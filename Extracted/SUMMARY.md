# Compatibility extraction results

- Input: \`SirrohOverhaul_Compatibility_Set.zip\`
- DLLs: **20**
- Successful C# decompilations: **20/20**
- Successful IL/metadata/resources extraction: **20/20**

| Input DLL | C# | IL + resources |
|---|:---:|:---:|
| \`QOL/To Adapt/JuneGame.Valheim.ForsakenPowerOverhaul.dll\` | OK | OK |
| \`QOL/To Adapt/LongshipUpgrades.dll\` | OK | OK |
| \`QOL/To Recreate/AutoRepair.dll\` | OK | OK |
| \`QOL/To Recreate/CarturSafeStamina.dll\` | OK | OK |
| \`QOL/To Recreate/FoodFreezer.dll\` | OK | OK |
| \`QOL/To Recreate/GlowingSigns.dll\` | OK | OK |
| \`QOL/To Recreate/NoSlopeSlide.dll\` | OK | OK |
| \`QOL/To Recreate/QuickStackStore.dll\` | OK | OK |
| \`QOL/To Recreate/Recycle_N_Reclaim.dll\` | OK | OK |
| \`QOL/To Recreate/RunicBuildCamera.dll\` | OK | OK |
| \`QOL/To Recreate/WieldEquipmentWhileSwimming.dll\` | OK | OK |
| \`QOL/To Recreate/Zen.ModLib.dll\` | OK | OK |
| \`QOL/To Recreate/ZenUI.dll\` | OK | OK |
| \`Skills/To Adapt/BlacksmithingExpanded.dll\` | OK | OK |
| \`Skills/To Recreate/Slayer.dll\` | OK | OK |
| \`Skills/To Recreate/SlayerSkills.dll\` | OK | OK |
| \`Taming&Breeding/To Adapt/CreatureLevelControl.dll\` | OK | OK |
| \`Taming&Breeding/To Recreate/BetterTames.dll\` | OK | OK |
| \`Taming&Breeding/To Recreate/Husbandry.dll\` | OK | OK |
| \`Taming&Breeding/To Recreate/LetMeTameYou.dll\` | OK | OK |

Output contains one directory per DLL: reconstructed C# project, complete IL listing,
assembly metadata, reference/call graph inputs, raw embedded resources,
Unity exports (where present), and a search index of compatibility-relevant APIs.
Dlls are NOT executed. Managed obfuscation, native libraries, and Unity asset bundles
may prevent full recovery; see individual error logs in manifest.json.
