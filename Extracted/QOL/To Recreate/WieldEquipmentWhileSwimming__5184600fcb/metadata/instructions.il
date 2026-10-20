
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

// BepInEx.Configuration.ConfigEntry`1<T> WieldEquipmentWhileSwimming.Plugin::config(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
.locals BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigEntry`1<T>
IL_0000: ldarg.s description
IL_0002: callvirt System.String BepInEx.Configuration.ConfigDescription::get_Description()
IL_0007: ldarg.s synchronizedConfig
IL_0009: brtrue.s IL_0012
IL_000b: ldstr " [Not Synced with Server]"
IL_0010: br.s IL_0017
IL_0012: ldstr " [Synced with Server]"
IL_0017: call System.String System.String::Concat(System.String,System.String)
IL_001c: ldarg.s description
IL_001e: callvirt BepInEx.Configuration.AcceptableValueBase BepInEx.Configuration.ConfigDescription::get_AcceptableValues()
IL_0023: ldarg.s description
IL_0025: callvirt System.Object[] BepInEx.Configuration.ConfigDescription::get_Tags()
IL_002a: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_002f: stloc.0
IL_0030: ldarg.0
IL_0031: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0036: ldarg.1
IL_0037: ldarg.2
IL_0038: ldarg.3
IL_0039: ldloc.0
IL_003a: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<T>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_003f: stloc.1
IL_0040: ldsfld ServerSync.ConfigSync WieldEquipmentWhileSwimming.Plugin::_configSync
IL_0045: ldloc.1
IL_0046: callvirt ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync::AddConfigEntry<T>(BepInEx.Configuration.ConfigEntry`1<T>)
IL_004b: ldarg.s synchronizedConfig
IL_004d: stfld System.Boolean ServerSync.OwnConfigEntryBase::SynchronizedConfig
IL_0052: ldloc.1
IL_0053: ret

// BepInEx.Configuration.ConfigEntry`1<T> WieldEquipmentWhileSwimming.Plugin::config2(System.String,System.String,T,System.String,System.Boolean)
.locals WieldEquipmentWhileSwimming.Plugin/ConfigurationManagerAttributes
IL_0000: newobj System.Void WieldEquipmentWhileSwimming.Plugin/ConfigurationManagerAttributes::.ctor()
IL_0005: dup
IL_0006: ldsfld System.Action`1<BepInEx.Configuration.ConfigEntryBase> WieldEquipmentWhileSwimming.Plugin/<>O::<0>__TextBox
IL_000b: dup
IL_000c: brtrue.s IL_0021
IL_000e: pop
IL_000f: ldnull
IL_0010: ldftn System.Void WieldEquipmentWhileSwimming.Plugin::TextBox(BepInEx.Configuration.ConfigEntryBase)
IL_0016: newobj System.Void System.Action`1<BepInEx.Configuration.ConfigEntryBase>::.ctor(System.Object,System.IntPtr)
IL_001b: dup
IL_001c: stsfld System.Action`1<BepInEx.Configuration.ConfigEntryBase> WieldEquipmentWhileSwimming.Plugin/<>O::<0>__TextBox
IL_0021: stfld System.Action`1<BepInEx.Configuration.ConfigEntryBase> WieldEquipmentWhileSwimming.Plugin/ConfigurationManagerAttributes::CustomDrawer
IL_0026: stloc.0
IL_0027: ldarg.0
IL_0028: ldarg.1
IL_0029: ldarg.2
IL_002a: ldarg.3
IL_002b: ldarg.s desc
IL_002d: ldnull
IL_002e: ldc.i4.1
IL_002f: newarr System.Object
IL_0034: dup
IL_0035: ldc.i4.0
IL_0036: ldloc.0
IL_0037: stelem.ref
IL_0038: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_003d: ldarg.s synchronizedConfig
IL_003f: call BepInEx.Configuration.ConfigEntry`1<T> WieldEquipmentWhileSwimming.Plugin::config<T>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_0044: ret

// System.Void WieldEquipmentWhileSwimming.Plugin::Awake()
.locals System.Reflection.Assembly
IL_0000: ldarg.0
IL_0001: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0006: ldc.i4.0
IL_0007: callvirt System.Void BepInEx.Configuration.ConfigFile::set_SaveOnConfigSet(System.Boolean)
IL_000c: ldarg.0
IL_000d: ldstr "1- ServerSync"
IL_0012: ldstr "Lock Configuration"
IL_0017: ldc.i4.1
IL_0018: ldstr "If On, the configuration is locked and can be changed by server admins only."
IL_001d: ldnull
IL_001e: call !!0[] System.Array::Empty<System.Object>()
IL_0023: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0028: ldc.i4.1
IL_0029: call BepInEx.Configuration.ConfigEntry`1<T> WieldEquipmentWhileSwimming.Plugin::config<WieldEquipmentWhileSwimming.Plugin/Toggle>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_002e: stsfld BepInEx.Configuration.ConfigEntry`1<WieldEquipmentWhileSwimming.Plugin/Toggle> WieldEquipmentWhileSwimming.Plugin::_serverConfigLocked
IL_0033: ldsfld ServerSync.ConfigSync WieldEquipmentWhileSwimming.Plugin::_configSync
IL_0038: ldsfld BepInEx.Configuration.ConfigEntry`1<WieldEquipmentWhileSwimming.Plugin/Toggle> WieldEquipmentWhileSwimming.Plugin::_serverConfigLocked
IL_003d: callvirt ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync::AddLockingConfigEntry<WieldEquipmentWhileSwimming.Plugin/Toggle>(BepInEx.Configuration.ConfigEntry`1<T>)
IL_0042: pop
IL_0043: ldarg.0
IL_0044: ldstr "2- General"
IL_0049: ldstr "Allow"
IL_004e: ldc.i4.0
IL_004f: ldstr "Allow selected options to use in water."
IL_0054: ldnull
IL_0055: call !!0[] System.Array::Empty<System.Object>()
IL_005a: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_005f: ldc.i4.1
IL_0060: call BepInEx.Configuration.ConfigEntry`1<T> WieldEquipmentWhileSwimming.Plugin::config<WieldEquipmentWhileSwimming.Plugin/UseOptions>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_0065: stsfld BepInEx.Configuration.ConfigEntry`1<WieldEquipmentWhileSwimming.Plugin/UseOptions> WieldEquipmentWhileSwimming.Plugin::_useOptions
IL_006a: ldarg.0
IL_006b: ldstr "2- General"
IL_0070: ldstr "Custom"
IL_0075: ldstr "Hammer,AxeBronze,Hoe,PickaxeAntler"
IL_007a: ldstr "Allow only the items in the list when Allow is set to Custom."
IL_007f: ldc.i4.1
IL_0080: call BepInEx.Configuration.ConfigEntry`1<T> WieldEquipmentWhileSwimming.Plugin::config2<System.String>(System.String,System.String,T,System.String,System.Boolean)
IL_0085: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> WieldEquipmentWhileSwimming.Plugin::_useCustom
IL_008a: ldarg.0
IL_008b: ldstr "2- General"
IL_0090: ldstr "Black List"
IL_0095: ldstr "Hoe"
IL_009a: ldstr "Dont allow items on this list to be use while swimming."
IL_009f: ldc.i4.1
IL_00a0: call BepInEx.Configuration.ConfigEntry`1<T> WieldEquipmentWhileSwimming.Plugin::config2<System.String>(System.String,System.String,T,System.String,System.Boolean)
IL_00a5: stsfld BepInEx.Configuration.ConfigEntry`1<System.String> WieldEquipmentWhileSwimming.Plugin::_blackList
IL_00aa: ldarg.0
IL_00ab: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_00b0: ldc.i4.1
IL_00b1: callvirt System.Void BepInEx.Configuration.ConfigFile::set_SaveOnConfigSet(System.Boolean)
IL_00b6: ldarg.0
IL_00b7: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_00bc: callvirt System.Void BepInEx.Configuration.ConfigFile::Save()
IL_00c1: call System.Reflection.Assembly System.Reflection.Assembly::GetExecutingAssembly()
IL_00c6: stloc.0
IL_00c7: ldsfld HarmonyLib.Harmony WieldEquipmentWhileSwimming.Plugin::_harmony
IL_00cc: ldloc.0
IL_00cd: callvirt System.Void HarmonyLib.Harmony::PatchAll(System.Reflection.Assembly)
IL_00d2: ret

// System.Void WieldEquipmentWhileSwimming.Plugin::OnDestroy()
.locals 
IL_0000: ldarg.0
IL_0001: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0006: callvirt System.Void BepInEx.Configuration.ConfigFile::Save()
IL_000b: ret

// System.Void WieldEquipmentWhileSwimming.Plugin::TextBox(BepInEx.Configuration.ConfigEntryBase)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.0
IL_0002: callvirt System.Object BepInEx.Configuration.ConfigEntryBase::get_BoxedValue()
IL_0007: castclass System.String
IL_000c: ldc.i4.2
IL_000d: newarr UnityEngine.GUILayoutOption
IL_0012: dup
IL_0013: ldc.i4.0
IL_0014: ldc.i4.1
IL_0015: call UnityEngine.GUILayoutOption UnityEngine.GUILayout::ExpandWidth(System.Boolean)
IL_001a: stelem.ref
IL_001b: dup
IL_001c: ldc.i4.1
IL_001d: ldc.i4.1
IL_001e: call UnityEngine.GUILayoutOption UnityEngine.GUILayout::ExpandHeight(System.Boolean)
IL_0023: stelem.ref
IL_0024: call System.String UnityEngine.GUILayout::TextArea(System.String,UnityEngine.GUILayoutOption[])
IL_0029: callvirt System.Void BepInEx.Configuration.ConfigEntryBase::set_BoxedValue(System.Object)
IL_002e: ret

// System.Void WieldEquipmentWhileSwimming.Plugin::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BepInEx.BaseUnityPlugin::.ctor()
IL_0006: ret

// System.Void WieldEquipmentWhileSwimming.Plugin::.cctor()
.locals 
IL_0000: ldstr "blacks7ar.WieldEquipmentWhileSwimming"
IL_0005: newobj System.Void HarmonyLib.Harmony::.ctor(System.String)
IL_000a: stsfld HarmonyLib.Harmony WieldEquipmentWhileSwimming.Plugin::_harmony
IL_000f: ldstr "blacks7ar.WieldEquipmentWhileSwimming"
IL_0014: newobj System.Void ServerSync.ConfigSync::.ctor(System.String)
IL_0019: dup
IL_001a: ldstr "WieldEquipmentWhileSwimming"
IL_001f: stfld System.String ServerSync.ConfigSync::DisplayName
IL_0024: dup
IL_0025: ldstr "1.1.4"
IL_002a: stfld System.String ServerSync.ConfigSync::CurrentVersion
IL_002f: dup
IL_0030: ldstr "1.1.4"
IL_0035: stfld System.String ServerSync.ConfigSync::MinimumRequiredVersion
IL_003a: stsfld ServerSync.ConfigSync WieldEquipmentWhileSwimming.Plugin::_configSync
IL_003f: ret

// System.Void WieldEquipmentWhileSwimming.Plugin/ConfigurationManagerAttributes::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean WieldEquipmentWhileSwimming.Plugin/Patches::IsSwimming_Prefix(Humanoid,System.Single,System.Boolean&)
.locals System.Diagnostics.StackTrace, System.String, System.Int32, WieldEquipmentWhileSwimming.Plugin/UseOptions
IL_0000: ldarg.1
IL_0001: ldc.r4 0.5
IL_0006: bge.un.s IL_0010
IL_0008: ldarg.0
IL_0009: callvirt System.Boolean Character::IsPlayer()
IL_000e: brtrue.s IL_0012
IL_0010: ldc.i4.1
IL_0011: ret
IL_0012: newobj System.Void System.Diagnostics.StackTrace::.ctor()
IL_0017: stloc.0
IL_0018: ldstr ""
IL_001d: stloc.1
IL_001e: ldc.i4.2
IL_001f: stloc.2
IL_0020: br.s IL_0043
IL_0022: ldloc.1
IL_0023: ldloc.0
IL_0024: ldloc.2
IL_0025: callvirt System.Diagnostics.StackFrame System.Diagnostics.StackTrace::GetFrame(System.Int32)
IL_002a: callvirt System.Reflection.MethodBase System.Diagnostics.StackFrame::GetMethod()
IL_002f: call System.String HarmonyLib.GeneralExtensions::FullDescription(System.Reflection.MethodBase)
IL_0034: ldstr "_"
IL_0039: call System.String System.String::Concat(System.String,System.String,System.String)
IL_003e: stloc.1
IL_003f: ldloc.2
IL_0040: ldc.i4.1
IL_0041: add
IL_0042: stloc.2
IL_0043: ldloc.2
IL_0044: ldloc.0
IL_0045: callvirt System.Int32 System.Diagnostics.StackTrace::get_FrameCount()
IL_004a: bge.s IL_0051
IL_004c: ldloc.2
IL_004d: ldc.i4.s 10
IL_004f: blt.s IL_0022
IL_0051: ldloc.1
IL_0052: ldstr "UpdateEquipment"
IL_0057: callvirt System.Boolean System.String::Contains(System.String)
IL_005c: brtrue.s IL_006d
IL_005e: ldloc.1
IL_005f: ldstr "EquipItem"
IL_0064: callvirt System.Boolean System.String::Contains(System.String)
IL_0069: brtrue.s IL_006d
IL_006b: ldc.i4.1
IL_006c: ret
IL_006d: ldsfld BepInEx.Configuration.ConfigEntry`1<WieldEquipmentWhileSwimming.Plugin/UseOptions> WieldEquipmentWhileSwimming.Plugin::_useOptions
IL_0072: callvirt !0 BepInEx.Configuration.ConfigEntry`1<WieldEquipmentWhileSwimming.Plugin/UseOptions>::get_Value()
IL_0077: stloc.3
IL_0078: ldloc.3
IL_0079: switch IL_0093,IL_019b,IL_0103,IL_0225
IL_008e: br IL_02ea
IL_0093: ldarg.0
IL_0094: callvirt ItemDrop/ItemData Humanoid::GetRightItem()
IL_0099: brfalse.s IL_00c4
IL_009b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> WieldEquipmentWhileSwimming.Plugin::_blackList
IL_00a0: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_00a5: ldc.i4.s 44
IL_00a7: ldc.i4.0
IL_00a8: callvirt System.String[] System.String::Split(System.Char,System.StringSplitOptions)
IL_00ad: ldarg.0
IL_00ae: callvirt ItemDrop/ItemData Humanoid::GetRightItem()
IL_00b3: ldfld UnityEngine.GameObject ItemDrop/ItemData::m_dropPrefab
IL_00b8: callvirt System.String UnityEngine.Object::get_name()
IL_00bd: call System.Boolean System.Linq.Enumerable::Contains<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,!!0)
IL_00c2: brtrue.s IL_00f5
IL_00c4: ldarg.0
IL_00c5: callvirt ItemDrop/ItemData Humanoid::GetLeftItem()
IL_00ca: brfalse.s IL_00fe
IL_00cc: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> WieldEquipmentWhileSwimming.Plugin::_blackList
IL_00d1: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_00d6: ldc.i4.s 44
IL_00d8: ldc.i4.0
IL_00d9: callvirt System.String[] System.String::Split(System.Char,System.StringSplitOptions)
IL_00de: ldarg.0
IL_00df: callvirt ItemDrop/ItemData Humanoid::GetLeftItem()
IL_00e4: ldfld UnityEngine.GameObject ItemDrop/ItemData::m_dropPrefab
IL_00e9: callvirt System.String UnityEngine.Object::get_name()
IL_00ee: call System.Boolean System.Linq.Enumerable::Contains<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,!!0)
IL_00f3: brfalse.s IL_00fe
IL_00f5: ldarg.0
IL_00f6: ldc.i4.0
IL_00f7: ldc.i4.1
IL_00f8: callvirt System.Boolean Humanoid::HideHandItems(System.Boolean,System.Boolean)
IL_00fd: pop
IL_00fe: ldarg.2
IL_00ff: ldc.i4.0
IL_0100: stind.i1
IL_0101: ldc.i4.0
IL_0102: ret
IL_0103: ldarg.0
IL_0104: callvirt ItemDrop/ItemData Humanoid::GetRightItem()
IL_0109: brfalse.s IL_0148
IL_010b: ldarg.0
IL_010c: callvirt ItemDrop/ItemData Humanoid::GetRightItem()
IL_0111: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_0116: ldfld ItemDrop/ItemData/ItemType ItemDrop/ItemData/SharedData::m_itemType
IL_011b: ldc.i4.s 19
IL_011d: bne.un.s IL_018d
IL_011f: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> WieldEquipmentWhileSwimming.Plugin::_blackList
IL_0124: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_0129: ldc.i4.s 44
IL_012b: ldc.i4.0
IL_012c: callvirt System.String[] System.String::Split(System.Char,System.StringSplitOptions)
IL_0131: ldarg.0
IL_0132: callvirt ItemDrop/ItemData Humanoid::GetRightItem()
IL_0137: ldfld UnityEngine.GameObject ItemDrop/ItemData::m_dropPrefab
IL_013c: callvirt System.String UnityEngine.Object::get_name()
IL_0141: call System.Boolean System.Linq.Enumerable::Contains<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,!!0)
IL_0146: brtrue.s IL_018d
IL_0148: ldarg.0
IL_0149: callvirt ItemDrop/ItemData Humanoid::GetLeftItem()
IL_014e: brfalse.s IL_0196
IL_0150: ldarg.0
IL_0151: callvirt ItemDrop/ItemData Humanoid::GetLeftItem()
IL_0156: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_015b: ldfld ItemDrop/ItemData/ItemType ItemDrop/ItemData/SharedData::m_itemType
IL_0160: ldc.i4.s 19
IL_0162: bne.un.s IL_018d
IL_0164: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> WieldEquipmentWhileSwimming.Plugin::_blackList
IL_0169: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_016e: ldc.i4.s 44
IL_0170: ldc.i4.0
IL_0171: callvirt System.String[] System.String::Split(System.Char,System.StringSplitOptions)
IL_0176: ldarg.0
IL_0177: callvirt ItemDrop/ItemData Humanoid::GetLeftItem()
IL_017c: ldfld UnityEngine.GameObject ItemDrop/ItemData::m_dropPrefab
IL_0181: callvirt System.String UnityEngine.Object::get_name()
IL_0186: call System.Boolean System.Linq.Enumerable::Contains<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,!!0)
IL_018b: brfalse.s IL_0196
IL_018d: ldarg.0
IL_018e: ldc.i4.0
IL_018f: ldc.i4.1
IL_0190: callvirt System.Boolean Humanoid::HideHandItems(System.Boolean,System.Boolean)
IL_0195: pop
IL_0196: ldarg.2
IL_0197: ldc.i4.0
IL_0198: stind.i1
IL_0199: ldc.i4.0
IL_019a: ret
IL_019b: ldarg.0
IL_019c: callvirt ItemDrop/ItemData Humanoid::GetRightItem()
IL_01a1: brfalse.s IL_01d9
IL_01a3: ldarg.0
IL_01a4: callvirt ItemDrop/ItemData Humanoid::GetRightItem()
IL_01a9: callvirt System.Boolean ItemDrop/ItemData::IsWeapon()
IL_01ae: brfalse.s IL_0217
IL_01b0: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> WieldEquipmentWhileSwimming.Plugin::_blackList
IL_01b5: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_01ba: ldc.i4.s 44
IL_01bc: ldc.i4.0
IL_01bd: callvirt System.String[] System.String::Split(System.Char,System.StringSplitOptions)
IL_01c2: ldarg.0
IL_01c3: callvirt ItemDrop/ItemData Humanoid::GetRightItem()
IL_01c8: ldfld UnityEngine.GameObject ItemDrop/ItemData::m_dropPrefab
IL_01cd: callvirt System.String UnityEngine.Object::get_name()
IL_01d2: call System.Boolean System.Linq.Enumerable::Contains<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,!!0)
IL_01d7: brtrue.s IL_0217
IL_01d9: ldarg.0
IL_01da: callvirt ItemDrop/ItemData Humanoid::GetLeftItem()
IL_01df: brfalse.s IL_0220
IL_01e1: ldarg.0
IL_01e2: callvirt ItemDrop/ItemData Humanoid::GetLeftItem()
IL_01e7: callvirt System.Boolean ItemDrop/ItemData::IsWeapon()
IL_01ec: brfalse.s IL_0217
IL_01ee: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> WieldEquipmentWhileSwimming.Plugin::_blackList
IL_01f3: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_01f8: ldc.i4.s 44
IL_01fa: ldc.i4.0
IL_01fb: callvirt System.String[] System.String::Split(System.Char,System.StringSplitOptions)
IL_0200: ldarg.0
IL_0201: callvirt ItemDrop/ItemData Humanoid::GetLeftItem()
IL_0206: ldfld UnityEngine.GameObject ItemDrop/ItemData::m_dropPrefab
IL_020b: callvirt System.String UnityEngine.Object::get_name()
IL_0210: call System.Boolean System.Linq.Enumerable::Contains<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,!!0)
IL_0215: brfalse.s IL_0220
IL_0217: ldarg.0
IL_0218: ldc.i4.0
IL_0219: ldc.i4.1
IL_021a: callvirt System.Boolean Humanoid::HideHandItems(System.Boolean,System.Boolean)
IL_021f: pop
IL_0220: ldarg.2
IL_0221: ldc.i4.0
IL_0222: stind.i1
IL_0223: ldc.i4.0
IL_0224: ret
IL_0225: ldarg.0
IL_0226: callvirt ItemDrop/ItemData Humanoid::GetRightItem()
IL_022b: brfalse.s IL_0282
IL_022d: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> WieldEquipmentWhileSwimming.Plugin::_useCustom
IL_0232: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_0237: ldc.i4.s 44
IL_0239: ldc.i4.0
IL_023a: callvirt System.String[] System.String::Split(System.Char,System.StringSplitOptions)
IL_023f: ldarg.0
IL_0240: callvirt ItemDrop/ItemData Humanoid::GetRightItem()
IL_0245: ldfld UnityEngine.GameObject ItemDrop/ItemData::m_dropPrefab
IL_024a: callvirt System.String UnityEngine.Object::get_name()
IL_024f: call System.Boolean System.Linq.Enumerable::Contains<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,!!0)
IL_0254: brfalse IL_02dc
IL_0259: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> WieldEquipmentWhileSwimming.Plugin::_blackList
IL_025e: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_0263: ldc.i4.s 44
IL_0265: ldc.i4.0
IL_0266: callvirt System.String[] System.String::Split(System.Char,System.StringSplitOptions)
IL_026b: ldarg.0
IL_026c: callvirt ItemDrop/ItemData Humanoid::GetRightItem()
IL_0271: ldfld UnityEngine.GameObject ItemDrop/ItemData::m_dropPrefab
IL_0276: callvirt System.String UnityEngine.Object::get_name()
IL_027b: call System.Boolean System.Linq.Enumerable::Contains<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,!!0)
IL_0280: brtrue.s IL_02dc
IL_0282: ldarg.0
IL_0283: callvirt ItemDrop/ItemData Humanoid::GetLeftItem()
IL_0288: brfalse.s IL_02e5
IL_028a: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> WieldEquipmentWhileSwimming.Plugin::_useCustom
IL_028f: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_0294: ldc.i4.s 44
IL_0296: ldc.i4.0
IL_0297: callvirt System.String[] System.String::Split(System.Char,System.StringSplitOptions)
IL_029c: ldarg.0
IL_029d: callvirt ItemDrop/ItemData Humanoid::GetLeftItem()
IL_02a2: ldfld UnityEngine.GameObject ItemDrop/ItemData::m_dropPrefab
IL_02a7: callvirt System.String UnityEngine.Object::get_name()
IL_02ac: call System.Boolean System.Linq.Enumerable::Contains<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,!!0)
IL_02b1: brfalse.s IL_02dc
IL_02b3: ldsfld BepInEx.Configuration.ConfigEntry`1<System.String> WieldEquipmentWhileSwimming.Plugin::_blackList
IL_02b8: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.String>::get_Value()
IL_02bd: ldc.i4.s 44
IL_02bf: ldc.i4.0
IL_02c0: callvirt System.String[] System.String::Split(System.Char,System.StringSplitOptions)
IL_02c5: ldarg.0
IL_02c6: callvirt ItemDrop/ItemData Humanoid::GetLeftItem()
IL_02cb: ldfld UnityEngine.GameObject ItemDrop/ItemData::m_dropPrefab
IL_02d0: callvirt System.String UnityEngine.Object::get_name()
IL_02d5: call System.Boolean System.Linq.Enumerable::Contains<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,!!0)
IL_02da: brfalse.s IL_02e5
IL_02dc: ldarg.0
IL_02dd: ldc.i4.0
IL_02de: ldc.i4.1
IL_02df: callvirt System.Boolean Humanoid::HideHandItems(System.Boolean,System.Boolean)
IL_02e4: pop
IL_02e5: ldarg.2
IL_02e6: ldc.i4.0
IL_02e7: stind.i1
IL_02e8: ldc.i4.0
IL_02e9: ret
IL_02ea: ldc.i4.1
IL_02eb: ret

// System.Void WieldEquipmentWhileSwimming.Plugin/Patches::EquipItem_Prefix()
.locals 
IL_0000: ret

// System.Void WieldEquipmentWhileSwimming.Plugin/Patches::UpdateEquipment_Prefix()
.locals 
IL_0000: ret

// System.Void System.Runtime.CompilerServices.NullableAttribute::.ctor(System.Byte)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldc.i4.1
IL_0009: newarr System.Byte
IL_000e: dup
IL_000f: ldc.i4.0
IL_0010: ldarg.1
IL_0011: stelem.i1
IL_0012: stfld System.Byte[] System.Runtime.CompilerServices.NullableAttribute::NullableFlags
IL_0017: ret

// System.Void System.Runtime.CompilerServices.NullableAttribute::.ctor(System.Byte[])
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldarg.1
IL_0009: stfld System.Byte[] System.Runtime.CompilerServices.NullableAttribute::NullableFlags
IL_000e: ret

// System.Void System.Runtime.CompilerServices.NullableContextAttribute::.ctor(System.Byte)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldarg.1
IL_0009: stfld System.Byte System.Runtime.CompilerServices.NullableContextAttribute::Flag
IL_000e: ret

// System.Void ServerSync.OwnConfigEntryBase::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.1
IL_0002: stfld System.Boolean ServerSync.OwnConfigEntryBase::SynchronizedConfig
IL_0007: ldarg.0
IL_0008: call System.Void System.Object::.ctor()
IL_000d: nop
IL_000e: ret

// System.Void ServerSync.SyncedConfigEntry`1::.ctor(BepInEx.Configuration.ConfigEntry`1<T>)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld BepInEx.Configuration.ConfigEntry`1<T> ServerSync.SyncedConfigEntry`1<T>::SourceConfig
IL_0007: ldarg.0
IL_0008: call System.Void ServerSync.OwnConfigEntryBase::.ctor()
IL_000d: nop
IL_000e: ret

// BepInEx.Configuration.ConfigEntryBase ServerSync.SyncedConfigEntry`1::get_BaseConfig()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld BepInEx.Configuration.ConfigEntry`1<T> ServerSync.SyncedConfigEntry`1<T>::SourceConfig
IL_0006: ret

// T ServerSync.SyncedConfigEntry`1::get_Value()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld BepInEx.Configuration.ConfigEntry`1<T> ServerSync.SyncedConfigEntry`1<T>::SourceConfig
IL_0006: callvirt !0 BepInEx.Configuration.ConfigEntry`1<T>::get_Value()
IL_000b: ret

// System.Void ServerSync.SyncedConfigEntry`1::set_Value(T)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld BepInEx.Configuration.ConfigEntry`1<T> ServerSync.SyncedConfigEntry`1<T>::SourceConfig
IL_0006: ldarg.1
IL_0007: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<T>::set_Value(!0)
IL_000c: nop
IL_000d: ret

// System.Void ServerSync.SyncedConfigEntry`1::AssignLocalValue(T)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_0007: ldnull
IL_0008: ceq
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: brfalse.s IL_001a
IL_000e: nop
IL_000f: ldarg.0
IL_0010: ldarg.1
IL_0011: call System.Void ServerSync.SyncedConfigEntry`1<T>::set_Value(T)
IL_0016: nop
IL_0017: nop
IL_0018: br.s IL_0028
IL_001a: nop
IL_001b: ldarg.0
IL_001c: ldarg.1
IL_001d: box T
IL_0022: stfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_0027: nop
IL_0028: ret

// System.Void ServerSync.CustomSyncedValueBase::add_ValueChanged(System.Action)
.locals System.Action, System.Action, System.Action
IL_0000: ldarg.0
IL_0001: ldfld System.Action ServerSync.CustomSyncedValueBase::ValueChanged
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: stloc.1
IL_0009: ldloc.1
IL_000a: ldarg.1
IL_000b: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_0010: castclass System.Action
IL_0015: stloc.2
IL_0016: ldarg.0
IL_0017: ldflda System.Action ServerSync.CustomSyncedValueBase::ValueChanged
IL_001c: ldloc.2
IL_001d: ldloc.1
IL_001e: call !!0 System.Threading.Interlocked::CompareExchange<System.Action>(!!0&,!!0,!!0)
IL_0023: stloc.0
IL_0024: ldloc.0
IL_0025: ldloc.1
IL_0026: bne.un.s IL_0007
IL_0028: ret

// System.Void ServerSync.CustomSyncedValueBase::remove_ValueChanged(System.Action)
.locals System.Action, System.Action, System.Action
IL_0000: ldarg.0
IL_0001: ldfld System.Action ServerSync.CustomSyncedValueBase::ValueChanged
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: stloc.1
IL_0009: ldloc.1
IL_000a: ldarg.1
IL_000b: call System.Delegate System.Delegate::Remove(System.Delegate,System.Delegate)
IL_0010: castclass System.Action
IL_0015: stloc.2
IL_0016: ldarg.0
IL_0017: ldflda System.Action ServerSync.CustomSyncedValueBase::ValueChanged
IL_001c: ldloc.2
IL_001d: ldloc.1
IL_001e: call !!0 System.Threading.Interlocked::CompareExchange<System.Action>(!!0&,!!0,!!0)
IL_0023: stloc.0
IL_0024: ldloc.0
IL_0025: ldloc.1
IL_0026: bne.un.s IL_0007
IL_0028: ret

// System.Object ServerSync.CustomSyncedValueBase::get_BoxedValue()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Object ServerSync.CustomSyncedValueBase::boxedValue
IL_0006: ret

// System.Void ServerSync.CustomSyncedValueBase::set_BoxedValue(System.Object)
.locals 
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldarg.1
IL_0003: stfld System.Object ServerSync.CustomSyncedValueBase::boxedValue
IL_0008: ldarg.0
IL_0009: ldfld System.Action ServerSync.CustomSyncedValueBase::ValueChanged
IL_000e: dup
IL_000f: brtrue.s IL_0014
IL_0011: pop
IL_0012: br.s IL_001a
IL_0014: callvirt System.Void System.Action::Invoke()
IL_0019: nop
IL_001a: ret

// System.Void ServerSync.CustomSyncedValueBase::.ctor(ServerSync.ConfigSync,System.String,System.Type,System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: nop
IL_0008: ldarg.0
IL_0009: ldarg.s priority
IL_000b: stfld System.Int32 ServerSync.CustomSyncedValueBase::Priority
IL_0010: ldarg.0
IL_0011: ldarg.2
IL_0012: stfld System.String ServerSync.CustomSyncedValueBase::Identifier
IL_0017: ldarg.0
IL_0018: ldarg.3
IL_0019: stfld System.Type ServerSync.CustomSyncedValueBase::Type
IL_001e: ldarg.1
IL_001f: ldarg.0
IL_0020: callvirt System.Void ServerSync.ConfigSync::AddCustomValue(ServerSync.CustomSyncedValueBase)
IL_0025: nop
IL_0026: ldarg.0
IL_0027: ldarg.1
IL_0028: callvirt System.Boolean ServerSync.ConfigSync::get_IsSourceOfTruth()
IL_002d: stfld System.Boolean ServerSync.CustomSyncedValueBase::localIsOwner
IL_0032: ldarg.1
IL_0033: ldarg.0
IL_0034: ldftn System.Void ServerSync.CustomSyncedValueBase::<.ctor>b__12_0(System.Boolean)
IL_003a: newobj System.Void System.Action`1<System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_003f: callvirt System.Void ServerSync.ConfigSync::add_SourceOfTruthChanged(System.Action`1<System.Boolean>)
IL_0044: nop
IL_0045: ret

// System.Void ServerSync.CustomSyncedValueBase::<.ctor>b__12_0(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Boolean ServerSync.CustomSyncedValueBase::localIsOwner
IL_0007: ret

// T ServerSync.CustomSyncedValue`1::get_Value()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Object ServerSync.CustomSyncedValueBase::get_BoxedValue()
IL_0006: unbox.any T
IL_000b: ret

// System.Void ServerSync.CustomSyncedValue`1::set_Value(T)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: box T
IL_0007: call System.Void ServerSync.CustomSyncedValueBase::set_BoxedValue(System.Object)
IL_000c: nop
IL_000d: ret

// System.Void ServerSync.CustomSyncedValue`1::.ctor(ServerSync.ConfigSync,System.String,T,System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldarg.2
IL_0003: ldtoken T
IL_0008: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_000d: ldarg.s priority
IL_000f: call System.Void ServerSync.CustomSyncedValueBase::.ctor(ServerSync.ConfigSync,System.String,System.Type,System.Int32)
IL_0014: nop
IL_0015: nop
IL_0016: ldarg.0
IL_0017: ldarg.3
IL_0018: call System.Void ServerSync.CustomSyncedValue`1<T>::set_Value(T)
IL_001d: nop
IL_001e: ret

// System.Void ServerSync.CustomSyncedValue`1::AssignLocalValue(T)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.Boolean ServerSync.CustomSyncedValueBase::localIsOwner
IL_0007: stloc.0
IL_0008: ldloc.0
IL_0009: brfalse.s IL_0017
IL_000b: nop
IL_000c: ldarg.0
IL_000d: ldarg.1
IL_000e: call System.Void ServerSync.CustomSyncedValue`1<T>::set_Value(T)
IL_0013: nop
IL_0014: nop
IL_0015: br.s IL_0025
IL_0017: nop
IL_0018: ldarg.0
IL_0019: ldarg.1
IL_001a: box T
IL_001f: stfld System.Object ServerSync.CustomSyncedValueBase::LocalBaseValue
IL_0024: nop
IL_0025: ret

// System.Void ServerSync.ConfigurationManagerAttributes::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.0
IL_0002: newobj System.Void System.Nullable`1<System.Boolean>::.ctor(!0)
IL_0007: stfld System.Nullable`1<System.Boolean> ServerSync.ConfigurationManagerAttributes::ReadOnly
IL_000c: ldarg.0
IL_000d: call System.Void System.Object::.ctor()
IL_0012: nop
IL_0013: ret

// System.Boolean ServerSync.ConfigSync::get_IsLocked()
.locals System.Nullable`1<System.Boolean>
IL_0000: ldarg.0
IL_0001: ldfld System.Nullable`1<System.Boolean> ServerSync.ConfigSync::forceConfigLocking
IL_0006: stloc.0
IL_0007: ldloca.s V_0
IL_0009: call System.Boolean System.Nullable`1<System.Boolean>::get_HasValue()
IL_000e: brtrue.s IL_003f
IL_0010: ldarg.0
IL_0011: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::lockedConfig
IL_0016: brfalse.s IL_003c
IL_0018: ldarg.0
IL_0019: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::lockedConfig
IL_001e: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_0023: callvirt System.Object BepInEx.Configuration.ConfigEntryBase::get_BoxedValue()
IL_0028: castclass System.IConvertible
IL_002d: call System.Globalization.CultureInfo System.Globalization.CultureInfo::get_InvariantCulture()
IL_0032: callvirt System.Int32 System.IConvertible::ToInt32(System.IFormatProvider)
IL_0037: ldc.i4.0
IL_0038: cgt.un
IL_003a: br.s IL_003d
IL_003c: ldc.i4.0
IL_003d: br.s IL_0046
IL_003f: ldloca.s V_0
IL_0041: call !0 System.Nullable`1<System.Boolean>::GetValueOrDefault()
IL_0046: brfalse.s IL_0052
IL_0048: ldsfld System.Boolean ServerSync.ConfigSync::lockExempt
IL_004d: ldc.i4.0
IL_004e: ceq
IL_0050: br.s IL_0053
IL_0052: ldc.i4.0
IL_0053: ret

// System.Void ServerSync.ConfigSync::set_IsLocked(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: newobj System.Void System.Nullable`1<System.Boolean>::.ctor(!0)
IL_0007: stfld System.Nullable`1<System.Boolean> ServerSync.ConfigSync::forceConfigLocking
IL_000c: ret

// System.Boolean ServerSync.ConfigSync::get_IsAdmin()
.locals 
IL_0000: ldsfld System.Boolean ServerSync.ConfigSync::lockExempt
IL_0005: brtrue.s IL_000f
IL_0007: ldarg.0
IL_0008: ldfld System.Boolean ServerSync.ConfigSync::isSourceOfTruth
IL_000d: br.s IL_0010
IL_000f: ldc.i4.1
IL_0010: ret

// System.Boolean ServerSync.ConfigSync::get_IsSourceOfTruth()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean ServerSync.ConfigSync::isSourceOfTruth
IL_0006: ret

// System.Void ServerSync.ConfigSync::set_IsSourceOfTruth(System.Boolean)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: ldarg.0
IL_0003: ldfld System.Boolean ServerSync.ConfigSync::isSourceOfTruth
IL_0008: ceq
IL_000a: ldc.i4.0
IL_000b: ceq
IL_000d: stloc.0
IL_000e: ldloc.0
IL_000f: brfalse.s IL_002d
IL_0011: nop
IL_0012: ldarg.0
IL_0013: ldarg.1
IL_0014: stfld System.Boolean ServerSync.ConfigSync::isSourceOfTruth
IL_0019: ldarg.0
IL_001a: ldfld System.Action`1<System.Boolean> ServerSync.ConfigSync::SourceOfTruthChanged
IL_001f: dup
IL_0020: brtrue.s IL_0025
IL_0022: pop
IL_0023: br.s IL_002c
IL_0025: ldarg.1
IL_0026: callvirt System.Void System.Action`1<System.Boolean>::Invoke(!0)
IL_002b: nop
IL_002c: nop
IL_002d: ret

// System.Boolean ServerSync.ConfigSync::get_InitialSyncDone()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean ServerSync.ConfigSync::<InitialSyncDone>k__BackingField
IL_0006: ret

// System.Void ServerSync.ConfigSync::set_InitialSyncDone(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Boolean ServerSync.ConfigSync::<InitialSyncDone>k__BackingField
IL_0007: ret

// System.Void ServerSync.ConfigSync::add_SourceOfTruthChanged(System.Action`1<System.Boolean>)
.locals System.Action`1<System.Boolean>, System.Action`1<System.Boolean>, System.Action`1<System.Boolean>
IL_0000: ldarg.0
IL_0001: ldfld System.Action`1<System.Boolean> ServerSync.ConfigSync::SourceOfTruthChanged
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: stloc.1
IL_0009: ldloc.1
IL_000a: ldarg.1
IL_000b: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_0010: castclass System.Action`1<System.Boolean>
IL_0015: stloc.2
IL_0016: ldarg.0
IL_0017: ldflda System.Action`1<System.Boolean> ServerSync.ConfigSync::SourceOfTruthChanged
IL_001c: ldloc.2
IL_001d: ldloc.1
IL_001e: call !!0 System.Threading.Interlocked::CompareExchange<System.Action`1<System.Boolean>>(!!0&,!!0,!!0)
IL_0023: stloc.0
IL_0024: ldloc.0
IL_0025: ldloc.1
IL_0026: bne.un.s IL_0007
IL_0028: ret

// System.Void ServerSync.ConfigSync::remove_SourceOfTruthChanged(System.Action`1<System.Boolean>)
.locals System.Action`1<System.Boolean>, System.Action`1<System.Boolean>, System.Action`1<System.Boolean>
IL_0000: ldarg.0
IL_0001: ldfld System.Action`1<System.Boolean> ServerSync.ConfigSync::SourceOfTruthChanged
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: stloc.1
IL_0009: ldloc.1
IL_000a: ldarg.1
IL_000b: call System.Delegate System.Delegate::Remove(System.Delegate,System.Delegate)
IL_0010: castclass System.Action`1<System.Boolean>
IL_0015: stloc.2
IL_0016: ldarg.0
IL_0017: ldflda System.Action`1<System.Boolean> ServerSync.ConfigSync::SourceOfTruthChanged
IL_001c: ldloc.2
IL_001d: ldloc.1
IL_001e: call !!0 System.Threading.Interlocked::CompareExchange<System.Action`1<System.Boolean>>(!!0&,!!0,!!0)
IL_0023: stloc.0
IL_0024: ldloc.0
IL_0025: ldloc.1
IL_0026: bne.un.s IL_0007
IL_0028: ret

// System.Void ServerSync.ConfigSync::add_lockedConfigChanged(System.Action)
.locals System.Action, System.Action, System.Action
IL_0000: ldarg.0
IL_0001: ldfld System.Action ServerSync.ConfigSync::lockedConfigChanged
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: stloc.1
IL_0009: ldloc.1
IL_000a: ldarg.1
IL_000b: call System.Delegate System.Delegate::Combine(System.Delegate,System.Delegate)
IL_0010: castclass System.Action
IL_0015: stloc.2
IL_0016: ldarg.0
IL_0017: ldflda System.Action ServerSync.ConfigSync::lockedConfigChanged
IL_001c: ldloc.2
IL_001d: ldloc.1
IL_001e: call !!0 System.Threading.Interlocked::CompareExchange<System.Action>(!!0&,!!0,!!0)
IL_0023: stloc.0
IL_0024: ldloc.0
IL_0025: ldloc.1
IL_0026: bne.un.s IL_0007
IL_0028: ret

// System.Void ServerSync.ConfigSync::remove_lockedConfigChanged(System.Action)
.locals System.Action, System.Action, System.Action
IL_0000: ldarg.0
IL_0001: ldfld System.Action ServerSync.ConfigSync::lockedConfigChanged
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: stloc.1
IL_0009: ldloc.1
IL_000a: ldarg.1
IL_000b: call System.Delegate System.Delegate::Remove(System.Delegate,System.Delegate)
IL_0010: castclass System.Action
IL_0015: stloc.2
IL_0016: ldarg.0
IL_0017: ldflda System.Action ServerSync.ConfigSync::lockedConfigChanged
IL_001c: ldloc.2
IL_001d: ldloc.1
IL_001e: call !!0 System.Threading.Interlocked::CompareExchange<System.Action>(!!0&,!!0,!!0)
IL_0023: stloc.0
IL_0024: ldloc.0
IL_0025: ldloc.1
IL_0026: bne.un.s IL_0007
IL_0028: ret

// System.Void ServerSync.ConfigSync::.cctor()
.locals 
IL_0000: ldc.i4.0
IL_0001: stsfld System.Boolean ServerSync.ConfigSync::ProcessingServerUpdate
IL_0006: newobj System.Void System.Collections.Generic.HashSet`1<ServerSync.ConfigSync>::.ctor()
IL_000b: stsfld System.Collections.Generic.HashSet`1<ServerSync.ConfigSync> ServerSync.ConfigSync::configSyncs
IL_0010: ldc.i4.0
IL_0011: stsfld System.Boolean ServerSync.ConfigSync::lockExempt
IL_0016: ldc.i4.0
IL_0017: conv.i8
IL_0018: stsfld System.Int64 ServerSync.ConfigSync::packageCounter
IL_001d: nop
IL_001e: ldtoken ServerSync.VersionCheck
IL_0023: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0028: callvirt System.RuntimeTypeHandle System.Type::get_TypeHandle()
IL_002d: call System.Void System.Runtime.CompilerServices.RuntimeHelpers::RunClassConstructor(System.RuntimeTypeHandle)
IL_0032: nop
IL_0033: ret

// System.Void ServerSync.ConfigSync::.ctor(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.0
IL_0002: stfld System.Boolean ServerSync.ConfigSync::ModRequired
IL_0007: ldarg.0
IL_0008: ldc.i4.1
IL_0009: stfld System.Boolean ServerSync.ConfigSync::isSourceOfTruth
IL_000e: ldarg.0
IL_000f: ldc.i4.0
IL_0010: stfld System.Boolean ServerSync.ConfigSync::<InitialSyncDone>k__BackingField
IL_0015: ldarg.0
IL_0016: newobj System.Void System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase>::.ctor()
IL_001b: stfld System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase> ServerSync.ConfigSync::allConfigs
IL_0020: ldarg.0
IL_0021: newobj System.Void System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase>::.ctor()
IL_0026: stfld System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync::allCustomValues
IL_002b: ldarg.0
IL_002c: ldnull
IL_002d: stfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::lockedConfig
IL_0032: ldarg.0
IL_0033: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>>::.ctor()
IL_0038: stfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>> ServerSync.ConfigSync::configValueCache
IL_003d: ldarg.0
IL_003e: newobj System.Void System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>>::.ctor()
IL_0043: stfld System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>> ServerSync.ConfigSync::cacheExpirations
IL_0048: ldarg.0
IL_0049: call System.Void System.Object::.ctor()
IL_004e: nop
IL_004f: nop
IL_0050: ldarg.0
IL_0051: ldarg.1
IL_0052: stfld System.String ServerSync.ConfigSync::Name
IL_0057: ldsfld System.Collections.Generic.HashSet`1<ServerSync.ConfigSync> ServerSync.ConfigSync::configSyncs
IL_005c: ldarg.0
IL_005d: callvirt System.Boolean System.Collections.Generic.HashSet`1<ServerSync.ConfigSync>::Add(!0)
IL_0062: pop
IL_0063: ldarg.0
IL_0064: newobj System.Void ServerSync.VersionCheck::.ctor(ServerSync.ConfigSync)
IL_0069: pop
IL_006a: ret

// ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync::AddConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
.locals ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>, System.Boolean, ServerSync.OwnConfigEntryBase, ServerSync.SyncedConfigEntry`1<T>
IL_0000: newobj System.Void ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.0
IL_0008: stfld ServerSync.ConfigSync ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::<>4__this
IL_000d: ldloc.0
IL_000e: ldarg.1
IL_000f: stfld BepInEx.Configuration.ConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::configEntry
IL_0014: nop
IL_0015: ldloc.0
IL_0016: ldfld BepInEx.Configuration.ConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::configEntry
IL_001b: call ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::configData(BepInEx.Configuration.ConfigEntryBase)
IL_0020: stloc.2
IL_0021: ldloc.0
IL_0022: ldloc.2
IL_0023: isinst ServerSync.SyncedConfigEntry`1<T>
IL_0028: stfld ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::syncedEntry
IL_002d: ldloc.0
IL_002e: ldfld ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::syncedEntry
IL_0033: ldnull
IL_0034: cgt.un
IL_0036: ldc.i4.0
IL_0037: ceq
IL_0039: stloc.1
IL_003a: ldloc.1
IL_003b: brfalse IL_00e7
IL_0040: nop
IL_0041: ldloc.0
IL_0042: ldloc.0
IL_0043: ldfld BepInEx.Configuration.ConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::configEntry
IL_0048: newobj System.Void ServerSync.SyncedConfigEntry`1<T>::.ctor(BepInEx.Configuration.ConfigEntry`1<T>)
IL_004d: stfld ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::syncedEntry
IL_0052: ldtoken BepInEx.Configuration.ConfigDescription
IL_0057: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_005c: ldstr "<Tags>k__BackingField"
IL_0061: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_0066: ldloc.0
IL_0067: ldfld BepInEx.Configuration.ConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::configEntry
IL_006c: callvirt BepInEx.Configuration.ConfigDescription BepInEx.Configuration.ConfigEntryBase::get_Description()
IL_0071: ldc.i4.1
IL_0072: newarr System.Object
IL_0077: dup
IL_0078: ldc.i4.0
IL_0079: newobj System.Void ServerSync.ConfigurationManagerAttributes::.ctor()
IL_007e: stelem.ref
IL_007f: ldloc.0
IL_0080: ldfld BepInEx.Configuration.ConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::configEntry
IL_0085: callvirt BepInEx.Configuration.ConfigDescription BepInEx.Configuration.ConfigEntryBase::get_Description()
IL_008a: callvirt System.Object[] BepInEx.Configuration.ConfigDescription::get_Tags()
IL_008f: dup
IL_0090: brtrue.s IL_0098
IL_0092: pop
IL_0093: call !!0[] System.Array::Empty<System.Object>()
IL_0098: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Concat<System.Object>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_009d: ldc.i4.1
IL_009e: newarr ServerSync.SyncedConfigEntry`1<T>
IL_00a3: dup
IL_00a4: ldc.i4.0
IL_00a5: ldloc.0
IL_00a6: ldfld ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::syncedEntry
IL_00ab: stelem.ref
IL_00ac: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Concat<System.Object>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_00b1: call !!0[] System.Linq.Enumerable::ToArray<System.Object>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_00b6: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_00bb: nop
IL_00bc: ldloc.0
IL_00bd: ldfld BepInEx.Configuration.ConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::configEntry
IL_00c2: ldloc.0
IL_00c3: ldftn System.Void ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::<AddConfigEntry>b__0(System.Object,System.EventArgs)
IL_00c9: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_00ce: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<T>::add_SettingChanged(System.EventHandler)
IL_00d3: nop
IL_00d4: ldarg.0
IL_00d5: ldfld System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase> ServerSync.ConfigSync::allConfigs
IL_00da: ldloc.0
IL_00db: ldfld ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::syncedEntry
IL_00e0: callvirt System.Boolean System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase>::Add(!0)
IL_00e5: pop
IL_00e6: nop
IL_00e7: ldloc.0
IL_00e8: ldfld ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::syncedEntry
IL_00ed: stloc.3
IL_00ee: br.s IL_00f0
IL_00f0: ldloc.3
IL_00f1: ret

// ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync::AddLockingConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
.locals System.Boolean, ServerSync.SyncedConfigEntry`1<T>
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::lockedConfig
IL_0007: ldnull
IL_0008: cgt.un
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: brfalse.s IL_001a
IL_000e: nop
IL_000f: ldstr "Cannot initialize locking ConfigEntry twice"
IL_0014: newobj System.Void System.Exception::.ctor(System.String)
IL_0019: throw
IL_001a: ldarg.0
IL_001b: ldarg.0
IL_001c: ldarg.1
IL_001d: call ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync::AddConfigEntry<T>(BepInEx.Configuration.ConfigEntry`1<T>)
IL_0022: stfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::lockedConfig
IL_0027: ldarg.1
IL_0028: ldarg.0
IL_0029: ldftn System.Void ServerSync.ConfigSync::<AddLockingConfigEntry>b__35_0<T>(System.Object,System.EventArgs)
IL_002f: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_0034: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<T>::add_SettingChanged(System.EventHandler)
IL_0039: nop
IL_003a: ldarg.0
IL_003b: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::lockedConfig
IL_0040: castclass ServerSync.SyncedConfigEntry`1<T>
IL_0045: stloc.1
IL_0046: br.s IL_0048
IL_0048: ldloc.1
IL_0049: ret

// System.Void ServerSync.ConfigSync::AddCustomValue(ServerSync.CustomSyncedValueBase)
.locals ServerSync.ConfigSync/<>c__DisplayClass36_0, System.Boolean
IL_0000: newobj System.Void ServerSync.ConfigSync/<>c__DisplayClass36_0::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.0
IL_0008: stfld ServerSync.ConfigSync ServerSync.ConfigSync/<>c__DisplayClass36_0::<>4__this
IL_000d: ldloc.0
IL_000e: ldarg.1
IL_000f: stfld ServerSync.CustomSyncedValueBase ServerSync.ConfigSync/<>c__DisplayClass36_0::customValue
IL_0014: nop
IL_0015: ldarg.0
IL_0016: ldfld System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync::allCustomValues
IL_001b: ldsfld System.Func`2<ServerSync.CustomSyncedValueBase,System.String> ServerSync.ConfigSync/<>c::<>9__36_2
IL_0020: dup
IL_0021: brtrue.s IL_003a
IL_0023: pop
IL_0024: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_0029: ldftn System.String ServerSync.ConfigSync/<>c::<AddCustomValue>b__36_2(ServerSync.CustomSyncedValueBase)
IL_002f: newobj System.Void System.Func`2<ServerSync.CustomSyncedValueBase,System.String>::.ctor(System.Object,System.IntPtr)
IL_0034: dup
IL_0035: stsfld System.Func`2<ServerSync.CustomSyncedValueBase,System.String> ServerSync.ConfigSync/<>c::<>9__36_2
IL_003a: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::Select<ServerSync.CustomSyncedValueBase,System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_003f: ldc.i4.1
IL_0040: newarr System.String
IL_0045: dup
IL_0046: ldc.i4.0
IL_0047: ldstr "serverversion"
IL_004c: stelem.ref
IL_004d: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Concat<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_0052: ldloc.0
IL_0053: ldfld ServerSync.CustomSyncedValueBase ServerSync.ConfigSync/<>c__DisplayClass36_0::customValue
IL_0058: ldfld System.String ServerSync.CustomSyncedValueBase::Identifier
IL_005d: call System.Boolean System.Linq.Enumerable::Contains<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,!!0)
IL_0062: stloc.1
IL_0063: ldloc.1
IL_0064: brfalse.s IL_0072
IL_0066: nop
IL_0067: ldstr "Cannot have multiple settings with the same name or with a reserved name (serverversion)"
IL_006c: newobj System.Void System.Exception::.ctor(System.String)
IL_0071: throw
IL_0072: ldarg.0
IL_0073: ldfld System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync::allCustomValues
IL_0078: ldloc.0
IL_0079: ldfld ServerSync.CustomSyncedValueBase ServerSync.ConfigSync/<>c__DisplayClass36_0::customValue
IL_007e: callvirt System.Boolean System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase>::Add(!0)
IL_0083: pop
IL_0084: ldarg.0
IL_0085: ldarg.0
IL_0086: ldfld System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync::allCustomValues
IL_008b: ldsfld System.Func`2<ServerSync.CustomSyncedValueBase,System.Int32> ServerSync.ConfigSync/<>c::<>9__36_0
IL_0090: dup
IL_0091: brtrue.s IL_00aa
IL_0093: pop
IL_0094: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_0099: ldftn System.Int32 ServerSync.ConfigSync/<>c::<AddCustomValue>b__36_0(ServerSync.CustomSyncedValueBase)
IL_009f: newobj System.Void System.Func`2<ServerSync.CustomSyncedValueBase,System.Int32>::.ctor(System.Object,System.IntPtr)
IL_00a4: dup
IL_00a5: stsfld System.Func`2<ServerSync.CustomSyncedValueBase,System.Int32> ServerSync.ConfigSync/<>c::<>9__36_0
IL_00aa: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::OrderByDescending<ServerSync.CustomSyncedValueBase,System.Int32>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_00af: newobj System.Void System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase>::.ctor(System.Collections.Generic.IEnumerable`1<!0>)
IL_00b4: stfld System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync::allCustomValues
IL_00b9: ldloc.0
IL_00ba: ldfld ServerSync.CustomSyncedValueBase ServerSync.ConfigSync/<>c__DisplayClass36_0::customValue
IL_00bf: ldloc.0
IL_00c0: ldftn System.Void ServerSync.ConfigSync/<>c__DisplayClass36_0::<AddCustomValue>b__1()
IL_00c6: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_00cb: callvirt System.Void ServerSync.CustomSyncedValueBase::add_ValueChanged(System.Action)
IL_00d0: nop
IL_00d1: ret

