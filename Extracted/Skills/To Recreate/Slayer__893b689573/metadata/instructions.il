
// System.Void Slayer.SlayerDamage::Initialize()
.locals 
IL_0000: nop
IL_0001: ldstr "Damage system initialized."
IL_0006: call System.Void Slayer.Slayer::DebugLog(System.String)
IL_000b: nop
IL_000c: ret

// System.Void Slayer.SlayerDamage/DamagePatch::Postfix(ItemDrop/ItemData,HitData/DamageTypes&)
.locals Player, System.Single, System.Single, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Slayer.SlayerConfig::DamageEnabled
IL_0006: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000b: ldc.i4.0
IL_000c: ceq
IL_000e: stloc.3
IL_000f: ldloc.3
IL_0010: brfalse.s IL_0014
IL_0012: br.s IL_0068
IL_0014: ldsfld Player Player::m_localPlayer
IL_0019: stloc.0
IL_001a: ldloc.0
IL_001b: ldnull
IL_001c: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0021: stloc.s V_4
IL_0023: ldloc.s V_4
IL_0025: brfalse.s IL_0029
IL_0027: br.s IL_0068
IL_0029: ldarg.0
IL_002a: call System.Boolean Slayer.SlayerWeapons::IsSlayerWeapon(ItemDrop/ItemData)
IL_002f: ldc.i4.0
IL_0030: ceq
IL_0032: stloc.s V_5
IL_0034: ldloc.s V_5
IL_0036: brfalse.s IL_003b
IL_0038: nop
IL_0039: br.s IL_0068
IL_003b: ldloc.0
IL_003c: ldsfld Skills/SkillType Slayer.Slayer::SlayerType
IL_0041: callvirt System.Single Character::GetSkillFactor(Skills/SkillType)
IL_0046: stloc.1
IL_0047: ldc.r4 1
IL_004c: ldloc.1
IL_004d: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Slayer.SlayerConfig::DamageAmount
IL_0052: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0057: mul
IL_0058: ldc.r4 100
IL_005d: div
IL_005e: add
IL_005f: stloc.2
IL_0060: ldarg.1
IL_0061: ldloc.2
IL_0062: call System.Void HitData/DamageTypes::Modify(System.Single)
IL_0067: nop
IL_0068: ret

// System.Void Slayer.SlayerExperience::Initialize()
.locals 
IL_0000: nop
IL_0001: ldstr "Experience system initialized."
IL_0006: call System.Void Slayer.Slayer::DebugLog(System.String)
IL_000b: nop
IL_000c: ret

// System.Void Slayer.SlayerExperience/ExperiencePatch::Prefix(Character,HitData)
.locals Player, ItemDrop/ItemData, System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: callvirt Character HitData::GetAttacker()
IL_0007: isinst Player
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: ldnull
IL_000f: cgt.un
IL_0011: ldc.i4.0
IL_0012: ceq
IL_0014: stloc.2
IL_0015: ldloc.2
IL_0016: brfalse.s IL_001b
IL_0018: nop
IL_0019: br.s IL_006c
IL_001b: ldloc.0
IL_001c: callvirt ItemDrop/ItemData Humanoid::GetCurrentWeapon()
IL_0021: stloc.1
IL_0022: ldloc.1
IL_0023: ldnull
IL_0024: ceq
IL_0026: stloc.3
IL_0027: ldloc.3
IL_0028: brfalse.s IL_002c
IL_002a: br.s IL_006c
IL_002c: ldloc.1
IL_002d: call System.Boolean Slayer.SlayerWeapons::IsSlayerWeapon(ItemDrop/ItemData)
IL_0032: ldc.i4.0
IL_0033: ceq
IL_0035: stloc.s V_4
IL_0037: ldloc.s V_4
IL_0039: brfalse.s IL_003e
IL_003b: nop
IL_003c: br.s IL_006c
IL_003e: ldarg.1
IL_003f: ldflda HitData/DamageTypes HitData::m_damage
IL_0044: call System.Single HitData/DamageTypes::GetTotalDamage()
IL_0049: ldc.r4 0
IL_004e: cgt.un
IL_0050: ldc.i4.0
IL_0051: ceq
IL_0053: stloc.s V_5
IL_0055: ldloc.s V_5
IL_0057: brfalse.s IL_005b
IL_0059: br.s IL_006c
IL_005b: ldloc.0
IL_005c: ldsfld Skills/SkillType Slayer.Slayer::SlayerType
IL_0061: ldc.r4 0.5
IL_0066: callvirt System.Void Character::RaiseSkill(Skills/SkillType,System.Single)
IL_006b: nop
IL_006c: ret

