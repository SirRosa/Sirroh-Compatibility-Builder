# Sirroh Compatibility Builder

Batch **static** reverse-engineering workflow for Valheim / BepInEx mod DLLs.
The checked-in archive currently contains 20 DLLs divided into Skills,
Taming & Breeding and QOL, retaining the \`To Adapt\` / \`To Recreate\` grouping.

## Run

Go to **Actions → Bulk decompile Valheim mod DLLs → Run workflow** or commit
changes to the ZIP or extractor. Download the
**compatibility-source-and-assets** artifact from the successful Actions run.
Each DLL is processed independently, so a failure in one mod does not abort the others.

The workflow installs ILSpyCmd, compiles a Mono.Cecil inspection helper,
installs UnityPy, then processes the entire archive in one job.

## Output per DLL

- \`csharp/\`: decompiled C# project (ILSpy, with fallback).
- \`metadata/metadata.json\`: assembly identity, attributes, BepInEx/Harmony
  attributes, namespaces/types, methods, fields, external references, calls,
  all discovered string literals and embedded-resource index.
- \`metadata/instructions.il\`: disassembly of every managed method (including
  exception handlers) for reference and to supplement imperfect C#.
- \`metadata/embedded_resources/\`: **raw embedded resource bytes**, plus
  individual entries from standard .NET \`.resources\` containers.
- \`unity_assets/\`: best-effort extraction with UnityPy of embedded Unity
  bundles: images, audio, text, typetree JSON for meshes/materials/animations,
  and OBJ when supported.
- \`compatibility_clues.json\`: search hits for Harmony, BepInEx, ZNetScene,
  ObjectDB, taming, skills, network/RPC, inventory, rendering, and other hooks.
- \`REPORT.md\`: concise status.

The top-level \`manifest.json\` records hashes, results and errors for each DLL.
\`SUMMARY.md\` contains the results table.

### Scope / limitations

This is static inspection: **DLLs are never loaded or executed**.
A managed .NET DLL typically yields substantial reconstructed code and IL,
but the original comments, source layout, and local variable names may be lost.
Obfuscation, mixed native code, missing dependencies, ILSpy limitations, and
Unity serialization variants can prevent partial/full extraction.
Not all embedded bundles contain importable FBX/Blender rigs;
mesh data/typetrees are not the same as a ready-to-use model.
Raw binary resources are preserved even when a decoder fails.

The extractor does **not** automatically publish recovered third-party source
to the public repository. GitHub Actions artifacts expire after 30 days.
Respect applicable mod licenses when distributing recovered content.

To change or add input DLLs, replace the source ZIP; it can contain arbitrary
folders and nested ZIPs. The classifier groups results by the original paths,
and collisions in names are separated by a SHA256 prefix.

### Local usage

Requires .NET 8 SDK, ILSpyCmd, Python 3.11+ and dependencies in requirements.txt:

\`\`\`sh
dotnet tool install --global ilspycmd
dotnet build tools/MetadataExtractor/MetadataExtractor.csproj -c Release
python -m pip install -r requirements.txt
python scripts/extract_all.py --input SirrohOverhaul_Compatibility_Set.zip \
  --output extracted-analysis --metadata tools/MetadataExtractor/bin/Release/net8.0/MetadataExtractor.dll --unity
\`\`\`