// System.Void ServerSync.ConfigSync::RPC_FromServerConfigSync(ZRpc,ZPackage)
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldarg.0
IL_0003: ldftn System.Void ServerSync.ConfigSync::serverLockedSettingChanged()
IL_0009: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_000e: call System.Void ServerSync.ConfigSync::add_lockedConfigChanged(System.Action)
IL_0013: nop
IL_0014: ldarg.0
IL_0015: ldc.i4.0
IL_0016: call System.Void ServerSync.ConfigSync::set_IsSourceOfTruth(System.Boolean)
IL_001b: nop
IL_001c: ldarg.0
IL_001d: ldc.i4.0
IL_001e: conv.i8
IL_001f: ldarg.2
IL_0020: ldc.i4.0
IL_0021: call System.Boolean ServerSync.ConfigSync::HandleConfigSyncRPC(System.Int64,ZPackage,System.Boolean)
IL_0026: stloc.0
IL_0027: ldloc.0
IL_0028: brfalse.s IL_0034
IL_002a: nop
IL_002b: ldarg.0
IL_002c: ldc.i4.1
IL_002d: call System.Void ServerSync.ConfigSync::set_InitialSyncDone(System.Boolean)
IL_0032: nop
IL_0033: nop
IL_0034: ret

// System.Void ServerSync.ConfigSync::RPC_FromOtherClientConfigSync(System.Int64,ZPackage)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldarg.2
IL_0003: ldc.i4.1
IL_0004: call System.Boolean ServerSync.ConfigSync::HandleConfigSyncRPC(System.Int64,ZPackage,System.Boolean)
IL_0009: pop
IL_000a: ret

