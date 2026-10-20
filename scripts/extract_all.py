#!/usr/bin/env python3
"""Bulk static extraction of Valheim/BepInEx mod assemblies; never executes mod DLLs."""
from __future__ import annotations

import argparse
import collections
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import traceback
import zipfile
from pathlib import Path, PurePosixPath

MAX_FILES = 20000
MAX_UNCOMPRESSED = 6 * 1024**3
MAX_SINGLE = 1024**3

CLUES = {
    "BepInEx plugin/dependencies": r"BepInPlugin|BepInDependency|BaseUnityPlugin|BepInProcess",
    "Harmony patches": r"HarmonyPatch|HarmonyPrefix|HarmonyPostfix|HarmonyTranspiler|PatchAll|AccessTools",
    "Configuration": r"Config\.Bind|ConfigEntry|ConfigDescription|ConfigFile",
    "Network/RPC": r"ZNetView|ZDOMan|ZDOID|ZRpc|RegisterRPC|InvokeRPC|ZRoutedRpc|RPC_",
    "World/prefabs": r"ZNetScene|ObjectDB|PrefabManager|PieceTable|PieceManager|ZoneSystem|ClutterSystem",
    "Characters/combat": r"Character|Humanoid|Player|SEMan|StatusEffect|HitData|DamageTypes",
    "Skills": r"Skills\.SkillType|RaiseSkill|SkillDef|GetSkillFactor|OnSkillLevelup",
    "Taming/breeding": r"Tameable|Procreation|MonsterAI|BaseAI|CreatureLevelControl|Growup",
    "Inventory/items": r"Inventory|ItemDrop|ItemData|Container|InventoryGui|Stack",
    "Rendering/assets": r"AssetBundle|Resources\.Load|Shader|Material|Texture2D|Sprite|Animator",
}
COMPILED = {name: re.compile(pattern, re.IGNORECASE) for name, pattern in CLUES.items()}


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for part in iter(lambda: f.read(1024 * 1024), b""):
            h.update(part)
    return h.hexdigest()


def safe_unzip(src: Path, out: Path) -> int:
    out.mkdir(parents=True, exist_ok=True)
    count, total = 0, 0
    with zipfile.ZipFile(src) as z:
        for info in z.infolist():
            name = info.filename.replace("\\", "/")
            relative = PurePosixPath(name)
            # Prevent absolute paths, drive prefix, traversal, symlinks and zip bombs.
            if (not name or name.startswith("/") or re.match(r"^[A-Za-z]:", name)
                    or any(x in ("", ".", "..") for x in relative.parts)
                    or (info.external_attr >> 16) & 0o170000 == 0o120000):
                print(f"SKIP unsafe archive entry: {name}", file=sys.stderr)
                continue
            if info.is_dir():
                continue
            count += 1
            total += info.file_size
            if count > MAX_FILES or total > MAX_UNCOMPRESSED or info.file_size > MAX_SINGLE:
                raise ValueError(f"Archive extraction limit exceeded: {src}")
            target = out.joinpath(*relative.parts)
            target.parent.mkdir(parents=True, exist_ok=True)
            with z.open(info) as source, target.open("wb") as dest:
                shutil.copyfileobj(source, dest, 1024 * 1024)
    return count


def run(args: list[str], cwd: Path | None = None, timeout: int = 420) -> dict:
    try:
        p = subprocess.run(args, cwd=cwd, text=True, errors="replace",
                           capture_output=True, timeout=timeout, check=False)
        return {"ok": p.returncode == 0, "returncode": p.returncode,
                "stdout": p.stdout[-20000:], "stderr": p.stderr[-20000:],
                "command": args}
    except Exception as exc:
        return {"ok": False, "error": str(exc), "command": args}


def asset_kind(path: Path) -> bool:
    suffix = path.suffix.lower()
    if suffix in {".bundle", ".unity3d", ".assetbundle", ".assets", ".unity", ".ab"}:
        return True
    try:
        with path.open("rb") as f:
            return f.read(16).startswith((b"UnityFS", b"UnityRaw", b"UnityWeb"))
    except OSError:
        return False


def filename(value: str, limit=120) -> str:
    name = re.sub(r"[^a-zA-Z0-9._-]+", "_", str(value)).strip("._")
    return (name or "unnamed")[:limit]


def json_safe(obj, depth=0):
    if depth > 12:
        return repr(obj)[:300]
    if obj is None or isinstance(obj, (str, int, float, bool)):
        return obj
    if isinstance(obj, bytes):
        return {"byte_count": len(obj)}
    if isinstance(obj, dict):
        return {str(k): json_safe(v, depth + 1) for k, v in list(obj.items())[:20000]}
    if isinstance(obj, (list, tuple)):
        return [json_safe(v, depth + 1) for v in obj[:20000]]
    return str(obj)