// System.Void Slayer.SlayerPushback::Initialize()
.locals 
IL_0000: nop
IL_0001: ret

// System.Void Slayer.SlayerPushback/PushbackPatch::Prefix(Character,UnityEngine.Vector3&,System.Single&)
.locals Player, System.Single, System.Single, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Slayer.SlayerConfig::PushbackResistanceEnabled
IL_0006: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000b: ldc.i4.0
IL_000c: ceq
IL_000e: stloc.3
IL_000f: ldloc.3
IL_0010: brfalse.s IL_0015
IL_0012: nop
IL_0013: br.s IL_0092
IL_0015: ldarg.0
IL_0016: isinst Player
IL_001b: stloc.0
IL_001c: ldloc.0
IL_001d: ldnull
IL_001e: cgt.un
IL_0020: ldc.i4.0
IL_0021: ceq
IL_0023: stloc.s V_4
IL_0025: ldloc.s V_4
IL_0027: brfalse.s IL_002b
IL_0029: br.s IL_0092
IL_002b: ldloc.0
IL_002c: ldsfld Player Player::m_localPlayer
IL_0031: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0036: stloc.s V_5
IL_0038: ldloc.s V_5
IL_003a: brfalse.s IL_003e
IL_003c: br.s IL_0092
IL_003e: ldloc.0
IL_003f: ldsfld Skills/SkillType Slayer.Slayer::SlayerType
IL_0044: callvirt System.Single Character::GetSkillFactor(Skills/SkillType)
IL_0049: stloc.1
IL_004a: ldloc.1
IL_004b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Slayer.SlayerConfig::PushbackResistanceAmount
IL_0050: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0055: mul
IL_0056: call System.Single UnityEngine.Mathf::Clamp01(System.Single)
IL_005b: stloc.2
IL_005c: ldloc.0
IL_005d: callvirt System.Boolean Character::InAttack()
IL_0062: stloc.s V_6
IL_0064: ldloc.s V_6
IL_0066: brfalse.s IL_0074
IL_0068: nop
IL_0069: ldarg.1
IL_006a: ldarg.2
IL_006b: ldloc.2
IL_006c: call System.Void Slayer.SlayerPushback/PushbackPatch::ApplyResistance(UnityEngine.Vector3&,System.Single&,System.Single)
IL_0071: nop
IL_0072: br.s IL_0092
IL_0074: ldloc.0
IL_0075: callvirt System.Boolean Character::IsBlocking()
IL_007a: stloc.s V_7
IL_007c: ldloc.s V_7
IL_007e: brfalse.s IL_0092
IL_0080: nop
IL_0081: ldarg.1
IL_0082: ldarg.2
IL_0083: ldloc.2
IL_0084: ldc.r4 0.5
IL_0089: mul
IL_008a: call System.Void Slayer.SlayerPushback/PushbackPatch::ApplyResistance(UnityEngine.Vector3&,System.Single&,System.Single)
IL_008f: nop
IL_0090: br.s IL_0092
IL_0092: ret