// System.Boolean ServerSync.ConfigSync::HandleConfigSyncRPC(System.Int64,ZPackage,System.Boolean)
.locals System.String, System.Byte, ServerSync.ConfigSync/ParsedConfigs, BepInEx.Configuration.ConfigFile, System.Boolean, System.Boolean, System.Reflection.MethodInfo, SyncedList, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Int64, System.String, System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>, System.Int32, System.Int32, System.Boolean, System.DateTimeOffset, System.Boolean, System.Boolean, System.Byte[], System.IO.MemoryStream, System.IO.MemoryStream, System.IO.Compression.DeflateStream, System.Boolean, System.Collections.Generic.Dictionary`2/Enumerator<ServerSync.OwnConfigEntryBase,System.Object>, System.Collections.Generic.KeyValuePair`2<ServerSync.OwnConfigEntryBase,System.Object>, System.Boolean, System.Boolean, System.Boolean, System.Collections.Generic.Dictionary`2/Enumerator<ServerSync.CustomSyncedValueBase,System.Object>, System.Collections.Generic.KeyValuePair`2<ServerSync.CustomSyncedValueBase,System.Object>, System.Boolean, ServerSync.CustomSyncedValueBase, System.Boolean
IL_0000: nop
IL_0001: nop
IL_0002: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_0007: brfalse.s IL_0035
IL_0009: ldarg.0
IL_000a: call System.Boolean ServerSync.ConfigSync::get_IsLocked()
IL_000f: brfalse.s IL_0035
IL_0011: ldsfld ZRpc ServerSync.ConfigSync/SnatchCurrentlyHandlingRPC::currentRpc
IL_0016: dup
IL_0017: brtrue.s IL_001d
IL_0019: pop
IL_001a: ldnull
IL_001b: br.s IL_002e
IL_001d: call ISocket ZRpc::GetSocket()
IL_0022: dup
IL_0023: brtrue.s IL_0029
IL_0025: pop
IL_0026: ldnull
IL_0027: br.s IL_002e
IL_0029: callvirt System.String ISocket::GetHostName()
IL_002e: stloc.0
IL_002f: ldloc.0
IL_0030: ldnull
IL_0031: cgt.un
IL_0033: br.s IL_0036
IL_0035: ldc.i4.0
IL_0036: stloc.s V_5
IL_0038: ldloc.s V_5
IL_003a: brfalse IL_00c2
IL_003f: nop
IL_0040: ldtoken ZNet
IL_0045: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_004a: ldstr "ListContainsId"
IL_004f: ldnull
IL_0050: ldnull
IL_0051: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_0056: stloc.s V_6
IL_0058: ldtoken ZNet
IL_005d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0062: ldstr "m_adminList"
IL_0067: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_006c: call ZNet ZNet::get_instance()
IL_0071: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_0076: castclass SyncedList
IL_007b: stloc.s V_7
IL_007d: ldloc.s V_6
IL_007f: brfalse.s IL_00a3
IL_0081: ldloc.s V_6
IL_0083: call ZNet ZNet::get_instance()
IL_0088: ldc.i4.2
IL_0089: newarr System.Object
IL_008e: dup
IL_008f: ldc.i4.0
IL_0090: ldloc.s V_7
IL_0092: stelem.ref
IL_0093: dup
IL_0094: ldc.i4.1
IL_0095: ldloc.0
IL_0096: stelem.ref
IL_0097: callvirt System.Object System.Reflection.MethodBase::Invoke(System.Object,System.Object[])
IL_009c: unbox.any System.Boolean
IL_00a1: br.s IL_00ab
IL_00a3: ldloc.s V_7
IL_00a5: ldloc.0
IL_00a6: callvirt System.Boolean SyncedList::Contains(System.String)
IL_00ab: stloc.s V_8
IL_00ad: ldloc.s V_8
IL_00af: ldc.i4.0
IL_00b0: ceq
IL_00b2: stloc.s V_9
IL_00b4: ldloc.s V_9
IL_00b6: brfalse.s IL_00c1
IL_00b8: nop
IL_00b9: ldc.i4.0
IL_00ba: stloc.s V_10
IL_00bc: leave IL_0472
IL_00c1: nop
IL_00c2: ldarg.0
IL_00c3: ldfld System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>> ServerSync.ConfigSync::cacheExpirations
IL_00c8: ldarg.0
IL_00c9: ldftn System.Boolean ServerSync.ConfigSync::<HandleConfigSyncRPC>b__47_0(System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>)
IL_00cf: newobj System.Void System.Predicate`1<System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>>::.ctor(System.Object,System.IntPtr)
IL_00d4: callvirt System.Int32 System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>>::RemoveAll(System.Predicate`1<!0>)
IL_00d9: pop
IL_00da: ldarg.2
IL_00db: callvirt System.Byte ZPackage::ReadByte()
IL_00e0: stloc.1
IL_00e1: ldloc.1
IL_00e2: ldc.i4.2
IL_00e3: and
IL_00e4: ldc.i4.0
IL_00e5: cgt.un
IL_00e7: stloc.s V_11
IL_00e9: ldloc.s V_11
IL_00eb: brfalse IL_01f9
IL_00f0: nop
IL_00f1: ldarg.2
IL_00f2: callvirt System.Int64 ZPackage::ReadLong()
IL_00f7: stloc.s V_12
IL_00f9: ldarga.s sender
IL_00fb: call System.String System.Int64::ToString()
IL_0100: ldloca.s V_12
IL_0102: call System.String System.Int64::ToString()
IL_0107: call System.String System.String::Concat(System.String,System.String)
IL_010c: stloc.s V_13
IL_010e: ldarg.0
IL_010f: ldfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>> ServerSync.ConfigSync::configValueCache
IL_0114: ldloc.s V_13
IL_0116: ldloca.s V_14
IL_0118: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>>::TryGetValue(!0,!1&)
IL_011d: ldc.i4.0
IL_011e: ceq
IL_0120: stloc.s V_17
IL_0122: ldloc.s V_17
IL_0124: brfalse.s IL_0172
IL_0126: nop
IL_0127: newobj System.Void System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>::.ctor()
IL_012c: stloc.s V_14
IL_012e: ldarg.0
IL_012f: ldfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>> ServerSync.ConfigSync::configValueCache
IL_0134: ldloc.s V_13
IL_0136: ldloc.s V_14
IL_0138: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>>::set_Item(!0,!1)
IL_013d: nop
IL_013e: ldarg.0
IL_013f: ldfld System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>> ServerSync.ConfigSync::cacheExpirations
IL_0144: call System.DateTimeOffset System.DateTimeOffset::get_Now()
IL_0149: stloc.s V_18
IL_014b: ldloca.s V_18
IL_014d: ldc.r8 60
IL_0156: call System.DateTimeOffset System.DateTimeOffset::AddSeconds(System.Double)
IL_015b: stloc.s V_18
IL_015d: ldloca.s V_18
IL_015f: call System.Int64 System.DateTimeOffset::get_Ticks()
IL_0164: ldloc.s V_13
IL_0166: newobj System.Void System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>::.ctor(!0,!1)
IL_016b: callvirt System.Void System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>>::Add(!0)
IL_0170: nop
IL_0171: nop
IL_0172: ldarg.2
IL_0173: callvirt System.Int32 ZPackage::ReadInt()
IL_0178: stloc.s V_15
IL_017a: ldarg.2
IL_017b: callvirt System.Int32 ZPackage::ReadInt()
IL_0180: stloc.s V_16
IL_0182: ldloc.s V_14
IL_0184: ldloc.s V_15
IL_0186: ldarg.2
IL_0187: callvirt System.Byte[] ZPackage::ReadByteArray()
IL_018c: callvirt System.Void System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>::Add(!0,!1)
IL_0191: nop
IL_0192: ldloc.s V_14
IL_0194: callvirt System.Int32 System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>::get_Count()
IL_0199: ldloc.s V_16
IL_019b: clt
IL_019d: stloc.s V_19
IL_019f: ldloc.s V_19
IL_01a1: brfalse.s IL_01ac
IL_01a3: nop
IL_01a4: ldc.i4.0
IL_01a5: stloc.s V_10
IL_01a7: leave IL_0472
IL_01ac: ldarg.0
IL_01ad: ldfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>> ServerSync.ConfigSync::configValueCache
IL_01b2: ldloc.s V_13
IL_01b4: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>>::Remove(!0)
IL_01b9: pop
IL_01ba: ldloc.s V_14
IL_01bc: callvirt System.Collections.Generic.SortedDictionary`2/ValueCollection<!0,!1> System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>::get_Values()
IL_01c1: ldsfld System.Func`2<System.Byte[],System.Collections.Generic.IEnumerable`1<System.Byte>> ServerSync.ConfigSync/<>c::<>9__47_1
IL_01c6: dup
IL_01c7: brtrue.s IL_01e0
IL_01c9: pop
IL_01ca: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_01cf: ldftn System.Collections.Generic.IEnumerable`1<System.Byte> ServerSync.ConfigSync/<>c::<HandleConfigSyncRPC>b__47_1(System.Byte[])
IL_01d5: newobj System.Void System.Func`2<System.Byte[],System.Collections.Generic.IEnumerable`1<System.Byte>>::.ctor(System.Object,System.IntPtr)
IL_01da: dup
IL_01db: stsfld System.Func`2<System.Byte[],System.Collections.Generic.IEnumerable`1<System.Byte>> ServerSync.ConfigSync/<>c::<>9__47_1
IL_01e0: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::SelectMany<System.Byte[],System.Byte>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Collections.Generic.IEnumerable`1<!!1>>)
IL_01e5: call !!0[] System.Linq.Enumerable::ToArray<System.Byte>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_01ea: newobj System.Void ZPackage::.ctor(System.Byte[])
IL_01ef: starg.s package
IL_01f1: ldarg.2
IL_01f2: callvirt System.Byte ZPackage::ReadByte()
IL_01f7: stloc.1
IL_01f8: nop
IL_01f9: ldc.i4.1
IL_01fa: stsfld System.Boolean ServerSync.ConfigSync::ProcessingServerUpdate
IL_01ff: ldloc.1
IL_0200: ldc.i4.4
IL_0201: and
IL_0202: ldc.i4.0
IL_0203: cgt.un
IL_0205: stloc.s V_20
IL_0207: ldloc.s V_20
IL_0209: brfalse.s IL_025f
IL_020b: nop
IL_020c: ldarg.2
IL_020d: callvirt System.Byte[] ZPackage::ReadByteArray()
IL_0212: stloc.s V_21
IL_0214: ldloc.s V_21
IL_0216: newobj System.Void System.IO.MemoryStream::.ctor(System.Byte[])
IL_021b: stloc.s V_22
IL_021d: newobj System.Void System.IO.MemoryStream::.ctor()
IL_0222: stloc.s V_23
IL_0224: ldloc.s V_22
IL_0226: ldc.i4.0
IL_0227: newobj System.Void System.IO.Compression.DeflateStream::.ctor(System.IO.Stream,System.IO.Compression.CompressionMode)
IL_022c: stloc.s V_24
IL_022e: nop
IL_022f: ldloc.s V_24
IL_0231: ldloc.s V_23
IL_0233: callvirt System.Void System.IO.Stream::CopyTo(System.IO.Stream)
IL_0238: nop
IL_0239: nop
IL_023a: leave.s IL_0249
IL_023c: ldloc.s V_24
IL_023e: brfalse.s IL_0248
IL_0240: ldloc.s V_24
IL_0242: callvirt System.Void System.IDisposable::Dispose()
IL_0247: nop
IL_0248: endfinally
IL_0249: ldloc.s V_23
IL_024b: callvirt System.Byte[] System.IO.MemoryStream::ToArray()
IL_0250: newobj System.Void ZPackage::.ctor(System.Byte[])
IL_0255: starg.s package
IL_0257: ldarg.2
IL_0258: callvirt System.Byte ZPackage::ReadByte()
IL_025d: stloc.1
IL_025e: nop
IL_025f: ldloc.1
IL_0260: ldc.i4.1
IL_0261: and
IL_0262: ldc.i4.0
IL_0263: ceq
IL_0265: stloc.s V_25
IL_0267: ldloc.s V_25
IL_0269: brfalse.s IL_0274
IL_026b: nop
IL_026c: ldarg.0
IL_026d: call System.Void ServerSync.ConfigSync::resetConfigsFromServer()
IL_0272: nop
IL_0273: nop
IL_0274: ldarg.0
IL_0275: ldarg.2
IL_0276: call ServerSync.ConfigSync/ParsedConfigs ServerSync.ConfigSync::ReadConfigsFromPackage(ZPackage)
IL_027b: stloc.2
IL_027c: ldnull
IL_027d: stloc.3
IL_027e: ldc.i4.0
IL_027f: stloc.s V_4
IL_0281: nop
IL_0282: ldloc.2
IL_0283: ldfld System.Collections.Generic.Dictionary`2<ServerSync.OwnConfigEntryBase,System.Object> ServerSync.ConfigSync/ParsedConfigs::configValues
IL_0288: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<ServerSync.OwnConfigEntryBase,System.Object>::GetEnumerator()
IL_028d: stloc.s V_26
IL_028f: br IL_0324
IL_0294: ldloca.s V_26
IL_0296: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<ServerSync.OwnConfigEntryBase,System.Object>::get_Current()
IL_029b: stloc.s V_27
IL_029d: nop
IL_029e: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_02a3: brtrue.s IL_02b6
IL_02a5: ldloca.s V_27
IL_02a7: call !0 System.Collections.Generic.KeyValuePair`2<ServerSync.OwnConfigEntryBase,System.Object>::get_Key()
IL_02ac: ldfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_02b1: ldnull
IL_02b2: ceq
IL_02b4: br.s IL_02b7
IL_02b6: ldc.i4.0
IL_02b7: stloc.s V_28
IL_02b9: ldloc.s V_28
IL_02bb: brfalse.s IL_02dc
IL_02bd: nop
IL_02be: ldloca.s V_27
IL_02c0: call !0 System.Collections.Generic.KeyValuePair`2<ServerSync.OwnConfigEntryBase,System.Object>::get_Key()
IL_02c5: ldloca.s V_27
IL_02c7: call !0 System.Collections.Generic.KeyValuePair`2<ServerSync.OwnConfigEntryBase,System.Object>::get_Key()
IL_02cc: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_02d1: callvirt System.Object BepInEx.Configuration.ConfigEntryBase::get_BoxedValue()
IL_02d6: stfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_02db: nop
IL_02dc: ldloc.3
IL_02dd: ldnull
IL_02de: ceq
IL_02e0: stloc.s V_29
IL_02e2: ldloc.s V_29
IL_02e4: brfalse.s IL_030a
IL_02e6: nop
IL_02e7: ldloca.s V_27
IL_02e9: call !0 System.Collections.Generic.KeyValuePair`2<ServerSync.OwnConfigEntryBase,System.Object>::get_Key()
IL_02ee: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_02f3: callvirt BepInEx.Configuration.ConfigFile BepInEx.Configuration.ConfigEntryBase::get_ConfigFile()
IL_02f8: stloc.3
IL_02f9: ldloc.3
IL_02fa: callvirt System.Boolean BepInEx.Configuration.ConfigFile::get_SaveOnConfigSet()
IL_02ff: stloc.s V_4
IL_0301: ldloc.3
IL_0302: ldc.i4.0
IL_0303: callvirt System.Void BepInEx.Configuration.ConfigFile::set_SaveOnConfigSet(System.Boolean)
IL_0308: nop
IL_0309: nop
IL_030a: ldloca.s V_27
IL_030c: call !0 System.Collections.Generic.KeyValuePair`2<ServerSync.OwnConfigEntryBase,System.Object>::get_Key()
IL_0311: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_0316: ldloca.s V_27
IL_0318: call !1 System.Collections.Generic.KeyValuePair`2<ServerSync.OwnConfigEntryBase,System.Object>::get_Value()
IL_031d: callvirt System.Void BepInEx.Configuration.ConfigEntryBase::set_BoxedValue(System.Object)
IL_0322: nop
IL_0323: nop
IL_0324: ldloca.s V_26
IL_0326: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<ServerSync.OwnConfigEntryBase,System.Object>::MoveNext()
IL_032b: brtrue IL_0294
IL_0330: leave.s IL_0341
IL_0332: ldloca.s V_26
IL_0334: constrained. System.Collections.Generic.Dictionary`2/Enumerator<ServerSync.OwnConfigEntryBase,System.Object>
IL_033a: callvirt System.Void System.IDisposable::Dispose()
IL_033f: nop
IL_0340: endfinally
IL_0341: ldloc.3
IL_0342: ldnull
IL_0343: cgt.un
IL_0345: stloc.s V_30
IL_0347: ldloc.s V_30
IL_0349: brfalse.s IL_035d
IL_034b: nop
IL_034c: ldloc.3
IL_034d: ldloc.s V_4
IL_034f: callvirt System.Void BepInEx.Configuration.ConfigFile::set_SaveOnConfigSet(System.Boolean)
IL_0354: nop
IL_0355: ldloc.3
IL_0356: callvirt System.Void BepInEx.Configuration.ConfigFile::Save()
IL_035b: nop
IL_035c: nop
IL_035d: nop
IL_035e: ldloc.2
IL_035f: ldfld System.Collections.Generic.Dictionary`2<ServerSync.CustomSyncedValueBase,System.Object> ServerSync.ConfigSync/ParsedConfigs::customValues
IL_0364: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<ServerSync.CustomSyncedValueBase,System.Object>::GetEnumerator()
IL_0369: stloc.s V_31
IL_036b: br.s IL_03c1
IL_036d: ldloca.s V_31
IL_036f: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<ServerSync.CustomSyncedValueBase,System.Object>::get_Current()
IL_0374: stloc.s V_32
IL_0376: nop
IL_0377: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_037c: ldc.i4.0
IL_037d: ceq
IL_037f: stloc.s V_33
IL_0381: ldloc.s V_33
IL_0383: brfalse.s IL_03ac
IL_0385: nop
IL_0386: ldloca.s V_32
IL_0388: call !0 System.Collections.Generic.KeyValuePair`2<ServerSync.CustomSyncedValueBase,System.Object>::get_Key()
IL_038d: stloc.s V_34
IL_038f: ldloc.s V_34
IL_0391: ldfld System.Object ServerSync.CustomSyncedValueBase::LocalBaseValue
IL_0396: brtrue.s IL_03ab
IL_0398: ldloc.s V_34
IL_039a: ldloca.s V_32
IL_039c: call !0 System.Collections.Generic.KeyValuePair`2<ServerSync.CustomSyncedValueBase,System.Object>::get_Key()
IL_03a1: callvirt System.Object ServerSync.CustomSyncedValueBase::get_BoxedValue()
IL_03a6: stfld System.Object ServerSync.CustomSyncedValueBase::LocalBaseValue
IL_03ab: nop
IL_03ac: ldloca.s V_32
IL_03ae: call !0 System.Collections.Generic.KeyValuePair`2<ServerSync.CustomSyncedValueBase,System.Object>::get_Key()
IL_03b3: ldloca.s V_32
IL_03b5: call !1 System.Collections.Generic.KeyValuePair`2<ServerSync.CustomSyncedValueBase,System.Object>::get_Value()
IL_03ba: callvirt System.Void ServerSync.CustomSyncedValueBase::set_BoxedValue(System.Object)
IL_03bf: nop
IL_03c0: nop
IL_03c1: ldloca.s V_31
IL_03c3: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<ServerSync.CustomSyncedValueBase,System.Object>::MoveNext()
IL_03c8: brtrue.s IL_036d
IL_03ca: leave.s IL_03db
IL_03cc: ldloca.s V_31
IL_03ce: constrained. System.Collections.Generic.Dictionary`2/Enumerator<ServerSync.CustomSyncedValueBase,System.Object>
IL_03d4: callvirt System.Void System.IDisposable::Dispose()
IL_03d9: nop
IL_03da: endfinally
IL_03db: ldstr "Received {0} configs and {1} custom values from {2} for mod {3}"
IL_03e0: ldc.i4.4
IL_03e1: newarr System.Object
IL_03e6: dup
IL_03e7: ldc.i4.0
IL_03e8: ldloc.2
IL_03e9: ldfld System.Collections.Generic.Dictionary`2<ServerSync.OwnConfigEntryBase,System.Object> ServerSync.ConfigSync/ParsedConfigs::configValues
IL_03ee: callvirt System.Int32 System.Collections.Generic.Dictionary`2<ServerSync.OwnConfigEntryBase,System.Object>::get_Count()
IL_03f3: box System.Int32
IL_03f8: stelem.ref
IL_03f9: dup
IL_03fa: ldc.i4.1
IL_03fb: ldloc.2
IL_03fc: ldfld System.Collections.Generic.Dictionary`2<ServerSync.CustomSyncedValueBase,System.Object> ServerSync.ConfigSync/ParsedConfigs::customValues
IL_0401: callvirt System.Int32 System.Collections.Generic.Dictionary`2<ServerSync.CustomSyncedValueBase,System.Object>::get_Count()
IL_0406: box System.Int32
IL_040b: stelem.ref
IL_040c: dup
IL_040d: ldc.i4.2
IL_040e: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_0413: ldarg.3
IL_0414: or
IL_0415: brtrue.s IL_041e
IL_0417: ldstr "the server"
IL_041c: br.s IL_042e
IL_041e: ldstr "client {0}"
IL_0423: ldarg.1
IL_0424: box System.Int64
IL_0429: call System.String System.String::Format(System.String,System.Object)
IL_042e: stelem.ref
IL_042f: dup
IL_0430: ldc.i4.3
IL_0431: ldarg.0
IL_0432: ldfld System.String ServerSync.ConfigSync::DisplayName
IL_0437: dup
IL_0438: brtrue.s IL_0441
IL_043a: pop
IL_043b: ldarg.0
IL_043c: ldfld System.String ServerSync.ConfigSync::Name
IL_0441: stelem.ref
IL_0442: call System.String System.String::Format(System.String,System.Object[])
IL_0447: call System.Void UnityEngine.Debug::Log(System.Object)
IL_044c: nop
IL_044d: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_0452: ldc.i4.0
IL_0453: ceq
IL_0455: stloc.s V_35
IL_0457: ldloc.s V_35
IL_0459: brfalse.s IL_0464
IL_045b: nop
IL_045c: ldarg.0
IL_045d: call System.Void ServerSync.ConfigSync::serverLockedSettingChanged()
IL_0462: nop
IL_0463: nop
IL_0464: ldc.i4.1
IL_0465: stloc.s V_10
IL_0467: leave.s IL_0472
IL_0469: nop
IL_046a: ldc.i4.0
IL_046b: stsfld System.Boolean ServerSync.ConfigSync::ProcessingServerUpdate
IL_0470: nop
IL_0471: endfinally
IL_0472: ldloc.s V_10
IL_0474: ret
// EH Finally: 558 - 572 => 572 - 585
// EH Finally: 655 - 818 => 818 - 833
// EH Finally: 875 - 972 => 972 - 987
// EH Finally: 1 - 1129 => 1129 - 1138

// ServerSync.ConfigSync/ParsedConfigs ServerSync.ConfigSync::ReadConfigsFromPackage(ZPackage)
.locals ServerSync.ConfigSync/ParsedConfigs, System.Collections.Generic.Dictionary`2<System.String,ServerSync.OwnConfigEntryBase>, System.Collections.Generic.Dictionary`2<System.String,ServerSync.CustomSyncedValueBase>, System.Int32, System.Int32, System.String, System.String, System.String, System.Type, System.Boolean, System.Object, ServerSync.ConfigSync/InvalidDeserializationTypeException, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, ServerSync.CustomSyncedValueBase, System.Boolean, System.Boolean, ServerSync.OwnConfigEntryBase, System.Boolean, System.Type, System.Boolean, ServerSync.ConfigSync/ParsedConfigs, System.Boolean
IL_0000: nop
IL_0001: newobj System.Void ServerSync.ConfigSync/ParsedConfigs::.ctor()
IL_0006: stloc.0
IL_0007: ldarg.0
IL_0008: ldfld System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase> ServerSync.ConfigSync::allConfigs
IL_000d: ldsfld System.Func`2<ServerSync.OwnConfigEntryBase,System.Boolean> ServerSync.ConfigSync/<>c::<>9__49_0
IL_0012: dup
IL_0013: brtrue.s IL_002c
IL_0015: pop
IL_0016: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_001b: ldftn System.Boolean ServerSync.ConfigSync/<>c::<ReadConfigsFromPackage>b__49_0(ServerSync.OwnConfigEntryBase)
IL_0021: newobj System.Void System.Func`2<ServerSync.OwnConfigEntryBase,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0026: dup
IL_0027: stsfld System.Func`2<ServerSync.OwnConfigEntryBase,System.Boolean> ServerSync.ConfigSync/<>c::<>9__49_0
IL_002c: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ServerSync.OwnConfigEntryBase>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0031: ldsfld System.Func`2<ServerSync.OwnConfigEntryBase,System.String> ServerSync.ConfigSync/<>c::<>9__49_1
IL_0036: dup
IL_0037: brtrue.s IL_0050
IL_0039: pop
IL_003a: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_003f: ldftn System.String ServerSync.ConfigSync/<>c::<ReadConfigsFromPackage>b__49_1(ServerSync.OwnConfigEntryBase)
IL_0045: newobj System.Void System.Func`2<ServerSync.OwnConfigEntryBase,System.String>::.ctor(System.Object,System.IntPtr)
IL_004a: dup
IL_004b: stsfld System.Func`2<ServerSync.OwnConfigEntryBase,System.String> ServerSync.ConfigSync/<>c::<>9__49_1
IL_0050: ldsfld System.Func`2<ServerSync.OwnConfigEntryBase,ServerSync.OwnConfigEntryBase> ServerSync.ConfigSync/<>c::<>9__49_2
IL_0055: dup
IL_0056: brtrue.s IL_006f
IL_0058: pop
IL_0059: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_005e: ldftn ServerSync.OwnConfigEntryBase ServerSync.ConfigSync/<>c::<ReadConfigsFromPackage>b__49_2(ServerSync.OwnConfigEntryBase)
IL_0064: newobj System.Void System.Func`2<ServerSync.OwnConfigEntryBase,ServerSync.OwnConfigEntryBase>::.ctor(System.Object,System.IntPtr)
IL_0069: dup
IL_006a: stsfld System.Func`2<ServerSync.OwnConfigEntryBase,ServerSync.OwnConfigEntryBase> ServerSync.ConfigSync/<>c::<>9__49_2
IL_006f: call System.Collections.Generic.Dictionary`2<!!1,!!2> System.Linq.Enumerable::ToDictionary<ServerSync.OwnConfigEntryBase,System.String,ServerSync.OwnConfigEntryBase>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>,System.Func`2<!!0,!!2>)
IL_0074: stloc.1
IL_0075: ldarg.0
IL_0076: ldfld System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync::allCustomValues
IL_007b: ldsfld System.Func`2<ServerSync.CustomSyncedValueBase,System.String> ServerSync.ConfigSync/<>c::<>9__49_3
IL_0080: dup
IL_0081: brtrue.s IL_009a
IL_0083: pop
IL_0084: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_0089: ldftn System.String ServerSync.ConfigSync/<>c::<ReadConfigsFromPackage>b__49_3(ServerSync.CustomSyncedValueBase)
IL_008f: newobj System.Void System.Func`2<ServerSync.CustomSyncedValueBase,System.String>::.ctor(System.Object,System.IntPtr)
IL_0094: dup
IL_0095: stsfld System.Func`2<ServerSync.CustomSyncedValueBase,System.String> ServerSync.ConfigSync/<>c::<>9__49_3
IL_009a: ldsfld System.Func`2<ServerSync.CustomSyncedValueBase,ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync/<>c::<>9__49_4
IL_009f: dup
IL_00a0: brtrue.s IL_00b9
IL_00a2: pop
IL_00a3: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_00a8: ldftn ServerSync.CustomSyncedValueBase ServerSync.ConfigSync/<>c::<ReadConfigsFromPackage>b__49_4(ServerSync.CustomSyncedValueBase)
IL_00ae: newobj System.Void System.Func`2<ServerSync.CustomSyncedValueBase,ServerSync.CustomSyncedValueBase>::.ctor(System.Object,System.IntPtr)
IL_00b3: dup
IL_00b4: stsfld System.Func`2<ServerSync.CustomSyncedValueBase,ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync/<>c::<>9__49_4
IL_00b9: call System.Collections.Generic.Dictionary`2<!!1,!!2> System.Linq.Enumerable::ToDictionary<ServerSync.CustomSyncedValueBase,System.String,ServerSync.CustomSyncedValueBase>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>,System.Func`2<!!0,!!2>)
IL_00be: stloc.2
IL_00bf: ldarg.1
IL_00c0: callvirt System.Int32 ZPackage::ReadInt()
IL_00c5: stloc.3
IL_00c6: ldc.i4.0
IL_00c7: stloc.s V_4
IL_00c9: br IL_04d5
IL_00ce: nop
IL_00cf: ldarg.1
IL_00d0: callvirt System.String ZPackage::ReadString()
IL_00d5: stloc.s V_5
IL_00d7: ldarg.1
IL_00d8: callvirt System.String ZPackage::ReadString()
IL_00dd: stloc.s V_6
IL_00df: ldarg.1
IL_00e0: callvirt System.String ZPackage::ReadString()
IL_00e5: stloc.s V_7
IL_00e7: ldloc.s V_7
IL_00e9: call System.Type System.Type::GetType(System.String)
IL_00ee: stloc.s V_8
IL_00f0: ldloc.s V_7
IL_00f2: ldstr ""
IL_00f7: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_00fc: brtrue.s IL_0108
IL_00fe: ldloc.s V_8
IL_0100: ldnull
IL_0101: call System.Boolean System.Type::op_Inequality(System.Type,System.Type)
IL_0106: br.s IL_0109
IL_0108: ldc.i4.1
IL_0109: stloc.s V_9
IL_010b: ldloc.s V_9
IL_010d: brfalse IL_04ad
IL_0112: nop
IL_0113: nop
IL_0114: ldloc.s V_7
IL_0116: ldstr ""
IL_011b: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0120: brtrue.s IL_012c
IL_0122: ldarg.1
IL_0123: ldloc.s V_8
IL_0125: call System.Object ServerSync.ConfigSync::ReadValueWithTypeFromZPackage(ZPackage,System.Type)
IL_012a: br.s IL_012d
IL_012c: ldnull
IL_012d: stloc.s V_10
IL_012f: nop
IL_0130: leave IL_01cc
IL_0135: stloc.s V_11
IL_0137: nop
IL_0138: ldc.i4.s 14
IL_013a: newarr System.String
IL_013f: dup
IL_0140: ldc.i4.0
IL_0141: ldstr "Got unexpected struct internal type "
IL_0146: stelem.ref
IL_0147: dup
IL_0148: ldc.i4.1
IL_0149: ldloc.s V_11
IL_014b: ldfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::received
IL_0150: stelem.ref
IL_0151: dup
IL_0152: ldc.i4.2
IL_0153: ldstr " for field "
IL_0158: stelem.ref
IL_0159: dup
IL_015a: ldc.i4.3
IL_015b: ldloc.s V_11
IL_015d: ldfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::field
IL_0162: stelem.ref
IL_0163: dup
IL_0164: ldc.i4.4
IL_0165: ldstr " struct "
IL_016a: stelem.ref
IL_016b: dup
IL_016c: ldc.i4.5
IL_016d: ldloc.s V_7
IL_016f: stelem.ref
IL_0170: dup
IL_0171: ldc.i4.6
IL_0172: ldstr " for "
IL_0177: stelem.ref
IL_0178: dup
IL_0179: ldc.i4.7
IL_017a: ldloc.s V_6
IL_017c: stelem.ref
IL_017d: dup
IL_017e: ldc.i4.8
IL_017f: ldstr " in section "
IL_0184: stelem.ref
IL_0185: dup
IL_0186: ldc.i4.s 9
IL_0188: ldloc.s V_5
IL_018a: stelem.ref
IL_018b: dup
IL_018c: ldc.i4.s 10
IL_018e: ldstr " for mod "
IL_0193: stelem.ref
IL_0194: dup
IL_0195: ldc.i4.s 11
IL_0197: ldarg.0
IL_0198: ldfld System.String ServerSync.ConfigSync::DisplayName
IL_019d: dup
IL_019e: brtrue.s IL_01a7
IL_01a0: pop
IL_01a1: ldarg.0
IL_01a2: ldfld System.String ServerSync.ConfigSync::Name
IL_01a7: stelem.ref
IL_01a8: dup
IL_01a9: ldc.i4.s 12
IL_01ab: ldstr ", expecting "
IL_01b0: stelem.ref
IL_01b1: dup
IL_01b2: ldc.i4.s 13
IL_01b4: ldloc.s V_11
IL_01b6: ldfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::expected
IL_01bb: stelem.ref
IL_01bc: call System.String System.String::Concat(System.String[])
IL_01c1: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_01c6: nop
IL_01c7: leave IL_04cf
IL_01cc: ldloc.s V_5
IL_01ce: ldstr "Internal"
IL_01d3: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_01d8: stloc.s V_12
IL_01da: ldloc.s V_12
IL_01dc: brfalse IL_036f
IL_01e1: nop
IL_01e2: ldloc.s V_6
IL_01e4: ldstr "serverversion"
IL_01e9: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_01ee: stloc.s V_13
IL_01f0: ldloc.s V_13
IL_01f2: brfalse.s IL_0257
IL_01f4: nop
IL_01f5: ldloc.s V_10
IL_01f7: brtrue.s IL_01fc
IL_01f9: ldnull
IL_01fa: br.s IL_0203
IL_01fc: ldloc.s V_10
IL_01fe: callvirt System.String System.Object::ToString()
IL_0203: ldarg.0
IL_0204: ldfld System.String ServerSync.ConfigSync::CurrentVersion
IL_0209: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_020e: stloc.s V_14
IL_0210: ldloc.s V_14
IL_0212: brfalse.s IL_0251
IL_0214: nop
IL_0215: ldstr "Received server version is not equal: server version = "
IL_021a: ldloc.s V_10
IL_021c: brtrue.s IL_0221
IL_021e: ldnull
IL_021f: br.s IL_0228
IL_0221: ldloc.s V_10
IL_0223: callvirt System.String System.Object::ToString()
IL_0228: dup
IL_0229: brtrue.s IL_0231
IL_022b: pop
IL_022c: ldstr "null"
IL_0231: ldstr "; local version = "
IL_0236: ldarg.0
IL_0237: ldfld System.String ServerSync.ConfigSync::CurrentVersion
IL_023c: dup
IL_023d: brtrue.s IL_0245
IL_023f: pop
IL_0240: ldstr "unknown"
IL_0245: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_024a: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_024f: nop
IL_0250: nop
IL_0251: nop
IL_0252: br IL_0369
IL_0257: ldloc.s V_6
IL_0259: ldstr "lockexempt"
IL_025e: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0263: stloc.s V_15
IL_0265: ldloc.s V_15
IL_0267: brfalse.s IL_0295
IL_0269: nop
IL_026a: ldloc.s V_10
IL_026c: isinst System.Boolean
IL_0271: brfalse.s IL_027f
IL_0273: ldloc.s V_10
IL_0275: unbox.any System.Boolean
IL_027a: stloc.s V_16
IL_027c: ldc.i4.1
IL_027d: br.s IL_0280
IL_027f: ldc.i4.0
IL_0280: stloc.s V_17
IL_0282: ldloc.s V_17
IL_0284: brfalse.s IL_028f
IL_0286: nop
IL_0287: ldloc.s V_16
IL_0289: stsfld System.Boolean ServerSync.ConfigSync::lockExempt
IL_028e: nop
IL_028f: nop
IL_0290: br IL_0369
IL_0295: ldloc.2
IL_0296: ldloc.s V_6
IL_0298: ldloca.s V_18
IL_029a: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,ServerSync.CustomSyncedValueBase>::TryGetValue(!0,!1&)
IL_029f: stloc.s V_19
IL_02a1: ldloc.s V_19
IL_02a3: brfalse IL_0369
IL_02a8: nop
IL_02a9: ldloc.s V_7
IL_02ab: ldstr ""
IL_02b0: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_02b5: brfalse.s IL_02d9
IL_02b7: ldloc.s V_18
IL_02b9: ldfld System.Type ServerSync.CustomSyncedValueBase::Type
IL_02be: callvirt System.Boolean System.Type::get_IsValueType()
IL_02c3: brfalse.s IL_02ee
IL_02c5: ldloc.s V_18
IL_02c7: ldfld System.Type ServerSync.CustomSyncedValueBase::Type
IL_02cc: call System.Type System.Nullable::GetUnderlyingType(System.Type)
IL_02d1: ldnull
IL_02d2: call System.Boolean System.Type::op_Inequality(System.Type,System.Type)
IL_02d7: brtrue.s IL_02ee
IL_02d9: ldloc.s V_18
IL_02db: ldfld System.Type ServerSync.CustomSyncedValueBase::Type
IL_02e0: call System.String ServerSync.ConfigSync::GetZPackageTypeString(System.Type)
IL_02e5: ldloc.s V_7
IL_02e7: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_02ec: br.s IL_02ef
IL_02ee: ldc.i4.1
IL_02ef: stloc.s V_20
IL_02f1: ldloc.s V_20
IL_02f3: brfalse.s IL_0309
IL_02f5: nop
IL_02f6: ldloc.0
IL_02f7: ldfld System.Collections.Generic.Dictionary`2<ServerSync.CustomSyncedValueBase,System.Object> ServerSync.ConfigSync/ParsedConfigs::customValues
IL_02fc: ldloc.s V_18
IL_02fe: ldloc.s V_10
IL_0300: callvirt System.Void System.Collections.Generic.Dictionary`2<ServerSync.CustomSyncedValueBase,System.Object>::set_Item(!0,!1)
IL_0305: nop
IL_0306: nop
IL_0307: br.s IL_0368
IL_0309: nop
IL_030a: ldc.i4.8
IL_030b: newarr System.String
IL_0310: dup
IL_0311: ldc.i4.0
IL_0312: ldstr "Got unexpected type "
IL_0317: stelem.ref
IL_0318: dup
IL_0319: ldc.i4.1
IL_031a: ldloc.s V_7
IL_031c: stelem.ref
IL_031d: dup
IL_031e: ldc.i4.2
IL_031f: ldstr " for internal value "
IL_0324: stelem.ref
IL_0325: dup
IL_0326: ldc.i4.3
IL_0327: ldloc.s V_6
IL_0329: stelem.ref
IL_032a: dup
IL_032b: ldc.i4.4
IL_032c: ldstr " for mod "
IL_0331: stelem.ref
IL_0332: dup
IL_0333: ldc.i4.5
IL_0334: ldarg.0
IL_0335: ldfld System.String ServerSync.ConfigSync::DisplayName
IL_033a: dup
IL_033b: brtrue.s IL_0344
IL_033d: pop
IL_033e: ldarg.0
IL_033f: ldfld System.String ServerSync.ConfigSync::Name
IL_0344: stelem.ref
IL_0345: dup
IL_0346: ldc.i4.6
IL_0347: ldstr ", expecting "
IL_034c: stelem.ref
IL_034d: dup
IL_034e: ldc.i4.7
IL_034f: ldloc.s V_18
IL_0351: ldfld System.Type ServerSync.CustomSyncedValueBase::Type
IL_0356: callvirt System.String System.Type::get_AssemblyQualifiedName()
IL_035b: stelem.ref
IL_035c: call System.String System.String::Concat(System.String[])
IL_0361: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_0366: nop
IL_0367: nop
IL_0368: nop
IL_0369: nop
IL_036a: br IL_04aa
IL_036f: ldloc.1
IL_0370: ldloc.s V_5
IL_0372: ldstr "_"
IL_0377: ldloc.s V_6
IL_0379: call System.String System.String::Concat(System.String,System.String,System.String)
IL_037e: ldloca.s V_21
IL_0380: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,ServerSync.OwnConfigEntryBase>::TryGetValue(!0,!1&)
IL_0385: stloc.s V_22
IL_0387: ldloc.s V_22
IL_0389: brfalse IL_045a
IL_038e: nop
IL_038f: ldloc.s V_21
IL_0391: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_0396: call System.Type ServerSync.ConfigSync::configType(BepInEx.Configuration.ConfigEntryBase)
IL_039b: stloc.s V_23
IL_039d: ldloc.s V_7
IL_039f: ldstr ""
IL_03a4: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_03a9: brfalse.s IL_03c3
IL_03ab: ldloc.s V_23
IL_03ad: callvirt System.Boolean System.Type::get_IsValueType()
IL_03b2: brfalse.s IL_03d3
IL_03b4: ldloc.s V_23
IL_03b6: call System.Type System.Nullable::GetUnderlyingType(System.Type)
IL_03bb: ldnull
IL_03bc: call System.Boolean System.Type::op_Inequality(System.Type,System.Type)
IL_03c1: brtrue.s IL_03d3
IL_03c3: ldloc.s V_23
IL_03c5: call System.String ServerSync.ConfigSync::GetZPackageTypeString(System.Type)
IL_03ca: ldloc.s V_7
IL_03cc: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_03d1: br.s IL_03d4
IL_03d3: ldc.i4.1
IL_03d4: stloc.s V_24
IL_03d6: ldloc.s V_24
IL_03d8: brfalse.s IL_03ee
IL_03da: nop
IL_03db: ldloc.0
IL_03dc: ldfld System.Collections.Generic.Dictionary`2<ServerSync.OwnConfigEntryBase,System.Object> ServerSync.ConfigSync/ParsedConfigs::configValues
IL_03e1: ldloc.s V_21
IL_03e3: ldloc.s V_10
IL_03e5: callvirt System.Void System.Collections.Generic.Dictionary`2<ServerSync.OwnConfigEntryBase,System.Object>::set_Item(!0,!1)
IL_03ea: nop
IL_03eb: nop
IL_03ec: br.s IL_0457
IL_03ee: nop
IL_03ef: ldc.i4.s 10
IL_03f1: newarr System.String
IL_03f6: dup
IL_03f7: ldc.i4.0
IL_03f8: ldstr "Got unexpected type "
IL_03fd: stelem.ref
IL_03fe: dup
IL_03ff: ldc.i4.1
IL_0400: ldloc.s V_7
IL_0402: stelem.ref
IL_0403: dup
IL_0404: ldc.i4.2
IL_0405: ldstr " for "
IL_040a: stelem.ref
IL_040b: dup
IL_040c: ldc.i4.3
IL_040d: ldloc.s V_6
IL_040f: stelem.ref
IL_0410: dup
IL_0411: ldc.i4.4
IL_0412: ldstr " in section "
IL_0417: stelem.ref
IL_0418: dup
IL_0419: ldc.i4.5
IL_041a: ldloc.s V_5
IL_041c: stelem.ref
IL_041d: dup
IL_041e: ldc.i4.6
IL_041f: ldstr " for mod "
IL_0424: stelem.ref
IL_0425: dup
IL_0426: ldc.i4.7
IL_0427: ldarg.0
IL_0428: ldfld System.String ServerSync.ConfigSync::DisplayName
IL_042d: dup
IL_042e: brtrue.s IL_0437
IL_0430: pop
IL_0431: ldarg.0
IL_0432: ldfld System.String ServerSync.ConfigSync::Name
IL_0437: stelem.ref
IL_0438: dup
IL_0439: ldc.i4.8
IL_043a: ldstr ", expecting "
IL_043f: stelem.ref
IL_0440: dup
IL_0441: ldc.i4.s 9
IL_0443: ldloc.s V_23
IL_0445: callvirt System.String System.Type::get_AssemblyQualifiedName()
IL_044a: stelem.ref
IL_044b: call System.String System.String::Concat(System.String[])
IL_0450: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_0455: nop
IL_0456: nop
IL_0457: nop
IL_0458: br.s IL_04aa
IL_045a: nop
IL_045b: ldc.i4.7
IL_045c: newarr System.String
IL_0461: dup
IL_0462: ldc.i4.0
IL_0463: ldstr "Received unknown config entry "
IL_0468: stelem.ref
IL_0469: dup
IL_046a: ldc.i4.1
IL_046b: ldloc.s V_6
IL_046d: stelem.ref
IL_046e: dup
IL_046f: ldc.i4.2
IL_0470: ldstr " in section "
IL_0475: stelem.ref
IL_0476: dup
IL_0477: ldc.i4.3
IL_0478: ldloc.s V_5
IL_047a: stelem.ref
IL_047b: dup
IL_047c: ldc.i4.4
IL_047d: ldstr " for mod "
IL_0482: stelem.ref
IL_0483: dup
IL_0484: ldc.i4.5
IL_0485: ldarg.0
IL_0486: ldfld System.String ServerSync.ConfigSync::DisplayName
IL_048b: dup
IL_048c: brtrue.s IL_0495
IL_048e: pop
IL_048f: ldarg.0
IL_0490: ldfld System.String ServerSync.ConfigSync::Name
IL_0495: stelem.ref
IL_0496: dup
IL_0497: ldc.i4.6
IL_0498: ldstr ". This may happen if client and server versions of the mod do not match."
IL_049d: stelem.ref
IL_049e: call System.String System.String::Concat(System.String[])
IL_04a3: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_04a8: nop
IL_04a9: nop
IL_04aa: nop
IL_04ab: br.s IL_04ce
IL_04ad: nop
IL_04ae: ldstr "Got invalid type "
IL_04b3: ldloc.s V_7
IL_04b5: ldstr ", abort reading of received configs"
IL_04ba: call System.String System.String::Concat(System.String,System.String,System.String)
IL_04bf: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_04c4: nop
IL_04c5: newobj System.Void ServerSync.ConfigSync/ParsedConfigs::.ctor()
IL_04ca: stloc.s V_25
IL_04cc: br.s IL_04e8
IL_04ce: nop
IL_04cf: ldloc.s V_4
IL_04d1: ldc.i4.1
IL_04d2: add
IL_04d3: stloc.s V_4
IL_04d5: ldloc.s V_4
IL_04d7: ldloc.3
IL_04d8: clt
IL_04da: stloc.s V_26
IL_04dc: ldloc.s V_26
IL_04de: brtrue IL_00ce
IL_04e3: ldloc.0
IL_04e4: stloc.s V_25
IL_04e6: br.s IL_04e8
IL_04e8: ldloc.s V_25
IL_04ea: ret
// EH Catch: 275 - 309 => 309 - 460

// System.Boolean ServerSync.ConfigSync::isWritableConfig(ServerSync.OwnConfigEntryBase)
.locals ServerSync.ConfigSync/<>c__DisplayClass51_0, ServerSync.ConfigSync, System.Boolean, System.Boolean
IL_0000: newobj System.Void ServerSync.ConfigSync/<>c__DisplayClass51_0::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.0
IL_0008: stfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync/<>c__DisplayClass51_0::config
IL_000d: nop
IL_000e: ldsfld System.Collections.Generic.HashSet`1<ServerSync.ConfigSync> ServerSync.ConfigSync::configSyncs
IL_0013: ldloc.0
IL_0014: ldftn System.Boolean ServerSync.ConfigSync/<>c__DisplayClass51_0::<isWritableConfig>b__0(ServerSync.ConfigSync)
IL_001a: newobj System.Void System.Func`2<ServerSync.ConfigSync,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_001f: call !!0 System.Linq.Enumerable::FirstOrDefault<ServerSync.ConfigSync>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0024: stloc.1
IL_0025: ldloc.1
IL_0026: ldnull
IL_0027: cgt.un
IL_0029: ldc.i4.0
IL_002a: ceq
IL_002c: stloc.2
IL_002d: ldloc.2
IL_002e: brfalse.s IL_0035
IL_0030: nop
IL_0031: ldc.i4.1
IL_0032: stloc.3
IL_0033: br.s IL_007e
IL_0035: ldloc.1
IL_0036: callvirt System.Boolean ServerSync.ConfigSync::get_IsSourceOfTruth()
IL_003b: brtrue.s IL_007a
IL_003d: ldloc.0
IL_003e: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync/<>c__DisplayClass51_0::config
IL_0043: ldfld System.Boolean ServerSync.OwnConfigEntryBase::SynchronizedConfig
IL_0048: brfalse.s IL_007a
IL_004a: ldloc.0
IL_004b: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync/<>c__DisplayClass51_0::config
IL_0050: ldfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_0055: brfalse.s IL_007a
IL_0057: ldloc.1
IL_0058: callvirt System.Boolean ServerSync.ConfigSync::get_IsLocked()
IL_005d: brtrue.s IL_0077
IL_005f: ldloc.0
IL_0060: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync/<>c__DisplayClass51_0::config
IL_0065: ldloc.1
IL_0066: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::lockedConfig
IL_006b: bne.un.s IL_0074
IL_006d: ldsfld System.Boolean ServerSync.ConfigSync::lockExempt
IL_0072: br.s IL_0075
IL_0074: ldc.i4.1
IL_0075: br.s IL_0078
IL_0077: ldc.i4.0
IL_0078: br.s IL_007b
IL_007a: ldc.i4.1
IL_007b: stloc.3
IL_007c: br.s IL_007e
IL_007e: ldloc.3
IL_007f: ret

// System.Void ServerSync.ConfigSync::serverLockedSettingChanged()
.locals System.Collections.Generic.HashSet`1/Enumerator<ServerSync.OwnConfigEntryBase>, ServerSync.OwnConfigEntryBase
IL_0000: nop
IL_0001: nop
IL_0002: ldarg.0
IL_0003: ldfld System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase> ServerSync.ConfigSync::allConfigs
IL_0008: callvirt System.Collections.Generic.HashSet`1/Enumerator<!0> System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase>::GetEnumerator()
IL_000d: stloc.0
IL_000e: br.s IL_0038
IL_0010: ldloca.s V_0
IL_0012: call !0 System.Collections.Generic.HashSet`1/Enumerator<ServerSync.OwnConfigEntryBase>::get_Current()
IL_0017: stloc.1
IL_0018: nop
IL_0019: ldloc.1
IL_001a: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_001f: call T ServerSync.ConfigSync::configAttribute<ServerSync.ConfigurationManagerAttributes>(BepInEx.Configuration.ConfigEntryBase)
IL_0024: ldloc.1
IL_0025: call System.Boolean ServerSync.ConfigSync::isWritableConfig(ServerSync.OwnConfigEntryBase)
IL_002a: ldc.i4.0
IL_002b: ceq
IL_002d: newobj System.Void System.Nullable`1<System.Boolean>::.ctor(!0)
IL_0032: stfld System.Nullable`1<System.Boolean> ServerSync.ConfigurationManagerAttributes::ReadOnly
IL_0037: nop
IL_0038: ldloca.s V_0
IL_003a: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<ServerSync.OwnConfigEntryBase>::MoveNext()
IL_003f: brtrue.s IL_0010
IL_0041: leave.s IL_0052
IL_0043: ldloca.s V_0
IL_0045: constrained. System.Collections.Generic.HashSet`1/Enumerator<ServerSync.OwnConfigEntryBase>
IL_004b: callvirt System.Void System.IDisposable::Dispose()
IL_0050: nop
IL_0051: endfinally
IL_0052: ret
// EH Finally: 14 - 67 => 67 - 82

// System.Void ServerSync.ConfigSync::resetConfigsFromServer()
.locals BepInEx.Configuration.ConfigFile, System.Boolean, System.Collections.Generic.IEnumerator`1<ServerSync.OwnConfigEntryBase>, ServerSync.OwnConfigEntryBase, System.Boolean, System.Boolean, System.Collections.Generic.IEnumerator`1<ServerSync.CustomSyncedValueBase>, ServerSync.CustomSyncedValueBase
IL_0000: nop
IL_0001: ldnull
IL_0002: stloc.0
IL_0003: ldc.i4.0
IL_0004: stloc.1
IL_0005: nop
IL_0006: ldarg.0
IL_0007: ldfld System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase> ServerSync.ConfigSync::allConfigs
IL_000c: ldsfld System.Func`2<ServerSync.OwnConfigEntryBase,System.Boolean> ServerSync.ConfigSync/<>c::<>9__53_0
IL_0011: dup
IL_0012: brtrue.s IL_002b
IL_0014: pop
IL_0015: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_001a: ldftn System.Boolean ServerSync.ConfigSync/<>c::<resetConfigsFromServer>b__53_0(ServerSync.OwnConfigEntryBase)
IL_0020: newobj System.Void System.Func`2<ServerSync.OwnConfigEntryBase,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0025: dup
IL_0026: stsfld System.Func`2<ServerSync.OwnConfigEntryBase,System.Boolean> ServerSync.ConfigSync/<>c::<>9__53_0
IL_002b: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ServerSync.OwnConfigEntryBase>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0030: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<ServerSync.OwnConfigEntryBase>::GetEnumerator()
IL_0035: stloc.2
IL_0036: br.s IL_0081
IL_0038: ldloc.2
IL_0039: callvirt !0 System.Collections.Generic.IEnumerator`1<ServerSync.OwnConfigEntryBase>::get_Current()
IL_003e: stloc.3
IL_003f: nop
IL_0040: ldloc.0
IL_0041: ldnull
IL_0042: ceq
IL_0044: stloc.s V_4
IL_0046: ldloc.s V_4
IL_0048: brfalse.s IL_0067
IL_004a: nop
IL_004b: ldloc.3
IL_004c: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_0051: callvirt BepInEx.Configuration.ConfigFile BepInEx.Configuration.ConfigEntryBase::get_ConfigFile()
IL_0056: stloc.0
IL_0057: ldloc.0
IL_0058: callvirt System.Boolean BepInEx.Configuration.ConfigFile::get_SaveOnConfigSet()
IL_005d: stloc.1
IL_005e: ldloc.0
IL_005f: ldc.i4.0
IL_0060: callvirt System.Void BepInEx.Configuration.ConfigFile::set_SaveOnConfigSet(System.Boolean)
IL_0065: nop
IL_0066: nop
IL_0067: ldloc.3
IL_0068: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_006d: ldloc.3
IL_006e: ldfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_0073: callvirt System.Void BepInEx.Configuration.ConfigEntryBase::set_BoxedValue(System.Object)
IL_0078: nop
IL_0079: ldloc.3
IL_007a: ldnull
IL_007b: stfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_0080: nop
IL_0081: ldloc.2
IL_0082: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0087: brtrue.s IL_0038
IL_0089: leave.s IL_0096
IL_008b: ldloc.2
IL_008c: brfalse.s IL_0095
IL_008e: ldloc.2
IL_008f: callvirt System.Void System.IDisposable::Dispose()
IL_0094: nop
IL_0095: endfinally
IL_0096: ldloc.0
IL_0097: ldnull
IL_0098: cgt.un
IL_009a: stloc.s V_5
IL_009c: ldloc.s V_5
IL_009e: brfalse.s IL_00aa
IL_00a0: nop
IL_00a1: ldloc.0
IL_00a2: ldloc.1
IL_00a3: callvirt System.Void BepInEx.Configuration.ConfigFile::set_SaveOnConfigSet(System.Boolean)
IL_00a8: nop
IL_00a9: nop
IL_00aa: nop
IL_00ab: ldarg.0
IL_00ac: ldfld System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync::allCustomValues
IL_00b1: ldsfld System.Func`2<ServerSync.CustomSyncedValueBase,System.Boolean> ServerSync.ConfigSync/<>c::<>9__53_1
IL_00b6: dup
IL_00b7: brtrue.s IL_00d0
IL_00b9: pop
IL_00ba: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_00bf: ldftn System.Boolean ServerSync.ConfigSync/<>c::<resetConfigsFromServer>b__53_1(ServerSync.CustomSyncedValueBase)
IL_00c5: newobj System.Void System.Func`2<ServerSync.CustomSyncedValueBase,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_00ca: dup
IL_00cb: stsfld System.Func`2<ServerSync.CustomSyncedValueBase,System.Boolean> ServerSync.ConfigSync/<>c::<>9__53_1
IL_00d0: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ServerSync.CustomSyncedValueBase>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_00d5: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<ServerSync.CustomSyncedValueBase>::GetEnumerator()
IL_00da: stloc.s V_6
IL_00dc: br.s IL_0100
IL_00de: ldloc.s V_6
IL_00e0: callvirt !0 System.Collections.Generic.IEnumerator`1<ServerSync.CustomSyncedValueBase>::get_Current()
IL_00e5: stloc.s V_7
IL_00e7: nop
IL_00e8: ldloc.s V_7
IL_00ea: ldloc.s V_7
IL_00ec: ldfld System.Object ServerSync.CustomSyncedValueBase::LocalBaseValue
IL_00f1: callvirt System.Void ServerSync.CustomSyncedValueBase::set_BoxedValue(System.Object)
IL_00f6: nop
IL_00f7: ldloc.s V_7
IL_00f9: ldnull
IL_00fa: stfld System.Object ServerSync.CustomSyncedValueBase::LocalBaseValue
IL_00ff: nop
IL_0100: ldloc.s V_6
IL_0102: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0107: brtrue.s IL_00de
IL_0109: leave.s IL_0118
IL_010b: ldloc.s V_6
IL_010d: brfalse.s IL_0117
IL_010f: ldloc.s V_6
IL_0111: callvirt System.Void System.IDisposable::Dispose()
IL_0116: nop
IL_0117: endfinally
IL_0118: ldarg.0
IL_0119: ldarg.0
IL_011a: ldftn System.Void ServerSync.ConfigSync::serverLockedSettingChanged()
IL_0120: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_0125: call System.Void ServerSync.ConfigSync::remove_lockedConfigChanged(System.Action)
IL_012a: nop
IL_012b: ldarg.0
IL_012c: call System.Void ServerSync.ConfigSync::serverLockedSettingChanged()
IL_0131: nop
IL_0132: ret
// EH Finally: 54 - 139 => 139 - 150
// EH Finally: 220 - 267 => 267 - 280

// System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync::distributeConfigToPeers(ZNetPeer,ZPackage)
.locals 
IL_0000: ldc.i4.0
IL_0001: newobj System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::.ctor(System.Int32)
IL_0006: dup
IL_0007: ldarg.0
IL_0008: stfld ServerSync.ConfigSync ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>4__this
IL_000d: dup
IL_000e: ldarg.1
IL_000f: stfld ZNetPeer ServerSync.ConfigSync/<distributeConfigToPeers>d__55::peer
IL_0014: dup
IL_0015: ldarg.2
IL_0016: stfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::package
IL_001b: ret

// System.Collections.IEnumerator ServerSync.ConfigSync::sendZPackage(System.Int64,ZPackage)
.locals ServerSync.ConfigSync/<>c__DisplayClass56_0, System.Collections.Generic.List`1<ZNetPeer>, System.Boolean, System.Collections.IEnumerator, System.Boolean
IL_0000: newobj System.Void ServerSync.ConfigSync/<>c__DisplayClass56_0::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.1
IL_0008: stfld System.Int64 ServerSync.ConfigSync/<>c__DisplayClass56_0::target
IL_000d: nop
IL_000e: call ZNet ZNet::get_instance()
IL_0013: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0018: ldc.i4.0
IL_0019: ceq
IL_001b: stloc.2
IL_001c: ldloc.2
IL_001d: brfalse.s IL_002d
IL_001f: nop
IL_0020: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Empty<System.Object>()
IL_0025: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.Object>::GetEnumerator()
IL_002a: stloc.3
IL_002b: br.s IL_0086
IL_002d: ldtoken ZRoutedRpc
IL_0032: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0037: ldstr "m_peers"
IL_003c: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_0041: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_0046: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_004b: castclass System.Collections.Generic.List`1<ZNetPeer>
IL_0050: stloc.1
IL_0051: ldloc.0
IL_0052: ldfld System.Int64 ServerSync.ConfigSync/<>c__DisplayClass56_0::target
IL_0057: ldc.i4.0
IL_0058: conv.i8
IL_0059: cgt.un
IL_005b: stloc.s V_4
IL_005d: ldloc.s V_4
IL_005f: brfalse.s IL_007b
IL_0061: nop
IL_0062: ldloc.1
IL_0063: ldloc.0
IL_0064: ldftn System.Boolean ServerSync.ConfigSync/<>c__DisplayClass56_0::<sendZPackage>b__0(ZNetPeer)
IL_006a: newobj System.Void System.Func`2<ZNetPeer,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_006f: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ZNetPeer>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0074: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<ZNetPeer>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0079: stloc.1
IL_007a: nop
IL_007b: ldarg.0
IL_007c: ldloc.1
IL_007d: ldarg.2
IL_007e: call System.Collections.IEnumerator ServerSync.ConfigSync::sendZPackage(System.Collections.Generic.List`1<ZNetPeer>,ZPackage)
IL_0083: stloc.3
IL_0084: br.s IL_0086
IL_0086: ldloc.3
IL_0087: ret

// System.Collections.IEnumerator ServerSync.ConfigSync::sendZPackage(System.Collections.Generic.List`1<ZNetPeer>,ZPackage)
.locals 
IL_0000: ldc.i4.0
IL_0001: newobj System.Void ServerSync.ConfigSync/<sendZPackage>d__57::.ctor(System.Int32)
IL_0006: dup
IL_0007: ldarg.0
IL_0008: stfld ServerSync.ConfigSync ServerSync.ConfigSync/<sendZPackage>d__57::<>4__this
IL_000d: dup
IL_000e: ldarg.1
IL_000f: stfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/<sendZPackage>d__57::peers
IL_0014: dup
IL_0015: ldarg.2
IL_0016: stfld ZPackage ServerSync.ConfigSync/<sendZPackage>d__57::package
IL_001b: ret

