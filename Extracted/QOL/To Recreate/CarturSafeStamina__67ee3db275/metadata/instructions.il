
// System.Void Microsoft.CodeAnalysis.EmbeddedAttribute::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: ret

// System.Void System.Runtime.CompilerServices.RefSafetyRulesAttribute::.ctor(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: stfld System.Int32 System.Runtime.CompilerServices.RefSafetyRulesAttribute::Version
IL_000d: ret

// System.Void CarturSafeStamina.Plugin::Awake()
.locals 
IL_0000: ldarg.0
IL_0001: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0006: ldstr "General"
IL_000b: ldstr "SafeRadius"
IL_0010: ldc.r4 25
IL_0015: ldstr "No stamina cost for sprint/jump/build/swim/attacks/sneak when no enemy is within this many meters."
IL_001a: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,System.String)
IL_001f: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> CarturSafeStamina.Plugin::SafeRadius
IL_0024: ldarg.0
IL_0025: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_002a: ldstr "General"
IL_002f: ldstr "AffectSprint"
IL_0034: ldc.i4.1
IL_0035: ldstr "Free sprint stamina when safe."
IL_003a: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_003f: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectSprint
IL_0044: ldarg.0
IL_0045: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_004a: ldstr "General"
IL_004f: ldstr "AffectJump"
IL_0054: ldc.i4.1
IL_0055: ldstr "Free jump stamina when safe."
IL_005a: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_005f: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectJump
IL_0064: ldarg.0
IL_0065: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_006a: ldstr "General"
IL_006f: ldstr "AffectBuild"
IL_0074: ldc.i4.1
IL_0075: ldstr "Free build/repair/remove stamina when safe. Covers every build tool, so planting with the cultivator and levelling with the hoe are free too."
IL_007a: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_007f: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectBuild
IL_0084: ldarg.0
IL_0085: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_008a: ldstr "General"
IL_008f: ldstr "AffectSwim"
IL_0094: ldc.i4.1
IL_0095: ldstr "Free swim stamina when safe. Note this also removes the drowning risk while safe, since drowning only starts once stamina is empty."
IL_009a: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_009f: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectSwim
IL_00a4: ldarg.0
IL_00a5: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_00aa: ldstr "General"
IL_00af: ldstr "AffectAttacks"
IL_00b4: ldc.i4.1
IL_00b5: ldstr "Free attack stamina when safe - chopping wood, mining, and weapon swings all pay through the same cost."
IL_00ba: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_00bf: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectAttacks
IL_00c4: ldarg.0
IL_00c5: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_00ca: ldstr "General"
IL_00cf: ldstr "AffectSneak"
IL_00d4: ldc.i4.1
IL_00d5: ldstr "Free sneak/crouch stamina when safe."
IL_00da: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_00df: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectSneak
IL_00e4: ldarg.0
IL_00e5: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_00ea: ldstr "General"
IL_00ef: ldstr "AffectEncumbered"
IL_00f4: ldc.i4.0
IL_00f5: ldstr "Over the weight limit and safe: walking costs no stamina and stamina refills. Off by default, so being over-loaded costs you as in vanilla."
IL_00fa: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_00ff: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectEncumbered
IL_0104: ldarg.0
IL_0105: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_010a: ldstr "General"
IL_010f: ldstr "IgnoredCreatures"
IL_0114: ldstr ""
IL_0119: ldstr "Comma-separated creatures that never count as an enemy nearby, by prefab name or by the name shown in game (e.g. T.W.I.G). For modded creatures that are hostile by faction but never fight."
IL_011e: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.String>(System.String,System.String,!!0,System.String)
IL_0123: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> CarturSafeStamina.Plugin::IgnoredCreatures
IL_0128: ldtoken CarturSafeStamina.Plugin
IL_012d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0132: callvirt System.Reflection.Assembly System.Type::get_Assembly()
IL_0137: ldstr "com.jekkle.valheim.cartursafestamina"
IL_013c: call HarmonyLib.Harmony HarmonyLib.Harmony::CreateAndPatchAll(System.Reflection.Assembly,System.String)
IL_0141: pop
IL_0142: ldarg.0
IL_0143: call BepInEx.Logging.ManualLogSource BepInEx.BaseUnityPlugin::get_Logger()
IL_0148: ldstr "Cartur's Safe Stamina 1.0.13 loaded."
IL_014d: callvirt System.Void BepInEx.Logging.ManualLogSource::LogInfo(System.Object)
IL_0152: ret