// System.Void Slayer.SlayerPushback/PushbackPatch::ApplyResistance(UnityEngine.Vector3&,System.Single&,System.Single)
.locals System.Single, System.Boolean
IL_0000: nop
IL_0001: ldc.r4 1
IL_0006: ldarg.2
IL_0007: sub
IL_0008: stloc.0
IL_0009: ldarg.1
IL_000a: ldarg.1
IL_000b: ldind.r4
IL_000c: ldloc.0
IL_000d: mul
IL_000e: stind.r4
IL_000f: ldloc.0
IL_0010: ldc.r4 0
IL_0015: cgt.un
IL_0017: ldc.i4.0
IL_0018: ceq
IL_001a: stloc.1
IL_001b: ldloc.1
IL_001c: brfalse.s IL_0032
IL_001e: nop
IL_001f: ldarg.1
IL_0020: ldc.r4 0
IL_0025: stind.r4
IL_0026: ldarg.0
IL_0027: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_002c: stobj UnityEngine.Vector3
IL_0031: nop
IL_0032: ret

// System.Void Slayer.SlayerStagger::Initialize()
.locals 
IL_0000: nop
IL_0001: ret

// System.Void Slayer.SlayerStagger/AddStaggerDamagePatch::Prefix(Character,System.Single&,UnityEngine.Vector3,HitData)
.locals Character, Player, ItemDrop/ItemData, System.Single, System.Single, System.Single, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Slayer.SlayerConfig::StaggerDamageEnabled
IL_0006: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000b: ldc.i4.0
IL_000c: ceq
IL_000e: stloc.s V_6
IL_0010: ldloc.s V_6
IL_0012: brfalse.s IL_0019
IL_0014: br IL_00cc
IL_0019: ldarg.3
IL_001a: ldnull
IL_001b: ceq
IL_001d: stloc.s V_7
IL_001f: ldloc.s V_7
IL_0021: brfalse.s IL_0028
IL_0023: br IL_00cc
IL_0028: ldarg.3
IL_0029: callvirt Character HitData::GetAttacker()
IL_002e: stloc.0
IL_002f: ldloc.0
IL_0030: ldnull
IL_0031: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0036: stloc.s V_8
IL_0038: ldloc.s V_8
IL_003a: brfalse.s IL_0041
IL_003c: br IL_00cc
IL_0041: ldloc.0
IL_0042: isinst Player
IL_0047: stloc.1
IL_0048: ldloc.1
IL_0049: ldnull
IL_004a: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_004f: stloc.s V_9
IL_0051: ldloc.s V_9
IL_0053: brfalse.s IL_0057
IL_0055: br.s IL_00cc
IL_0057: ldloc.1
IL_0058: callvirt ItemDrop/ItemData Humanoid::GetCurrentWeapon()
IL_005d: stloc.2
IL_005e: ldloc.2
IL_005f: ldnull
IL_0060: ceq
IL_0062: stloc.s V_10
IL_0064: ldloc.s V_10
IL_0066: brfalse.s IL_006a
IL_0068: br.s IL_00cc
IL_006a: ldloc.2
IL_006b: call System.Boolean Slayer.SlayerWeapons::IsSlayerWeapon(ItemDrop/ItemData)
IL_0070: ldc.i4.0
IL_0071: ceq
IL_0073: stloc.s V_11
IL_0075: ldloc.s V_11
IL_0077: brfalse.s IL_007b
IL_0079: br.s IL_00cc
IL_007b: ldloc.2
IL_007c: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0081: ldfld ItemDrop/ItemData/ItemType ItemDrop/ItemData/SharedData::m_itemType
IL_0086: ldc.i4.s 14
IL_0088: ceq
IL_008a: ldc.i4.0
IL_008b: ceq
IL_008d: stloc.s V_12
IL_008f: ldloc.s V_12
IL_0091: brfalse.s IL_0096
IL_0093: nop
IL_0094: br.s IL_00cc
IL_0096: ldloc.1
IL_0097: ldsfld Skills/SkillType Slayer.Slayer::SlayerType
IL_009c: callvirt System.Single Character::GetSkillFactor(Skills/SkillType)
IL_00a1: stloc.3
IL_00a2: ldloc.3
IL_00a3: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Slayer.SlayerConfig::StaggerDamageAmount
IL_00a8: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_00ad: mul
IL_00ae: ldc.r4 100
IL_00b3: div
IL_00b4: stloc.s V_4
IL_00b6: ldarg.1
IL_00b7: ldind.r4
IL_00b8: stloc.s V_5
IL_00ba: ldarg.1
IL_00bb: ldarg.1
IL_00bc: ldind.r4
IL_00bd: ldc.r4 1
IL_00c2: ldloc.s V_4
IL_00c4: add
IL_00c5: mul
IL_00c6: stind.r4
IL_00c7: ldc.i4.0
IL_00c8: stloc.s V_13
IL_00ca: br.s IL_00cc
IL_00cc: ret