// System.Void ServerSync.ConfigSync::Broadcast(System.Int64,BepInEx.Configuration.ConfigEntryBase[])
.locals System.Boolean, ZPackage
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean ServerSync.ConfigSync::get_IsLocked()
IL_0007: brfalse.s IL_0010
IL_0009: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_000e: br.s IL_0011
IL_0010: ldc.i4.1
IL_0011: stloc.0
IL_0012: ldloc.0
IL_0013: brfalse.s IL_003a
IL_0015: nop
IL_0016: ldarg.2
IL_0017: ldnull
IL_0018: ldnull
IL_0019: ldc.i4.1
IL_001a: call ZPackage ServerSync.ConfigSync::ConfigsToPackage(System.Collections.Generic.IEnumerable`1<BepInEx.Configuration.ConfigEntryBase>,System.Collections.Generic.IEnumerable`1<ServerSync.CustomSyncedValueBase>,System.Collections.Generic.IEnumerable`1<ServerSync.ConfigSync/PackageEntry>,System.Boolean)
IL_001f: stloc.1
IL_0020: call ZNet ZNet::get_instance()
IL_0025: dup
IL_0026: brtrue.s IL_002b
IL_0028: pop
IL_0029: br.s IL_0039
IL_002b: ldarg.0
IL_002c: ldarg.1
IL_002d: ldloc.1
IL_002e: call System.Collections.IEnumerator ServerSync.ConfigSync::sendZPackage(System.Int64,ZPackage)
IL_0033: call UnityEngine.Coroutine UnityEngine.MonoBehaviour::StartCoroutine(System.Collections.IEnumerator)
IL_0038: pop
IL_0039: nop
IL_003a: ret

// System.Void ServerSync.ConfigSync::Broadcast(System.Int64,ServerSync.CustomSyncedValueBase[])
.locals System.Boolean, ZPackage
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean ServerSync.ConfigSync::get_IsLocked()
IL_0007: brfalse.s IL_0010
IL_0009: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_000e: br.s IL_0011
IL_0010: ldc.i4.1
IL_0011: stloc.0
IL_0012: ldloc.0
IL_0013: brfalse.s IL_003a
IL_0015: nop
IL_0016: ldnull
IL_0017: ldarg.2
IL_0018: ldnull
IL_0019: ldc.i4.1
IL_001a: call ZPackage ServerSync.ConfigSync::ConfigsToPackage(System.Collections.Generic.IEnumerable`1<BepInEx.Configuration.ConfigEntryBase>,System.Collections.Generic.IEnumerable`1<ServerSync.CustomSyncedValueBase>,System.Collections.Generic.IEnumerable`1<ServerSync.ConfigSync/PackageEntry>,System.Boolean)
IL_001f: stloc.1
IL_0020: call ZNet ZNet::get_instance()
IL_0025: dup
IL_0026: brtrue.s IL_002b
IL_0028: pop
IL_0029: br.s IL_0039
IL_002b: ldarg.0
IL_002c: ldarg.1
IL_002d: ldloc.1
IL_002e: call System.Collections.IEnumerator ServerSync.ConfigSync::sendZPackage(System.Int64,ZPackage)
IL_0033: call UnityEngine.Coroutine UnityEngine.MonoBehaviour::StartCoroutine(System.Collections.IEnumerator)
IL_0038: pop
IL_0039: nop
IL_003a: ret

// ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::configData(BepInEx.Configuration.ConfigEntryBase)
.locals ServerSync.OwnConfigEntryBase
IL_0000: nop
IL_0001: ldarg.0
IL_0002: callvirt BepInEx.Configuration.ConfigDescription BepInEx.Configuration.ConfigEntryBase::get_Description()
IL_0007: callvirt System.Object[] BepInEx.Configuration.ConfigDescription::get_Tags()
IL_000c: dup
IL_000d: brtrue.s IL_0013
IL_000f: pop
IL_0010: ldnull
IL_0011: br.s IL_001d
IL_0013: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::OfType<ServerSync.OwnConfigEntryBase>(System.Collections.IEnumerable)
IL_0018: call !!0 System.Linq.Enumerable::SingleOrDefault<ServerSync.OwnConfigEntryBase>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_001d: stloc.0
IL_001e: br.s IL_0020
IL_0020: ldloc.0
IL_0021: ret

// ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync::ConfigData(BepInEx.Configuration.ConfigEntry`1<T>)
.locals ServerSync.SyncedConfigEntry`1<T>
IL_0000: nop
IL_0001: ldarg.0
IL_0002: callvirt BepInEx.Configuration.ConfigDescription BepInEx.Configuration.ConfigEntryBase::get_Description()
IL_0007: callvirt System.Object[] BepInEx.Configuration.ConfigDescription::get_Tags()
IL_000c: dup
IL_000d: brtrue.s IL_0013
IL_000f: pop
IL_0010: ldnull
IL_0011: br.s IL_001d
IL_0013: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::OfType<ServerSync.SyncedConfigEntry`1<T>>(System.Collections.IEnumerable)
IL_0018: call !!0 System.Linq.Enumerable::SingleOrDefault<ServerSync.SyncedConfigEntry`1<T>>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_001d: stloc.0
IL_001e: br.s IL_0020
IL_0020: ldloc.0
IL_0021: ret

// T ServerSync.ConfigSync::configAttribute(BepInEx.Configuration.ConfigEntryBase)
.locals T
IL_0000: nop
IL_0001: ldarg.0
IL_0002: callvirt BepInEx.Configuration.ConfigDescription BepInEx.Configuration.ConfigEntryBase::get_Description()
IL_0007: callvirt System.Object[] BepInEx.Configuration.ConfigDescription::get_Tags()
IL_000c: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::OfType<T>(System.Collections.IEnumerable)
IL_0011: call !!0 System.Linq.Enumerable::First<T>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0016: stloc.0
IL_0017: br.s IL_0019
IL_0019: ldloc.0
IL_001a: ret

// System.Type ServerSync.ConfigSync::configType(BepInEx.Configuration.ConfigEntryBase)
.locals 
IL_0000: ldarg.0
IL_0001: callvirt System.Type BepInEx.Configuration.ConfigEntryBase::get_SettingType()
IL_0006: call System.Type ServerSync.ConfigSync::configType(System.Type)
IL_000b: ret

// System.Type ServerSync.ConfigSync::configType(System.Type)
.locals 
IL_0000: ldarg.0
IL_0001: callvirt System.Boolean System.Type::get_IsEnum()
IL_0006: brtrue.s IL_000b
IL_0008: ldarg.0
IL_0009: br.s IL_0011
IL_000b: ldarg.0
IL_000c: call System.Type System.Enum::GetUnderlyingType(System.Type)
IL_0011: ret

// ZPackage ServerSync.ConfigSync::ConfigsToPackage(System.Collections.Generic.IEnumerable`1<BepInEx.Configuration.ConfigEntryBase>,System.Collections.Generic.IEnumerable`1<ServerSync.CustomSyncedValueBase>,System.Collections.Generic.IEnumerable`1<ServerSync.ConfigSync/PackageEntry>,System.Boolean)
.locals System.Collections.Generic.List`1<BepInEx.Configuration.ConfigEntryBase>, System.Collections.Generic.List`1<ServerSync.CustomSyncedValueBase>, ZPackage, System.Collections.Generic.IEnumerator`1<ServerSync.ConfigSync/PackageEntry>, ServerSync.ConfigSync/PackageEntry, System.Collections.Generic.List`1/Enumerator<ServerSync.CustomSyncedValueBase>, ServerSync.CustomSyncedValueBase, System.Collections.Generic.List`1/Enumerator<BepInEx.Configuration.ConfigEntryBase>, BepInEx.Configuration.ConfigEntryBase, ZPackage
IL_0000: nop
IL_0001: ldarg.0
IL_0002: brtrue.s IL_0007
IL_0004: ldnull
IL_0005: br.s IL_0031
IL_0007: ldarg.0
IL_0008: ldsfld System.Func`2<BepInEx.Configuration.ConfigEntryBase,System.Boolean> ServerSync.ConfigSync/<>c::<>9__69_0
IL_000d: dup
IL_000e: brtrue.s IL_0027
IL_0010: pop
IL_0011: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_0016: ldftn System.Boolean ServerSync.ConfigSync/<>c::<ConfigsToPackage>b__69_0(BepInEx.Configuration.ConfigEntryBase)
IL_001c: newobj System.Void System.Func`2<BepInEx.Configuration.ConfigEntryBase,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0021: dup
IL_0022: stsfld System.Func`2<BepInEx.Configuration.ConfigEntryBase,System.Boolean> ServerSync.ConfigSync/<>c::<>9__69_0
IL_0027: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<BepInEx.Configuration.ConfigEntryBase>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_002c: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<BepInEx.Configuration.ConfigEntryBase>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0031: dup
IL_0032: brtrue.s IL_003a
IL_0034: pop
IL_0035: newobj System.Void System.Collections.Generic.List`1<BepInEx.Configuration.ConfigEntryBase>::.ctor()
IL_003a: stloc.0
IL_003b: ldarg.1
IL_003c: brtrue.s IL_0041
IL_003e: ldnull
IL_003f: br.s IL_0047
IL_0041: ldarg.1
IL_0042: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<ServerSync.CustomSyncedValueBase>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0047: dup
IL_0048: brtrue.s IL_0050
IL_004a: pop
IL_004b: newobj System.Void System.Collections.Generic.List`1<ServerSync.CustomSyncedValueBase>::.ctor()
IL_0050: stloc.1
IL_0051: newobj System.Void ZPackage::.ctor()
IL_0056: stloc.2
IL_0057: ldloc.2
IL_0058: ldarg.3
IL_0059: brtrue.s IL_005e
IL_005b: ldc.i4.0
IL_005c: br.s IL_005f
IL_005e: ldc.i4.1
IL_005f: callvirt System.Void ZPackage::Write(System.Byte)
IL_0064: nop
IL_0065: ldloc.2
IL_0066: ldloc.0
IL_0067: callvirt System.Int32 System.Collections.Generic.List`1<BepInEx.Configuration.ConfigEntryBase>::get_Count()
IL_006c: ldloc.1
IL_006d: callvirt System.Int32 System.Collections.Generic.List`1<ServerSync.CustomSyncedValueBase>::get_Count()
IL_0072: add
IL_0073: ldarg.2
IL_0074: brtrue.s IL_0079
IL_0076: ldc.i4.0
IL_0077: br.s IL_007f
IL_0079: ldarg.2
IL_007a: call System.Int32 System.Linq.Enumerable::Count<ServerSync.ConfigSync/PackageEntry>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_007f: add
IL_0080: callvirt System.Void ZPackage::Write(System.Int32)
IL_0085: nop
IL_0086: nop
IL_0087: ldarg.2
IL_0088: dup
IL_0089: brtrue.s IL_0091
IL_008b: pop
IL_008c: call !!0[] System.Array::Empty<ServerSync.ConfigSync/PackageEntry>()
IL_0091: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<ServerSync.ConfigSync/PackageEntry>::GetEnumerator()
IL_0096: stloc.3
IL_0097: br.s IL_00ac
IL_0099: ldloc.3
IL_009a: callvirt !0 System.Collections.Generic.IEnumerator`1<ServerSync.ConfigSync/PackageEntry>::get_Current()
IL_009f: stloc.s V_4
IL_00a1: nop
IL_00a2: ldloc.2
IL_00a3: ldloc.s V_4
IL_00a5: call System.Void ServerSync.ConfigSync::AddEntryToPackage(ZPackage,ServerSync.ConfigSync/PackageEntry)
IL_00aa: nop
IL_00ab: nop
IL_00ac: ldloc.3
IL_00ad: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_00b2: brtrue.s IL_0099
IL_00b4: leave.s IL_00c1
IL_00b6: ldloc.3
IL_00b7: brfalse.s IL_00c0
IL_00b9: ldloc.3
IL_00ba: callvirt System.Void System.IDisposable::Dispose()
IL_00bf: nop
IL_00c0: endfinally
IL_00c1: nop
IL_00c2: ldloc.1
IL_00c3: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<ServerSync.CustomSyncedValueBase>::GetEnumerator()
IL_00c8: stloc.s V_5
IL_00ca: br.s IL_0115
IL_00cc: ldloca.s V_5
IL_00ce: call !0 System.Collections.Generic.List`1/Enumerator<ServerSync.CustomSyncedValueBase>::get_Current()
IL_00d3: stloc.s V_6
IL_00d5: nop
IL_00d6: ldloc.2
IL_00d7: newobj System.Void ServerSync.ConfigSync/PackageEntry::.ctor()
IL_00dc: dup
IL_00dd: ldstr "Internal"
IL_00e2: stfld System.String ServerSync.ConfigSync/PackageEntry::section
IL_00e7: dup
IL_00e8: ldloc.s V_6
IL_00ea: ldfld System.String ServerSync.CustomSyncedValueBase::Identifier
IL_00ef: stfld System.String ServerSync.ConfigSync/PackageEntry::key
IL_00f4: dup
IL_00f5: ldloc.s V_6
IL_00f7: ldfld System.Type ServerSync.CustomSyncedValueBase::Type
IL_00fc: stfld System.Type ServerSync.ConfigSync/PackageEntry::type
IL_0101: dup
IL_0102: ldloc.s V_6
IL_0104: callvirt System.Object ServerSync.CustomSyncedValueBase::get_BoxedValue()
IL_0109: stfld System.Object ServerSync.ConfigSync/PackageEntry::value
IL_010e: call System.Void ServerSync.ConfigSync::AddEntryToPackage(ZPackage,ServerSync.ConfigSync/PackageEntry)
IL_0113: nop
IL_0114: nop
IL_0115: ldloca.s V_5
IL_0117: call System.Boolean System.Collections.Generic.List`1/Enumerator<ServerSync.CustomSyncedValueBase>::MoveNext()
IL_011c: brtrue.s IL_00cc
IL_011e: leave.s IL_012f
IL_0120: ldloca.s V_5
IL_0122: constrained. System.Collections.Generic.List`1/Enumerator<ServerSync.CustomSyncedValueBase>
IL_0128: callvirt System.Void System.IDisposable::Dispose()
IL_012d: nop
IL_012e: endfinally
IL_012f: nop
IL_0130: ldloc.0
IL_0131: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<BepInEx.Configuration.ConfigEntryBase>::GetEnumerator()
IL_0136: stloc.s V_7
IL_0138: br.s IL_018f
IL_013a: ldloca.s V_7
IL_013c: call !0 System.Collections.Generic.List`1/Enumerator<BepInEx.Configuration.ConfigEntryBase>::get_Current()
IL_0141: stloc.s V_8
IL_0143: nop
IL_0144: ldloc.2
IL_0145: newobj System.Void ServerSync.ConfigSync/PackageEntry::.ctor()
IL_014a: dup
IL_014b: ldloc.s V_8
IL_014d: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_0152: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Section()
IL_0157: stfld System.String ServerSync.ConfigSync/PackageEntry::section
IL_015c: dup
IL_015d: ldloc.s V_8
IL_015f: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_0164: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Key()
IL_0169: stfld System.String ServerSync.ConfigSync/PackageEntry::key
IL_016e: dup
IL_016f: ldloc.s V_8
IL_0171: call System.Type ServerSync.ConfigSync::configType(BepInEx.Configuration.ConfigEntryBase)
IL_0176: stfld System.Type ServerSync.ConfigSync/PackageEntry::type
IL_017b: dup
IL_017c: ldloc.s V_8
IL_017e: callvirt System.Object BepInEx.Configuration.ConfigEntryBase::get_BoxedValue()
IL_0183: stfld System.Object ServerSync.ConfigSync/PackageEntry::value
IL_0188: call System.Void ServerSync.ConfigSync::AddEntryToPackage(ZPackage,ServerSync.ConfigSync/PackageEntry)
IL_018d: nop
IL_018e: nop
IL_018f: ldloca.s V_7
IL_0191: call System.Boolean System.Collections.Generic.List`1/Enumerator<BepInEx.Configuration.ConfigEntryBase>::MoveNext()
IL_0196: brtrue.s IL_013a
IL_0198: leave.s IL_01a9
IL_019a: ldloca.s V_7
IL_019c: constrained. System.Collections.Generic.List`1/Enumerator<BepInEx.Configuration.ConfigEntryBase>
IL_01a2: callvirt System.Void System.IDisposable::Dispose()
IL_01a7: nop
IL_01a8: endfinally
IL_01a9: ldloc.2
IL_01aa: stloc.s V_9
IL_01ac: br.s IL_01ae
IL_01ae: ldloc.s V_9
IL_01b0: ret
// EH Finally: 151 - 182 => 182 - 193
// EH Finally: 202 - 288 => 288 - 303
// EH Finally: 312 - 410 => 410 - 425

// System.Void ServerSync.ConfigSync::AddEntryToPackage(ZPackage,ServerSync.ConfigSync/PackageEntry)
.locals 
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldarg.1
IL_0003: ldfld System.String ServerSync.ConfigSync/PackageEntry::section
IL_0008: callvirt System.Void ZPackage::Write(System.String)
IL_000d: nop
IL_000e: ldarg.0
IL_000f: ldarg.1
IL_0010: ldfld System.String ServerSync.ConfigSync/PackageEntry::key
IL_0015: callvirt System.Void ZPackage::Write(System.String)
IL_001a: nop
IL_001b: ldarg.0
IL_001c: ldarg.1
IL_001d: ldfld System.Object ServerSync.ConfigSync/PackageEntry::value
IL_0022: brfalse.s IL_0031
IL_0024: ldarg.1
IL_0025: ldfld System.Type ServerSync.ConfigSync/PackageEntry::type
IL_002a: call System.String ServerSync.ConfigSync::GetZPackageTypeString(System.Type)
IL_002f: br.s IL_0036
IL_0031: ldstr ""
IL_0036: callvirt System.Void ZPackage::Write(System.String)
IL_003b: nop
IL_003c: ldarg.0
IL_003d: ldarg.1
IL_003e: ldfld System.Object ServerSync.ConfigSync/PackageEntry::value
IL_0043: call System.Void ServerSync.ConfigSync::AddValueToZPackage(ZPackage,System.Object)
IL_0048: nop
IL_0049: ret

// System.String ServerSync.ConfigSync::GetZPackageTypeString(System.Type)
.locals 
IL_0000: ldarg.0
IL_0001: callvirt System.String System.Type::get_AssemblyQualifiedName()
IL_0006: ret

// System.Void ServerSync.ConfigSync::AddValueToZPackage(ZPackage,System.Object)
.locals System.Type, System.Boolean, System.Collections.ICollection, System.Boolean, System.Collections.IEnumerator, System.Object, System.IDisposable, System.Boolean, System.Reflection.FieldInfo[], System.Reflection.FieldInfo[], System.Int32, System.Reflection.FieldInfo
IL_0000: nop
IL_0001: ldarg.1
IL_0002: brtrue.s IL_0007
IL_0004: ldnull
IL_0005: br.s IL_000d
IL_0007: ldarg.1
IL_0008: call System.Type System.Object::GetType()
IL_000d: stloc.0
IL_000e: ldarg.1
IL_000f: isinst System.Enum
IL_0014: ldnull
IL_0015: cgt.un
IL_0017: stloc.1
IL_0018: ldloc.1
IL_0019: brfalse.s IL_003f
IL_001b: nop
IL_001c: ldarg.1
IL_001d: castclass System.IConvertible
IL_0022: ldarg.1
IL_0023: callvirt System.Type System.Object::GetType()
IL_0028: call System.Type System.Enum::GetUnderlyingType(System.Type)
IL_002d: call System.Globalization.CultureInfo System.Globalization.CultureInfo::get_InvariantCulture()
IL_0032: callvirt System.Object System.IConvertible::ToType(System.Type,System.IFormatProvider)
IL_0037: starg.s value
IL_0039: nop
IL_003a: br IL_0119
IL_003f: ldarg.1
IL_0040: isinst System.Collections.ICollection
IL_0045: stloc.2
IL_0046: ldloc.2
IL_0047: ldnull
IL_0048: cgt.un
IL_004a: stloc.3
IL_004b: ldloc.3
IL_004c: brfalse.s IL_00a1
IL_004e: nop
IL_004f: ldarg.0
IL_0050: ldloc.2
IL_0051: callvirt System.Int32 System.Collections.ICollection::get_Count()
IL_0056: callvirt System.Void ZPackage::Write(System.Int32)
IL_005b: nop
IL_005c: nop
IL_005d: ldloc.2
IL_005e: callvirt System.Collections.IEnumerator System.Collections.IEnumerable::GetEnumerator()
IL_0063: stloc.s V_4
IL_0065: br.s IL_007b
IL_0067: ldloc.s V_4
IL_0069: callvirt System.Object System.Collections.IEnumerator::get_Current()
IL_006e: stloc.s V_5
IL_0070: nop
IL_0071: ldarg.0
IL_0072: ldloc.s V_5
IL_0074: call System.Void ServerSync.ConfigSync::AddValueToZPackage(ZPackage,System.Object)
IL_0079: nop
IL_007a: nop
IL_007b: ldloc.s V_4
IL_007d: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0082: brtrue.s IL_0067
IL_0084: leave.s IL_009c
IL_0086: ldloc.s V_4
IL_0088: isinst System.IDisposable
IL_008d: stloc.s V_6
IL_008f: ldloc.s V_6
IL_0091: brfalse.s IL_009b
IL_0093: ldloc.s V_6
IL_0095: callvirt System.Void System.IDisposable::Dispose()
IL_009a: nop
IL_009b: endfinally
IL_009c: br IL_012b
IL_00a1: ldloc.0
IL_00a2: brfalse.s IL_00b7
IL_00a4: ldloc.0
IL_00a5: callvirt System.Boolean System.Type::get_IsValueType()
IL_00aa: brfalse.s IL_00b7
IL_00ac: ldloc.0
IL_00ad: callvirt System.Boolean System.Type::get_IsPrimitive()
IL_00b2: ldc.i4.0
IL_00b3: ceq
IL_00b5: br.s IL_00b8
IL_00b7: ldc.i4.0
IL_00b8: stloc.s V_7
IL_00ba: ldloc.s V_7
IL_00bc: brfalse.s IL_0119
IL_00be: nop
IL_00bf: ldloc.0
IL_00c0: ldc.i4.s 52
IL_00c2: callvirt System.Reflection.FieldInfo[] System.Type::GetFields(System.Reflection.BindingFlags)
IL_00c7: stloc.s V_8
IL_00c9: ldarg.0
IL_00ca: ldloc.s V_8
IL_00cc: ldlen
IL_00cd: conv.i4
IL_00ce: callvirt System.Void ZPackage::Write(System.Int32)
IL_00d3: nop
IL_00d4: nop
IL_00d5: ldloc.s V_8
IL_00d7: stloc.s V_9
IL_00d9: ldc.i4.0
IL_00da: stloc.s V_10
IL_00dc: br.s IL_010f
IL_00de: ldloc.s V_9
IL_00e0: ldloc.s V_10
IL_00e2: ldelem.ref
IL_00e3: stloc.s V_11
IL_00e5: nop
IL_00e6: ldarg.0
IL_00e7: ldloc.s V_11
IL_00e9: callvirt System.Type System.Reflection.FieldInfo::get_FieldType()
IL_00ee: call System.String ServerSync.ConfigSync::GetZPackageTypeString(System.Type)
IL_00f3: callvirt System.Void ZPackage::Write(System.String)
IL_00f8: nop
IL_00f9: ldarg.0
IL_00fa: ldloc.s V_11
IL_00fc: ldarg.1
IL_00fd: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_0102: call System.Void ServerSync.ConfigSync::AddValueToZPackage(ZPackage,System.Object)
IL_0107: nop
IL_0108: nop
IL_0109: ldloc.s V_10
IL_010b: ldc.i4.1
IL_010c: add
IL_010d: stloc.s V_10
IL_010f: ldloc.s V_10
IL_0111: ldloc.s V_9
IL_0113: ldlen
IL_0114: conv.i4
IL_0115: blt.s IL_00de
IL_0117: br.s IL_012b
IL_0119: ldc.i4.1
IL_011a: newarr System.Object
IL_011f: dup
IL_0120: ldc.i4.0
IL_0121: ldarg.1
IL_0122: stelem.ref
IL_0123: ldarga.s package
IL_0125: call System.Void ZRpc::Serialize(System.Object[],ZPackage&)
IL_012a: nop
IL_012b: ret
// EH Finally: 101 - 134 => 134 - 156

// System.Object ServerSync.ConfigSync::ReadValueWithTypeFromZPackage(ZPackage,System.Type)
.locals System.Type, System.Reflection.ParameterInfo, System.Collections.Generic.List`1<System.Object>, System.Boolean, System.Reflection.FieldInfo[], System.Int32, System.Object, System.Boolean, System.Reflection.FieldInfo[], System.Int32, System.Reflection.FieldInfo, System.String, System.Boolean, System.Object, System.Boolean, System.Int32, System.Collections.IDictionary, System.Type, System.Reflection.FieldInfo, System.Reflection.FieldInfo, System.Int32, System.Object, System.Boolean, System.Boolean, System.Int32, System.Object, System.Reflection.MethodInfo, System.Int32, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: brfalse.s IL_001f
IL_0004: ldarg.1
IL_0005: callvirt System.Boolean System.Type::get_IsValueType()
IL_000a: brfalse.s IL_001f
IL_000c: ldarg.1
IL_000d: callvirt System.Boolean System.Type::get_IsPrimitive()
IL_0012: brtrue.s IL_001f
IL_0014: ldarg.1
IL_0015: callvirt System.Boolean System.Type::get_IsEnum()
IL_001a: ldc.i4.0
IL_001b: ceq
IL_001d: br.s IL_0020
IL_001f: ldc.i4.0
IL_0020: stloc.3
IL_0021: ldloc.3
IL_0022: brfalse IL_011a
IL_0027: nop
IL_0028: ldarg.1
IL_0029: ldc.i4.s 52
IL_002b: callvirt System.Reflection.FieldInfo[] System.Type::GetFields(System.Reflection.BindingFlags)
IL_0030: stloc.s V_4
IL_0032: ldarg.0
IL_0033: callvirt System.Int32 ZPackage::ReadInt()
IL_0038: stloc.s V_5
IL_003a: ldloc.s V_5
IL_003c: ldloc.s V_4
IL_003e: ldlen
IL_003f: conv.i4
IL_0040: ceq
IL_0042: ldc.i4.0
IL_0043: ceq
IL_0045: stloc.s V_7
IL_0047: ldloc.s V_7
IL_0049: brfalse.s IL_0082
IL_004b: nop
IL_004c: newobj System.Void ServerSync.ConfigSync/InvalidDeserializationTypeException::.ctor()
IL_0051: dup
IL_0052: ldstr "(field count: {0})"
IL_0057: ldloc.s V_5
IL_0059: box System.Int32
IL_005e: call System.String System.String::Format(System.String,System.Object)
IL_0063: stfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::received
IL_0068: dup
IL_0069: ldstr "(field count: {0})"
IL_006e: ldloc.s V_4
IL_0070: ldlen
IL_0071: conv.i4
IL_0072: box System.Int32
IL_0077: call System.String System.String::Format(System.String,System.Object)
IL_007c: stfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::expected
IL_0081: throw
IL_0082: ldarg.1
IL_0083: call System.Object System.Runtime.Serialization.FormatterServices::GetUninitializedObject(System.Type)
IL_0088: stloc.s V_6
IL_008a: nop
IL_008b: ldloc.s V_4
IL_008d: stloc.s V_8
IL_008f: ldc.i4.0
IL_0090: stloc.s V_9
IL_0092: br.s IL_0109
IL_0094: ldloc.s V_8
IL_0096: ldloc.s V_9
IL_0098: ldelem.ref
IL_0099: stloc.s V_10
IL_009b: nop
IL_009c: ldarg.0
IL_009d: callvirt System.String ZPackage::ReadString()
IL_00a2: stloc.s V_11
IL_00a4: ldloc.s V_11
IL_00a6: ldloc.s V_10
IL_00a8: callvirt System.Type System.Reflection.FieldInfo::get_FieldType()
IL_00ad: call System.String ServerSync.ConfigSync::GetZPackageTypeString(System.Type)
IL_00b2: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_00b7: stloc.s V_12
IL_00b9: ldloc.s V_12
IL_00bb: brfalse.s IL_00eb
IL_00bd: nop
IL_00be: newobj System.Void ServerSync.ConfigSync/InvalidDeserializationTypeException::.ctor()
IL_00c3: dup
IL_00c4: ldloc.s V_11
IL_00c6: stfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::received
IL_00cb: dup
IL_00cc: ldloc.s V_10
IL_00ce: callvirt System.Type System.Reflection.FieldInfo::get_FieldType()
IL_00d3: call System.String ServerSync.ConfigSync::GetZPackageTypeString(System.Type)
IL_00d8: stfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::expected
IL_00dd: dup
IL_00de: ldloc.s V_10
IL_00e0: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_00e5: stfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::field
IL_00ea: throw
IL_00eb: ldloc.s V_10
IL_00ed: ldloc.s V_6
IL_00ef: ldarg.0
IL_00f0: ldloc.s V_10
IL_00f2: callvirt System.Type System.Reflection.FieldInfo::get_FieldType()
IL_00f7: call System.Object ServerSync.ConfigSync::ReadValueWithTypeFromZPackage(ZPackage,System.Type)
IL_00fc: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_0101: nop
IL_0102: nop
IL_0103: ldloc.s V_9
IL_0105: ldc.i4.1
IL_0106: add
IL_0107: stloc.s V_9
IL_0109: ldloc.s V_9
IL_010b: ldloc.s V_8
IL_010d: ldlen
IL_010e: conv.i4
IL_010f: blt.s IL_0094
IL_0111: ldloc.s V_6
IL_0113: stloc.s V_13
IL_0115: br IL_02d6
IL_011a: ldarg.1
IL_011b: callvirt System.Boolean System.Type::get_IsGenericType()
IL_0120: brfalse.s IL_0139
IL_0122: ldarg.1
IL_0123: callvirt System.Type System.Type::GetGenericTypeDefinition()
IL_0128: ldtoken System.Collections.Generic.Dictionary`2
IL_012d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0132: call System.Boolean System.Type::op_Equality(System.Type,System.Type)
IL_0137: br.s IL_013a
IL_0139: ldc.i4.0
IL_013a: stloc.s V_14
IL_013c: ldloc.s V_14
IL_013e: brfalse IL_01d6
IL_0143: nop
IL_0144: ldarg.0
IL_0145: callvirt System.Int32 ZPackage::ReadInt()
IL_014a: stloc.s V_15
IL_014c: ldarg.1
IL_014d: call System.Object System.Activator::CreateInstance(System.Type)
IL_0152: castclass System.Collections.IDictionary
IL_0157: stloc.s V_16
IL_0159: ldtoken System.Collections.Generic.KeyValuePair`2
IL_015e: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0163: ldarg.1
IL_0164: callvirt System.Type[] System.Type::get_GenericTypeArguments()
IL_0169: callvirt System.Type System.Type::MakeGenericType(System.Type[])
IL_016e: stloc.s V_17
IL_0170: ldloc.s V_17
IL_0172: ldstr "key"
IL_0177: ldc.i4.s 36
IL_0179: callvirt System.Reflection.FieldInfo System.Type::GetField(System.String,System.Reflection.BindingFlags)
IL_017e: stloc.s V_18
IL_0180: ldloc.s V_17
IL_0182: ldstr "value"
IL_0187: ldc.i4.s 36
IL_0189: callvirt System.Reflection.FieldInfo System.Type::GetField(System.String,System.Reflection.BindingFlags)
IL_018e: stloc.s V_19
IL_0190: ldc.i4.0
IL_0191: stloc.s V_20
IL_0193: br.s IL_01c1
IL_0195: nop
IL_0196: ldarg.0
IL_0197: ldloc.s V_17
IL_0199: call System.Object ServerSync.ConfigSync::ReadValueWithTypeFromZPackage(ZPackage,System.Type)
IL_019e: stloc.s V_21
IL_01a0: ldloc.s V_16
IL_01a2: ldloc.s V_18
IL_01a4: ldloc.s V_21
IL_01a6: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_01ab: ldloc.s V_19
IL_01ad: ldloc.s V_21
IL_01af: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_01b4: callvirt System.Void System.Collections.IDictionary::Add(System.Object,System.Object)
IL_01b9: nop
IL_01ba: nop
IL_01bb: ldloc.s V_20
IL_01bd: ldc.i4.1
IL_01be: add
IL_01bf: stloc.s V_20
IL_01c1: ldloc.s V_20
IL_01c3: ldloc.s V_15
IL_01c5: clt
IL_01c7: stloc.s V_22
IL_01c9: ldloc.s V_22
IL_01cb: brtrue.s IL_0195
IL_01cd: ldloc.s V_16
IL_01cf: stloc.s V_13
IL_01d1: br IL_02d6
IL_01d6: ldarg.1
IL_01d7: ldtoken System.Collections.Generic.List`1<System.String>
IL_01dc: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_01e1: call System.Boolean System.Type::op_Inequality(System.Type,System.Type)
IL_01e6: brfalse.s IL_021d
IL_01e8: ldarg.1
IL_01e9: callvirt System.Boolean System.Type::get_IsGenericType()
IL_01ee: brfalse.s IL_021d
IL_01f0: ldtoken System.Collections.Generic.ICollection`1
IL_01f5: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_01fa: ldc.i4.1
IL_01fb: newarr System.Type
IL_0200: dup
IL_0201: ldc.i4.0
IL_0202: ldarg.1
IL_0203: callvirt System.Type[] System.Type::get_GenericTypeArguments()
IL_0208: ldc.i4.0
IL_0209: ldelem.ref
IL_020a: stelem.ref
IL_020b: callvirt System.Type System.Type::MakeGenericType(System.Type[])
IL_0210: stloc.0
IL_0211: ldloc.0
IL_0212: brfalse.s IL_021d
IL_0214: ldloc.0
IL_0215: ldarg.1
IL_0216: callvirt System.Boolean System.Type::IsAssignableFrom(System.Type)
IL_021b: br.s IL_021e
IL_021d: ldc.i4.0
IL_021e: stloc.s V_23
IL_0220: ldloc.s V_23
IL_0222: brfalse.s IL_0282
IL_0224: nop
IL_0225: ldarg.0
IL_0226: callvirt System.Int32 ZPackage::ReadInt()
IL_022b: stloc.s V_24
IL_022d: ldarg.1
IL_022e: call System.Object System.Activator::CreateInstance(System.Type)
IL_0233: stloc.s V_25
IL_0235: ldloc.0
IL_0236: ldstr "Add"
IL_023b: callvirt System.Reflection.MethodInfo System.Type::GetMethod(System.String)
IL_0240: stloc.s V_26
IL_0242: ldc.i4.0
IL_0243: stloc.s V_27
IL_0245: br.s IL_0270
IL_0247: nop
IL_0248: ldloc.s V_26
IL_024a: ldloc.s V_25
IL_024c: ldc.i4.1
IL_024d: newarr System.Object
IL_0252: dup
IL_0253: ldc.i4.0
IL_0254: ldarg.0
IL_0255: ldarg.1
IL_0256: callvirt System.Type[] System.Type::get_GenericTypeArguments()
IL_025b: ldc.i4.0
IL_025c: ldelem.ref
IL_025d: call System.Object ServerSync.ConfigSync::ReadValueWithTypeFromZPackage(ZPackage,System.Type)
IL_0262: stelem.ref
IL_0263: callvirt System.Object System.Reflection.MethodBase::Invoke(System.Object,System.Object[])
IL_0268: pop
IL_0269: nop
IL_026a: ldloc.s V_27
IL_026c: ldc.i4.1
IL_026d: add
IL_026e: stloc.s V_27
IL_0270: ldloc.s V_27
IL_0272: ldloc.s V_24
IL_0274: clt
IL_0276: stloc.s V_28
IL_0278: ldloc.s V_28
IL_027a: brtrue.s IL_0247
IL_027c: ldloc.s V_25
IL_027e: stloc.s V_13
IL_0280: br.s IL_02d6
IL_0282: ldtoken System.Reflection.ParameterInfo
IL_0287: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_028c: call System.Object System.Runtime.Serialization.FormatterServices::GetUninitializedObject(System.Type)
IL_0291: castclass System.Reflection.ParameterInfo
IL_0296: stloc.1
IL_0297: ldtoken System.Reflection.ParameterInfo
IL_029c: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_02a1: ldstr "ClassImpl"
IL_02a6: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_02ab: ldloc.1
IL_02ac: ldarg.1
IL_02ad: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_02b2: nop
IL_02b3: newobj System.Void System.Collections.Generic.List`1<System.Object>::.ctor()
IL_02b8: stloc.2
IL_02b9: ldc.i4.2
IL_02ba: newarr System.Reflection.ParameterInfo
IL_02bf: dup
IL_02c0: ldc.i4.1
IL_02c1: ldloc.1
IL_02c2: stelem.ref
IL_02c3: ldarg.0
IL_02c4: ldloca.s V_2
IL_02c6: call System.Void ZRpc::Deserialize(System.Reflection.ParameterInfo[],ZPackage,System.Collections.Generic.List`1<System.Object>&)
IL_02cb: nop
IL_02cc: ldloc.2
IL_02cd: call !!0 System.Linq.Enumerable::First<System.Object>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_02d2: stloc.s V_13
IL_02d4: br.s IL_02d6
IL_02d6: ldloc.s V_13
IL_02d8: ret

// System.Void ServerSync.ConfigSync::<AddLockingConfigEntry>b__35_0(System.Object,System.EventArgs)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Action ServerSync.ConfigSync::lockedConfigChanged
IL_0006: dup
IL_0007: brtrue.s IL_000c
IL_0009: pop
IL_000a: br.s IL_0012
IL_000c: callvirt System.Void System.Action::Invoke()
IL_0011: nop
IL_0012: ret

// System.Boolean ServerSync.ConfigSync::<HandleConfigSyncRPC>b__47_0(System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>)
.locals System.Boolean, System.DateTimeOffset, System.Boolean
IL_0000: nop
IL_0001: ldarga.s kv
IL_0003: call !0 System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>::get_Key()
IL_0008: call System.DateTimeOffset System.DateTimeOffset::get_Now()
IL_000d: stloc.1
IL_000e: ldloca.s V_1
IL_0010: call System.Int64 System.DateTimeOffset::get_Ticks()
IL_0015: clt
IL_0017: stloc.0
IL_0018: ldloc.0
IL_0019: brfalse.s IL_0033
IL_001b: nop
IL_001c: ldarg.0
IL_001d: ldfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>> ServerSync.ConfigSync::configValueCache
IL_0022: ldarga.s kv
IL_0024: call !1 System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>::get_Value()
IL_0029: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>>::Remove(!0)
IL_002e: pop
IL_002f: ldc.i4.1
IL_0030: stloc.2
IL_0031: br.s IL_0037
IL_0033: ldc.i4.0
IL_0034: stloc.2
IL_0035: br.s IL_0037
IL_0037: ldloc.2
IL_0038: ret

// System.Void ServerSync.ConfigSync/SnatchCurrentlyHandlingRPC::Prefix(ZRpc)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld ZRpc ServerSync.ConfigSync/SnatchCurrentlyHandlingRPC::currentRpc
IL_0006: ret