// System.Boolean CarturSafeStamina.Plugin::IsLocalAndSafe(Character)
.locals Player
IL_0000: ldarg.0
IL_0001: isinst Player
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: brfalse.s IL_001e
IL_000a: ldloc.0
IL_000b: ldsfld Player Player::m_localPlayer
IL_0010: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0015: brfalse.s IL_001e
IL_0017: ldloc.0
IL_0018: call System.Boolean CarturSafeStamina.Plugin::IsSafe(Player)
IL_001d: ret
IL_001e: ldc.i4.0
IL_001f: ret

// System.Boolean CarturSafeStamina.Plugin::IsSafe(Player)
.locals System.Single, UnityEngine.Vector3, System.Collections.Generic.List`1/Enumerator<Character>, Character, UnityEngine.Vector3
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0007: brfalse.s IL_000b
IL_0009: ldc.i4.1
IL_000a: ret
IL_000b: call System.Single UnityEngine.Time::get_time()
IL_0010: ldsfld System.Single CarturSafeStamina.Plugin::_lastCheckTime
IL_0015: sub
IL_0016: ldc.r4 0.25
IL_001b: bge.un.s IL_0023
IL_001d: ldsfld System.Boolean CarturSafeStamina.Plugin::_lastResult
IL_0022: ret
IL_0023: call System.Single UnityEngine.Time::get_time()
IL_0028: stsfld System.Single CarturSafeStamina.Plugin::_lastCheckTime
IL_002d: ldc.i4.1
IL_002e: stsfld System.Boolean CarturSafeStamina.Plugin::_lastResult
IL_0033: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> CarturSafeStamina.Plugin::SafeRadius
IL_0038: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_003d: dup
IL_003e: mul
IL_003f: stloc.0
IL_0040: ldarg.0
IL_0041: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0046: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_004b: stloc.1
IL_004c: call System.Collections.Generic.List`1<Character> Character::GetAllCharacters()
IL_0051: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Character>::GetEnumerator()
IL_0056: stloc.2
IL_0057: br.s IL_00b1
IL_0059: ldloca.s V_2
IL_005b: call !0 System.Collections.Generic.List`1/Enumerator<Character>::get_Current()
IL_0060: stloc.3
IL_0061: ldloc.3
IL_0062: ldnull
IL_0063: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0068: brtrue.s IL_00b1
IL_006a: ldloc.3
IL_006b: ldarg.0
IL_006c: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0071: brtrue.s IL_00b1
IL_0073: ldloc.3
IL_0074: callvirt System.Boolean Character::IsDead()
IL_0079: brtrue.s IL_00b1
IL_007b: ldarg.0
IL_007c: ldloc.3
IL_007d: call System.Boolean BaseAI::IsEnemy(Character,Character)
IL_0082: brfalse.s IL_00b1
IL_0084: ldloc.3
IL_0085: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_008a: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_008f: ldloc.1
IL_0090: call UnityEngine.Vector3 UnityEngine.Vector3::op_Subtraction(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0095: stloc.s V_4
IL_0097: ldloca.s V_4
IL_0099: call System.Single UnityEngine.Vector3::get_sqrMagnitude()
IL_009e: ldloc.0
IL_009f: bgt.un.s IL_00b1
IL_00a1: ldloc.3
IL_00a2: call System.Boolean CarturSafeStamina.Plugin::IsIgnored(Character)
IL_00a7: brtrue.s IL_00b1
IL_00a9: ldc.i4.0
IL_00aa: stsfld System.Boolean CarturSafeStamina.Plugin::_lastResult
IL_00af: leave.s IL_00ca
IL_00b1: ldloca.s V_2
IL_00b3: call System.Boolean System.Collections.Generic.List`1/Enumerator<Character>::MoveNext()
IL_00b8: brtrue.s IL_0059
IL_00ba: leave.s IL_00ca
IL_00bc: ldloca.s V_2
IL_00be: constrained. System.Collections.Generic.List`1/Enumerator<Character>
IL_00c4: callvirt System.Void System.IDisposable::Dispose()
IL_00c9: endfinally
IL_00ca: ldsfld System.Boolean CarturSafeStamina.Plugin::_lastResult
IL_00cf: ret
// EH Finally: 87 - 188 => 188 - 202

// System.Boolean CarturSafeStamina.Plugin::IsIgnored(Character)
.locals System.String, System.String[], System.Int32, System.String
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> CarturSafeStamina.Plugin::IgnoredCreatures
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_000a: dup
IL_000b: brtrue.s IL_0013
IL_000d: pop
IL_000e: ldstr ""
IL_0013: stloc.0
IL_0014: ldloc.0
IL_0015: ldsfld System.String CarturSafeStamina.Plugin::_ignoredRaw
IL_001a: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_001f: brfalse.s IL_0074
IL_0021: ldloc.0
IL_0022: stsfld System.String CarturSafeStamina.Plugin::_ignoredRaw
IL_0027: ldsfld System.Collections.Generic.HashSet`1<System.String> CarturSafeStamina.Plugin::Ignored
IL_002c: callvirt System.Void System.Collections.Generic.HashSet`1<System.String>::Clear()
IL_0031: ldloc.0
IL_0032: ldc.i4.1
IL_0033: newarr System.Char
IL_0038: dup
IL_0039: ldc.i4.0
IL_003a: ldc.i4.s 44
IL_003c: stelem.i2
IL_003d: callvirt System.String[] System.String::Split(System.Char[])
IL_0042: stloc.1
IL_0043: ldc.i4.0
IL_0044: stloc.2
IL_0045: br.s IL_006e
IL_0047: ldloc.1
IL_0048: ldloc.2
IL_0049: ldelem.ref
IL_004a: stloc.3
IL_004b: ldloc.3
IL_004c: callvirt System.String System.String::Trim()
IL_0051: callvirt System.Int32 System.String::get_Length()
IL_0056: ldc.i4.0
IL_0057: ble.s IL_006a
IL_0059: ldsfld System.Collections.Generic.HashSet`1<System.String> CarturSafeStamina.Plugin::Ignored
IL_005e: ldloc.3
IL_005f: callvirt System.String System.String::Trim()
IL_0064: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Add(!0)
IL_0069: pop
IL_006a: ldloc.2
IL_006b: ldc.i4.1
IL_006c: add
IL_006d: stloc.2
IL_006e: ldloc.2
IL_006f: ldloc.1
IL_0070: ldlen
IL_0071: conv.i4
IL_0072: blt.s IL_0047
IL_0074: ldsfld System.Collections.Generic.HashSet`1<System.String> CarturSafeStamina.Plugin::Ignored
IL_0079: callvirt System.Int32 System.Collections.Generic.HashSet`1<System.String>::get_Count()
IL_007e: brtrue.s IL_0082
IL_0080: ldc.i4.0
IL_0081: ret
IL_0082: ldsfld System.Collections.Generic.HashSet`1<System.String> CarturSafeStamina.Plugin::Ignored
IL_0087: ldarg.0
IL_0088: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_008d: call System.String Utils::GetPrefabName(UnityEngine.GameObject)
IL_0092: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Contains(!0)
IL_0097: brtrue.s IL_00bd
IL_0099: call Localization Localization::get_instance()
IL_009e: brfalse.s IL_00bb
IL_00a0: ldsfld System.Collections.Generic.HashSet`1<System.String> CarturSafeStamina.Plugin::Ignored
IL_00a5: call Localization Localization::get_instance()
IL_00aa: ldarg.0
IL_00ab: ldfld System.String Character::m_name
IL_00b0: callvirt System.String Localization::Localize(System.String)
IL_00b5: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.String>::Contains(!0)
IL_00ba: ret
IL_00bb: ldc.i4.0
IL_00bc: ret
IL_00bd: ldc.i4.1
IL_00be: ret