// System.Void Slayer.Slayer::Awake()
.locals 
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Void Slayer.SlayerConfig::Initialize(BepInEx.BaseUnityPlugin)
IL_0007: nop
IL_0008: ldarg.0
IL_0009: call System.Void Slayer.Slayer::CreateSkill()
IL_000e: nop
IL_000f: ldstr "neithar.Slayer"
IL_0014: newobj System.Void HarmonyLib.Harmony::.ctor(System.String)
IL_0019: call System.Void HarmonyLib.Harmony::PatchAll()
IL_001e: nop
IL_001f: call System.Void Slayer.SlayerDamage::Initialize()
IL_0024: nop
IL_0025: call System.Void Slayer.SlayerPushback::Initialize()
IL_002a: nop
IL_002b: call System.Void Slayer.SlayerExperience::Initialize()
IL_0030: nop
IL_0031: ldstr "Slayer initialized."
IL_0036: call System.Void Slayer.Slayer::DebugLog(System.String)
IL_003b: nop
IL_003c: ret

// System.Void Slayer.Slayer::DebugLog(System.String)
.locals System.Boolean
IL_0000: nop
IL_0001: ldc.i4.0
IL_0002: stloc.0
IL_0003: br.s IL_0005
IL_0005: ret

// System.Void Slayer.Slayer::CreateSkill()
.locals UnityEngine.Texture2D, UnityEngine.Sprite, Jotunn.Configs.SkillConfig, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldstr "Slayer.Assets.krom_no_bg.png"
IL_0007: call UnityEngine.Texture2D Slayer.Slayer::LoadEmbeddedTexture(System.String)
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: ldnull
IL_000f: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0014: stloc.3
IL_0015: ldloc.3
IL_0016: brfalse.s IL_0029
IL_0018: nop
IL_0019: ldstr "Texture load failed!"
IL_001e: call System.Void Jotunn.Logger::LogError(System.Object)
IL_0023: nop
IL_0024: br IL_00aa
IL_0029: ldloc.0
IL_002a: ldc.r4 0
IL_002f: ldc.r4 0
IL_0034: ldloc.0
IL_0035: callvirt System.Int32 UnityEngine.Texture::get_width()
IL_003a: conv.r4
IL_003b: ldloc.0
IL_003c: callvirt System.Int32 UnityEngine.Texture::get_height()
IL_0041: conv.r4
IL_0042: newobj System.Void UnityEngine.Rect::.ctor(System.Single,System.Single,System.Single,System.Single)
IL_0047: ldc.r4 0.5
IL_004c: ldc.r4 0.5
IL_0051: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_0056: call UnityEngine.Sprite UnityEngine.Sprite::Create(UnityEngine.Texture2D,UnityEngine.Rect,UnityEngine.Vector2)
IL_005b: stloc.1
IL_005c: newobj System.Void Jotunn.Configs.SkillConfig::.ctor()
IL_0061: dup
IL_0062: ldstr "neithar.Slayer"
IL_0067: callvirt System.Void Jotunn.Configs.SkillConfig::set_Identifier(System.String)
IL_006c: nop
IL_006d: dup
IL_006e: ldstr "Slayer"
IL_0073: callvirt System.Void Jotunn.Configs.SkillConfig::set_Name(System.String)
IL_0078: nop
IL_0079: dup
IL_007a: ldstr "Deal more damage with two-handed and dual weapons"
IL_007f: callvirt System.Void Jotunn.Configs.SkillConfig::set_Description(System.String)
IL_0084: nop
IL_0085: dup
IL_0086: ldloc.1
IL_0087: callvirt System.Void Jotunn.Configs.SkillConfig::set_Icon(UnityEngine.Sprite)
IL_008c: nop
IL_008d: dup
IL_008e: ldc.r4 1
IL_0093: callvirt System.Void Jotunn.Configs.SkillConfig::set_IncreaseStep(System.Single)
IL_0098: nop
IL_0099: stloc.2
IL_009a: call Jotunn.Managers.SkillManager Jotunn.Managers.SkillManager::get_Instance()
IL_009f: ldloc.2
IL_00a0: callvirt Skills/SkillType Jotunn.Managers.SkillManager::AddSkill(Jotunn.Configs.SkillConfig)
IL_00a5: stsfld Skills/SkillType Slayer.Slayer::SlayerType
IL_00aa: ret