def extract_unity_assets(resource_root: Path, mod_out: Path) -> list[dict]:
    try:
        import UnityPy
    except ImportError:
        return [{"error": "UnityPy not installed"}]
    results = []
    for source in resource_root.rglob("*"):
        if not source.is_file() or source.stat().st_size > MAX_SINGLE or not asset_kind(source):
            continue
        rel = source.relative_to(resource_root)
        item = {"source": str(rel), "objects": [], "errors": []}
        dest = mod_out / "unity_assets" / filename(str(rel))
        dest.mkdir(parents=True, exist_ok=True)
        try:
            env = UnityPy.load(str(source))
            for idx, obj in enumerate(env.objects):
                kind = obj.type.name
                label = f"{idx:05d}_{filename(kind)}"
                record = {"index": idx, "type": kind, "pathId": str(obj.path_id)}
                try:
                    data = obj.read()
                    object_name = filename(getattr(data, "m_Name", label))
                    label += "_" + object_name
                    if kind in ("Texture2D", "Sprite"):
                        image = data.image
                        path = dest / (label + ".png")
                        image.save(path)
                        record["file"] = str(path.relative_to(mod_out))
                    elif kind == "TextAsset":
                        b = data.script
                        if isinstance(b, str):
                            b = b.encode("utf-8")
                        path = dest / (label + ".bytes")
                        path.write_bytes(bytes(b))
                        record["file"] = str(path.relative_to(mod_out))
                    elif kind == "AudioClip":
                        for sound_name, sound in data.samples.items():
                            path = dest / (label + "_" + filename(sound_name) + ".wav")
                            path.write_bytes(sound)
                            record.setdefault("files", []).append(str(path.relative_to(mod_out)))
                    # Preserve typetree for meshes, shaders, animation, game objects, materials, etc.
                    if kind not in ("Texture2D", "Sprite", "AudioClip"):
                        try:
                            tree = obj.read_typetree()
                            path = dest / (label + ".json")
                            path.write_text(json.dumps(json_safe(tree), indent=2, ensure_ascii=False),
                                            encoding="utf-8")
                            record["typetree"] = str(path.relative_to(mod_out))
                        except Exception as exc:
                            record["typetreeError"] = str(exc)[:400]
                    if kind == "Mesh":
                        try:
                            if callable(getattr(data, "export", None)):
                                mesh = data.export()
                                path = dest / (label + ".obj")
                                path.write_bytes(mesh if isinstance(mesh, bytes) else str(mesh).encode())
                                record["mesh"] = str(path.relative_to(mod_out))
                        except Exception as exc:
                            record["meshError"] = str(exc)[:400]
                except Exception as exc:
                    record["error"] = str(exc)[:500]
                item["objects"].append(record)
        except Exception as exc:
            item["errors"].append(str(exc))
        results.append(item)
    return results


def analyze_source(source: Path, base: Path, max_hits: int = 150) -> dict:
    result: dict[str, list[dict]] = {name: [] for name in CLUES}
    for file in source.rglob("*"):
        if not file.is_file() or file.suffix.lower() not in {".cs", ".json", ".il", ".config"}:
            continue
        if file.stat().st_size > 30 * 1024**2:
            continue
        try:
            with file.open(encoding="utf-8-sig", errors="replace") as f:
                for number, line in enumerate(f, 1):
                    for name, pattern in COMPILED.items():
                        if len(result[name]) < max_hits and pattern.search(line):
                            result[name].append({
                                "file": str(file.relative_to(base)), "line": number,
                                "text": line.strip()[:350]
                            })
        except OSError:
            continue
    return {name: hits for name, hits in result.items() if hits}