// System.Void ServerSync.ConfigSync/RegisterRPCPatch::Postfix(ZNet)
.locals System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>, ServerSync.ConfigSync, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: callvirt System.Boolean ZNet::IsServer()
IL_0007: stsfld System.Boolean ServerSync.ConfigSync::isServer
IL_000c: nop
IL_000d: ldsfld System.Collections.Generic.HashSet`1<ServerSync.ConfigSync> ServerSync.ConfigSync::configSyncs
IL_0012: callvirt System.Collections.Generic.HashSet`1/Enumerator<!0> System.Collections.Generic.HashSet`1<ServerSync.ConfigSync>::GetEnumerator()
IL_0017: stloc.0
IL_0018: br.s IL_0079
IL_001a: ldloca.s V_0
IL_001c: call !0 System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>::get_Current()
IL_0021: stloc.1
IL_0022: nop
IL_0023: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_0028: ldloc.1
IL_0029: ldfld System.String ServerSync.ConfigSync::Name
IL_002e: ldstr " ConfigSync"
IL_0033: call System.String System.String::Concat(System.String,System.String)
IL_0038: ldloc.1
IL_0039: ldftn System.Void ServerSync.ConfigSync::RPC_FromOtherClientConfigSync(System.Int64,ZPackage)
IL_003f: newobj System.Void System.Action`2<System.Int64,ZPackage>::.ctor(System.Object,System.IntPtr)
IL_0044: callvirt System.Void ZRoutedRpc::Register<ZPackage>(System.String,System.Action`2<System.Int64,!!0>)
IL_0049: nop
IL_004a: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_004f: stloc.2
IL_0050: ldloc.2
IL_0051: brfalse.s IL_0078
IL_0053: nop
IL_0054: ldloc.1
IL_0055: ldc.i4.1
IL_0056: callvirt System.Void ServerSync.ConfigSync::set_InitialSyncDone(System.Boolean)
IL_005b: nop
IL_005c: ldstr "Registered '"
IL_0061: ldloc.1
IL_0062: ldfld System.String ServerSync.ConfigSync::Name
IL_0067: ldstr " ConfigSync' RPC - waiting for incoming connections"
IL_006c: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0071: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0076: nop
IL_0077: nop
IL_0078: nop
IL_0079: ldloca.s V_0
IL_007b: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>::MoveNext()
IL_0080: brtrue.s IL_001a
IL_0082: leave.s IL_0093
IL_0084: ldloca.s V_0
IL_0086: constrained. System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>
IL_008c: callvirt System.Void System.IDisposable::Dispose()
IL_0091: nop
IL_0092: endfinally
IL_0093: nop
IL_0094: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_0099: stloc.3
IL_009a: ldloc.3
IL_009b: brfalse.s IL_00ab
IL_009d: nop
IL_009e: ldarg.0
IL_009f: call System.Collections.IEnumerator ServerSync.ConfigSync/RegisterRPCPatch::<Postfix>g__WatchAdminListChanges|0_0()
IL_00a4: callvirt UnityEngine.Coroutine UnityEngine.MonoBehaviour::StartCoroutine(System.Collections.IEnumerator)
IL_00a9: pop
IL_00aa: nop
IL_00ab: ret
// EH Finally: 24 - 132 => 132 - 147

// System.Collections.IEnumerator ServerSync.ConfigSync/RegisterRPCPatch::<Postfix>g__WatchAdminListChanges|0_0()
.locals ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d, System.Collections.IEnumerator
IL_0000: ldc.i4.0
IL_0001: newobj System.Void ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::.ctor(System.Int32)
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: stloc.1
IL_0009: ldloc.1
IL_000a: ret

// System.Void ServerSync.ConfigSync/RegisterRPCPatch::<Postfix>g__SendAdmin|0_1(System.Collections.Generic.List`1<ZNetPeer>,System.Boolean)
.locals ZPackage, ServerSync.ConfigSync, ServerSync.ConfigSync/PackageEntry, System.Boolean
IL_0000: nop
IL_0001: ldnull
IL_0002: ldnull
IL_0003: ldc.i4.1
IL_0004: newarr ServerSync.ConfigSync/PackageEntry
IL_0009: dup
IL_000a: ldc.i4.0
IL_000b: newobj System.Void ServerSync.ConfigSync/PackageEntry::.ctor()
IL_0010: stloc.2
IL_0011: ldloc.2
IL_0012: ldstr "Internal"
IL_0017: stfld System.String ServerSync.ConfigSync/PackageEntry::section
IL_001c: ldloc.2
IL_001d: ldstr "lockexempt"
IL_0022: stfld System.String ServerSync.ConfigSync/PackageEntry::key
IL_0027: ldloc.2
IL_0028: ldtoken System.Boolean
IL_002d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0032: stfld System.Type ServerSync.ConfigSync/PackageEntry::type
IL_0037: ldloc.2
IL_0038: ldarg.1
IL_0039: box System.Boolean
IL_003e: stfld System.Object ServerSync.ConfigSync/PackageEntry::value
IL_0043: ldloc.2
IL_0044: stelem.ref
IL_0045: ldc.i4.1
IL_0046: call ZPackage ServerSync.ConfigSync::ConfigsToPackage(System.Collections.Generic.IEnumerable`1<BepInEx.Configuration.ConfigEntryBase>,System.Collections.Generic.IEnumerable`1<ServerSync.CustomSyncedValueBase>,System.Collections.Generic.IEnumerable`1<ServerSync.ConfigSync/PackageEntry>,System.Boolean)
IL_004b: stloc.0
IL_004c: ldsfld System.Collections.Generic.HashSet`1<ServerSync.ConfigSync> ServerSync.ConfigSync::configSyncs
IL_0051: call !!0 System.Linq.Enumerable::First<ServerSync.ConfigSync>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0056: stloc.1
IL_0057: ldloc.1
IL_0058: ldnull
IL_0059: cgt.un
IL_005b: stloc.3
IL_005c: ldloc.3
IL_005d: brfalse.s IL_0074
IL_005f: nop
IL_0060: call ZNet ZNet::get_instance()
IL_0065: ldloc.1
IL_0066: ldarg.0
IL_0067: ldloc.0
IL_0068: callvirt System.Collections.IEnumerator ServerSync.ConfigSync::sendZPackage(System.Collections.Generic.List`1<ZNetPeer>,ZPackage)
IL_006d: callvirt UnityEngine.Coroutine UnityEngine.MonoBehaviour::StartCoroutine(System.Collections.IEnumerator)
IL_0072: pop
IL_0073: nop
IL_0074: ret

// System.Void ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::.ctor(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldarg.1
IL_0009: stfld System.Int32 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>1__state
IL_000e: ret

// System.Void ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::System.IDisposable.Dispose()
.locals 
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: stfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_0007: ldarg.0
IL_0008: ldnull
IL_0009: stfld System.Collections.Generic.List`1<System.String> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<CurrentList>5__2
IL_000e: ldarg.0
IL_000f: ldnull
IL_0010: stfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<adminPeer>5__3
IL_0015: ldarg.0
IL_0016: ldnull
IL_0017: stfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<nonAdminPeer>5__4
IL_001c: ldarg.0
IL_001d: ldc.i4.s -2
IL_001f: stfld System.Int32 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>1__state
IL_0024: ret

// System.Boolean ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::MoveNext()
.locals System.Int32, System.Boolean, System.Func`2<ZNetPeer,System.Boolean>
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>1__state
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: brfalse.s IL_0012
IL_000a: br.s IL_000c
IL_000c: ldloc.0
IL_000d: ldc.i4.1
IL_000e: beq.s IL_0014
IL_0010: br.s IL_0019
IL_0012: br.s IL_001b
IL_0014: br IL_00b7
IL_0019: ldc.i4.0
IL_001a: ret
IL_001b: ldarg.0
IL_001c: ldc.i4.m1
IL_001d: stfld System.Int32 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>1__state
IL_0022: ldarg.0
IL_0023: newobj System.Void ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::.ctor()
IL_0028: stfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_002d: nop
IL_002e: ldarg.0
IL_002f: ldfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_0034: ldtoken ZNet
IL_0039: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_003e: ldstr "ListContainsId"
IL_0043: ldnull
IL_0044: ldnull
IL_0045: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_004a: stfld System.Reflection.MethodInfo ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::listContainsId
IL_004f: ldarg.0
IL_0050: ldfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_0055: ldtoken ZNet
IL_005a: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_005f: ldstr "m_adminList"
IL_0064: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_0069: call ZNet ZNet::get_instance()
IL_006e: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_0073: castclass SyncedList
IL_0078: stfld SyncedList ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::adminList
IL_007d: ldarg.0
IL_007e: ldarg.0
IL_007f: ldfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_0084: ldfld SyncedList ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::adminList
IL_0089: callvirt System.Collections.Generic.List`1<System.String> SyncedList::GetList()
IL_008e: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor(System.Collections.Generic.IEnumerable`1<!0>)
IL_0093: stfld System.Collections.Generic.List`1<System.String> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<CurrentList>5__2
IL_0098: br IL_0192
IL_009d: nop
IL_009e: ldarg.0
IL_009f: ldc.r4 30
IL_00a4: newobj System.Void UnityEngine.WaitForSeconds::.ctor(System.Single)
IL_00a9: stfld System.Object ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>2__current
IL_00ae: ldarg.0
IL_00af: ldc.i4.1
IL_00b0: stfld System.Int32 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>1__state
IL_00b5: ldc.i4.1
IL_00b6: ret
IL_00b7: ldarg.0
IL_00b8: ldc.i4.m1
IL_00b9: stfld System.Int32 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>1__state
IL_00be: ldarg.0
IL_00bf: ldfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_00c4: ldfld SyncedList ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::adminList
IL_00c9: callvirt System.Collections.Generic.List`1<System.String> SyncedList::GetList()
IL_00ce: ldarg.0
IL_00cf: ldfld System.Collections.Generic.List`1<System.String> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<CurrentList>5__2
IL_00d4: call System.Boolean System.Linq.Enumerable::SequenceEqual<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_00d9: ldc.i4.0
IL_00da: ceq
IL_00dc: stloc.1
IL_00dd: ldloc.1
IL_00de: brfalse IL_0191
IL_00e3: nop
IL_00e4: ldarg.0
IL_00e5: ldarg.0
IL_00e6: ldfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_00eb: ldfld SyncedList ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::adminList
IL_00f0: callvirt System.Collections.Generic.List`1<System.String> SyncedList::GetList()
IL_00f5: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor(System.Collections.Generic.IEnumerable`1<!0>)
IL_00fa: stfld System.Collections.Generic.List`1<System.String> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<CurrentList>5__2
IL_00ff: nop
IL_0100: ldarg.0
IL_0101: call ZNet ZNet::get_instance()
IL_0106: callvirt System.Collections.Generic.List`1<ZNetPeer> ZNet::GetPeers()
IL_010b: ldarg.0
IL_010c: ldfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_0111: ldfld System.Func`2<ZNetPeer,System.Boolean> ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::<>9__2
IL_0116: dup
IL_0117: brtrue.s IL_0139
IL_0119: pop
IL_011a: ldarg.0
IL_011b: ldfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_0120: ldarg.0
IL_0121: ldfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_0126: ldftn System.Boolean ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::<Postfix>b__2(ZNetPeer)
IL_012c: newobj System.Void System.Func`2<ZNetPeer,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0131: dup
IL_0132: stloc.2
IL_0133: stfld System.Func`2<ZNetPeer,System.Boolean> ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::<>9__2
IL_0138: ldloc.2
IL_0139: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ZNetPeer>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_013e: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<ZNetPeer>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0143: stfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<adminPeer>5__3
IL_0148: ldarg.0
IL_0149: call ZNet ZNet::get_instance()
IL_014e: callvirt System.Collections.Generic.List`1<ZNetPeer> ZNet::GetPeers()
IL_0153: ldarg.0
IL_0154: ldfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<adminPeer>5__3
IL_0159: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Except<ZNetPeer>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_015e: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<ZNetPeer>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0163: stfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<nonAdminPeer>5__4
IL_0168: ldarg.0
IL_0169: ldfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<nonAdminPeer>5__4
IL_016e: ldc.i4.0
IL_016f: call System.Void ServerSync.ConfigSync/RegisterRPCPatch::<Postfix>g__SendAdmin|0_1(System.Collections.Generic.List`1<ZNetPeer>,System.Boolean)
IL_0174: nop
IL_0175: ldarg.0
IL_0176: ldfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<adminPeer>5__3
IL_017b: ldc.i4.1
IL_017c: call System.Void ServerSync.ConfigSync/RegisterRPCPatch::<Postfix>g__SendAdmin|0_1(System.Collections.Generic.List`1<ZNetPeer>,System.Boolean)
IL_0181: nop
IL_0182: nop
IL_0183: ldarg.0
IL_0184: ldnull
IL_0185: stfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<adminPeer>5__3
IL_018a: ldarg.0
IL_018b: ldnull
IL_018c: stfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<nonAdminPeer>5__4
IL_0191: nop
IL_0192: br IL_009d

// System.Object ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::System.Collections.Generic.IEnumerator<System.Object>.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Object ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>2__current
IL_0006: ret

// System.Void ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::System.Collections.IEnumerator.Reset()
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Object ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::System.Collections.IEnumerator.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Object ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>2__current
IL_0006: ret

// System.Void ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Boolean ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::<Postfix>b__2(ZNetPeer)
.locals System.String, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: ldfld ZRpc ZNetPeer::m_rpc
IL_0007: callvirt ISocket ZRpc::GetSocket()
IL_000c: callvirt System.String ISocket::GetHostName()
IL_0011: stloc.0
IL_0012: ldarg.0
IL_0013: ldfld System.Reflection.MethodInfo ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::listContainsId
IL_0018: brfalse.s IL_0044
IL_001a: ldarg.0
IL_001b: ldfld System.Reflection.MethodInfo ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::listContainsId
IL_0020: call ZNet ZNet::get_instance()
IL_0025: ldc.i4.2
IL_0026: newarr System.Object
IL_002b: dup
IL_002c: ldc.i4.0
IL_002d: ldarg.0
IL_002e: ldfld SyncedList ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::adminList
IL_0033: stelem.ref
IL_0034: dup
IL_0035: ldc.i4.1
IL_0036: ldloc.0
IL_0037: stelem.ref
IL_0038: callvirt System.Object System.Reflection.MethodBase::Invoke(System.Object,System.Object[])
IL_003d: unbox.any System.Boolean
IL_0042: br.s IL_0050
IL_0044: ldarg.0
IL_0045: ldfld SyncedList ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::adminList
IL_004a: ldloc.0
IL_004b: callvirt System.Boolean SyncedList::Contains(System.String)
IL_0050: stloc.1
IL_0051: br.s IL_0053
IL_0053: ldloc.1
IL_0054: ret

// System.Void ServerSync.ConfigSync/RegisterClientRPCPatch::Postfix(ZNet,ZNetPeer)
.locals System.Boolean, System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>, ServerSync.ConfigSync
IL_0000: nop
IL_0001: ldarg.0
IL_0002: callvirt System.Boolean ZNet::IsServer()
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: brfalse.s IL_006a
IL_000e: nop
IL_000f: nop
IL_0010: ldsfld System.Collections.Generic.HashSet`1<ServerSync.ConfigSync> ServerSync.ConfigSync::configSyncs
IL_0015: callvirt System.Collections.Generic.HashSet`1/Enumerator<!0> System.Collections.Generic.HashSet`1<ServerSync.ConfigSync>::GetEnumerator()
IL_001a: stloc.1
IL_001b: br.s IL_004f
IL_001d: ldloca.s V_1
IL_001f: call !0 System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>::get_Current()
IL_0024: stloc.2
IL_0025: nop
IL_0026: ldarg.1
IL_0027: ldfld ZRpc ZNetPeer::m_rpc
IL_002c: ldloc.2
IL_002d: ldfld System.String ServerSync.ConfigSync::Name
IL_0032: ldstr " ConfigSync"
IL_0037: call System.String System.String::Concat(System.String,System.String)
IL_003c: ldloc.2
IL_003d: ldftn System.Void ServerSync.ConfigSync::RPC_FromServerConfigSync(ZRpc,ZPackage)
IL_0043: newobj System.Void System.Action`2<ZRpc,ZPackage>::.ctor(System.Object,System.IntPtr)
IL_0048: callvirt System.Void ZRpc::Register<ZPackage>(System.String,System.Action`2<ZRpc,!!0>)
IL_004d: nop
IL_004e: nop
IL_004f: ldloca.s V_1
IL_0051: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>::MoveNext()
IL_0056: brtrue.s IL_001d
IL_0058: leave.s IL_0069
IL_005a: ldloca.s V_1
IL_005c: constrained. System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>
IL_0062: callvirt System.Void System.IDisposable::Dispose()
IL_0067: nop
IL_0068: endfinally
IL_0069: nop
IL_006a: ret
// EH Finally: 27 - 90 => 90 - 105

// System.Void ServerSync.ConfigSync/ParsedConfigs::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: newobj System.Void System.Collections.Generic.Dictionary`2<ServerSync.OwnConfigEntryBase,System.Object>::.ctor()
IL_0006: stfld System.Collections.Generic.Dictionary`2<ServerSync.OwnConfigEntryBase,System.Object> ServerSync.ConfigSync/ParsedConfigs::configValues
IL_000b: ldarg.0
IL_000c: newobj System.Void System.Collections.Generic.Dictionary`2<ServerSync.CustomSyncedValueBase,System.Object>::.ctor()
IL_0011: stfld System.Collections.Generic.Dictionary`2<ServerSync.CustomSyncedValueBase,System.Object> ServerSync.ConfigSync/ParsedConfigs::customValues
IL_0016: ldarg.0
IL_0017: call System.Void System.Object::.ctor()
IL_001c: nop
IL_001d: ret

// System.Void ServerSync.ConfigSync/ResetConfigsOnShutdown::Postfix()
.locals System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>, ServerSync.ConfigSync
IL_0000: nop
IL_0001: ldc.i4.1
IL_0002: stsfld System.Boolean ServerSync.ConfigSync::ProcessingServerUpdate
IL_0007: nop
IL_0008: ldsfld System.Collections.Generic.HashSet`1<ServerSync.ConfigSync> ServerSync.ConfigSync::configSyncs
IL_000d: callvirt System.Collections.Generic.HashSet`1/Enumerator<!0> System.Collections.Generic.HashSet`1<ServerSync.ConfigSync>::GetEnumerator()
IL_0012: stloc.0
IL_0013: br.s IL_0036
IL_0015: ldloca.s V_0
IL_0017: call !0 System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>::get_Current()
IL_001c: stloc.1
IL_001d: nop
IL_001e: ldloc.1
IL_001f: callvirt System.Void ServerSync.ConfigSync::resetConfigsFromServer()
IL_0024: nop
IL_0025: ldloc.1
IL_0026: ldc.i4.1
IL_0027: callvirt System.Void ServerSync.ConfigSync::set_IsSourceOfTruth(System.Boolean)
IL_002c: nop
IL_002d: ldloc.1
IL_002e: ldc.i4.0
IL_002f: callvirt System.Void ServerSync.ConfigSync::set_InitialSyncDone(System.Boolean)
IL_0034: nop
IL_0035: nop
IL_0036: ldloca.s V_0
IL_0038: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>::MoveNext()
IL_003d: brtrue.s IL_0015
IL_003f: leave.s IL_0050
IL_0041: ldloca.s V_0
IL_0043: constrained. System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>
IL_0049: callvirt System.Void System.IDisposable::Dispose()
IL_004e: nop
IL_004f: endfinally
IL_0050: ldc.i4.0
IL_0051: stsfld System.Boolean ServerSync.ConfigSync::ProcessingServerUpdate
IL_0056: ret
// EH Finally: 19 - 65 => 65 - 80

// System.Void ServerSync.ConfigSync/ResetConfigsOnShutdown::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin::Prefix(System.Collections.Generic.Dictionary`2<System.Reflection.Assembly,ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket>&,ZNet,ZRpc)
.locals System.Boolean, ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket, ZNetPeer, System.Boolean, System.Reflection.FieldInfo, ZPlayFabSocket, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: callvirt System.Boolean ZNet::IsServer()
IL_0007: stloc.0
IL_0008: ldloc.0
IL_0009: brfalse IL_0101
IL_000e: nop
IL_000f: ldarg.2
IL_0010: callvirt ISocket ZRpc::GetSocket()
IL_0015: newobj System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::.ctor(ISocket)
IL_001a: stloc.1
IL_001b: ldtoken ZRpc
IL_0020: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0025: ldstr "m_socket"
IL_002a: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_002f: ldarg.2
IL_0030: ldloc.1
IL_0031: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_0036: nop
IL_0037: ldtoken ZNet
IL_003c: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0041: ldstr "GetPeer"
IL_0046: ldc.i4.1
IL_0047: newarr System.Type
IL_004c: dup
IL_004d: ldc.i4.0
IL_004e: ldtoken ZRpc
IL_0053: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0058: stelem.ref
IL_0059: ldnull
IL_005a: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_005f: ldarg.1
IL_0060: ldc.i4.1
IL_0061: newarr System.Object
IL_0066: dup
IL_0067: ldc.i4.0
IL_0068: ldarg.2
IL_0069: stelem.ref
IL_006a: callvirt System.Object System.Reflection.MethodBase::Invoke(System.Object,System.Object[])
IL_006f: isinst ZNetPeer
IL_0074: stloc.2
IL_0075: ldloc.2
IL_0076: brfalse.s IL_0082
IL_0078: ldsfld OnlineBackendType ZNet::m_onlineBackend
IL_007d: ldc.i4.0
IL_007e: cgt.un
IL_0080: br.s IL_0083
IL_0082: ldc.i4.0
IL_0083: stloc.3
IL_0084: ldloc.3
IL_0085: brfalse.s IL_00e7
IL_0087: nop
IL_0088: ldtoken ZNetPeer
IL_008d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0092: ldstr "m_socket"
IL_0097: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_009c: stloc.s V_4
IL_009e: ldloc.s V_4
IL_00a0: ldloc.2
IL_00a1: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_00a6: isinst ZPlayFabSocket
IL_00ab: stloc.s V_5
IL_00ad: ldloc.s V_5
IL_00af: ldnull
IL_00b0: cgt.un
IL_00b2: stloc.s V_6
IL_00b4: ldloc.s V_6
IL_00b6: brfalse.s IL_00dc
IL_00b8: nop
IL_00b9: ldtoken ZPlayFabSocket
IL_00be: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00c3: ldstr "m_remotePlayerId"
IL_00c8: call System.Reflection.FieldInfo System.Type::GetField(System.String)
IL_00cd: ldloc.1
IL_00ce: ldloc.s V_5
IL_00d0: ldfld System.String ZPlayFabSocket::m_remotePlayerId
IL_00d5: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_00da: nop
IL_00db: nop
IL_00dc: ldloc.s V_4
IL_00de: ldloc.2
IL_00df: ldloc.1
IL_00e0: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_00e5: nop
IL_00e6: nop
IL_00e7: ldarg.0
IL_00e8: ldind.ref
IL_00e9: brtrue.s IL_00f2
IL_00eb: ldarg.0
IL_00ec: newobj System.Void System.Collections.Generic.Dictionary`2<System.Reflection.Assembly,ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket>::.ctor()
IL_00f1: stind.ref
IL_00f2: ldarg.0
IL_00f3: ldind.ref
IL_00f4: call System.Reflection.Assembly System.Reflection.Assembly::GetExecutingAssembly()
IL_00f9: ldloc.1
IL_00fa: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Reflection.Assembly,ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket>::set_Item(!0,!1)
IL_00ff: nop
IL_0100: nop
IL_0101: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin::Postfix(System.Collections.Generic.Dictionary`2<System.Reflection.Assembly,ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket>,ZNet,ZRpc)
.locals ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0, System.Boolean, System.Boolean, System.Object
IL_0000: newobj System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.2
IL_0008: stfld ZRpc ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::rpc
IL_000d: ldloc.0
IL_000e: ldarg.1
IL_000f: stfld ZNet ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::__instance
IL_0014: ldloc.0
IL_0015: ldarg.0
IL_0016: stfld System.Collections.Generic.Dictionary`2<System.Reflection.Assembly,ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::__state
IL_001b: nop
IL_001c: ldloc.0
IL_001d: ldfld ZNet ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::__instance
IL_0022: callvirt System.Boolean ZNet::IsServer()
IL_0027: ldc.i4.0
IL_0028: ceq
IL_002a: stloc.1
IL_002b: ldloc.1
IL_002c: brfalse.s IL_0031
IL_002e: nop
IL_002f: br.s IL_00ae
IL_0031: nop
IL_0032: ldtoken ZNet
IL_0037: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_003c: ldstr "GetPeer"
IL_0041: ldc.i4.1
IL_0042: newarr System.Type
IL_0047: dup
IL_0048: ldc.i4.0
IL_0049: ldtoken ZRpc
IL_004e: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0053: stelem.ref
IL_0054: ldnull
IL_0055: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_005a: ldloc.0
IL_005b: ldfld ZNet ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::__instance
IL_0060: ldc.i4.1
IL_0061: newarr System.Object
IL_0066: dup
IL_0067: ldc.i4.0
IL_0068: ldloc.0
IL_0069: ldfld ZRpc ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::rpc
IL_006e: stelem.ref
IL_006f: callvirt System.Object System.Reflection.MethodBase::Invoke(System.Object,System.Object[])
IL_0074: stloc.3
IL_0075: ldloc.0
IL_0076: ldloc.3
IL_0077: isinst ZNetPeer
IL_007c: stfld ZNetPeer ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::peer
IL_0081: ldloc.0
IL_0082: ldfld ZNetPeer ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::peer
IL_0087: ldnull
IL_0088: cgt.un
IL_008a: ldc.i4.0
IL_008b: ceq
IL_008d: stloc.2
IL_008e: ldloc.2
IL_008f: brfalse.s IL_009b
IL_0091: nop
IL_0092: ldloc.0
IL_0093: callvirt System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::<Postfix>g__SendBufferedData|0()
IL_0098: nop
IL_0099: br.s IL_00ae
IL_009b: nop
IL_009c: ldloc.0
IL_009d: ldfld ZNet ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::__instance
IL_00a2: ldloc.0
IL_00a3: callvirt System.Collections.IEnumerator ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::<Postfix>g__sendAsync|1()
IL_00a8: callvirt UnityEngine.Coroutine UnityEngine.MonoBehaviour::StartCoroutine(System.Collections.IEnumerator)
IL_00ad: pop
IL_00ae: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::.ctor(ISocket)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.0
IL_0002: volatile.
IL_0004: stfld System.Boolean modreq(System.Runtime.CompilerServices.IsVolatile) ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::finished
IL_0009: ldarg.0
IL_000a: ldc.i4.m1
IL_000b: volatile.
IL_000d: stfld System.Int32 modreq(System.Runtime.CompilerServices.IsVolatile) ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::versionMatchQueued
IL_0012: ldarg.0
IL_0013: newobj System.Void System.Collections.Generic.List`1<ZPackage>::.ctor()
IL_0018: stfld System.Collections.Generic.List`1<ZPackage> ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Package
IL_001d: ldarg.0
IL_001e: ldarg.1
IL_001f: stfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0024: ldarg.0
IL_0025: call System.Void ZPlayFabSocket::.ctor()
IL_002a: nop
IL_002b: ret

// System.Boolean ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::IsConnected()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0006: callvirt System.Boolean ISocket::IsConnected()
IL_000b: ret

// ZPackage ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Recv()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0006: callvirt ZPackage ISocket::Recv()
IL_000b: ret

// System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::GetSendQueueSize()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0006: callvirt System.Int32 ISocket::GetSendQueueSize()
IL_000b: ret

// System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::GetCurrentSendRate()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0006: callvirt System.Int32 ISocket::GetCurrentSendRate()
IL_000b: ret

// System.Boolean ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::IsHost()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0006: callvirt System.Boolean ISocket::IsHost()
IL_000b: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Dispose()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0006: callvirt System.Void ISocket::Dispose()
IL_000b: nop
IL_000c: ret

// System.Boolean ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::GotNewData()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0006: callvirt System.Boolean ISocket::GotNewData()
IL_000b: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Close()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0006: callvirt System.Void ISocket::Close()
IL_000b: nop
IL_000c: ret

// System.String ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::GetEndPointString()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0006: callvirt System.String ISocket::GetEndPointString()
IL_000b: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::GetAndResetStats(System.Int32&,System.Int32&)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0006: ldarg.1
IL_0007: ldarg.2
IL_0008: callvirt System.Void ISocket::GetAndResetStats(System.Int32&,System.Int32&)
IL_000d: nop
IL_000e: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::GetConnectionQuality(System.Single&,System.Single&,System.Int32&,System.Single&,System.Single&)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0006: ldarg.1
IL_0007: ldarg.2
IL_0008: ldarg.3
IL_0009: ldarg.s outByteSec
IL_000b: ldarg.s inByteSec
IL_000d: callvirt System.Void ISocket::GetConnectionQuality(System.Single&,System.Single&,System.Int32&,System.Single&,System.Single&)
IL_0012: nop
IL_0013: ret

// ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Accept()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0006: callvirt ISocket ISocket::Accept()
IL_000b: ret

// System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::GetHostPort()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0006: callvirt System.Int32 ISocket::GetHostPort()
IL_000b: ret

// System.Boolean ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Flush()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0006: callvirt System.Boolean ISocket::Flush()
IL_000b: ret

// System.String ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::GetHostName()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0006: callvirt System.String ISocket::GetHostName()
IL_000b: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::VersionMatch()
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: volatile.
IL_0004: ldfld System.Boolean modreq(System.Runtime.CompilerServices.IsVolatile) ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::finished
IL_0009: stloc.0
IL_000a: ldloc.0
IL_000b: brfalse.s IL_001d
IL_000d: nop
IL_000e: ldarg.0
IL_000f: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0014: callvirt System.Void ISocket::VersionMatch()
IL_0019: nop
IL_001a: nop
IL_001b: br.s IL_0032
IL_001d: nop
IL_001e: ldarg.0
IL_001f: ldarg.0
IL_0020: ldfld System.Collections.Generic.List`1<ZPackage> ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Package
IL_0025: callvirt System.Int32 System.Collections.Generic.List`1<ZPackage>::get_Count()
IL_002a: volatile.
IL_002c: stfld System.Int32 modreq(System.Runtime.CompilerServices.IsVolatile) ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::versionMatchQueued
IL_0031: nop
IL_0032: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Send(ZPackage)
.locals System.Int32, System.Int32, System.Boolean, ZPackage
IL_0000: nop
IL_0001: ldarg.1
IL_0002: callvirt System.Int32 ZPackage::GetPos()
IL_0007: stloc.0
IL_0008: ldarg.1
IL_0009: ldc.i4.0
IL_000a: callvirt System.Void ZPackage::SetPos(System.Int32)
IL_000f: nop
IL_0010: ldarg.1
IL_0011: callvirt System.Int32 ZPackage::ReadInt()
IL_0016: stloc.1
IL_0017: ldloc.1
IL_0018: ldstr "PeerInfo"
IL_001d: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0022: beq.s IL_003e
IL_0024: ldloc.1
IL_0025: ldstr "RoutedRPC"
IL_002a: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_002f: beq.s IL_003e
IL_0031: ldloc.1
IL_0032: ldstr "ZDOData"
IL_0037: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_003c: bne.un.s IL_004b
IL_003e: ldarg.0
IL_003f: volatile.
IL_0041: ldfld System.Boolean modreq(System.Runtime.CompilerServices.IsVolatile) ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::finished
IL_0046: ldc.i4.0
IL_0047: ceq
IL_0049: br.s IL_004c
IL_004b: ldc.i4.0
IL_004c: stloc.2
IL_004d: ldloc.2
IL_004e: brfalse.s IL_0075
IL_0050: nop
IL_0051: ldarg.1
IL_0052: callvirt System.Byte[] ZPackage::GetArray()
IL_0057: newobj System.Void ZPackage::.ctor(System.Byte[])
IL_005c: stloc.3
IL_005d: ldloc.3
IL_005e: ldloc.0
IL_005f: callvirt System.Void ZPackage::SetPos(System.Int32)
IL_0064: nop
IL_0065: ldarg.0
IL_0066: ldfld System.Collections.Generic.List`1<ZPackage> ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Package
IL_006b: ldloc.3
IL_006c: callvirt System.Void System.Collections.Generic.List`1<ZPackage>::Add(!0)
IL_0071: nop
IL_0072: nop
IL_0073: br.s IL_008c
IL_0075: nop
IL_0076: ldarg.1
IL_0077: ldloc.0
IL_0078: callvirt System.Void ZPackage::SetPos(System.Int32)
IL_007d: nop
IL_007e: ldarg.0
IL_007f: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0084: ldarg.1
IL_0085: callvirt System.Void ISocket::Send(ZPackage)
IL_008a: nop
IL_008b: nop
IL_008c: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c::.cctor()
.locals 
IL_0000: newobj System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c::.ctor()
IL_0005: stsfld ServerSync.ConfigSync/SendConfigsAfterLogin/<>c ServerSync.ConfigSync/SendConfigsAfterLogin/<>c::<>9
IL_000a: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// BepInEx.Configuration.ConfigEntryBase ServerSync.ConfigSync/SendConfigsAfterLogin/<>c::<Postfix>b__2_2(ServerSync.OwnConfigEntryBase)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_0006: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::<Postfix>g__SendBufferedData|0()
.locals ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket, System.Boolean, ZNetPeer, System.Boolean, System.Int32, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ZRpc ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::rpc
IL_0007: callvirt ISocket ZRpc::GetSocket()
IL_000c: isinst ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket
IL_0011: stloc.0
IL_0012: ldloc.0
IL_0013: ldnull
IL_0014: cgt.un
IL_0016: stloc.1
IL_0017: ldloc.1
IL_0018: brfalse IL_00b8
IL_001d: nop
IL_001e: ldtoken ZRpc
IL_0023: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0028: ldstr "m_socket"
IL_002d: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_0032: ldarg.0
IL_0033: ldfld ZRpc ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::rpc
IL_0038: ldloc.0
IL_0039: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_003e: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_0043: nop
IL_0044: ldtoken ZNet
IL_0049: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_004e: ldstr "GetPeer"
IL_0053: ldc.i4.1
IL_0054: newarr System.Type
IL_0059: dup
IL_005a: ldc.i4.0
IL_005b: ldtoken ZRpc
IL_0060: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0065: stelem.ref
IL_0066: ldnull
IL_0067: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_006c: ldarg.0
IL_006d: ldfld ZNet ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::__instance
IL_0072: ldc.i4.1
IL_0073: newarr System.Object
IL_0078: dup
IL_0079: ldc.i4.0
IL_007a: ldarg.0
IL_007b: ldfld ZRpc ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::rpc
IL_0080: stelem.ref
IL_0081: callvirt System.Object System.Reflection.MethodBase::Invoke(System.Object,System.Object[])
IL_0086: isinst ZNetPeer
IL_008b: stloc.2
IL_008c: ldloc.2
IL_008d: ldnull
IL_008e: cgt.un
IL_0090: stloc.3
IL_0091: ldloc.3
IL_0092: brfalse.s IL_00b7
IL_0094: nop
IL_0095: ldtoken ZNetPeer
IL_009a: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_009f: ldstr "m_socket"
IL_00a4: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_00a9: ldloc.2
IL_00aa: ldloc.0
IL_00ab: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_00b0: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_00b5: nop
IL_00b6: nop
IL_00b7: nop
IL_00b8: ldarg.0
IL_00b9: ldfld System.Collections.Generic.Dictionary`2<System.Reflection.Assembly,ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::__state
IL_00be: call System.Reflection.Assembly System.Reflection.Assembly::GetExecutingAssembly()
IL_00c3: callvirt !1 System.Collections.Generic.Dictionary`2<System.Reflection.Assembly,ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket>::get_Item(!0)
IL_00c8: stloc.0
IL_00c9: ldloc.0
IL_00ca: ldc.i4.1
IL_00cb: volatile.
IL_00cd: stfld System.Boolean modreq(System.Runtime.CompilerServices.IsVolatile) ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::finished
IL_00d2: ldc.i4.0
IL_00d3: stloc.s V_4
IL_00d5: br.s IL_0118
IL_00d7: nop
IL_00d8: ldloc.s V_4
IL_00da: ldloc.0
IL_00db: volatile.
IL_00dd: ldfld System.Int32 modreq(System.Runtime.CompilerServices.IsVolatile) ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::versionMatchQueued
IL_00e2: ceq
IL_00e4: stloc.s V_5
IL_00e6: ldloc.s V_5
IL_00e8: brfalse.s IL_00f8
IL_00ea: nop
IL_00eb: ldloc.0
IL_00ec: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_00f1: callvirt System.Void ISocket::VersionMatch()
IL_00f6: nop
IL_00f7: nop
IL_00f8: ldloc.0
IL_00f9: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_00fe: ldloc.0
IL_00ff: ldfld System.Collections.Generic.List`1<ZPackage> ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Package
IL_0104: ldloc.s V_4
IL_0106: callvirt !0 System.Collections.Generic.List`1<ZPackage>::get_Item(System.Int32)
IL_010b: callvirt System.Void ISocket::Send(ZPackage)
IL_0110: nop
IL_0111: nop
IL_0112: ldloc.s V_4
IL_0114: ldc.i4.1
IL_0115: add
IL_0116: stloc.s V_4
IL_0118: ldloc.s V_4
IL_011a: ldloc.0
IL_011b: ldfld System.Collections.Generic.List`1<ZPackage> ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Package
IL_0120: callvirt System.Int32 System.Collections.Generic.List`1<ZPackage>::get_Count()
IL_0125: clt
IL_0127: stloc.s V_6
IL_0129: ldloc.s V_6
IL_012b: brtrue.s IL_00d7
IL_012d: ldloc.0
IL_012e: ldfld System.Collections.Generic.List`1<ZPackage> ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Package
IL_0133: callvirt System.Int32 System.Collections.Generic.List`1<ZPackage>::get_Count()
IL_0138: ldloc.0
IL_0139: volatile.
IL_013b: ldfld System.Int32 modreq(System.Runtime.CompilerServices.IsVolatile) ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::versionMatchQueued
IL_0140: ceq
IL_0142: stloc.s V_7
IL_0144: ldloc.s V_7
IL_0146: brfalse.s IL_0156
IL_0148: nop
IL_0149: ldloc.0
IL_014a: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_014f: callvirt System.Void ISocket::VersionMatch()
IL_0154: nop
IL_0155: nop
IL_0156: ret

// System.Collections.IEnumerator ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::<Postfix>g__sendAsync|1()
.locals ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d, System.Collections.IEnumerator
IL_0000: ldc.i4.0
IL_0001: newobj System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::.ctor(System.Int32)
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: ldarg.0
IL_0009: stfld ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>4__this
IL_000e: ldloc.0
IL_000f: stloc.1
IL_0010: ldloc.1
IL_0011: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::.ctor(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldarg.1
IL_0009: stfld System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>1__state
IL_000e: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::System.IDisposable.Dispose()
.locals System.Int32
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>1__state
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: ldc.i4.s -3
IL_000a: beq.s IL_0014
IL_000c: br.s IL_000e
IL_000e: ldloc.0
IL_000f: ldc.i4.1
IL_0010: beq.s IL_0014
IL_0012: br.s IL_0020
IL_0014: nop
IL_0015: leave.s IL_001e
IL_0017: ldarg.0
IL_0018: call System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>m__Finally1()
IL_001d: endfinally
IL_001e: br.s IL_0020
IL_0020: ldarg.0
IL_0021: ldflda System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>s__1
IL_0026: initobj System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>
IL_002c: ldarg.0
IL_002d: ldnull
IL_002e: stfld ServerSync.ConfigSync ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<configSync>5__2
IL_0033: ldarg.0
IL_0034: ldnull
IL_0035: stfld System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<entries>5__3
IL_003a: ldarg.0
IL_003b: ldnull
IL_003c: stfld System.Reflection.MethodInfo ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<listContainsId>5__4
IL_0041: ldarg.0
IL_0042: ldnull
IL_0043: stfld SyncedList ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<adminList>5__5
IL_0048: ldarg.0
IL_0049: ldnull
IL_004a: stfld ZPackage ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<package>5__6
IL_004f: ldarg.0
IL_0050: ldc.i4.s -2
IL_0052: stfld System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>1__state
IL_0057: ret
// EH Finally: 21 - 23 => 23 - 30

// System.Boolean ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::MoveNext()
.locals System.Boolean, System.Int32, System.Boolean, ServerSync.ConfigSync/PackageEntry
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>1__state
IL_0006: stloc.1
IL_0007: ldloc.1
IL_0008: brfalse.s IL_0012
IL_000a: br.s IL_000c
IL_000c: ldloc.1
IL_000d: ldc.i4.1
IL_000e: beq.s IL_0014
IL_0010: br.s IL_0019
IL_0012: br.s IL_0020
IL_0014: br IL_0240
IL_0019: ldc.i4.0
IL_001a: stloc.0
IL_001b: leave IL_02a7
IL_0020: ldarg.0
IL_0021: ldc.i4.m1
IL_0022: stfld System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>1__state
IL_0027: nop
IL_0028: nop
IL_0029: ldarg.0
IL_002a: ldsfld System.Collections.Generic.HashSet`1<ServerSync.ConfigSync> ServerSync.ConfigSync::configSyncs
IL_002f: callvirt System.Collections.Generic.HashSet`1/Enumerator<!0> System.Collections.Generic.HashSet`1<ServerSync.ConfigSync>::GetEnumerator()
IL_0034: stfld System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>s__1
IL_0039: ldarg.0
IL_003a: ldc.i4.s -3
IL_003c: stfld System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>1__state
IL_0041: br IL_026c
IL_0046: ldarg.0
IL_0047: ldarg.0
IL_0048: ldflda System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>s__1
IL_004d: call !0 System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>::get_Current()
IL_0052: stfld ServerSync.ConfigSync ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<configSync>5__2
IL_0057: nop
IL_0058: ldarg.0
IL_0059: newobj System.Void System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry>::.ctor()
IL_005e: stfld System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<entries>5__3
IL_0063: ldarg.0
IL_0064: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<configSync>5__2
IL_0069: ldfld System.String ServerSync.ConfigSync::CurrentVersion
IL_006e: ldnull
IL_006f: cgt.un
IL_0071: stloc.2
IL_0072: ldloc.2
IL_0073: brfalse.s IL_00c1
IL_0075: nop
IL_0076: ldarg.0
IL_0077: ldfld System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<entries>5__3
IL_007c: newobj System.Void ServerSync.ConfigSync/PackageEntry::.ctor()
IL_0081: stloc.3
IL_0082: ldloc.3
IL_0083: ldstr "Internal"
IL_0088: stfld System.String ServerSync.ConfigSync/PackageEntry::section
IL_008d: ldloc.3
IL_008e: ldstr "serverversion"
IL_0093: stfld System.String ServerSync.ConfigSync/PackageEntry::key
IL_0098: ldloc.3
IL_0099: ldtoken System.String
IL_009e: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00a3: stfld System.Type ServerSync.ConfigSync/PackageEntry::type
IL_00a8: ldloc.3
IL_00a9: ldarg.0
IL_00aa: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<configSync>5__2
IL_00af: ldfld System.String ServerSync.ConfigSync::CurrentVersion
IL_00b4: stfld System.Object ServerSync.ConfigSync/PackageEntry::value
IL_00b9: ldloc.3
IL_00ba: callvirt System.Void System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry>::Add(!0)
IL_00bf: nop
IL_00c0: nop
IL_00c1: ldarg.0
IL_00c2: ldtoken ZNet
IL_00c7: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00cc: ldstr "ListContainsId"
IL_00d1: ldnull
IL_00d2: ldnull
IL_00d3: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_00d8: stfld System.Reflection.MethodInfo ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<listContainsId>5__4
IL_00dd: ldarg.0
IL_00de: ldtoken ZNet
IL_00e3: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00e8: ldstr "m_adminList"
IL_00ed: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_00f2: call ZNet ZNet::get_instance()
IL_00f7: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_00fc: castclass SyncedList
IL_0101: stfld SyncedList ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<adminList>5__5
IL_0106: ldarg.0
IL_0107: ldfld System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<entries>5__3
IL_010c: newobj System.Void ServerSync.ConfigSync/PackageEntry::.ctor()
IL_0111: stloc.3
IL_0112: ldloc.3
IL_0113: ldstr "Internal"
IL_0118: stfld System.String ServerSync.ConfigSync/PackageEntry::section
IL_011d: ldloc.3
IL_011e: ldstr "lockexempt"
IL_0123: stfld System.String ServerSync.ConfigSync/PackageEntry::key
IL_0128: ldloc.3
IL_0129: ldtoken System.Boolean
IL_012e: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0133: stfld System.Type ServerSync.ConfigSync/PackageEntry::type
IL_0138: ldloc.3
IL_0139: ldarg.0
IL_013a: ldfld System.Reflection.MethodInfo ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<listContainsId>5__4
IL_013f: brfalse.s IL_017a
IL_0141: ldarg.0
IL_0142: ldfld System.Reflection.MethodInfo ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<listContainsId>5__4
IL_0147: call ZNet ZNet::get_instance()
IL_014c: ldc.i4.2
IL_014d: newarr System.Object
IL_0152: dup
IL_0153: ldc.i4.0
IL_0154: ldarg.0
IL_0155: ldfld SyncedList ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<adminList>5__5
IL_015a: stelem.ref
IL_015b: dup
IL_015c: ldc.i4.1
IL_015d: ldarg.0
IL_015e: ldfld ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>4__this
IL_0163: ldfld ZRpc ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::rpc
IL_0168: callvirt ISocket ZRpc::GetSocket()
IL_016d: callvirt System.String ISocket::GetHostName()
IL_0172: stelem.ref
IL_0173: callvirt System.Object System.Reflection.MethodBase::Invoke(System.Object,System.Object[])
IL_0178: br.s IL_019f
IL_017a: ldarg.0
IL_017b: ldfld SyncedList ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<adminList>5__5
IL_0180: ldarg.0
IL_0181: ldfld ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>4__this
IL_0186: ldfld ZRpc ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::rpc
IL_018b: callvirt ISocket ZRpc::GetSocket()
IL_0190: callvirt System.String ISocket::GetHostName()
IL_0195: callvirt System.Boolean SyncedList::Contains(System.String)
IL_019a: box System.Boolean
IL_019f: stfld System.Object ServerSync.ConfigSync/PackageEntry::value
IL_01a4: ldloc.3
IL_01a5: callvirt System.Void System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry>::Add(!0)
IL_01aa: nop
IL_01ab: ldarg.0
IL_01ac: ldarg.0
IL_01ad: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<configSync>5__2
IL_01b2: ldfld System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase> ServerSync.ConfigSync::allConfigs
IL_01b7: ldsfld System.Func`2<ServerSync.OwnConfigEntryBase,BepInEx.Configuration.ConfigEntryBase> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c::<>9__2_2
IL_01bc: dup
IL_01bd: brtrue.s IL_01d6
IL_01bf: pop
IL_01c0: ldsfld ServerSync.ConfigSync/SendConfigsAfterLogin/<>c ServerSync.ConfigSync/SendConfigsAfterLogin/<>c::<>9
IL_01c5: ldftn BepInEx.Configuration.ConfigEntryBase ServerSync.ConfigSync/SendConfigsAfterLogin/<>c::<Postfix>b__2_2(ServerSync.OwnConfigEntryBase)
IL_01cb: newobj System.Void System.Func`2<ServerSync.OwnConfigEntryBase,BepInEx.Configuration.ConfigEntryBase>::.ctor(System.Object,System.IntPtr)
IL_01d0: dup
IL_01d1: stsfld System.Func`2<ServerSync.OwnConfigEntryBase,BepInEx.Configuration.ConfigEntryBase> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c::<>9__2_2
IL_01d6: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::Select<ServerSync.OwnConfigEntryBase,BepInEx.Configuration.ConfigEntryBase>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_01db: ldarg.0
IL_01dc: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<configSync>5__2
IL_01e1: ldfld System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync::allCustomValues
IL_01e6: ldarg.0
IL_01e7: ldfld System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<entries>5__3
IL_01ec: ldc.i4.0
IL_01ed: call ZPackage ServerSync.ConfigSync::ConfigsToPackage(System.Collections.Generic.IEnumerable`1<BepInEx.Configuration.ConfigEntryBase>,System.Collections.Generic.IEnumerable`1<ServerSync.CustomSyncedValueBase>,System.Collections.Generic.IEnumerable`1<ServerSync.ConfigSync/PackageEntry>,System.Boolean)
IL_01f2: stfld ZPackage ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<package>5__6
IL_01f7: ldarg.0
IL_01f8: ldarg.0
IL_01f9: ldfld ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>4__this
IL_01fe: ldfld ZNet ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::__instance
IL_0203: ldarg.0
IL_0204: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<configSync>5__2
IL_0209: newobj System.Void System.Collections.Generic.List`1<ZNetPeer>::.ctor()
IL_020e: dup
IL_020f: ldarg.0
IL_0210: ldfld ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>4__this
IL_0215: ldfld ZNetPeer ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::peer
IL_021a: callvirt System.Void System.Collections.Generic.List`1<ZNetPeer>::Add(!0)
IL_021f: nop
IL_0220: ldarg.0
IL_0221: ldfld ZPackage ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<package>5__6
IL_0226: callvirt System.Collections.IEnumerator ServerSync.ConfigSync::sendZPackage(System.Collections.Generic.List`1<ZNetPeer>,ZPackage)
IL_022b: callvirt UnityEngine.Coroutine UnityEngine.MonoBehaviour::StartCoroutine(System.Collections.IEnumerator)
IL_0230: stfld System.Object ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>2__current
IL_0235: ldarg.0
IL_0236: ldc.i4.1
IL_0237: stfld System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>1__state
IL_023c: ldc.i4.1
IL_023d: stloc.0
IL_023e: leave.s IL_02a7
IL_0240: ldarg.0
IL_0241: ldc.i4.s -3
IL_0243: stfld System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>1__state
IL_0248: nop
IL_0249: ldarg.0
IL_024a: ldnull
IL_024b: stfld System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<entries>5__3
IL_0250: ldarg.0
IL_0251: ldnull
IL_0252: stfld System.Reflection.MethodInfo ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<listContainsId>5__4
IL_0257: ldarg.0
IL_0258: ldnull
IL_0259: stfld SyncedList ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<adminList>5__5
IL_025e: ldarg.0
IL_025f: ldnull
IL_0260: stfld ZPackage ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<package>5__6
IL_0265: ldarg.0
IL_0266: ldnull
IL_0267: stfld ServerSync.ConfigSync ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<configSync>5__2
IL_026c: ldarg.0
IL_026d: ldflda System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>s__1
IL_0272: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>::MoveNext()
IL_0277: brtrue IL_0046
IL_027c: ldarg.0
IL_027d: call System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>m__Finally1()
IL_0282: nop
IL_0283: ldarg.0
IL_0284: ldflda System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>s__1
IL_0289: initobj System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>
IL_028f: ldarg.0
IL_0290: ldfld ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>4__this
IL_0295: call System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::<Postfix>g__SendBufferedData|0()
IL_029a: nop
IL_029b: ldc.i4.0
IL_029c: stloc.0
IL_029d: leave.s IL_02a7
IL_029f: ldarg.0
IL_02a0: call System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::System.IDisposable.Dispose()
IL_02a5: nop
IL_02a6: endfinally
IL_02a7: ldloc.0
IL_02a8: ret
// EH Fault: 0 - 671 => 671 - 679

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>m__Finally1()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.m1
IL_0002: stfld System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>1__state
IL_0007: ldarg.0
IL_0008: ldflda System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>s__1
IL_000d: constrained. System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>
IL_0013: callvirt System.Void System.IDisposable::Dispose()
IL_0018: nop
IL_0019: ret

// System.Object ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::System.Collections.Generic.IEnumerator<System.Object>.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Object ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>2__current
IL_0006: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::System.Collections.IEnumerator.Reset()
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Object ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::System.Collections.IEnumerator.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Object ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>2__current
IL_0006: ret

// System.Void ServerSync.ConfigSync/PackageEntry::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: stfld System.String ServerSync.ConfigSync/PackageEntry::section
IL_0007: ldarg.0
IL_0008: ldnull
IL_0009: stfld System.String ServerSync.ConfigSync/PackageEntry::key
IL_000e: ldarg.0
IL_000f: ldnull
IL_0010: stfld System.Type ServerSync.ConfigSync/PackageEntry::type
IL_0015: ldarg.0
IL_0016: call System.Void System.Object::.ctor()
IL_001b: nop
IL_001c: ret

// System.Boolean ServerSync.ConfigSync/PreventSavingServerInfo::Prefix(BepInEx.Configuration.ConfigEntryBase,System.String&)
.locals ServerSync.OwnConfigEntryBase, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::configData(BepInEx.Configuration.ConfigEntryBase)
IL_0007: stloc.0
IL_0008: ldloc.0
IL_0009: brfalse.s IL_0013
IL_000b: ldloc.0
IL_000c: call System.Boolean ServerSync.ConfigSync::isWritableConfig(ServerSync.OwnConfigEntryBase)
IL_0011: br.s IL_0014
IL_0013: ldc.i4.1
IL_0014: stloc.1
IL_0015: ldloc.1
IL_0016: brfalse.s IL_001d
IL_0018: nop
IL_0019: ldc.i4.1
IL_001a: stloc.2
IL_001b: br.s IL_0034
IL_001d: ldarg.1
IL_001e: ldloc.0
IL_001f: ldfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_0024: ldarg.0
IL_0025: callvirt System.Type BepInEx.Configuration.ConfigEntryBase::get_SettingType()
IL_002a: call System.String BepInEx.Configuration.TomlTypeConverter::ConvertToString(System.Object,System.Type)
IL_002f: stind.ref
IL_0030: ldc.i4.0
IL_0031: stloc.2
IL_0032: br.s IL_0034
IL_0034: ldloc.2
IL_0035: ret

// System.Boolean ServerSync.ConfigSync/PreventConfigRereadChangingValues::Prefix(BepInEx.Configuration.ConfigEntryBase,System.String)
.locals ServerSync.OwnConfigEntryBase, System.Boolean, System.Boolean, System.Exception
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::configData(BepInEx.Configuration.ConfigEntryBase)
IL_0007: stloc.0
IL_0008: ldloc.0
IL_0009: brfalse.s IL_0016
IL_000b: ldloc.0
IL_000c: ldfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_0011: ldnull
IL_0012: ceq
IL_0014: br.s IL_0017
IL_0016: ldc.i4.1
IL_0017: stloc.1
IL_0018: ldloc.1
IL_0019: brfalse.s IL_0020
IL_001b: nop
IL_001c: ldc.i4.1
IL_001d: stloc.2
IL_001e: br.s IL_005d
IL_0020: nop
IL_0021: nop
IL_0022: ldloc.0
IL_0023: ldarg.1
IL_0024: ldarg.0
IL_0025: callvirt System.Type BepInEx.Configuration.ConfigEntryBase::get_SettingType()
IL_002a: call System.Object BepInEx.Configuration.TomlTypeConverter::ConvertToValue(System.String,System.Type)
IL_002f: stfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_0034: nop
IL_0035: leave.s IL_0059
IL_0037: stloc.3
IL_0038: nop
IL_0039: ldstr "Config value of setting "{0}" could not be parsed and will be ignored. Reason: {1}; Value: {2}"
IL_003e: ldarg.0
IL_003f: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_0044: ldloc.3
IL_0045: callvirt System.String System.Exception::get_Message()
IL_004a: ldarg.1
IL_004b: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_0050: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_0055: nop
IL_0056: nop
IL_0057: leave.s IL_0059
IL_0059: ldc.i4.0
IL_005a: stloc.2
IL_005b: br.s IL_005d
IL_005d: ldloc.2
IL_005e: ret
// EH Catch: 33 - 55 => 55 - 89

// System.Void ServerSync.ConfigSync/InvalidDeserializationTypeException::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: stfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::expected
IL_0007: ldarg.0
IL_0008: ldnull
IL_0009: stfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::received
IL_000e: ldarg.0
IL_000f: ldstr ""
IL_0014: stfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::field
IL_0019: ldarg.0
IL_001a: call System.Void System.Exception::.ctor()
IL_001f: nop
IL_0020: ret

// System.Void ServerSync.ConfigSync/<>c::.cctor()
.locals 
IL_0000: newobj System.Void ServerSync.ConfigSync/<>c::.ctor()
IL_0005: stsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_000a: ret

// System.Void ServerSync.ConfigSync/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.String ServerSync.ConfigSync/<>c::<AddCustomValue>b__36_2(ServerSync.CustomSyncedValueBase)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.String ServerSync.CustomSyncedValueBase::Identifier
IL_0006: ret

// System.Int32 ServerSync.ConfigSync/<>c::<AddCustomValue>b__36_0(ServerSync.CustomSyncedValueBase)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.Int32 ServerSync.CustomSyncedValueBase::Priority
IL_0006: ret

// System.Collections.Generic.IEnumerable`1<System.Byte> ServerSync.ConfigSync/<>c::<HandleConfigSyncRPC>b__47_1(System.Byte[])
.locals 
IL_0000: ldarg.1
IL_0001: ret

// System.Boolean ServerSync.ConfigSync/<>c::<ReadConfigsFromPackage>b__49_0(ServerSync.OwnConfigEntryBase)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.Boolean ServerSync.OwnConfigEntryBase::SynchronizedConfig
IL_0006: ret

// System.String ServerSync.ConfigSync/<>c::<ReadConfigsFromPackage>b__49_1(ServerSync.OwnConfigEntryBase)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_0006: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_000b: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Section()
IL_0010: ldstr "_"
IL_0015: ldarg.1
IL_0016: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_001b: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_0020: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Key()
IL_0025: call System.String System.String::Concat(System.String,System.String,System.String)
IL_002a: ret

// ServerSync.OwnConfigEntryBase ServerSync.ConfigSync/<>c::<ReadConfigsFromPackage>b__49_2(ServerSync.OwnConfigEntryBase)
.locals 
IL_0000: ldarg.1
IL_0001: ret

// System.String ServerSync.ConfigSync/<>c::<ReadConfigsFromPackage>b__49_3(ServerSync.CustomSyncedValueBase)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.String ServerSync.CustomSyncedValueBase::Identifier
IL_0006: ret

// ServerSync.CustomSyncedValueBase ServerSync.ConfigSync/<>c::<ReadConfigsFromPackage>b__49_4(ServerSync.CustomSyncedValueBase)
.locals 
IL_0000: ldarg.1
IL_0001: ret

// System.Boolean ServerSync.ConfigSync/<>c::<resetConfigsFromServer>b__53_0(ServerSync.OwnConfigEntryBase)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_0006: ldnull
IL_0007: cgt.un
IL_0009: ret

// System.Boolean ServerSync.ConfigSync/<>c::<resetConfigsFromServer>b__53_1(ServerSync.CustomSyncedValueBase)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.Object ServerSync.CustomSyncedValueBase::LocalBaseValue
IL_0006: ldnull
IL_0007: cgt.un
IL_0009: ret

// System.Boolean ServerSync.ConfigSync/<>c::<sendZPackage>b__57_0(ZNetPeer)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.Boolean ZNetPeer::IsReady()
IL_0006: ret

// System.Boolean ServerSync.ConfigSync/<>c::<sendZPackage>b__57_2(System.Collections.Generic.IEnumerator`1<System.Boolean>)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0006: ldc.i4.0
IL_0007: ceq
IL_0009: ret

// System.Boolean ServerSync.ConfigSync/<>c::<sendZPackage>b__57_3(System.Collections.Generic.IEnumerator`1<System.Boolean>)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0006: ldc.i4.0
IL_0007: ceq
IL_0009: ret

// System.Boolean ServerSync.ConfigSync/<>c::<ConfigsToPackage>b__69_0(BepInEx.Configuration.ConfigEntryBase)
.locals 
IL_0000: ldarg.1
IL_0001: call ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::configData(BepInEx.Configuration.ConfigEntryBase)
IL_0006: ldfld System.Boolean ServerSync.OwnConfigEntryBase::SynchronizedConfig
IL_000b: ret

// System.Void ServerSync.ConfigSync/<>c__DisplayClass34_0`1::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Void ServerSync.ConfigSync/<>c__DisplayClass34_0`1::<AddConfigEntry>b__0(System.Object,System.EventArgs)
.locals System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Boolean ServerSync.ConfigSync::ProcessingServerUpdate
IL_0006: brtrue.s IL_0015
IL_0008: ldarg.0
IL_0009: ldfld ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::syncedEntry
IL_000e: ldfld System.Boolean ServerSync.OwnConfigEntryBase::SynchronizedConfig
IL_0013: br.s IL_0016
IL_0015: ldc.i4.0
IL_0016: stloc.0
IL_0017: ldloc.0
IL_0018: brfalse.s IL_0039
IL_001a: nop
IL_001b: ldarg.0
IL_001c: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::<>4__this
IL_0021: ldc.i4.0
IL_0022: conv.i8
IL_0023: ldc.i4.1
IL_0024: newarr BepInEx.Configuration.ConfigEntryBase
IL_0029: dup
IL_002a: ldc.i4.0
IL_002b: ldarg.0
IL_002c: ldfld BepInEx.Configuration.ConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::configEntry
IL_0031: stelem.ref
IL_0032: call System.Void ServerSync.ConfigSync::Broadcast(System.Int64,BepInEx.Configuration.ConfigEntryBase[])
IL_0037: nop
IL_0038: nop
IL_0039: ret

// System.Void ServerSync.ConfigSync/<>c__DisplayClass36_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Void ServerSync.ConfigSync/<>c__DisplayClass36_0::<AddCustomValue>b__1()
.locals System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Boolean ServerSync.ConfigSync::ProcessingServerUpdate
IL_0006: ldc.i4.0
IL_0007: ceq
IL_0009: stloc.0
IL_000a: ldloc.0
IL_000b: brfalse.s IL_002c
IL_000d: nop
IL_000e: ldarg.0
IL_000f: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/<>c__DisplayClass36_0::<>4__this
IL_0014: ldc.i4.0
IL_0015: conv.i8
IL_0016: ldc.i4.1
IL_0017: newarr ServerSync.CustomSyncedValueBase
IL_001c: dup
IL_001d: ldc.i4.0
IL_001e: ldarg.0
IL_001f: ldfld ServerSync.CustomSyncedValueBase ServerSync.ConfigSync/<>c__DisplayClass36_0::customValue
IL_0024: stelem.ref
IL_0025: call System.Void ServerSync.ConfigSync::Broadcast(System.Int64,ServerSync.CustomSyncedValueBase[])
IL_002a: nop
IL_002b: nop
IL_002c: ret

// System.Void ServerSync.ConfigSync/<>c__DisplayClass51_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Boolean ServerSync.ConfigSync/<>c__DisplayClass51_0::<isWritableConfig>b__0(ServerSync.ConfigSync)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase> ServerSync.ConfigSync::allConfigs
IL_0006: ldarg.0
IL_0007: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync/<>c__DisplayClass51_0::config
IL_000c: callvirt System.Boolean System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase>::Contains(!0)
IL_0011: ret

// System.Void ServerSync.ConfigSync/<>c__DisplayClass55_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Collections.Generic.IEnumerable`1<System.Boolean> ServerSync.ConfigSync/<>c__DisplayClass55_0::<distributeConfigToPeers>g__waitForQueue|0()
.locals ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d, System.Collections.Generic.IEnumerable`1<System.Boolean>
IL_0000: ldc.i4.s -2
IL_0002: newobj System.Void ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::.ctor(System.Int32)
IL_0007: stloc.0
IL_0008: ldloc.0
IL_0009: ldarg.0
IL_000a: stfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>4__this
IL_000f: ldloc.0
IL_0010: stloc.1
IL_0011: ldloc.1
IL_0012: ret

// System.Void ServerSync.ConfigSync/<>c__DisplayClass55_0::<distributeConfigToPeers>g__SendPackage|1(ZPackage)
.locals System.String, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/<>c__DisplayClass55_0::<>4__this
IL_0007: ldfld System.String ServerSync.ConfigSync::Name
IL_000c: ldstr " ConfigSync"
IL_0011: call System.String System.String::Concat(System.String,System.String)
IL_0016: stloc.0
IL_0017: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_001c: stloc.1
IL_001d: ldloc.1
IL_001e: brfalse.s IL_0040
IL_0020: nop
IL_0021: ldarg.0
IL_0022: ldfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_0027: ldfld ZRpc ZNetPeer::m_rpc
IL_002c: ldloc.0
IL_002d: ldc.i4.1
IL_002e: newarr System.Object
IL_0033: dup
IL_0034: ldc.i4.0
IL_0035: ldarg.1
IL_0036: stelem.ref
IL_0037: callvirt System.Void ZRpc::Invoke(System.String,System.Object[])
IL_003c: nop
IL_003d: nop
IL_003e: br.s IL_0075
IL_0040: nop
IL_0041: ldarg.0
IL_0042: ldfld ZRoutedRpc ServerSync.ConfigSync/<>c__DisplayClass55_0::rpc
IL_0047: ldarg.0
IL_0048: ldfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_004d: ldfld System.Boolean ZNetPeer::m_server
IL_0052: brtrue.s IL_0061
IL_0054: ldarg.0
IL_0055: ldfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_005a: ldfld System.Int64 ZNetPeer::m_uid
IL_005f: br.s IL_0063
IL_0061: ldc.i4.0
IL_0062: conv.i8
IL_0063: ldloc.0
IL_0064: ldc.i4.1
IL_0065: newarr System.Object
IL_006a: dup
IL_006b: ldc.i4.0
IL_006c: ldarg.1
IL_006d: stelem.ref
IL_006e: callvirt System.Void ZRoutedRpc::InvokeRoutedRPC(System.Int64,System.String,System.Object[])
IL_0073: nop
IL_0074: nop
IL_0075: ret

// System.Void ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::.ctor(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldarg.1
IL_0009: stfld System.Int32 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>1__state
IL_000e: ldarg.0
IL_000f: call System.Int32 System.Environment::get_CurrentManagedThreadId()
IL_0014: stfld System.Int32 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>l__initialThreadId
IL_0019: ret

// System.Void ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::System.IDisposable.Dispose()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.s -2
IL_0003: stfld System.Int32 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>1__state
IL_0008: ret

// System.Boolean ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::MoveNext()
.locals System.Int32, System.Boolean, System.Boolean
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>1__state
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: brfalse.s IL_0012
IL_000a: br.s IL_000c
IL_000c: ldloc.0
IL_000d: ldc.i4.1
IL_000e: beq.s IL_0014
IL_0010: br.s IL_0019
IL_0012: br.s IL_001b
IL_0014: br IL_00c3
IL_0019: ldc.i4.0
IL_001a: ret
IL_001b: ldarg.0
IL_001c: ldc.i4.m1
IL_001d: stfld System.Int32 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>1__state
IL_0022: nop
IL_0023: ldarg.0
IL_0024: call System.Single UnityEngine.Time::get_time()
IL_0029: ldc.r4 30
IL_002e: add
IL_002f: stfld System.Single ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<timeout>5__1
IL_0034: br IL_00cb
IL_0039: nop
IL_003a: call System.Single UnityEngine.Time::get_time()
IL_003f: ldarg.0
IL_0040: ldfld System.Single ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<timeout>5__1
IL_0045: cgt
IL_0047: stloc.1
IL_0048: ldloc.1
IL_0049: brfalse.s IL_00b3
IL_004b: nop
IL_004c: ldstr "Disconnecting {0} after 30 seconds config sending timeout"
IL_0051: ldarg.0
IL_0052: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>4__this
IL_0057: ldfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_005c: ldfld System.Int64 ZNetPeer::m_uid
IL_0061: box System.Int64
IL_0066: call System.String System.String::Format(System.String,System.Object)
IL_006b: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0070: nop
IL_0071: ldarg.0
IL_0072: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>4__this
IL_0077: ldfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_007c: ldfld ZRpc ZNetPeer::m_rpc
IL_0081: ldstr "Error"
IL_0086: ldc.i4.1
IL_0087: newarr System.Object
IL_008c: dup
IL_008d: ldc.i4.0
IL_008e: ldc.i4.5
IL_008f: box ZNet/ConnectionStatus
IL_0094: stelem.ref
IL_0095: callvirt System.Void ZRpc::Invoke(System.String,System.Object[])
IL_009a: nop
IL_009b: call ZNet ZNet::get_instance()
IL_00a0: ldarg.0
IL_00a1: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>4__this
IL_00a6: ldfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_00ab: callvirt System.Void ZNet::Disconnect(ZNetPeer)
IL_00b0: nop
IL_00b1: ldc.i4.0
IL_00b2: ret
IL_00b3: ldarg.0
IL_00b4: ldc.i4.0
IL_00b5: stfld System.Boolean ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>2__current
IL_00ba: ldarg.0
IL_00bb: ldc.i4.1
IL_00bc: stfld System.Int32 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>1__state
IL_00c1: ldc.i4.1
IL_00c2: ret
IL_00c3: ldarg.0
IL_00c4: ldc.i4.m1
IL_00c5: stfld System.Int32 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>1__state
IL_00ca: nop
IL_00cb: ldarg.0
IL_00cc: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>4__this
IL_00d1: ldfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_00d6: ldfld ISocket ZNetPeer::m_socket
IL_00db: callvirt System.Int32 ISocket::GetSendQueueSize()
IL_00e0: ldc.i4 20000
IL_00e5: cgt
IL_00e7: stloc.2
IL_00e8: ldloc.2
IL_00e9: brtrue IL_0039
IL_00ee: ldc.i4.0
IL_00ef: ret

// System.Boolean ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::System.Collections.Generic.IEnumerator<System.Boolean>.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>2__current
IL_0006: ret

// System.Void ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::System.Collections.IEnumerator.Reset()
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Object ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::System.Collections.IEnumerator.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>2__current
IL_0006: box System.Boolean
IL_000b: ret

// System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::System.Collections.Generic.IEnumerable<System.Boolean>.GetEnumerator()
.locals ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>1__state
IL_0006: ldc.i4.s -2
IL_0008: bne.un.s IL_0022
IL_000a: ldarg.0
IL_000b: ldfld System.Int32 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>l__initialThreadId
IL_0010: call System.Int32 System.Environment::get_CurrentManagedThreadId()
IL_0015: bne.un.s IL_0022
IL_0017: ldarg.0
IL_0018: ldc.i4.0
IL_0019: stfld System.Int32 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>1__state
IL_001e: ldarg.0
IL_001f: stloc.0
IL_0020: br.s IL_0035
IL_0022: ldc.i4.0
IL_0023: newobj System.Void ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::.ctor(System.Int32)
IL_0028: stloc.0
IL_0029: ldloc.0
IL_002a: ldarg.0
IL_002b: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>4__this
IL_0030: stfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>4__this
IL_0035: ldloc.0
IL_0036: ret

// System.Collections.IEnumerator ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::System.Collections.IEnumerable.GetEnumerator()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::System.Collections.Generic.IEnumerable<System.Boolean>.GetEnumerator()
IL_0006: ret

// System.Void ServerSync.ConfigSync/<>c__DisplayClass56_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Boolean ServerSync.ConfigSync/<>c__DisplayClass56_0::<sendZPackage>b__0(ZNetPeer)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.Int64 ZNetPeer::m_uid
IL_0006: ldarg.0
IL_0007: ldfld System.Int64 ServerSync.ConfigSync/<>c__DisplayClass56_0::target
IL_000c: ceq
IL_000e: ret

// System.Void ServerSync.ConfigSync/<>c__DisplayClass57_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<>c__DisplayClass57_0::<sendZPackage>b__1(ZNetPeer)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/<>c__DisplayClass57_0::<>4__this
IL_0006: ldarg.1
IL_0007: ldarg.0
IL_0008: ldfld ZPackage ServerSync.ConfigSync/<>c__DisplayClass57_0::package
IL_000d: call System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync::distributeConfigToPeers(ZNetPeer,ZPackage)
IL_0012: ret

// System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::.ctor(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldarg.1
IL_0009: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_000e: ret

// System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::System.IDisposable.Dispose()
.locals System.Int32
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: ldc.i4.s -3
IL_000a: bgt.s IL_001a
IL_000c: ldloc.0
IL_000d: ldc.i4.s -4
IL_000f: beq.s IL_0032
IL_0011: br.s IL_0013
IL_0013: ldloc.0
IL_0014: ldc.i4.s -3
IL_0016: beq.s IL_0026
IL_0018: br.s IL_003e
IL_001a: ldloc.0
IL_001b: ldc.i4.1
IL_001c: beq.s IL_0026
IL_001e: br.s IL_0020
IL_0020: ldloc.0
IL_0021: ldc.i4.3
IL_0022: beq.s IL_0032
IL_0024: br.s IL_003e
IL_0026: nop
IL_0027: leave.s IL_0030
IL_0029: ldarg.0
IL_002a: call System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>m__Finally1()
IL_002f: endfinally
IL_0030: br.s IL_003e
IL_0032: nop
IL_0033: leave.s IL_003c
IL_0035: ldarg.0
IL_0036: call System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>m__Finally2()
IL_003b: endfinally
IL_003c: br.s IL_003e
IL_003e: ldarg.0
IL_003f: ldnull
IL_0040: stfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_0045: ldarg.0
IL_0046: ldnull
IL_0047: stfld System.Byte[] ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<data>5__2
IL_004c: ldarg.0
IL_004d: ldnull
IL_004e: stfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_0053: ldarg.0
IL_0054: ldnull
IL_0055: stfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__7
IL_005a: ldarg.0
IL_005b: ldnull
IL_005c: stfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__9
IL_0061: ldarg.0
IL_0062: ldc.i4.s -2
IL_0064: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0069: ret
// EH Finally: 39 - 41 => 41 - 48
// EH Finally: 51 - 53 => 53 - 60

// System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::MoveNext()
.locals System.Boolean, System.Int32, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Int32, System.Boolean
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0006: stloc.1
IL_0007: ldloc.1
IL_0008: switch IL_001f,IL_0021,IL_0026,IL_002b
IL_001d: br.s IL_0030
IL_001f: br.s IL_0037
IL_0021: br IL_0159
IL_0026: br IL_0264
IL_002b: br IL_02ee
IL_0030: ldc.i4.0
IL_0031: stloc.0
IL_0032: leave IL_0331
IL_0037: ldarg.0
IL_0038: ldc.i4.m1
IL_0039: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_003e: ldarg.0
IL_003f: newobj System.Void ServerSync.ConfigSync/<>c__DisplayClass55_0::.ctor()
IL_0044: stfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_0049: ldarg.0
IL_004a: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_004f: ldarg.0
IL_0050: ldfld ZNetPeer ServerSync.ConfigSync/<distributeConfigToPeers>d__55::peer
IL_0055: stfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_005a: ldarg.0
IL_005b: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_0060: ldarg.0
IL_0061: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>4__this
IL_0066: stfld ServerSync.ConfigSync ServerSync.ConfigSync/<>c__DisplayClass55_0::<>4__this
IL_006b: nop
IL_006c: ldarg.0
IL_006d: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_0072: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_0077: stfld ZRoutedRpc ServerSync.ConfigSync/<>c__DisplayClass55_0::rpc
IL_007c: ldarg.0
IL_007d: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_0082: ldfld ZRoutedRpc ServerSync.ConfigSync/<>c__DisplayClass55_0::rpc
IL_0087: ldnull
IL_0088: cgt.un
IL_008a: ldc.i4.0
IL_008b: ceq
IL_008d: stloc.2
IL_008e: ldloc.2
IL_008f: brfalse.s IL_0099
IL_0091: nop
IL_0092: ldc.i4.0
IL_0093: stloc.0
IL_0094: leave IL_0331
IL_0099: nop
IL_009a: nop
IL_009b: ldarg.0
IL_009c: ldarg.0
IL_009d: ldfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::package
IL_00a2: callvirt System.Byte[] ZPackage::GetArray()
IL_00a7: stfld System.Byte[] ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<data>5__2
IL_00ac: ldarg.0
IL_00ad: ldfld System.Byte[] ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<data>5__2
IL_00b2: brfalse.s IL_00c6
IL_00b4: ldarg.0
IL_00b5: ldfld System.Byte[] ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<data>5__2
IL_00ba: ldlen
IL_00bb: conv.i8
IL_00bc: ldc.i4 250000
IL_00c1: conv.i8
IL_00c2: cgt
IL_00c4: br.s IL_00c7
IL_00c6: ldc.i4.0
IL_00c7: stloc.3
IL_00c8: ldloc.3
IL_00c9: brfalse IL_02a3
IL_00ce: nop
IL_00cf: ldarg.0
IL_00d0: ldc.i4.1
IL_00d1: conv.i8
IL_00d2: ldarg.0
IL_00d3: ldfld System.Byte[] ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<data>5__2
IL_00d8: ldlen
IL_00d9: conv.i8
IL_00da: ldc.i4.1
IL_00db: conv.i8
IL_00dc: sub
IL_00dd: ldc.i4 250000
IL_00e2: conv.i8
IL_00e3: div
IL_00e4: add
IL_00e5: conv.i4
IL_00e6: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragments>5__3
IL_00eb: ldarg.0
IL_00ec: ldsfld System.Int64 ServerSync.ConfigSync::packageCounter
IL_00f1: ldc.i4.1
IL_00f2: conv.i8
IL_00f3: add
IL_00f4: dup
IL_00f5: stsfld System.Int64 ServerSync.ConfigSync::packageCounter
IL_00fa: stfld System.Int64 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<packageIdentifier>5__4
IL_00ff: ldarg.0
IL_0100: ldc.i4.0
IL_0101: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragment>5__5
IL_0106: br IL_0286
IL_010b: nop
IL_010c: nop
IL_010d: ldarg.0
IL_010e: ldarg.0
IL_010f: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_0114: callvirt System.Collections.Generic.IEnumerable`1<System.Boolean> ServerSync.ConfigSync/<>c__DisplayClass55_0::<distributeConfigToPeers>g__waitForQueue|0()
IL_0119: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.Boolean>::GetEnumerator()
IL_011e: stfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__7
IL_0123: ldarg.0
IL_0124: ldc.i4.s -3
IL_0126: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_012b: br.s IL_0162
IL_012d: ldarg.0
IL_012e: ldarg.0
IL_012f: ldfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__7
IL_0134: callvirt !0 System.Collections.Generic.IEnumerator`1<System.Boolean>::get_Current()
IL_0139: stfld System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<wait>5__8
IL_013e: nop
IL_013f: ldarg.0
IL_0140: ldarg.0
IL_0141: ldfld System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<wait>5__8
IL_0146: stfld System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>2__current
IL_014b: ldarg.0
IL_014c: ldc.i4.1
IL_014d: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0152: ldc.i4.1
IL_0153: stloc.0
IL_0154: leave IL_0331
IL_0159: ldarg.0
IL_015a: ldc.i4.s -3
IL_015c: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0161: nop
IL_0162: ldarg.0
IL_0163: ldfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__7
IL_0168: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_016d: brtrue.s IL_012d
IL_016f: ldarg.0
IL_0170: call System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>m__Finally1()
IL_0175: nop
IL_0176: ldarg.0
IL_0177: ldnull
IL_0178: stfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__7
IL_017d: ldarg.0
IL_017e: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_0183: ldfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_0188: ldfld ISocket ZNetPeer::m_socket
IL_018d: callvirt System.Boolean ISocket::IsConnected()
IL_0192: ldc.i4.0
IL_0193: ceq
IL_0195: stloc.s V_4
IL_0197: ldloc.s V_4
IL_0199: brfalse.s IL_01a3
IL_019b: nop
IL_019c: ldc.i4.0
IL_019d: stloc.0
IL_019e: leave IL_0331
IL_01a3: ldarg.0
IL_01a4: newobj System.Void ZPackage::.ctor()
IL_01a9: stfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_01ae: ldarg.0
IL_01af: ldfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_01b4: ldc.i4.2
IL_01b5: callvirt System.Void ZPackage::Write(System.Byte)
IL_01ba: nop
IL_01bb: ldarg.0
IL_01bc: ldfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_01c1: ldarg.0
IL_01c2: ldfld System.Int64 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<packageIdentifier>5__4
IL_01c7: callvirt System.Void ZPackage::Write(System.Int64)
IL_01cc: nop
IL_01cd: ldarg.0
IL_01ce: ldfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_01d3: ldarg.0
IL_01d4: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragment>5__5
IL_01d9: callvirt System.Void ZPackage::Write(System.Int32)
IL_01de: nop
IL_01df: ldarg.0
IL_01e0: ldfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_01e5: ldarg.0
IL_01e6: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragments>5__3
IL_01eb: callvirt System.Void ZPackage::Write(System.Int32)
IL_01f0: nop
IL_01f1: ldarg.0
IL_01f2: ldfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_01f7: ldarg.0
IL_01f8: ldfld System.Byte[] ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<data>5__2
IL_01fd: ldc.i4 250000
IL_0202: ldarg.0
IL_0203: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragment>5__5
IL_0208: mul
IL_0209: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Skip<System.Byte>(System.Collections.Generic.IEnumerable`1<!!0>,System.Int32)
IL_020e: ldc.i4 250000
IL_0213: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Take<System.Byte>(System.Collections.Generic.IEnumerable`1<!!0>,System.Int32)
IL_0218: call !!0[] System.Linq.Enumerable::ToArray<System.Byte>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_021d: callvirt System.Void ZPackage::Write(System.Byte[])
IL_0222: nop
IL_0223: ldarg.0
IL_0224: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_0229: ldarg.0
IL_022a: ldfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_022f: callvirt System.Void ServerSync.ConfigSync/<>c__DisplayClass55_0::<distributeConfigToPeers>g__SendPackage|1(ZPackage)
IL_0234: nop
IL_0235: ldarg.0
IL_0236: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragment>5__5
IL_023b: ldarg.0
IL_023c: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragments>5__3
IL_0241: ldc.i4.1
IL_0242: sub
IL_0243: ceq
IL_0245: ldc.i4.0
IL_0246: ceq
IL_0248: stloc.s V_5
IL_024a: ldloc.s V_5
IL_024c: brfalse.s IL_026c
IL_024e: nop
IL_024f: ldarg.0
IL_0250: ldc.i4.1
IL_0251: stfld System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>2__current
IL_0256: ldarg.0
IL_0257: ldc.i4.2
IL_0258: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_025d: ldc.i4.1
IL_025e: stloc.0
IL_025f: leave IL_0331
IL_0264: ldarg.0
IL_0265: ldc.i4.m1
IL_0266: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_026b: nop
IL_026c: nop
IL_026d: ldarg.0
IL_026e: ldnull
IL_026f: stfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_0274: ldarg.0
IL_0275: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragment>5__5
IL_027a: ldc.i4.1
IL_027b: add
IL_027c: stloc.s V_6
IL_027e: ldarg.0
IL_027f: ldloc.s V_6
IL_0281: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragment>5__5
IL_0286: ldarg.0
IL_0287: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragment>5__5
IL_028c: ldarg.0
IL_028d: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragments>5__3
IL_0292: clt
IL_0294: stloc.s V_7
IL_0296: ldloc.s V_7
IL_0298: brtrue IL_010b
IL_029d: nop
IL_029e: br IL_0325
IL_02a3: nop
IL_02a4: nop
IL_02a5: ldarg.0
IL_02a6: ldarg.0
IL_02a7: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_02ac: callvirt System.Collections.Generic.IEnumerable`1<System.Boolean> ServerSync.ConfigSync/<>c__DisplayClass55_0::<distributeConfigToPeers>g__waitForQueue|0()
IL_02b1: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.Boolean>::GetEnumerator()
IL_02b6: stfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__9
IL_02bb: ldarg.0
IL_02bc: ldc.i4.s -4
IL_02be: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_02c3: br.s IL_02f7
IL_02c5: ldarg.0
IL_02c6: ldarg.0
IL_02c7: ldfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__9
IL_02cc: callvirt !0 System.Collections.Generic.IEnumerator`1<System.Boolean>::get_Current()
IL_02d1: stfld System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<wait>5__10
IL_02d6: nop
IL_02d7: ldarg.0
IL_02d8: ldarg.0
IL_02d9: ldfld System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<wait>5__10
IL_02de: stfld System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>2__current
IL_02e3: ldarg.0
IL_02e4: ldc.i4.3
IL_02e5: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_02ea: ldc.i4.1
IL_02eb: stloc.0
IL_02ec: leave.s IL_0331
IL_02ee: ldarg.0
IL_02ef: ldc.i4.s -4
IL_02f1: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_02f6: nop
IL_02f7: ldarg.0
IL_02f8: ldfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__9
IL_02fd: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0302: brtrue.s IL_02c5
IL_0304: ldarg.0
IL_0305: call System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>m__Finally2()
IL_030a: nop
IL_030b: ldarg.0
IL_030c: ldnull
IL_030d: stfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__9
IL_0312: ldarg.0
IL_0313: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_0318: ldarg.0
IL_0319: ldfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::package
IL_031e: callvirt System.Void ServerSync.ConfigSync/<>c__DisplayClass55_0::<distributeConfigToPeers>g__SendPackage|1(ZPackage)
IL_0323: nop
IL_0324: nop
IL_0325: ldc.i4.0
IL_0326: stloc.0
IL_0327: leave.s IL_0331
IL_0329: ldarg.0
IL_032a: call System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::System.IDisposable.Dispose()
IL_032f: nop
IL_0330: endfinally
IL_0331: ldloc.0
IL_0332: ret
// EH Fault: 0 - 809 => 809 - 817

// System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>m__Finally1()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.m1
IL_0002: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0007: ldarg.0
IL_0008: ldfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__7
IL_000d: brfalse.s IL_001b
IL_000f: ldarg.0
IL_0010: ldfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__7
IL_0015: callvirt System.Void System.IDisposable::Dispose()
IL_001a: nop
IL_001b: ret

// System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>m__Finally2()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.m1
IL_0002: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0007: ldarg.0
IL_0008: ldfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__9
IL_000d: brfalse.s IL_001b
IL_000f: ldarg.0
IL_0010: ldfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__9
IL_0015: callvirt System.Void System.IDisposable::Dispose()
IL_001a: nop
IL_001b: ret

// System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::System.Collections.Generic.IEnumerator<System.Boolean>.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>2__current
IL_0006: ret

// System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::System.Collections.IEnumerator.Reset()
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Object ServerSync.ConfigSync/<distributeConfigToPeers>d__55::System.Collections.IEnumerator.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>2__current
IL_0006: box System.Boolean
IL_000b: ret

// System.Void ServerSync.ConfigSync/<sendZPackage>d__57::.ctor(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldarg.1
IL_0009: stfld System.Int32 ServerSync.ConfigSync/<sendZPackage>d__57::<>1__state
IL_000e: ret

// System.Void ServerSync.ConfigSync/<sendZPackage>d__57::System.IDisposable.Dispose()
.locals 
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: stfld ServerSync.ConfigSync/<>c__DisplayClass57_0 ServerSync.ConfigSync/<sendZPackage>d__57::<>8__1
IL_0007: ldarg.0
IL_0008: ldnull
IL_0009: stfld System.Byte[] ServerSync.ConfigSync/<sendZPackage>d__57::<rawData>5__2
IL_000e: ldarg.0
IL_000f: ldnull
IL_0010: stfld System.Collections.Generic.List`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<sendZPackage>d__57::<writers>5__3
IL_0015: ldarg.0
IL_0016: ldnull
IL_0017: stfld ZPackage ServerSync.ConfigSync/<sendZPackage>d__57::<compressedPackage>5__4
IL_001c: ldarg.0
IL_001d: ldnull
IL_001e: stfld System.IO.MemoryStream ServerSync.ConfigSync/<sendZPackage>d__57::<output>5__5
IL_0023: ldarg.0
IL_0024: ldnull
IL_0025: stfld System.IO.Compression.DeflateStream ServerSync.ConfigSync/<sendZPackage>d__57::<deflateStream>5__6
IL_002a: ldarg.0
IL_002b: ldc.i4.s -2
IL_002d: stfld System.Int32 ServerSync.ConfigSync/<sendZPackage>d__57::<>1__state
IL_0032: ret

// System.Boolean ServerSync.ConfigSync/<sendZPackage>d__57::MoveNext()
.locals System.Int32, System.Boolean, System.Boolean, System.Boolean
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 ServerSync.ConfigSync/<sendZPackage>d__57::<>1__state
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: brfalse.s IL_0012
IL_000a: br.s IL_000c
IL_000c: ldloc.0
IL_000d: ldc.i4.1
IL_000e: beq.s IL_0014
IL_0010: br.s IL_0019
IL_0012: br.s IL_001b
IL_0014: br IL_01cd
IL_0019: ldc.i4.0
IL_001a: ret
IL_001b: ldarg.0
IL_001c: ldc.i4.m1
IL_001d: stfld System.Int32 ServerSync.ConfigSync/<sendZPackage>d__57::<>1__state
IL_0022: ldarg.0
IL_0023: newobj System.Void ServerSync.ConfigSync/<>c__DisplayClass57_0::.ctor()
IL_0028: stfld ServerSync.ConfigSync/<>c__DisplayClass57_0 ServerSync.ConfigSync/<sendZPackage>d__57::<>8__1
IL_002d: ldarg.0
IL_002e: ldfld ServerSync.ConfigSync/<>c__DisplayClass57_0 ServerSync.ConfigSync/<sendZPackage>d__57::<>8__1
IL_0033: ldarg.0
IL_0034: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/<sendZPackage>d__57::<>4__this
IL_0039: stfld ServerSync.ConfigSync ServerSync.ConfigSync/<>c__DisplayClass57_0::<>4__this
IL_003e: ldarg.0
IL_003f: ldfld ServerSync.ConfigSync/<>c__DisplayClass57_0 ServerSync.ConfigSync/<sendZPackage>d__57::<>8__1
IL_0044: ldarg.0
IL_0045: ldfld ZPackage ServerSync.ConfigSync/<sendZPackage>d__57::package
IL_004a: stfld ZPackage ServerSync.ConfigSync/<>c__DisplayClass57_0::package
IL_004f: nop
IL_0050: call ZNet ZNet::get_instance()
IL_0055: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_005a: ldc.i4.0
IL_005b: ceq
IL_005d: stloc.1
IL_005e: ldloc.1
IL_005f: brfalse.s IL_0064
IL_0061: nop
IL_0062: ldc.i4.0
IL_0063: ret
IL_0064: ldarg.0
IL_0065: ldarg.0
IL_0066: ldfld ServerSync.ConfigSync/<>c__DisplayClass57_0 ServerSync.ConfigSync/<sendZPackage>d__57::<>8__1
IL_006b: ldfld ZPackage ServerSync.ConfigSync/<>c__DisplayClass57_0::package
IL_0070: callvirt System.Byte[] ZPackage::GetArray()
IL_0075: stfld System.Byte[] ServerSync.ConfigSync/<sendZPackage>d__57::<rawData>5__2
IL_007a: ldarg.0
IL_007b: ldfld System.Byte[] ServerSync.ConfigSync/<sendZPackage>d__57::<rawData>5__2
IL_0080: brfalse.s IL_0094
IL_0082: ldarg.0
IL_0083: ldfld System.Byte[] ServerSync.ConfigSync/<sendZPackage>d__57::<rawData>5__2
IL_0088: ldlen
IL_0089: conv.i8
IL_008a: ldc.i4 10000
IL_008f: conv.i8
IL_0090: cgt
IL_0092: br.s IL_0095
IL_0094: ldc.i4.0
IL_0095: stloc.2
IL_0096: ldloc.2
IL_0097: brfalse IL_0144
IL_009c: nop
IL_009d: ldarg.0
IL_009e: newobj System.Void ZPackage::.ctor()
IL_00a3: stfld ZPackage ServerSync.ConfigSync/<sendZPackage>d__57::<compressedPackage>5__4
IL_00a8: ldarg.0
IL_00a9: ldfld ZPackage ServerSync.ConfigSync/<sendZPackage>d__57::<compressedPackage>5__4
IL_00ae: ldc.i4.4
IL_00af: callvirt System.Void ZPackage::Write(System.Byte)
IL_00b4: nop
IL_00b5: ldarg.0
IL_00b6: newobj System.Void System.IO.MemoryStream::.ctor()
IL_00bb: stfld System.IO.MemoryStream ServerSync.ConfigSync/<sendZPackage>d__57::<output>5__5
IL_00c0: ldarg.0
IL_00c1: ldarg.0
IL_00c2: ldfld System.IO.MemoryStream ServerSync.ConfigSync/<sendZPackage>d__57::<output>5__5
IL_00c7: ldc.i4.0
IL_00c8: newobj System.Void System.IO.Compression.DeflateStream::.ctor(System.IO.Stream,System.IO.Compression.CompressionLevel)
IL_00cd: stfld System.IO.Compression.DeflateStream ServerSync.ConfigSync/<sendZPackage>d__57::<deflateStream>5__6
IL_00d2: nop
IL_00d3: ldarg.0
IL_00d4: ldfld System.IO.Compression.DeflateStream ServerSync.ConfigSync/<sendZPackage>d__57::<deflateStream>5__6
IL_00d9: ldarg.0
IL_00da: ldfld System.Byte[] ServerSync.ConfigSync/<sendZPackage>d__57::<rawData>5__2
IL_00df: ldc.i4.0
IL_00e0: ldarg.0
IL_00e1: ldfld System.Byte[] ServerSync.ConfigSync/<sendZPackage>d__57::<rawData>5__2
IL_00e6: ldlen
IL_00e7: conv.i4
IL_00e8: callvirt System.Void System.IO.Stream::Write(System.Byte[],System.Int32,System.Int32)
IL_00ed: nop
IL_00ee: nop
IL_00ef: leave.s IL_0106
IL_00f1: ldarg.0
IL_00f2: ldfld System.IO.Compression.DeflateStream ServerSync.ConfigSync/<sendZPackage>d__57::<deflateStream>5__6
IL_00f7: brfalse.s IL_0105
IL_00f9: ldarg.0
IL_00fa: ldfld System.IO.Compression.DeflateStream ServerSync.ConfigSync/<sendZPackage>d__57::<deflateStream>5__6
IL_00ff: callvirt System.Void System.IDisposable::Dispose()
IL_0104: nop
IL_0105: endfinally
IL_0106: ldarg.0
IL_0107: ldnull
IL_0108: stfld System.IO.Compression.DeflateStream ServerSync.ConfigSync/<sendZPackage>d__57::<deflateStream>5__6
IL_010d: ldarg.0
IL_010e: ldfld ZPackage ServerSync.ConfigSync/<sendZPackage>d__57::<compressedPackage>5__4
IL_0113: ldarg.0
IL_0114: ldfld System.IO.MemoryStream ServerSync.ConfigSync/<sendZPackage>d__57::<output>5__5
IL_0119: callvirt System.Byte[] System.IO.MemoryStream::ToArray()
IL_011e: callvirt System.Void ZPackage::Write(System.Byte[])
IL_0123: nop
IL_0124: ldarg.0
IL_0125: ldfld ServerSync.ConfigSync/<>c__DisplayClass57_0 ServerSync.ConfigSync/<sendZPackage>d__57::<>8__1
IL_012a: ldarg.0
IL_012b: ldfld ZPackage ServerSync.ConfigSync/<sendZPackage>d__57::<compressedPackage>5__4
IL_0130: stfld ZPackage ServerSync.ConfigSync/<>c__DisplayClass57_0::package
IL_0135: nop
IL_0136: ldarg.0
IL_0137: ldnull
IL_0138: stfld ZPackage ServerSync.ConfigSync/<sendZPackage>d__57::<compressedPackage>5__4
IL_013d: ldarg.0
IL_013e: ldnull
IL_013f: stfld System.IO.MemoryStream ServerSync.ConfigSync/<sendZPackage>d__57::<output>5__5
IL_0144: ldarg.0
IL_0145: ldarg.0
IL_0146: ldfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/<sendZPackage>d__57::peers
IL_014b: ldsfld System.Func`2<ZNetPeer,System.Boolean> ServerSync.ConfigSync/<>c::<>9__57_0
IL_0150: dup
IL_0151: brtrue.s IL_016a
IL_0153: pop
IL_0154: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_0159: ldftn System.Boolean ServerSync.ConfigSync/<>c::<sendZPackage>b__57_0(ZNetPeer)
IL_015f: newobj System.Void System.Func`2<ZNetPeer,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0164: dup
IL_0165: stsfld System.Func`2<ZNetPeer,System.Boolean> ServerSync.ConfigSync/<>c::<>9__57_0
IL_016a: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ZNetPeer>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_016f: ldarg.0
IL_0170: ldfld ServerSync.ConfigSync/<>c__DisplayClass57_0 ServerSync.ConfigSync/<sendZPackage>d__57::<>8__1
IL_0175: ldftn System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<>c__DisplayClass57_0::<sendZPackage>b__1(ZNetPeer)
IL_017b: newobj System.Void System.Func`2<ZNetPeer,System.Collections.Generic.IEnumerator`1<System.Boolean>>::.ctor(System.Object,System.IntPtr)
IL_0180: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::Select<ZNetPeer,System.Collections.Generic.IEnumerator`1<System.Boolean>>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0185: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.Collections.Generic.IEnumerator`1<System.Boolean>>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_018a: stfld System.Collections.Generic.List`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<sendZPackage>d__57::<writers>5__3
IL_018f: ldarg.0
IL_0190: ldfld System.Collections.Generic.List`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<sendZPackage>d__57::<writers>5__3
IL_0195: ldsfld System.Predicate`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<>c::<>9__57_2
IL_019a: dup
IL_019b: brtrue.s IL_01b4
IL_019d: pop
IL_019e: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_01a3: ldftn System.Boolean ServerSync.ConfigSync/<>c::<sendZPackage>b__57_2(System.Collections.Generic.IEnumerator`1<System.Boolean>)
IL_01a9: newobj System.Void System.Predicate`1<System.Collections.Generic.IEnumerator`1<System.Boolean>>::.ctor(System.Object,System.IntPtr)
IL_01ae: dup
IL_01af: stsfld System.Predicate`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<>c::<>9__57_2
IL_01b4: callvirt System.Int32 System.Collections.Generic.List`1<System.Collections.Generic.IEnumerator`1<System.Boolean>>::RemoveAll(System.Predicate`1<!0>)
IL_01b9: pop
IL_01ba: br.s IL_0200
IL_01bc: nop
IL_01bd: ldarg.0
IL_01be: ldnull
IL_01bf: stfld System.Object ServerSync.ConfigSync/<sendZPackage>d__57::<>2__current
IL_01c4: ldarg.0
IL_01c5: ldc.i4.1
IL_01c6: stfld System.Int32 ServerSync.ConfigSync/<sendZPackage>d__57::<>1__state
IL_01cb: ldc.i4.1
IL_01cc: ret
IL_01cd: ldarg.0
IL_01ce: ldc.i4.m1
IL_01cf: stfld System.Int32 ServerSync.ConfigSync/<sendZPackage>d__57::<>1__state
IL_01d4: ldarg.0
IL_01d5: ldfld System.Collections.Generic.List`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<sendZPackage>d__57::<writers>5__3
IL_01da: ldsfld System.Predicate`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<>c::<>9__57_3
IL_01df: dup
IL_01e0: brtrue.s IL_01f9
IL_01e2: pop
IL_01e3: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_01e8: ldftn System.Boolean ServerSync.ConfigSync/<>c::<sendZPackage>b__57_3(System.Collections.Generic.IEnumerator`1<System.Boolean>)
IL_01ee: newobj System.Void System.Predicate`1<System.Collections.Generic.IEnumerator`1<System.Boolean>>::.ctor(System.Object,System.IntPtr)
IL_01f3: dup
IL_01f4: stsfld System.Predicate`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<>c::<>9__57_3
IL_01f9: callvirt System.Int32 System.Collections.Generic.List`1<System.Collections.Generic.IEnumerator`1<System.Boolean>>::RemoveAll(System.Predicate`1<!0>)
IL_01fe: pop
IL_01ff: nop
IL_0200: ldarg.0
IL_0201: ldfld System.Collections.Generic.List`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<sendZPackage>d__57::<writers>5__3
IL_0206: callvirt System.Int32 System.Collections.Generic.List`1<System.Collections.Generic.IEnumerator`1<System.Boolean>>::get_Count()
IL_020b: ldc.i4.0
IL_020c: cgt
IL_020e: stloc.3
IL_020f: ldloc.3
IL_0210: brtrue.s IL_01bc
IL_0212: ldc.i4.0
IL_0213: ret
// EH Finally: 210 - 241 => 241 - 262

// System.Object ServerSync.ConfigSync/<sendZPackage>d__57::System.Collections.Generic.IEnumerator<System.Object>.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Object ServerSync.ConfigSync/<sendZPackage>d__57::<>2__current
IL_0006: ret

// System.Void ServerSync.ConfigSync/<sendZPackage>d__57::System.Collections.IEnumerator.Reset()
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Object ServerSync.ConfigSync/<sendZPackage>d__57::System.Collections.IEnumerator.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Object ServerSync.ConfigSync/<sendZPackage>d__57::<>2__current
IL_0006: ret

// System.String ServerSync.VersionCheck::get_DisplayName()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.String ServerSync.VersionCheck::displayName
IL_0006: dup
IL_0007: brtrue.s IL_0010
IL_0009: pop
IL_000a: ldarg.0
IL_000b: ldfld System.String ServerSync.VersionCheck::Name
IL_0010: ret

// System.Void ServerSync.VersionCheck::set_DisplayName(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.String ServerSync.VersionCheck::displayName
IL_0007: ret

// System.String ServerSync.VersionCheck::get_CurrentVersion()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.String ServerSync.VersionCheck::currentVersion
IL_0006: dup
IL_0007: brtrue.s IL_000f
IL_0009: pop
IL_000a: ldstr "0.0.0"
IL_000f: ret

// System.Void ServerSync.VersionCheck::set_CurrentVersion(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.String ServerSync.VersionCheck::currentVersion
IL_0007: ret

// System.String ServerSync.VersionCheck::get_MinimumRequiredVersion()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.String ServerSync.VersionCheck::minimumRequiredVersion
IL_0006: dup
IL_0007: brtrue.s IL_001f
IL_0009: pop
IL_000a: ldarg.0
IL_000b: ldfld System.Boolean ServerSync.VersionCheck::ModRequired
IL_0010: brtrue.s IL_0019
IL_0012: ldstr "0.0.0"
IL_0017: br.s IL_001f
IL_0019: ldarg.0
IL_001a: call System.String ServerSync.VersionCheck::get_CurrentVersion()
IL_001f: ret

// System.Void ServerSync.VersionCheck::set_MinimumRequiredVersion(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.String ServerSync.VersionCheck::minimumRequiredVersion
IL_0007: ret

// System.Void ServerSync.VersionCheck::PatchServerSync()
.locals HarmonyLib.Harmony, System.Boolean, System.Collections.Generic.IEnumerator`1<System.Type>, System.Type
IL_0000: nop
IL_0001: ldtoken ZNet
IL_0006: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_000b: ldstr "Awake"
IL_0010: ldnull
IL_0011: ldnull
IL_0012: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_0017: call HarmonyLib.Patches HarmonyLib.PatchProcessor::GetPatchInfo(System.Reflection.MethodBase)
IL_001c: dup
IL_001d: brtrue.s IL_0023
IL_001f: pop
IL_0020: ldc.i4.0
IL_0021: br.s IL_004f
IL_0023: ldfld System.Collections.ObjectModel.ReadOnlyCollection`1<HarmonyLib.Patch> HarmonyLib.Patches::Postfixes
IL_0028: ldsfld System.Func`2<HarmonyLib.Patch,System.Boolean> ServerSync.VersionCheck/<>c::<>9__20_0
IL_002d: dup
IL_002e: brtrue.s IL_0047
IL_0030: pop
IL_0031: ldsfld ServerSync.VersionCheck/<>c ServerSync.VersionCheck/<>c::<>9
IL_0036: ldftn System.Boolean ServerSync.VersionCheck/<>c::<PatchServerSync>b__20_0(HarmonyLib.Patch)
IL_003c: newobj System.Void System.Func`2<HarmonyLib.Patch,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0041: dup
IL_0042: stsfld System.Func`2<HarmonyLib.Patch,System.Boolean> ServerSync.VersionCheck/<>c::<>9__20_0
IL_0047: call System.Int32 System.Linq.Enumerable::Count<HarmonyLib.Patch>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_004c: ldc.i4.0
IL_004d: cgt
IL_004f: stloc.1
IL_0050: ldloc.1
IL_0051: brfalse.s IL_0059
IL_0053: nop
IL_0054: br IL_00e0
IL_0059: ldstr "org.bepinex.helpers.ServerSync"
IL_005e: newobj System.Void HarmonyLib.Harmony::.ctor(System.String)
IL_0063: stloc.0
IL_0064: nop
IL_0065: ldtoken ServerSync.ConfigSync
IL_006a: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_006f: ldc.i4.s 32
IL_0071: callvirt System.Type[] System.Type::GetNestedTypes(System.Reflection.BindingFlags)
IL_0076: ldc.i4.1
IL_0077: newarr System.Type
IL_007c: dup
IL_007d: ldc.i4.0
IL_007e: ldtoken ServerSync.VersionCheck
IL_0083: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0088: stelem.ref
IL_0089: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Concat<System.Type>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_008e: ldsfld System.Func`2<System.Type,System.Boolean> ServerSync.VersionCheck/<>c::<>9__20_1
IL_0093: dup
IL_0094: brtrue.s IL_00ad
IL_0096: pop
IL_0097: ldsfld ServerSync.VersionCheck/<>c ServerSync.VersionCheck/<>c::<>9
IL_009c: ldftn System.Boolean ServerSync.VersionCheck/<>c::<PatchServerSync>b__20_1(System.Type)
IL_00a2: newobj System.Void System.Func`2<System.Type,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_00a7: dup
IL_00a8: stsfld System.Func`2<System.Type,System.Boolean> ServerSync.VersionCheck/<>c::<>9__20_1
IL_00ad: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<System.Type>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_00b2: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.Type>::GetEnumerator()
IL_00b7: stloc.2
IL_00b8: br.s IL_00cb
IL_00ba: ldloc.2
IL_00bb: callvirt !0 System.Collections.Generic.IEnumerator`1<System.Type>::get_Current()
IL_00c0: stloc.3
IL_00c1: nop
IL_00c2: ldloc.0
IL_00c3: ldloc.3
IL_00c4: callvirt System.Void HarmonyLib.Harmony::PatchAll(System.Type)
IL_00c9: nop
IL_00ca: nop
IL_00cb: ldloc.2
IL_00cc: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_00d1: brtrue.s IL_00ba
IL_00d3: leave.s IL_00e0
IL_00d5: ldloc.2
IL_00d6: brfalse.s IL_00df
IL_00d8: ldloc.2
IL_00d9: callvirt System.Void System.IDisposable::Dispose()
IL_00de: nop
IL_00df: endfinally
IL_00e0: ret
// EH Finally: 184 - 213 => 213 - 224

// System.Void ServerSync.VersionCheck::.cctor()
.locals 
IL_0000: newobj System.Void System.Collections.Generic.HashSet`1<ServerSync.VersionCheck>::.ctor()
IL_0005: stsfld System.Collections.Generic.HashSet`1<ServerSync.VersionCheck> ServerSync.VersionCheck::versionChecks
IL_000a: newobj System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::.ctor()
IL_000f: stsfld System.Collections.Generic.Dictionary`2<System.String,System.String> ServerSync.VersionCheck::notProcessedNames
IL_0014: nop
IL_0015: ldtoken BepInEx.ThreadingHelper
IL_001a: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_001f: ldstr "StartSyncInvoke"
IL_0024: call System.Reflection.MethodInfo System.Type::GetMethod(System.String)
IL_0029: call BepInEx.ThreadingHelper BepInEx.ThreadingHelper::get_Instance()
IL_002e: ldc.i4.1
IL_002f: newarr System.Object
IL_0034: dup
IL_0035: ldc.i4.0
IL_0036: ldnull
IL_0037: ldftn System.Void ServerSync.VersionCheck::PatchServerSync()
IL_003d: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_0042: stelem.ref
IL_0043: callvirt System.Object System.Reflection.MethodBase::Invoke(System.Object,System.Object[])
IL_0048: pop
IL_0049: ret

// System.Void ServerSync.VersionCheck::.ctor(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.1
IL_0002: stfld System.Boolean ServerSync.VersionCheck::ModRequired
IL_0007: ldarg.0
IL_0008: newobj System.Void System.Collections.Generic.List`1<ZRpc>::.ctor()
IL_000d: stfld System.Collections.Generic.List`1<ZRpc> ServerSync.VersionCheck::ValidatedClients
IL_0012: ldarg.0
IL_0013: call System.Void System.Object::.ctor()
IL_0018: nop
IL_0019: nop
IL_001a: ldarg.0
IL_001b: ldarg.1
IL_001c: stfld System.String ServerSync.VersionCheck::Name
IL_0021: ldarg.0
IL_0022: ldc.i4.1
IL_0023: stfld System.Boolean ServerSync.VersionCheck::ModRequired
IL_0028: ldsfld System.Collections.Generic.HashSet`1<ServerSync.VersionCheck> ServerSync.VersionCheck::versionChecks
IL_002d: ldarg.0
IL_002e: callvirt System.Boolean System.Collections.Generic.HashSet`1<ServerSync.VersionCheck>::Add(!0)
IL_0033: pop
IL_0034: ret

// System.Void ServerSync.VersionCheck::.ctor(ServerSync.ConfigSync)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.1
IL_0002: stfld System.Boolean ServerSync.VersionCheck::ModRequired
IL_0007: ldarg.0
IL_0008: newobj System.Void System.Collections.Generic.List`1<ZRpc>::.ctor()
IL_000d: stfld System.Collections.Generic.List`1<ZRpc> ServerSync.VersionCheck::ValidatedClients
IL_0012: ldarg.0
IL_0013: call System.Void System.Object::.ctor()
IL_0018: nop
IL_0019: nop
IL_001a: ldarg.0
IL_001b: ldarg.1
IL_001c: stfld ServerSync.ConfigSync ServerSync.VersionCheck::ConfigSync
IL_0021: ldarg.0
IL_0022: ldarg.0
IL_0023: ldfld ServerSync.ConfigSync ServerSync.VersionCheck::ConfigSync
IL_0028: ldfld System.String ServerSync.ConfigSync::Name
IL_002d: stfld System.String ServerSync.VersionCheck::Name
IL_0032: ldsfld System.Collections.Generic.HashSet`1<ServerSync.VersionCheck> ServerSync.VersionCheck::versionChecks
IL_0037: ldarg.0
IL_0038: callvirt System.Boolean System.Collections.Generic.HashSet`1<ServerSync.VersionCheck>::Add(!0)
IL_003d: pop
IL_003e: ret

// System.Void ServerSync.VersionCheck::Initialize()
.locals System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldnull
IL_0003: stfld System.String ServerSync.VersionCheck::ReceivedCurrentVersion
IL_0008: ldarg.0
IL_0009: ldnull
IL_000a: stfld System.String ServerSync.VersionCheck::ReceivedMinimumRequiredVersion
IL_000f: ldarg.0
IL_0010: ldfld ServerSync.ConfigSync ServerSync.VersionCheck::ConfigSync
IL_0015: ldnull
IL_0016: ceq
IL_0018: stloc.0
IL_0019: ldloc.0
IL_001a: brfalse.s IL_001f
IL_001c: nop
IL_001d: br.s IL_0077
IL_001f: ldarg.0
IL_0020: ldarg.0
IL_0021: ldfld ServerSync.ConfigSync ServerSync.VersionCheck::ConfigSync
IL_0026: ldfld System.String ServerSync.ConfigSync::Name
IL_002b: stfld System.String ServerSync.VersionCheck::Name
IL_0030: ldarg.0
IL_0031: ldarg.0
IL_0032: ldfld ServerSync.ConfigSync ServerSync.VersionCheck::ConfigSync
IL_0037: ldfld System.String ServerSync.ConfigSync::DisplayName
IL_003c: call System.Void ServerSync.VersionCheck::set_DisplayName(System.String)
IL_0041: nop
IL_0042: ldarg.0
IL_0043: ldarg.0
IL_0044: ldfld ServerSync.ConfigSync ServerSync.VersionCheck::ConfigSync
IL_0049: ldfld System.String ServerSync.ConfigSync::CurrentVersion
IL_004e: call System.Void ServerSync.VersionCheck::set_CurrentVersion(System.String)
IL_0053: nop
IL_0054: ldarg.0
IL_0055: ldarg.0
IL_0056: ldfld ServerSync.ConfigSync ServerSync.VersionCheck::ConfigSync
IL_005b: ldfld System.String ServerSync.ConfigSync::MinimumRequiredVersion
IL_0060: call System.Void ServerSync.VersionCheck::set_MinimumRequiredVersion(System.String)
IL_0065: nop
IL_0066: ldarg.0
IL_0067: ldarg.0
IL_0068: ldfld ServerSync.ConfigSync ServerSync.VersionCheck::ConfigSync
IL_006d: ldfld System.Boolean ServerSync.ConfigSync::ModRequired
IL_0072: stfld System.Boolean ServerSync.VersionCheck::ModRequired
IL_0077: ret

// System.Boolean ServerSync.VersionCheck::IsVersionOk()
.locals System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.String ServerSync.VersionCheck::ReceivedMinimumRequiredVersion
IL_0007: brfalse.s IL_0014
IL_0009: ldarg.0
IL_000a: ldfld System.String ServerSync.VersionCheck::ReceivedCurrentVersion
IL_000f: ldnull
IL_0010: ceq
IL_0012: br.s IL_0015
IL_0014: ldc.i4.1
IL_0015: stloc.2
IL_0016: ldloc.2
IL_0017: brfalse.s IL_0026
IL_0019: nop
IL_001a: ldarg.0
IL_001b: ldfld System.Boolean ServerSync.VersionCheck::ModRequired
IL_0020: ldc.i4.0
IL_0021: ceq
IL_0023: stloc.3
IL_0024: br.s IL_0064
IL_0026: ldarg.0
IL_0027: call System.String ServerSync.VersionCheck::get_CurrentVersion()
IL_002c: newobj System.Void System.Version::.ctor(System.String)
IL_0031: ldarg.0
IL_0032: ldfld System.String ServerSync.VersionCheck::ReceivedMinimumRequiredVersion
IL_0037: newobj System.Void System.Version::.ctor(System.String)
IL_003c: call System.Boolean System.Version::op_GreaterThanOrEqual(System.Version,System.Version)
IL_0041: stloc.0
IL_0042: ldarg.0
IL_0043: ldfld System.String ServerSync.VersionCheck::ReceivedCurrentVersion
IL_0048: newobj System.Void System.Version::.ctor(System.String)
IL_004d: ldarg.0
IL_004e: call System.String ServerSync.VersionCheck::get_MinimumRequiredVersion()
IL_0053: newobj System.Void System.Version::.ctor(System.String)
IL_0058: call System.Boolean System.Version::op_GreaterThanOrEqual(System.Version,System.Version)
IL_005d: stloc.1
IL_005e: ldloc.0
IL_005f: ldloc.1
IL_0060: and
IL_0061: stloc.3
IL_0062: br.s IL_0064
IL_0064: ldloc.3
IL_0065: ret

// System.String ServerSync.VersionCheck::ErrorClient()
.locals System.Boolean, System.Boolean, System.String
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.String ServerSync.VersionCheck::ReceivedMinimumRequiredVersion
IL_0007: ldnull
IL_0008: ceq
IL_000a: stloc.1
IL_000b: ldloc.1
IL_000c: brfalse.s IL_0025
IL_000e: nop
IL_000f: ldarg.0
IL_0010: call System.String ServerSync.VersionCheck::get_DisplayName()
IL_0015: ldstr " is not installed on the server."
IL_001a: call System.String System.String::Concat(System.String,System.String)
IL_001f: stloc.2
IL_0020: br IL_00c5
IL_0025: ldarg.0
IL_0026: call System.String ServerSync.VersionCheck::get_CurrentVersion()
IL_002b: newobj System.Void System.Version::.ctor(System.String)
IL_0030: ldarg.0
IL_0031: ldfld System.String ServerSync.VersionCheck::ReceivedMinimumRequiredVersion
IL_0036: newobj System.Void System.Version::.ctor(System.String)
IL_003b: call System.Boolean System.Version::op_GreaterThanOrEqual(System.Version,System.Version)
IL_0040: stloc.0
IL_0041: ldloc.0
IL_0042: brtrue.s IL_0084
IL_0044: ldc.i4.6
IL_0045: newarr System.String
IL_004a: dup
IL_004b: ldc.i4.0
IL_004c: ldarg.0
IL_004d: call System.String ServerSync.VersionCheck::get_DisplayName()
IL_0052: stelem.ref
IL_0053: dup
IL_0054: ldc.i4.1
IL_0055: ldstr " needs to be at least version "
IL_005a: stelem.ref
IL_005b: dup
IL_005c: ldc.i4.2
IL_005d: ldarg.0
IL_005e: ldfld System.String ServerSync.VersionCheck::ReceivedMinimumRequiredVersion
IL_0063: stelem.ref
IL_0064: dup
IL_0065: ldc.i4.3
IL_0066: ldstr ". You have version "
IL_006b: stelem.ref
IL_006c: dup
IL_006d: ldc.i4.4
IL_006e: ldarg.0
IL_006f: call System.String ServerSync.VersionCheck::get_CurrentVersion()
IL_0074: stelem.ref
IL_0075: dup
IL_0076: ldc.i4.5
IL_0077: ldstr "."
IL_007c: stelem.ref
IL_007d: call System.String System.String::Concat(System.String[])
IL_0082: br.s IL_00c2
IL_0084: ldc.i4.6
IL_0085: newarr System.String
IL_008a: dup
IL_008b: ldc.i4.0
IL_008c: ldarg.0
IL_008d: call System.String ServerSync.VersionCheck::get_DisplayName()
IL_0092: stelem.ref
IL_0093: dup
IL_0094: ldc.i4.1
IL_0095: ldstr " may not be higher than version "
IL_009a: stelem.ref
IL_009b: dup
IL_009c: ldc.i4.2
IL_009d: ldarg.0
IL_009e: ldfld System.String ServerSync.VersionCheck::ReceivedCurrentVersion
IL_00a3: stelem.ref
IL_00a4: dup
IL_00a5: ldc.i4.3
IL_00a6: ldstr ". You have version "
IL_00ab: stelem.ref
IL_00ac: dup
IL_00ad: ldc.i4.4
IL_00ae: ldarg.0
IL_00af: call System.String ServerSync.VersionCheck::get_CurrentVersion()
IL_00b4: stelem.ref
IL_00b5: dup
IL_00b6: ldc.i4.5
IL_00b7: ldstr "."
IL_00bc: stelem.ref
IL_00bd: call System.String System.String::Concat(System.String[])
IL_00c2: stloc.2
IL_00c3: br.s IL_00c5
IL_00c5: ldloc.2
IL_00c6: ret

// System.String ServerSync.VersionCheck::ErrorServer(ZRpc)
.locals System.String
IL_0000: nop
IL_0001: ldc.i4.6
IL_0002: newarr System.String
IL_0007: dup
IL_0008: ldc.i4.0
IL_0009: ldstr "Disconnect: The client ("
IL_000e: stelem.ref
IL_000f: dup
IL_0010: ldc.i4.1
IL_0011: ldarg.1
IL_0012: callvirt ISocket ZRpc::GetSocket()
IL_0017: callvirt System.String ISocket::GetHostName()
IL_001c: stelem.ref
IL_001d: dup
IL_001e: ldc.i4.2
IL_001f: ldstr ") doesn't have the correct "
IL_0024: stelem.ref
IL_0025: dup
IL_0026: ldc.i4.3
IL_0027: ldarg.0
IL_0028: call System.String ServerSync.VersionCheck::get_DisplayName()
IL_002d: stelem.ref
IL_002e: dup
IL_002f: ldc.i4.4
IL_0030: ldstr " version "
IL_0035: stelem.ref
IL_0036: dup
IL_0037: ldc.i4.5
IL_0038: ldarg.0
IL_0039: call System.String ServerSync.VersionCheck::get_MinimumRequiredVersion()
IL_003e: stelem.ref
IL_003f: call System.String System.String::Concat(System.String[])
IL_0044: stloc.0
IL_0045: br.s IL_0047
IL_0047: ldloc.0
IL_0048: ret

// System.String ServerSync.VersionCheck::Error(ZRpc)
.locals System.String
IL_0000: nop
IL_0001: ldarg.1
IL_0002: brfalse.s IL_000d
IL_0004: ldarg.0
IL_0005: ldarg.1
IL_0006: call System.String ServerSync.VersionCheck::ErrorServer(ZRpc)
IL_000b: br.s IL_0013
IL_000d: ldarg.0
IL_000e: call System.String ServerSync.VersionCheck::ErrorClient()
IL_0013: stloc.0
IL_0014: br.s IL_0016
IL_0016: ldloc.0
IL_0017: ret

// ServerSync.VersionCheck[] ServerSync.VersionCheck::GetFailedClient()
.locals ServerSync.VersionCheck[]
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.HashSet`1<ServerSync.VersionCheck> ServerSync.VersionCheck::versionChecks
IL_0006: ldsfld System.Func`2<ServerSync.VersionCheck,System.Boolean> ServerSync.VersionCheck/<>c::<>9__29_0
IL_000b: dup
IL_000c: brtrue.s IL_0025
IL_000e: pop
IL_000f: ldsfld ServerSync.VersionCheck/<>c ServerSync.VersionCheck/<>c::<>9
IL_0014: ldftn System.Boolean ServerSync.VersionCheck/<>c::<GetFailedClient>b__29_0(ServerSync.VersionCheck)
IL_001a: newobj System.Void System.Func`2<ServerSync.VersionCheck,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_001f: dup
IL_0020: stsfld System.Func`2<ServerSync.VersionCheck,System.Boolean> ServerSync.VersionCheck/<>c::<>9__29_0
IL_0025: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ServerSync.VersionCheck>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_002a: call !!0[] System.Linq.Enumerable::ToArray<ServerSync.VersionCheck>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_002f: stloc.0
IL_0030: br.s IL_0032
IL_0032: ldloc.0
IL_0033: ret

// ServerSync.VersionCheck[] ServerSync.VersionCheck::GetFailedServer(ZRpc)
.locals ServerSync.VersionCheck/<>c__DisplayClass30_0, ServerSync.VersionCheck[]
IL_0000: newobj System.Void ServerSync.VersionCheck/<>c__DisplayClass30_0::.ctor()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldarg.0
IL_0008: stfld ZRpc ServerSync.VersionCheck/<>c__DisplayClass30_0::rpc
IL_000d: nop
IL_000e: ldsfld System.Collections.Generic.HashSet`1<ServerSync.VersionCheck> ServerSync.VersionCheck::versionChecks
IL_0013: ldloc.0
IL_0014: ldftn System.Boolean ServerSync.VersionCheck/<>c__DisplayClass30_0::<GetFailedServer>b__0(ServerSync.VersionCheck)
IL_001a: newobj System.Void System.Func`2<ServerSync.VersionCheck,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_001f: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ServerSync.VersionCheck>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0024: call !!0[] System.Linq.Enumerable::ToArray<ServerSync.VersionCheck>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0029: stloc.1
IL_002a: br.s IL_002c
IL_002c: ldloc.1
IL_002d: ret

// System.Void ServerSync.VersionCheck::Logout()
.locals 
IL_0000: nop
IL_0001: call Game Game::get_instance()
IL_0006: ldc.i4.1
IL_0007: ldc.i4.1
IL_0008: callvirt System.Void Game::Logout(System.Boolean,System.Boolean)
IL_000d: nop
IL_000e: ldtoken ZNet
IL_0013: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0018: ldstr "m_connectionStatus"
IL_001d: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_0022: ldnull
IL_0023: ldc.i4.3
IL_0024: box ZNet/ConnectionStatus
IL_0029: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_002e: nop
IL_002f: ret

// System.Void ServerSync.VersionCheck::DisconnectClient(ZRpc)
.locals 
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldstr "Error"
IL_0007: ldc.i4.1
IL_0008: newarr System.Object
IL_000d: dup
IL_000e: ldc.i4.0
IL_000f: ldc.i4.3
IL_0010: box System.Int32
IL_0015: stelem.ref
IL_0016: callvirt System.Void ZRpc::Invoke(System.String,System.Object[])
IL_001b: nop
IL_001c: ret

// System.Void ServerSync.VersionCheck::CheckVersion(ZRpc,ZPackage)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldnull
IL_0003: call System.Void ServerSync.VersionCheck::CheckVersion(ZRpc,ZPackage,System.Action`2<ZRpc,ZPackage>)
IL_0008: nop
IL_0009: ret

// System.Void ServerSync.VersionCheck::CheckVersion(ZRpc,ZPackage,System.Action`2<ZRpc,ZPackage>)
.locals System.String, System.String, System.String, System.Boolean, System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>, ServerSync.VersionCheck, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: callvirt System.String ZPackage::ReadString()
IL_0007: stloc.0
IL_0008: ldarg.1
IL_0009: callvirt System.String ZPackage::ReadString()
IL_000e: stloc.1
IL_000f: ldarg.1
IL_0010: callvirt System.String ZPackage::ReadString()
IL_0015: stloc.2
IL_0016: ldc.i4.0
IL_0017: stloc.3
IL_0018: nop
IL_0019: ldsfld System.Collections.Generic.HashSet`1<ServerSync.VersionCheck> ServerSync.VersionCheck::versionChecks
IL_001e: callvirt System.Collections.Generic.HashSet`1/Enumerator<!0> System.Collections.Generic.HashSet`1<ServerSync.VersionCheck>::GetEnumerator()
IL_0023: stloc.s V_4
IL_0025: br IL_00f3
IL_002a: ldloca.s V_4
IL_002c: call !0 System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>::get_Current()
IL_0031: stloc.s V_5
IL_0033: nop
IL_0034: ldloc.0
IL_0035: ldloc.s V_5
IL_0037: ldfld System.String ServerSync.VersionCheck::Name
IL_003c: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_0041: stloc.s V_6
IL_0043: ldloc.s V_6
IL_0045: brfalse.s IL_004d
IL_0047: nop
IL_0048: br IL_00f3
IL_004d: ldc.i4.s 9
IL_004f: newarr System.String
IL_0054: dup
IL_0055: ldc.i4.0
IL_0056: ldstr "Received "
IL_005b: stelem.ref
IL_005c: dup
IL_005d: ldc.i4.1
IL_005e: ldloc.s V_5
IL_0060: callvirt System.String ServerSync.VersionCheck::get_DisplayName()
IL_0065: stelem.ref
IL_0066: dup
IL_0067: ldc.i4.2
IL_0068: ldstr " version "
IL_006d: stelem.ref
IL_006e: dup
IL_006f: ldc.i4.3
IL_0070: ldloc.2
IL_0071: stelem.ref
IL_0072: dup
IL_0073: ldc.i4.4
IL_0074: ldstr " and minimum version "
IL_0079: stelem.ref
IL_007a: dup
IL_007b: ldc.i4.5
IL_007c: ldloc.1
IL_007d: stelem.ref
IL_007e: dup
IL_007f: ldc.i4.6
IL_0080: ldstr " from the "
IL_0085: stelem.ref
IL_0086: dup
IL_0087: ldc.i4.7
IL_0088: call ZNet ZNet::get_instance()
IL_008d: callvirt System.Boolean ZNet::IsServer()
IL_0092: brtrue.s IL_009b
IL_0094: ldstr "server"
IL_0099: br.s IL_00a0
IL_009b: ldstr "client"
IL_00a0: stelem.ref
IL_00a1: dup
IL_00a2: ldc.i4.8
IL_00a3: ldstr "."
IL_00a8: stelem.ref
IL_00a9: call System.String System.String::Concat(System.String[])
IL_00ae: call System.Void UnityEngine.Debug::Log(System.Object)
IL_00b3: nop
IL_00b4: ldloc.s V_5
IL_00b6: ldloc.1
IL_00b7: stfld System.String ServerSync.VersionCheck::ReceivedMinimumRequiredVersion
IL_00bc: ldloc.s V_5
IL_00be: ldloc.2
IL_00bf: stfld System.String ServerSync.VersionCheck::ReceivedCurrentVersion
IL_00c4: call ZNet ZNet::get_instance()
IL_00c9: callvirt System.Boolean ZNet::IsServer()
IL_00ce: brfalse.s IL_00d9
IL_00d0: ldloc.s V_5
IL_00d2: callvirt System.Boolean ServerSync.VersionCheck::IsVersionOk()
IL_00d7: br.s IL_00da
IL_00d9: ldc.i4.0
IL_00da: stloc.s V_7
IL_00dc: ldloc.s V_7
IL_00de: brfalse.s IL_00f0
IL_00e0: nop
IL_00e1: ldloc.s V_5
IL_00e3: ldfld System.Collections.Generic.List`1<ZRpc> ServerSync.VersionCheck::ValidatedClients
IL_00e8: ldarg.0
IL_00e9: callvirt System.Void System.Collections.Generic.List`1<ZRpc>::Add(!0)
IL_00ee: nop
IL_00ef: nop
IL_00f0: ldc.i4.1
IL_00f1: stloc.3
IL_00f2: nop
IL_00f3: ldloca.s V_4
IL_00f5: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>::MoveNext()
IL_00fa: brtrue IL_002a
IL_00ff: leave.s IL_0110
IL_0101: ldloca.s V_4
IL_0103: constrained. System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>
IL_0109: callvirt System.Void System.IDisposable::Dispose()
IL_010e: nop
IL_010f: endfinally
IL_0110: ldloc.3
IL_0111: ldc.i4.0
IL_0112: ceq
IL_0114: stloc.s V_8
IL_0116: ldloc.s V_8
IL_0118: brfalse.s IL_0157
IL_011a: nop
IL_011b: ldarg.1
IL_011c: ldc.i4.0
IL_011d: callvirt System.Void ZPackage::SetPos(System.Int32)
IL_0122: nop
IL_0123: ldarg.2
IL_0124: ldnull
IL_0125: cgt.un
IL_0127: stloc.s V_9
IL_0129: ldloc.s V_9
IL_012b: brfalse.s IL_0156
IL_012d: nop
IL_012e: ldarg.2
IL_012f: ldarg.0
IL_0130: ldarg.1
IL_0131: callvirt System.Void System.Action`2<ZRpc,ZPackage>::Invoke(!0,!1)
IL_0136: nop
IL_0137: ldarg.1
IL_0138: callvirt System.Int32 ZPackage::GetPos()
IL_013d: ldc.i4.0
IL_013e: ceq
IL_0140: stloc.s V_10
IL_0142: ldloc.s V_10
IL_0144: brfalse.s IL_0155
IL_0146: nop
IL_0147: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> ServerSync.VersionCheck::notProcessedNames
IL_014c: ldloc.0
IL_014d: ldloc.2
IL_014e: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0153: nop
IL_0154: nop
IL_0155: nop
IL_0156: nop
IL_0157: ret
// EH Finally: 37 - 257 => 257 - 272

// System.Boolean ServerSync.VersionCheck::RPC_PeerInfo(ZRpc,ZNet)
.locals ServerSync.VersionCheck[], System.Boolean, System.Boolean, ServerSync.VersionCheck[], System.Int32, ServerSync.VersionCheck, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: callvirt System.Boolean ZNet::IsServer()
IL_0007: brtrue.s IL_0010
IL_0009: call ServerSync.VersionCheck[] ServerSync.VersionCheck::GetFailedClient()
IL_000e: br.s IL_0016
IL_0010: ldarg.0
IL_0011: call ServerSync.VersionCheck[] ServerSync.VersionCheck::GetFailedServer(ZRpc)
IL_0016: stloc.0
IL_0017: ldloc.0
IL_0018: ldlen
IL_0019: ldc.i4.0
IL_001a: ceq
IL_001c: stloc.1
IL_001d: ldloc.1
IL_001e: brfalse.s IL_0025
IL_0020: nop
IL_0021: ldc.i4.1
IL_0022: stloc.2
IL_0023: br.s IL_0073
IL_0025: nop
IL_0026: ldloc.0
IL_0027: stloc.3
IL_0028: ldc.i4.0
IL_0029: stloc.s V_4
IL_002b: br.s IL_0049
IL_002d: ldloc.3
IL_002e: ldloc.s V_4
IL_0030: ldelem.ref
IL_0031: stloc.s V_5
IL_0033: nop
IL_0034: ldloc.s V_5
IL_0036: ldarg.0
IL_0037: callvirt System.String ServerSync.VersionCheck::Error(ZRpc)
IL_003c: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_0041: nop
IL_0042: nop
IL_0043: ldloc.s V_4
IL_0045: ldc.i4.1
IL_0046: add
IL_0047: stloc.s V_4
IL_0049: ldloc.s V_4
IL_004b: ldloc.3
IL_004c: ldlen
IL_004d: conv.i4
IL_004e: blt.s IL_002d
IL_0050: ldarg.1
IL_0051: callvirt System.Boolean ZNet::IsServer()
IL_0056: stloc.s V_6
IL_0058: ldloc.s V_6
IL_005a: brfalse.s IL_0067
IL_005c: nop
IL_005d: ldarg.0
IL_005e: call System.Void ServerSync.VersionCheck::DisconnectClient(ZRpc)
IL_0063: nop
IL_0064: nop
IL_0065: br.s IL_006f
IL_0067: nop
IL_0068: call System.Void ServerSync.VersionCheck::Logout()
IL_006d: nop
IL_006e: nop
IL_006f: ldc.i4.0
IL_0070: stloc.2
IL_0071: br.s IL_0073
IL_0073: ldloc.2
IL_0074: ret

// System.Void ServerSync.VersionCheck::RegisterAndCheckVersion(ZNetPeer,ZNet)
.locals System.Collections.IDictionary, System.Boolean, ServerSync.VersionCheck/<>c__DisplayClass36_0, System.Object, System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>, ServerSync.VersionCheck, ZPackage, System.Boolean
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> ServerSync.VersionCheck::notProcessedNames
IL_0006: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Clear()
IL_000b: nop
IL_000c: ldtoken ZRpc
IL_0011: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0016: ldstr "m_functions"
IL_001b: ldc.i4.s 36
IL_001d: callvirt System.Reflection.FieldInfo System.Type::GetField(System.String,System.Reflection.BindingFlags)
IL_0022: ldarg.0
IL_0023: ldfld ZRpc ZNetPeer::m_rpc
IL_0028: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_002d: castclass System.Collections.IDictionary
IL_0032: stloc.0
IL_0033: ldloc.0
IL_0034: ldstr "ServerSync VersionCheck"
IL_0039: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_003e: box System.Int32
IL_0043: callvirt System.Boolean System.Collections.IDictionary::Contains(System.Object)
IL_0048: stloc.1
IL_0049: ldloc.1
IL_004a: brfalse.s IL_00ac
IL_004c: newobj System.Void ServerSync.VersionCheck/<>c__DisplayClass36_0::.ctor()
IL_0051: stloc.2
IL_0052: nop
IL_0053: ldloc.0
IL_0054: ldstr "ServerSync VersionCheck"
IL_0059: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_005e: box System.Int32
IL_0063: callvirt System.Object System.Collections.IDictionary::get_Item(System.Object)
IL_0068: stloc.3
IL_0069: ldloc.2
IL_006a: ldloc.3
IL_006b: callvirt System.Type System.Object::GetType()
IL_0070: ldstr "m_action"
IL_0075: ldc.i4.s 36
IL_0077: callvirt System.Reflection.FieldInfo System.Type::GetField(System.String,System.Reflection.BindingFlags)
IL_007c: ldloc.3
IL_007d: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_0082: castclass System.Action`2<ZRpc,ZPackage>
IL_0087: stfld System.Action`2<ZRpc,ZPackage> ServerSync.VersionCheck/<>c__DisplayClass36_0::action
IL_008c: ldarg.0
IL_008d: ldfld ZRpc ZNetPeer::m_rpc
IL_0092: ldstr "ServerSync VersionCheck"
IL_0097: ldloc.2
IL_0098: ldftn System.Void ServerSync.VersionCheck/<>c__DisplayClass36_0::<RegisterAndCheckVersion>b__0(ZRpc,ZPackage)
IL_009e: newobj System.Void System.Action`2<ZRpc,ZPackage>::.ctor(System.Object,System.IntPtr)
IL_00a3: callvirt System.Void ZRpc::Register<ZPackage>(System.String,System.Action`2<ZRpc,!!0>)
IL_00a8: nop
IL_00a9: nop
IL_00aa: br.s IL_00da
IL_00ac: nop
IL_00ad: ldarg.0
IL_00ae: ldfld ZRpc ZNetPeer::m_rpc
IL_00b3: ldstr "ServerSync VersionCheck"
IL_00b8: ldsfld System.Action`2<ZRpc,ZPackage> ServerSync.VersionCheck/<>O::<0>__CheckVersion
IL_00bd: dup
IL_00be: brtrue.s IL_00d3
IL_00c0: pop
IL_00c1: ldnull
IL_00c2: ldftn System.Void ServerSync.VersionCheck::CheckVersion(ZRpc,ZPackage)
IL_00c8: newobj System.Void System.Action`2<ZRpc,ZPackage>::.ctor(System.Object,System.IntPtr)
IL_00cd: dup
IL_00ce: stsfld System.Action`2<ZRpc,ZPackage> ServerSync.VersionCheck/<>O::<0>__CheckVersion
IL_00d3: callvirt System.Void ZRpc::Register<ZPackage>(System.String,System.Action`2<ZRpc,!!0>)
IL_00d8: nop
IL_00d9: nop
IL_00da: nop
IL_00db: ldsfld System.Collections.Generic.HashSet`1<ServerSync.VersionCheck> ServerSync.VersionCheck::versionChecks
IL_00e0: callvirt System.Collections.Generic.HashSet`1/Enumerator<!0> System.Collections.Generic.HashSet`1<ServerSync.VersionCheck>::GetEnumerator()
IL_00e5: stloc.s V_4
IL_00e7: br IL_01df
IL_00ec: ldloca.s V_4
IL_00ee: call !0 System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>::get_Current()
IL_00f3: stloc.s V_5
IL_00f5: nop
IL_00f6: ldloc.s V_5
IL_00f8: callvirt System.Void ServerSync.VersionCheck::Initialize()
IL_00fd: nop
IL_00fe: ldloc.s V_5
IL_0100: ldfld System.Boolean ServerSync.VersionCheck::ModRequired
IL_0105: brtrue.s IL_0112
IL_0107: ldarg.1
IL_0108: callvirt System.Boolean ZNet::IsServer()
IL_010d: ldc.i4.0
IL_010e: ceq
IL_0110: br.s IL_0113
IL_0112: ldc.i4.0
IL_0113: stloc.s V_7
IL_0115: ldloc.s V_7
IL_0117: brfalse.s IL_011f
IL_0119: nop
IL_011a: br IL_01df
IL_011f: ldc.i4.s 9
IL_0121: newarr System.String
IL_0126: dup
IL_0127: ldc.i4.0
IL_0128: ldstr "Sending "
IL_012d: stelem.ref
IL_012e: dup
IL_012f: ldc.i4.1
IL_0130: ldloc.s V_5
IL_0132: callvirt System.String ServerSync.VersionCheck::get_DisplayName()
IL_0137: stelem.ref
IL_0138: dup
IL_0139: ldc.i4.2
IL_013a: ldstr " version "
IL_013f: stelem.ref
IL_0140: dup
IL_0141: ldc.i4.3
IL_0142: ldloc.s V_5
IL_0144: callvirt System.String ServerSync.VersionCheck::get_CurrentVersion()
IL_0149: stelem.ref
IL_014a: dup
IL_014b: ldc.i4.4
IL_014c: ldstr " and minimum version "
IL_0151: stelem.ref
IL_0152: dup
IL_0153: ldc.i4.5
IL_0154: ldloc.s V_5
IL_0156: callvirt System.String ServerSync.VersionCheck::get_MinimumRequiredVersion()
IL_015b: stelem.ref
IL_015c: dup
IL_015d: ldc.i4.6
IL_015e: ldstr " to the "
IL_0163: stelem.ref
IL_0164: dup
IL_0165: ldc.i4.7
IL_0166: ldarg.1
IL_0167: callvirt System.Boolean ZNet::IsServer()
IL_016c: brtrue.s IL_0175
IL_016e: ldstr "server"
IL_0173: br.s IL_017a
IL_0175: ldstr "client"
IL_017a: stelem.ref
IL_017b: dup
IL_017c: ldc.i4.8
IL_017d: ldstr "."
IL_0182: stelem.ref
IL_0183: call System.String System.String::Concat(System.String[])
IL_0188: call System.Void UnityEngine.Debug::Log(System.Object)
IL_018d: nop
IL_018e: newobj System.Void ZPackage::.ctor()
IL_0193: stloc.s V_6
IL_0195: ldloc.s V_6
IL_0197: ldloc.s V_5
IL_0199: ldfld System.String ServerSync.VersionCheck::Name
IL_019e: callvirt System.Void ZPackage::Write(System.String)
IL_01a3: nop
IL_01a4: ldloc.s V_6
IL_01a6: ldloc.s V_5
IL_01a8: callvirt System.String ServerSync.VersionCheck::get_MinimumRequiredVersion()
IL_01ad: callvirt System.Void ZPackage::Write(System.String)
IL_01b2: nop
IL_01b3: ldloc.s V_6
IL_01b5: ldloc.s V_5
IL_01b7: callvirt System.String ServerSync.VersionCheck::get_CurrentVersion()
IL_01bc: callvirt System.Void ZPackage::Write(System.String)
IL_01c1: nop
IL_01c2: ldarg.0
IL_01c3: ldfld ZRpc ZNetPeer::m_rpc
IL_01c8: ldstr "ServerSync VersionCheck"
IL_01cd: ldc.i4.1
IL_01ce: newarr System.Object
IL_01d3: dup
IL_01d4: ldc.i4.0
IL_01d5: ldloc.s V_6
IL_01d7: stelem.ref
IL_01d8: callvirt System.Void ZRpc::Invoke(System.String,System.Object[])
IL_01dd: nop
IL_01de: nop
IL_01df: ldloca.s V_4
IL_01e1: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>::MoveNext()
IL_01e6: brtrue IL_00ec
IL_01eb: leave.s IL_01fc
IL_01ed: ldloca.s V_4
IL_01ef: constrained. System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>
IL_01f5: callvirt System.Void System.IDisposable::Dispose()
IL_01fa: nop
IL_01fb: endfinally
IL_01fc: ret
// EH Finally: 231 - 493 => 493 - 508

// System.Void ServerSync.VersionCheck::RemoveDisconnected(ZNetPeer,ZNet)
.locals System.Boolean, System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>, ServerSync.VersionCheck
IL_0000: nop
IL_0001: ldarg.1
IL_0002: callvirt System.Boolean ZNet::IsServer()
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: brfalse.s IL_0011
IL_000e: nop
IL_000f: br.s IL_0055
IL_0011: nop
IL_0012: ldsfld System.Collections.Generic.HashSet`1<ServerSync.VersionCheck> ServerSync.VersionCheck::versionChecks
IL_0017: callvirt System.Collections.Generic.HashSet`1/Enumerator<!0> System.Collections.Generic.HashSet`1<ServerSync.VersionCheck>::GetEnumerator()
IL_001c: stloc.1
IL_001d: br.s IL_003b
IL_001f: ldloca.s V_1
IL_0021: call !0 System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>::get_Current()
IL_0026: stloc.2
IL_0027: nop
IL_0028: ldloc.2
IL_0029: ldfld System.Collections.Generic.List`1<ZRpc> ServerSync.VersionCheck::ValidatedClients
IL_002e: ldarg.0
IL_002f: ldfld ZRpc ZNetPeer::m_rpc
IL_0034: callvirt System.Boolean System.Collections.Generic.List`1<ZRpc>::Remove(!0)
IL_0039: pop
IL_003a: nop
IL_003b: ldloca.s V_1
IL_003d: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>::MoveNext()
IL_0042: brtrue.s IL_001f
IL_0044: leave.s IL_0055
IL_0046: ldloca.s V_1
IL_0048: constrained. System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>
IL_004e: callvirt System.Void System.IDisposable::Dispose()
IL_0053: nop
IL_0054: endfinally
IL_0055: ret
// EH Finally: 29 - 70 => 70 - 85