// UnityEngine.Texture2D Slayer.Slayer::LoadEmbeddedTexture(System.String)
.locals System.Reflection.Assembly, System.IO.Stream, System.Byte[], UnityEngine.Texture2D, System.Boolean, UnityEngine.Texture2D, System.Boolean
IL_0000: nop
IL_0001: call System.Reflection.Assembly System.Reflection.Assembly::GetExecutingAssembly()
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: ldarg.1
IL_0009: callvirt System.IO.Stream System.Reflection.Assembly::GetManifestResourceStream(System.String)
IL_000e: stloc.1
IL_000f: nop
IL_0010: ldloc.1
IL_0011: ldnull
IL_0012: ceq
IL_0014: stloc.s V_4
IL_0016: ldloc.s V_4
IL_0018: brfalse.s IL_0031
IL_001a: nop
IL_001b: ldstr "Resource not found: "
IL_0020: ldarg.1
IL_0021: call System.String System.String::Concat(System.String,System.String)
IL_0026: call System.Void Jotunn.Logger::LogError(System.Object)
IL_002b: nop
IL_002c: ldnull
IL_002d: stloc.s V_5
IL_002f: leave.s IL_0083
IL_0031: ldloc.1
IL_0032: callvirt System.Int64 System.IO.Stream::get_Length()
IL_0037: conv.ovf.i
IL_0038: newarr System.Byte
IL_003d: stloc.2
IL_003e: ldloc.1
IL_003f: ldloc.2
IL_0040: ldc.i4.0
IL_0041: ldloc.2
IL_0042: ldlen
IL_0043: conv.i4
IL_0044: callvirt System.Int32 System.IO.Stream::Read(System.Byte[],System.Int32,System.Int32)
IL_0049: pop
IL_004a: ldc.i4.2
IL_004b: ldc.i4.2
IL_004c: newobj System.Void UnityEngine.Texture2D::.ctor(System.Int32,System.Int32)
IL_0051: stloc.3
IL_0052: ldloc.3
IL_0053: ldloc.2
IL_0054: call System.Boolean Jotunn.Utils.AssetUtils::LoadImage(UnityEngine.Texture2D,System.Byte[])
IL_0059: ldc.i4.0
IL_005a: ceq
IL_005c: stloc.s V_6
IL_005e: ldloc.s V_6
IL_0060: brfalse.s IL_0073
IL_0062: nop
IL_0063: ldstr "Failed to load image data into texture"
IL_0068: call System.Void Jotunn.Logger::LogError(System.Object)
IL_006d: nop
IL_006e: ldnull
IL_006f: stloc.s V_5
IL_0071: leave.s IL_0083
IL_0073: ldloc.3
IL_0074: stloc.s V_5
IL_0076: leave.s IL_0083
IL_0078: ldloc.1
IL_0079: brfalse.s IL_0082
IL_007b: ldloc.1
IL_007c: callvirt System.Void System.IDisposable::Dispose()
IL_0081: nop
IL_0082: endfinally
IL_0083: ldloc.s V_5
IL_0085: ret
// EH Finally: 15 - 120 => 120 - 131

// System.Void Slayer.Slayer::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BepInEx.BaseUnityPlugin::.ctor()
IL_0006: nop
IL_0007: ret