def process_dll(dll: Path, unpacked: Path, output: Path, ilspy: str, metadata: str,
                unity: bool) -> dict:
    rel = dll.relative_to(unpacked)
    digest = sha256(dll)
    mod_dir = output / "mods" / rel.parent / (filename(dll.stem) + "__" + digest[:10])
    mod_dir.mkdir(parents=True, exist_ok=True)
    info = {"originalPath": rel.as_posix(), "sha256": digest, "bytes": dll.stat().st_size,
            "output": str(mod_dir.relative_to(output)), "steps": {}}
    # Mono.Cecil is independent of runtime execution and gathers IL, signatures, calls and resources.
    info["steps"]["metadata"] = run(["dotnet", metadata, str(dll), str(mod_dir / "metadata")])
    source = mod_dir / "csharp"
    source.mkdir(exist_ok=True)
    decompiled = run([ilspy, "-p", "-o", str(source), str(dll)])
    if not decompiled["ok"]:
        fallback = run([ilspy, "-o", str(source), str(dll)])
        decompiled["fallback"] = fallback
        if fallback["ok"]:
            decompiled["ok"] = True
    info["steps"]["decompile"] = decompiled
    # Standalone C# hints are useful even when the Cecil stage fails.
    info["compatibilityClues"] = analyze_source(mod_dir, mod_dir)
    (mod_dir / "compatibility_clues.json").write_text(
        json.dumps(info["compatibilityClues"], indent=2, ensure_ascii=False), encoding="utf-8")
    resources = mod_dir / "metadata" / "embedded_resources"
    if unity and resources.exists():
        info["unityAssets"] = extract_unity_assets(resources, mod_dir)
        (mod_dir / "unity_asset_index.json").write_text(
            json.dumps(info["unityAssets"], indent=2, ensure_ascii=False), encoding="utf-8")
    report = mod_dir / "REPORT.md"
    clues = info["compatibilityClues"]
    lines = [f"# {rel.as_posix()}", "", f"- SHA-256: \`{digest}\`",
             f"- Size: {info['bytes']:,} bytes",
             f"- Decompiled: {'yes' if decompiled['ok'] else 'FAILED'}",
             f"- Cecil metadata/resources: {'yes' if info['steps']['metadata']['ok'] else 'FAILED'}",
             "- Code is reconstructed, not the author's original sources.", "",
             "## Compatibility indicators"]
    lines.extend(f"- {name}: {len(matches)} matches" for name, matches in clues.items())
    report.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"[{len(list(output.glob('mods/**/*REPORT.md')))}] {rel}: C#={decompiled['ok']} Cecil={info['steps']['metadata']['ok']}", flush=True)
    return info


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--ilspy", default="ilspycmd")
    parser.add_argument("--metadata", required=True)
    parser.add_argument("--unity", action="store_true")
    args = parser.parse_args()
    source, output = args.input.resolve(), args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    if not source.is_file():
        parser.error(f"Archive missing: {source}")
    with tempfile.TemporaryDirectory(prefix="compat-builder-") as directory:
        root = Path(directory) / "unpacked"
        if zipfile.is_zipfile(source):
            count = safe_unzip(source, root)
        elif source.suffix.lower() == ".dll":
            root.mkdir()
            shutil.copy2(source, root / source.name)
            count = 1
        else:
            parser.error("Input must be a .zip or a .dll")
        # Nested archives can contain additional DLLs; preserve their parent paths.
        for _ in range(3):
            nested = sorted(x for x in root.rglob("*.zip") if x.is_file())
            unseen = [p for p in nested if not (p.parent / (p.name + ".contents")).exists()]
            if not unseen:
                break
            for nested_zip in unseen:
                try:
                    safe_unzip(nested_zip, nested_zip.parent / (nested_zip.name + ".contents"))
                except Exception as exc:
                    print(f"Nested archive error: {nested_zip}: {exc}", file=sys.stderr)
        dlls = sorted(x for x in root.rglob("*") if x.is_file() and x.suffix.lower() == ".dll")
        print(f"Extracted {count} archive files; discovered {len(dlls)} DLLs", flush=True)
        entries = []
        for index, dll in enumerate(dlls, 1):
            print(f"Processing {index}/{len(dlls)}: {dll.relative_to(root)}", flush=True)
            try:
                entries.append(process_dll(dll, root, output, args.ilspy, args.metadata, args.unity))
            except Exception as exc:
                entries.append({"originalPath": dll.relative_to(root).as_posix(),
                                "error": traceback.format_exc()})
                print(f"ERROR {dll}: {exc}", file=sys.stderr)
        manifest = {"archive": source.name, "archiveSha256": sha256(source),
                    "filesInArchive": count, "dllCount": len(dlls), "mods": entries}
        (output / "manifest.json").write_text(
            json.dumps(manifest, indent=2, ensure_ascii=False), encoding="utf-8")
        succeeded = sum(x.get("steps", {}).get("decompile", {}).get("ok", False) for x in entries)
        meta = sum(x.get("steps", {}).get("metadata", {}).get("ok", False) for x in entries)
        summary = [
            "# Compatibility extraction results", "",
            f"- Input: \`{source.name}\`",
            f"- DLLs: **{len(dlls)}**",
            f"- Successful C# decompilations: **{succeeded}/{len(dlls)}**",
            f"- Successful IL/metadata/resources extraction: **{meta}/{len(dlls)}**", "",
            "| Input DLL | C# | IL + resources |",
            "|---|:---:|:---:|"
        ]
        for x in entries:
            steps = x.get("steps", {})
            summary.append(f"| \`{x['originalPath']}\` | {'OK' if steps.get('decompile', {}).get('ok') else 'FAIL'} | {'OK' if steps.get('metadata', {}).get('ok') else 'FAIL'} |")
        summary += ["", "Output contains one directory per DLL: reconstructed C# project, complete IL listing,",
                    "assembly metadata, reference/call graph inputs, raw embedded resources,",
                    "Unity exports (where present), and a search index of compatibility-relevant APIs.",
                    "Dlls are NOT executed. Managed obfuscation, native libraries, and Unity asset bundles",
                    "may prevent full recovery; see individual error logs in manifest.json.", ""]
        md = "\n".join(summary)
        (output / "SUMMARY.md").write_text(md, encoding="utf-8")
        print(md, flush=True)
        if os.environ.get("GITHUB_STEP_SUMMARY"):
            with open(os.environ["GITHUB_STEP_SUMMARY"], "a", encoding="utf-8") as f:
                f.write(md)
        return 0 if entries and (succeeded > 0 or meta > 0) else 1


if __name__ == "__main__":
    raise SystemExit(main())