// System.Void ServerSync.VersionCheck::ShowConnectionError(FejdStartup)
.locals System.Boolean, ServerSync.VersionCheck[], System.Boolean, System.Boolean, System.String, System.Collections.Generic.IEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.String,System.String>>, System.Collections.Generic.KeyValuePair`2<System.String,System.String>, System.Boolean, TMPro.TMP_Text, System.Boolean, UnityEngine.RectTransform, System.Single, UnityEngine.RectTransform, UnityEngine.Vector2
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld UnityEngine.GameObject FejdStartup::m_connectionFailedPanel
IL_0007: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_000c: brfalse.s IL_001b
IL_000e: call ZNet/ConnectionStatus ZNet::GetConnectionStatus()
IL_0013: ldc.i4.3
IL_0014: ceq
IL_0016: ldc.i4.0
IL_0017: ceq
IL_0019: br.s IL_001c
IL_001b: ldc.i4.1
IL_001c: stloc.2
IL_001d: ldloc.2
IL_001e: brfalse.s IL_0026
IL_0020: nop
IL_0021: br IL_0232
IL_0026: ldc.i4.0
IL_0027: stloc.0
IL_0028: call ServerSync.VersionCheck[] ServerSync.VersionCheck::GetFailedClient()
IL_002d: stloc.1
IL_002e: ldloc.1
IL_002f: ldlen
IL_0030: ldc.i4.0
IL_0031: cgt.un
IL_0033: stloc.3
IL_0034: ldloc.3
IL_0035: brfalse.s IL_008a
IL_0037: nop
IL_0038: ldstr "
"
IL_003d: ldloc.1
IL_003e: ldsfld System.Func`2<ServerSync.VersionCheck,System.String> ServerSync.VersionCheck/<>c::<>9__38_0
IL_0043: dup
IL_0044: brtrue.s IL_005d
IL_0046: pop
IL_0047: ldsfld ServerSync.VersionCheck/<>c ServerSync.VersionCheck/<>c::<>9
IL_004c: ldftn System.String ServerSync.VersionCheck/<>c::<ShowConnectionError>b__38_0(ServerSync.VersionCheck)
IL_0052: newobj System.Void System.Func`2<ServerSync.VersionCheck,System.String>::.ctor(System.Object,System.IntPtr)
IL_0057: dup
IL_0058: stsfld System.Func`2<ServerSync.VersionCheck,System.String> ServerSync.VersionCheck/<>c::<>9__38_0
IL_005d: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::Select<ServerSync.VersionCheck,System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0062: call System.String System.String::Join(System.String,System.Collections.Generic.IEnumerable`1<System.String>)
IL_0067: stloc.s V_4
IL_0069: ldarg.0
IL_006a: ldfld TMPro.TMP_Text FejdStartup::m_connectionFailedError
IL_006f: dup
IL_0070: callvirt System.String TMPro.TMP_Text::get_text()
IL_0075: ldstr "
"
IL_007a: ldloc.s V_4
IL_007c: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0081: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_0086: nop
IL_0087: ldc.i4.1
IL_0088: stloc.0
IL_0089: nop
IL_008a: nop
IL_008b: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> ServerSync.VersionCheck::notProcessedNames
IL_0090: ldsfld System.Func`2<System.Collections.Generic.KeyValuePair`2<System.String,System.String>,System.String> ServerSync.VersionCheck/<>c::<>9__38_1
IL_0095: dup
IL_0096: brtrue.s IL_00af
IL_0098: pop
IL_0099: ldsfld ServerSync.VersionCheck/<>c ServerSync.VersionCheck/<>c::<>9
IL_009e: ldftn System.String ServerSync.VersionCheck/<>c::<ShowConnectionError>b__38_1(System.Collections.Generic.KeyValuePair`2<System.String,System.String>)
IL_00a4: newobj System.Void System.Func`2<System.Collections.Generic.KeyValuePair`2<System.String,System.String>,System.String>::.ctor(System.Object,System.IntPtr)
IL_00a9: dup
IL_00aa: stsfld System.Func`2<System.Collections.Generic.KeyValuePair`2<System.String,System.String>,System.String> ServerSync.VersionCheck/<>c::<>9__38_1
IL_00af: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::OrderBy<System.Collections.Generic.KeyValuePair`2<System.String,System.String>,System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_00b4: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.Collections.Generic.KeyValuePair`2<System.String,System.String>>::GetEnumerator()
IL_00b9: stloc.s V_5
IL_00bb: br IL_0140
IL_00c0: ldloc.s V_5
IL_00c2: callvirt !0 System.Collections.Generic.IEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.String,System.String>>::get_Current()
IL_00c7: stloc.s V_6
IL_00c9: nop
IL_00ca: ldarg.0
IL_00cb: ldfld TMPro.TMP_Text FejdStartup::m_connectionFailedError
IL_00d0: callvirt System.String TMPro.TMP_Text::get_text()
IL_00d5: ldloca.s V_6
IL_00d7: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_00dc: callvirt System.Boolean System.String::Contains(System.String)
IL_00e1: ldc.i4.0
IL_00e2: ceq
IL_00e4: stloc.s V_7
IL_00e6: ldloc.s V_7
IL_00e8: brfalse.s IL_013f
IL_00ea: nop
IL_00eb: ldarg.0
IL_00ec: ldfld TMPro.TMP_Text FejdStartup::m_connectionFailedError
IL_00f1: stloc.s V_8
IL_00f3: ldloc.s V_8
IL_00f5: ldc.i4.6
IL_00f6: newarr System.String
IL_00fb: dup
IL_00fc: ldc.i4.0
IL_00fd: ldloc.s V_8
IL_00ff: callvirt System.String TMPro.TMP_Text::get_text()
IL_0104: stelem.ref
IL_0105: dup
IL_0106: ldc.i4.1
IL_0107: ldstr "
Server expects you to have "
IL_010c: stelem.ref
IL_010d: dup
IL_010e: ldc.i4.2
IL_010f: ldloca.s V_6
IL_0111: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_0116: stelem.ref
IL_0117: dup
IL_0118: ldc.i4.3
IL_0119: ldstr " (Version: "
IL_011e: stelem.ref
IL_011f: dup
IL_0120: ldc.i4.4
IL_0121: ldloca.s V_6
IL_0123: call !1 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Value()
IL_0128: stelem.ref
IL_0129: dup
IL_012a: ldc.i4.5
IL_012b: ldstr ") installed."
IL_0130: stelem.ref
IL_0131: call System.String System.String::Concat(System.String[])
IL_0136: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_013b: nop
IL_013c: ldc.i4.1
IL_013d: stloc.0
IL_013e: nop
IL_013f: nop
IL_0140: ldloc.s V_5
IL_0142: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0147: brtrue IL_00c0
IL_014c: leave.s IL_015b
IL_014e: ldloc.s V_5
IL_0150: brfalse.s IL_015a
IL_0152: ldloc.s V_5
IL_0154: callvirt System.Void System.IDisposable::Dispose()
IL_0159: nop
IL_015a: endfinally
IL_015b: ldloc.0
IL_015c: stloc.s V_9
IL_015e: ldloc.s V_9
IL_0160: brfalse IL_0232
IL_0165: nop
IL_0166: ldarg.0
IL_0167: ldfld UnityEngine.GameObject FejdStartup::m_connectionFailedPanel
IL_016c: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_0171: ldstr "Image"
IL_0176: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_017b: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.RectTransform>()
IL_0180: stloc.s V_10
IL_0182: ldloc.s V_10
IL_0184: ldloc.s V_10
IL_0186: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_sizeDelta()
IL_018b: stloc.s V_13
IL_018d: ldloca.s V_13
IL_018f: ldc.r4 675
IL_0194: stfld System.Single UnityEngine.Vector2::x
IL_0199: ldloc.s V_13
IL_019b: callvirt System.Void UnityEngine.RectTransform::set_sizeDelta(UnityEngine.Vector2)
IL_01a0: nop
IL_01a1: ldarg.0
IL_01a2: ldfld TMPro.TMP_Text FejdStartup::m_connectionFailedError
IL_01a7: ldc.i4.0
IL_01a8: ldc.i4.0
IL_01a9: callvirt System.Void TMPro.TMP_Text::ForceMeshUpdate(System.Boolean,System.Boolean)
IL_01ae: nop
IL_01af: ldarg.0
IL_01b0: ldfld TMPro.TMP_Text FejdStartup::m_connectionFailedError
IL_01b5: callvirt System.Single TMPro.TMP_Text::get_renderedHeight()
IL_01ba: ldc.r4 105
IL_01bf: add
IL_01c0: stloc.s V_11
IL_01c2: ldloc.s V_10
IL_01c4: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_01c9: ldstr "ButtonOk"
IL_01ce: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_01d3: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.RectTransform>()
IL_01d8: stloc.s V_12
IL_01da: ldloc.s V_12
IL_01dc: ldloc.s V_12
IL_01de: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_anchoredPosition()
IL_01e3: ldfld System.Single UnityEngine.Vector2::x
IL_01e8: ldloc.s V_12
IL_01ea: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_anchoredPosition()
IL_01ef: ldfld System.Single UnityEngine.Vector2::y
IL_01f4: ldloc.s V_11
IL_01f6: ldloc.s V_10
IL_01f8: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_sizeDelta()
IL_01fd: ldfld System.Single UnityEngine.Vector2::y
IL_0202: sub
IL_0203: ldc.r4 2
IL_0208: div
IL_0209: sub
IL_020a: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_020f: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_0214: nop
IL_0215: ldloc.s V_10
IL_0217: ldloc.s V_10
IL_0219: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_sizeDelta()
IL_021e: stloc.s V_13
IL_0220: ldloca.s V_13
IL_0222: ldloc.s V_11
IL_0224: stfld System.Single UnityEngine.Vector2::y
IL_0229: ldloc.s V_13
IL_022b: callvirt System.Void UnityEngine.RectTransform::set_sizeDelta(UnityEngine.Vector2)
IL_0230: nop
IL_0231: nop
IL_0232: ret
// EH Finally: 187 - 334 => 334 - 347