// System.Void Slayer.SlayerConfig::Initialize(BepInEx.BaseUnityPlugin)
.locals 
IL_0000: nop
IL_0001: ldarg.0
IL_0002: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0007: ldstr "Damage"
IL_000c: ldstr "Value"
IL_0011: ldc.r4 25
IL_0016: ldstr "The percentage by which two-handed weapon damage is increased at level 100"
IL_001b: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,System.String)
IL_0020: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Slayer.SlayerConfig::DamageAmount
IL_0025: ldarg.0
IL_0026: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_002b: ldstr "Damage Increase Enabled"
IL_0030: ldstr "Value"
IL_0035: ldc.i4.1
IL_0036: ldstr "Enable or disable the damage increase"
IL_003b: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_0040: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Slayer.SlayerConfig::DamageEnabled
IL_0045: ldarg.0
IL_0046: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_004b: ldstr "Pushback Resistance Amount"
IL_0050: ldstr "Value"
IL_0055: ldc.r4 2
IL_005a: ldstr "Percentage of pushback resistance gained with each level of the skill"
IL_005f: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,System.String)
IL_0064: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Slayer.SlayerConfig::PushbackResistanceAmount
IL_0069: ldarg.0
IL_006a: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_006f: ldstr "Pushback Resistance Enabled"
IL_0074: ldstr "Value"
IL_0079: ldc.i4.1
IL_007a: ldstr "Enable or disable the pushback resistance"
IL_007f: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_0084: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Slayer.SlayerConfig::PushbackResistanceEnabled
IL_0089: ldarg.0
IL_008a: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_008f: ldstr "Stagger Damage"
IL_0094: ldstr "Enabled"
IL_0099: ldc.i4.1
IL_009a: ldstr "Enable Slayer's bonus stagger damage."
IL_009f: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_00a4: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Slayer.SlayerConfig::StaggerDamageEnabled
IL_00a9: ldarg.0
IL_00aa: callvirt BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_00af: ldstr "Stagger Damage"
IL_00b4: ldstr "Bonus"
IL_00b9: ldc.r4 50
IL_00be: ldstr "Maximum stagger damage bonus at Slayer skill level 100."
IL_00c3: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,System.String)
IL_00c8: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Slayer.SlayerConfig::StaggerDamageAmount
IL_00cd: ret

// System.Boolean Slayer.SlayerWeapons::IsSlayerWeapon(ItemDrop/ItemData)
.locals System.Boolean, System.Boolean, System.Boolean, Skills/SkillType, Skills/SkillType
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldnull
IL_0003: ceq
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: brfalse.s IL_000d
IL_0009: ldc.i4.0
IL_000a: stloc.1
IL_000b: br.s IL_0066
IL_000d: ldarg.0
IL_000e: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0013: ldfld ItemDrop/ItemData/ItemType ItemDrop/ItemData/SharedData::m_itemType
IL_0018: ldc.i4.s 14
IL_001a: ceq
IL_001c: ldc.i4.0
IL_001d: ceq
IL_001f: stloc.2
IL_0020: ldloc.2
IL_0021: brfalse.s IL_0028
IL_0023: nop
IL_0024: ldc.i4.0
IL_0025: stloc.1
IL_0026: br.s IL_0066
IL_0028: ldarg.0
IL_0029: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_002e: ldfld Skills/SkillType ItemDrop/ItemData/SharedData::m_skillType
IL_0033: stloc.s V_4
IL_0035: ldloc.s V_4
IL_0037: stloc.3
IL_0038: ldloc.3
IL_0039: ldc.i4.1
IL_003a: sub
IL_003b: switch IL_005e,IL_0062,IL_005e,IL_005e,IL_0062,IL_0062,IL_005e
IL_005c: br.s IL_0062
IL_005e: ldc.i4.1
IL_005f: stloc.1
IL_0060: br.s IL_0066
IL_0062: ldc.i4.0
IL_0063: stloc.1
IL_0064: br.s IL_0066
IL_0066: ldloc.1
IL_0067: ret