// System.Void CarturSafeStamina.Plugin::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BepInEx.BaseUnityPlugin::.ctor()
IL_0006: ret

// System.Void CarturSafeStamina.Plugin::.cctor()
.locals 
IL_0000: ldc.r4 -999
IL_0005: stsfld System.Single CarturSafeStamina.Plugin::_lastCheckTime
IL_000a: ldc.i4.1
IL_000b: stsfld System.Boolean CarturSafeStamina.Plugin::_lastResult
IL_0010: call System.StringComparer System.StringComparer::get_OrdinalIgnoreCase()
IL_0015: newobj System.Void System.Collections.Generic.HashSet`1<System.String>::.ctor(System.Collections.Generic.IEqualityComparer`1<!0>)
IL_001a: stsfld System.Collections.Generic.HashSet`1<System.String> CarturSafeStamina.Plugin::Ignored
IL_001f: ret

// System.Void CarturSafeStamina.Patch_RunStaminaDrain::Postfix(System.Single&,System.Boolean,Character)
.locals 
IL_0000: ldarg.1
IL_0001: brfalse.s IL_000f
IL_0003: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectSprint
IL_0008: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000d: brtrue.s IL_0010
IL_000f: ret
IL_0010: ldarg.2
IL_0011: call System.Boolean CarturSafeStamina.Plugin::IsLocalAndSafe(Character)
IL_0016: brfalse.s IL_001f
IL_0018: ldarg.0
IL_0019: ldc.r4 0
IL_001e: stind.r4
IL_001f: ret

// System.Void CarturSafeStamina.Patch_JumpStamina::Postfix(System.Single&,System.Boolean,Character)
.locals 
IL_0000: ldarg.1
IL_0001: brfalse.s IL_001e
IL_0003: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectJump
IL_0008: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000d: brfalse.s IL_001e
IL_000f: ldarg.2
IL_0010: call System.Boolean CarturSafeStamina.Plugin::IsLocalAndSafe(Character)
IL_0015: brfalse.s IL_001e
IL_0017: ldarg.0
IL_0018: ldc.r4 0
IL_001d: stind.r4
IL_001e: ret

// System.Void CarturSafeStamina.Patch_GetBuildStamina::Postfix(Player,System.Single&)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectBuild
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_001b
IL_000c: ldarg.0
IL_000d: call System.Boolean CarturSafeStamina.Plugin::IsSafe(Player)
IL_0012: brfalse.s IL_001b
IL_0014: ldarg.1
IL_0015: ldc.r4 0
IL_001a: stind.r4
IL_001b: ret

// System.Void CarturSafeStamina.Patch_GetAttackStamina::Postfix(System.Single&,Humanoid)
.locals Player
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectAttacks
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0015
IL_000c: ldarg.0
IL_000d: ldind.r4
IL_000e: ldc.r4 0
IL_0013: bgt.un.s IL_0016
IL_0015: ret
IL_0016: ldarg.1
IL_0017: isinst Player
IL_001c: stloc.0
IL_001d: ldloc.0
IL_001e: brfalse.s IL_002d
IL_0020: ldloc.0
IL_0021: ldsfld Player Player::m_localPlayer
IL_0026: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_002b: brfalse.s IL_002e
IL_002d: ret
IL_002e: ldloc.0
IL_002f: call System.Boolean CarturSafeStamina.Plugin::IsSafe(Player)
IL_0034: brfalse.s IL_003d
IL_0036: ldarg.0
IL_0037: ldc.r4 0
IL_003c: stind.r4
IL_003d: ret

// System.Void CarturSafeStamina.Patch_SwimStamina::Postfix(System.Single&,System.Boolean,Character)
.locals 
IL_0000: ldarg.1
IL_0001: brfalse.s IL_001e
IL_0003: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectSwim
IL_0008: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000d: brfalse.s IL_001e
IL_000f: ldarg.2
IL_0010: call System.Boolean CarturSafeStamina.Plugin::IsLocalAndSafe(Character)
IL_0015: brfalse.s IL_001e
IL_0017: ldarg.0
IL_0018: ldc.r4 0
IL_001d: stind.r4
IL_001e: ret

// System.Void CarturSafeStamina.Patch_SneakStamina::Postfix(System.Single&,System.Boolean,Character)
.locals 
IL_0000: ldarg.1
IL_0001: brfalse.s IL_001e
IL_0003: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectSneak
IL_0008: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000d: brfalse.s IL_001e
IL_000f: ldarg.2
IL_0010: call System.Boolean CarturSafeStamina.Plugin::IsLocalAndSafe(Character)
IL_0015: brfalse.s IL_001e
IL_0017: ldarg.0
IL_0018: ldc.r4 0
IL_001d: stind.r4
IL_001e: ret

// System.Void CarturSafeStamina.Patch_UpdateStats::Postfix(Player,System.Single,System.Single&,System.Single)
.locals System.Single, System.Single, System.Single
IL_0000: ldarg.0
IL_0001: ldsfld Player Player::m_localPlayer
IL_0006: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_000b: brtrue.s IL_0015
IL_000d: ldarg.3
IL_000e: ldc.r4 0
IL_0013: ble.un.s IL_0016
IL_0015: ret
IL_0016: ldarg.0
IL_0017: call System.Boolean CarturSafeStamina.Patch_UpdateStats::BlockedAndAllowed(Player)
IL_001c: brfalse.s IL_0026
IL_001e: ldarg.0
IL_001f: call System.Boolean CarturSafeStamina.Plugin::IsSafe(Player)
IL_0024: brtrue.s IL_0027
IL_0026: ret
IL_0027: ldarg.0
IL_0028: callvirt System.Single Character::GetMaxStamina()
IL_002d: stloc.0
IL_002e: ldarg.2
IL_002f: ldind.r4
IL_0030: ldloc.0
IL_0031: blt.un.s IL_0034
IL_0033: ret
IL_0034: ldarg.0
IL_0035: ldfld System.Single Player::m_staminaRegen
IL_003a: ldc.r4 1
IL_003f: ldarg.2
IL_0040: ldind.r4
IL_0041: ldloc.0
IL_0042: div
IL_0043: sub
IL_0044: ldarg.0
IL_0045: ldfld System.Single Player::m_staminaRegen
IL_004a: mul
IL_004b: ldarg.0
IL_004c: ldfld System.Single Player::m_staminaRegenTimeMultiplier
IL_0051: mul
IL_0052: add
IL_0053: stloc.1
IL_0054: ldc.r4 1
IL_0059: stloc.2
IL_005a: ldarg.0
IL_005b: callvirt SEMan Character::GetSEMan()
IL_0060: ldloca.s V_2
IL_0062: callvirt System.Void SEMan::ModifyStaminaRegen(System.Single&)
IL_0067: ldarg.2
IL_0068: ldloc.0
IL_0069: ldarg.2
IL_006a: ldind.r4
IL_006b: ldloc.1
IL_006c: ldloc.2
IL_006d: mul
IL_006e: ldarg.1
IL_006f: mul
IL_0070: ldsfld System.Single Game::m_staminaRegenRate
IL_0075: mul
IL_0076: add
IL_0077: call System.Single UnityEngine.Mathf::Min(System.Single,System.Single)
IL_007c: stind.r4
IL_007d: ret

// System.Boolean CarturSafeStamina.Patch_UpdateStats::BlockedAndAllowed(Player)
.locals 
IL_0000: ldarg.0
IL_0001: callvirt System.Boolean Character::IsEncumbered()
IL_0006: brfalse.s IL_0013
IL_0008: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectEncumbered
IL_000d: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0012: ret
IL_0013: ldarg.0
IL_0014: callvirt System.Boolean Character::IsSwimming()
IL_0019: brfalse.s IL_002e
IL_001b: ldarg.0
IL_001c: callvirt System.Boolean Character::IsOnGround()
IL_0021: brtrue.s IL_002e
IL_0023: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectSwim
IL_0028: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_002d: ret
IL_002e: ldarg.0
IL_002f: callvirt System.Boolean Character::InAttack()
IL_0034: brtrue.s IL_003e
IL_0036: ldarg.0
IL_0037: callvirt System.Boolean Character::InDodge()
IL_003c: brfalse.s IL_0049
IL_003e: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectAttacks
IL_0043: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0048: ret
IL_0049: ldarg.0
IL_004a: callvirt System.Boolean Character::IsWallRunning()
IL_004f: ret

// System.Void CarturSafeStamina.Patch_EncumberedBracket::Prefix(Player)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> CarturSafeStamina.Plugin::AffectEncumbered
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_0029
IL_000c: ldarg.0
IL_000d: ldsfld Player Player::m_localPlayer
IL_0012: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0017: brfalse.s IL_0029
IL_0019: ldarg.0
IL_001a: callvirt System.Boolean Character::IsEncumbered()
IL_001f: brfalse.s IL_0029
IL_0021: ldarg.0
IL_0022: call System.Boolean CarturSafeStamina.Plugin::IsSafe(Player)
IL_0027: br.s IL_002a
IL_0029: ldc.i4.0
IL_002a: stsfld System.Boolean CarturSafeStamina.Patch_EncumberedBracket::Skip
IL_002f: ret

// System.Void CarturSafeStamina.Patch_EncumberedBracket::Finalizer()
.locals 
IL_0000: ldc.i4.0
IL_0001: stsfld System.Boolean CarturSafeStamina.Patch_EncumberedBracket::Skip
IL_0006: ret

// System.Boolean CarturSafeStamina.Patch_EncumberedDrain::Prefix()
.locals 
IL_0000: ldsfld System.Boolean CarturSafeStamina.Patch_EncumberedBracket::Skip
IL_0005: ldc.i4.0
IL_0006: ceq
IL_0008: ret