// System.Void ServerSync.VersionCheck/<>c::.cctor()
.locals 
IL_0000: newobj System.Void ServerSync.VersionCheck/<>c::.ctor()
IL_0005: stsfld ServerSync.VersionCheck/<>c ServerSync.VersionCheck/<>c::<>9
IL_000a: ret

// System.Void ServerSync.VersionCheck/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Boolean ServerSync.VersionCheck/<>c::<PatchServerSync>b__20_0(HarmonyLib.Patch)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.Reflection.MethodInfo HarmonyLib.Patch::get_PatchMethod()
IL_0006: callvirt System.Type System.Reflection.MemberInfo::get_DeclaringType()
IL_000b: ldtoken ServerSync.ConfigSync/RegisterRPCPatch
IL_0010: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0015: call System.Boolean System.Type::op_Equality(System.Type,System.Type)
IL_001a: ret

// System.Boolean ServerSync.VersionCheck/<>c::<PatchServerSync>b__20_1(System.Type)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.Boolean System.Type::get_IsClass()
IL_0006: ret

// System.Boolean ServerSync.VersionCheck/<>c::<GetFailedClient>b__29_0(ServerSync.VersionCheck)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.Boolean ServerSync.VersionCheck::IsVersionOk()
IL_0006: ldc.i4.0
IL_0007: ceq
IL_0009: ret

// System.String ServerSync.VersionCheck/<>c::<ShowConnectionError>b__38_0(ServerSync.VersionCheck)
.locals 
IL_0000: ldarg.1
IL_0001: ldnull
IL_0002: callvirt System.String ServerSync.VersionCheck::Error(ZRpc)
IL_0007: ret

// System.String ServerSync.VersionCheck/<>c::<ShowConnectionError>b__38_1(System.Collections.Generic.KeyValuePair`2<System.String,System.String>)
.locals 
IL_0000: ldarga.s kv
IL_0002: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_0007: ret

// System.Void ServerSync.VersionCheck/<>c__DisplayClass30_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Boolean ServerSync.VersionCheck/<>c__DisplayClass30_0::<GetFailedServer>b__0(ServerSync.VersionCheck)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.Boolean ServerSync.VersionCheck::ModRequired
IL_0006: brfalse.s IL_001e
IL_0008: ldarg.1
IL_0009: ldfld System.Collections.Generic.List`1<ZRpc> ServerSync.VersionCheck::ValidatedClients
IL_000e: ldarg.0
IL_000f: ldfld ZRpc ServerSync.VersionCheck/<>c__DisplayClass30_0::rpc
IL_0014: callvirt System.Boolean System.Collections.Generic.List`1<ZRpc>::Contains(!0)
IL_0019: ldc.i4.0
IL_001a: ceq
IL_001c: br.s IL_001f
IL_001e: ldc.i4.0
IL_001f: ret

// System.Void ServerSync.VersionCheck/<>c__DisplayClass36_0::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: nop
IL_0007: ret

// System.Void ServerSync.VersionCheck/<>c__DisplayClass36_0::<RegisterAndCheckVersion>b__0(ZRpc,ZPackage)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.2
IL_0002: ldarg.0
IL_0003: ldfld System.Action`2<ZRpc,ZPackage> ServerSync.VersionCheck/<>c__DisplayClass36_0::action
IL_0008: call System.Void ServerSync.VersionCheck::CheckVersion(ZRpc,ZPackage,System.Action`2<ZRpc,ZPackage>)
IL_000d: nop
IL_000e: ret
