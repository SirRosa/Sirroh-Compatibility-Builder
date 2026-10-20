
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

// System.Void Husbandry.Plugin::Awake()
.locals 
IL_0000: ldarg.0
IL_0001: call BepInEx.Logging.ManualLogSource BepInEx.BaseUnityPlugin::get_Logger()
IL_0006: stsfld BepInEx.Logging.ManualLogSource Husbandry.Util.Log::Source
IL_000b: ldarg.0
IL_000c: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0011: call System.Void Husbandry.Config.HusbandryConfig::Bind(BepInEx.Configuration.ConfigFile)
IL_0016: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::Enabled
IL_001b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0020: brtrue.s IL_002d
IL_0022: ldstr "Husbandry is switched off in config and is doing nothing."
IL_0027: call System.Void Husbandry.Util.Log::Info(System.String)
IL_002c: ret
IL_002d: ldarg.0
IL_002e: ldstr "dafini.husbandry"
IL_0033: newobj System.Void HarmonyLib.Harmony::.ctor(System.String)
IL_0038: stfld HarmonyLib.Harmony Husbandry.Plugin::_harmony
IL_003d: ldarg.0
IL_003e: ldfld HarmonyLib.Harmony Husbandry.Plugin::_harmony
IL_0043: callvirt System.Void HarmonyLib.Harmony::PatchAll()
IL_0048: call System.Void Husbandry.Commands.HusbandryCommand::Register()
IL_004d: ret

// System.Void Husbandry.Plugin::Update()
.locals ZNet
IL_0000: ldarg.0
IL_0001: ldfld System.Boolean Husbandry.Plugin::_started
IL_0006: brtrue.s IL_0047
IL_0008: call ZNet ZNet::get_instance()
IL_000d: stloc.0
IL_000e: ldloc.0
IL_000f: ldnull
IL_0010: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0015: brfalse.s IL_0018
IL_0017: ret
IL_0018: ldarg.0
IL_0019: ldc.i4.1
IL_001a: stfld System.Boolean Husbandry.Plugin::_started
IL_001f: ldloc.0
IL_0020: callvirt System.Boolean ZNet::IsServer()
IL_0025: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::OfflineUpkeep
IL_002a: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_002f: call System.Boolean Husbandry.Offline.Steward::ShouldRun(System.Boolean,System.Boolean)
IL_0034: brfalse.s IL_003d
IL_0036: call System.Void Husbandry.Offline.Steward::Begin()
IL_003b: br.s IL_0047
IL_003d: ldstr "Husbandry: this machine does not hold the world, so the offline upkeep is not running here. The throttle still is."
IL_0042: call System.Void Husbandry.Util.Log::Info(System.String)
IL_0047: call System.Void Husbandry.Offline.Steward::Tick()
IL_004c: call System.Single UnityEngine.Time::get_time()
IL_0051: call System.Void Husbandry.Herd.Shoving::Tick(System.Single)
IL_0056: ret

// System.Void Husbandry.Plugin::OnDestroy()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld HarmonyLib.Harmony Husbandry.Plugin::_harmony
IL_0006: dup
IL_0007: brtrue.s IL_000b
IL_0009: pop
IL_000a: ret
IL_000b: call System.Void HarmonyLib.Harmony::UnpatchSelf()
IL_0010: ret

// System.Void Husbandry.Plugin::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BepInEx.BaseUnityPlugin::.ctor()
IL_0006: ret

// System.Void Husbandry.Util.Log::Info(System.String)
.locals 
IL_0000: ldsfld BepInEx.Logging.ManualLogSource Husbandry.Util.Log::Source
IL_0005: dup
IL_0006: brtrue.s IL_000a
IL_0008: pop
IL_0009: ret
IL_000a: ldarg.0
IL_000b: call System.Void BepInEx.Logging.ManualLogSource::LogInfo(System.Object)
IL_0010: ret

// System.Void Husbandry.Util.Log::Warn(System.String)
.locals 
IL_0000: ldsfld BepInEx.Logging.ManualLogSource Husbandry.Util.Log::Source
IL_0005: dup
IL_0006: brtrue.s IL_000a
IL_0008: pop
IL_0009: ret
IL_000a: ldarg.0
IL_000b: call System.Void BepInEx.Logging.ManualLogSource::LogWarning(System.Object)
IL_0010: ret

// System.Void Husbandry.Util.Log::Debug(System.String)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::Verbose
IL_0005: brfalse.s IL_0014
IL_0007: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::Verbose
IL_000c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0011: brtrue.s IL_0014
IL_0013: ret
IL_0014: ldsfld BepInEx.Logging.ManualLogSource Husbandry.Util.Log::Source
IL_0019: dup
IL_001a: brtrue.s IL_001e
IL_001c: pop
IL_001d: ret
IL_001e: ldarg.0
IL_001f: call System.Void BepInEx.Logging.ManualLogSource::LogInfo(System.Object)
IL_0024: ret

// System.Int32 Husbandry.Patches.BreedPatch::get_Skipped()
.locals 
IL_0000: ldsfld System.Int32 Husbandry.Patches.BreedPatch::<Skipped>k__BackingField
IL_0005: ret

// System.Void Husbandry.Patches.BreedPatch::set_Skipped(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Int32 Husbandry.Patches.BreedPatch::<Skipped>k__BackingField
IL_0006: ret

// System.Void Husbandry.Patches.BreedPatch::ResetForTests()
.locals 
IL_0000: ldc.i4.0
IL_0001: call System.Void Husbandry.Patches.BreedPatch::set_Skipped(System.Int32)
IL_0006: ret

// System.Boolean Husbandry.Patches.BreedPatch::Prepare()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::Enabled
IL_0005: brfalse.s IL_0013
IL_0007: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::Enabled
IL_000c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0011: brfalse.s IL_0027
IL_0013: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::CheapCensus
IL_0018: brfalse.s IL_0025
IL_001a: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::CheapCensus
IL_001f: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0024: ret
IL_0025: ldc.i4.1
IL_0026: ret
IL_0027: ldc.i4.0
IL_0028: ret

// System.Boolean Husbandry.Patches.BreedPatch::Prefix(Procreation)
.locals ZNetView, System.Int32, System.Int32, Husbandry.Herd.Census
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0007: brfalse.s IL_000b
IL_0009: ldc.i4.1
IL_000a: ret
IL_000b: ldarg.0
IL_000c: callvirt !!0 UnityEngine.Component::GetComponent<ZNetView>()
IL_0011: stloc.0
IL_0012: ldloc.0
IL_0013: ldnull
IL_0014: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0019: brtrue.s IL_002b
IL_001b: ldloc.0
IL_001c: callvirt System.Boolean ZNetView::IsValid()
IL_0021: brfalse.s IL_002b
IL_0023: ldloc.0
IL_0024: callvirt System.Boolean ZNetView::IsOwner()
IL_0029: brtrue.s IL_002d
IL_002b: ldc.i4.1
IL_002c: ret
IL_002d: ldloc.0
IL_002e: callvirt ZDO ZNetView::GetZDO()
IL_0033: ldsfld System.Int32 ZDOVars::s_pregnant
IL_0038: ldc.i4.0
IL_0039: conv.i8
IL_003a: callvirt System.Int64 ZDO::GetLong(System.Int32,System.Int64)
IL_003f: call System.Boolean Husbandry.Offline.Quickening::Carrying(System.Int64)
IL_0044: brfalse.s IL_0048
IL_0046: ldc.i4.1
IL_0047: ret
IL_0048: ldarg.0
IL_0049: ldfld System.Int32 Procreation::m_maxCreatures
IL_004e: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> Husbandry.Config.HusbandryConfig::SoftCap
IL_0053: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0058: call System.Int32 Husbandry.Herd.Cap::Effective(System.Int32,System.Int32)
IL_005d: stloc.1
IL_005e: ldloc.1
IL_005f: ldc.i4.0
IL_0060: bgt.s IL_0064
IL_0062: ldc.i4.1
IL_0063: ret
IL_0064: ldloc.0
IL_0065: callvirt ZDO ZNetView::GetZDO()
IL_006a: callvirt System.Int32 ZDO::GetPrefab()
IL_006f: stloc.2
IL_0070: call System.Single UnityEngine.Time::get_time()
IL_0075: call Husbandry.Herd.Census Husbandry.Herd.Muster::Current(System.Single)
IL_007a: stloc.3
IL_007b: ldloc.3
IL_007c: ldloc.2
IL_007d: callvirt System.Int32 Husbandry.Herd.Census::Total(System.Int32)
IL_0082: ldloc.1
IL_0083: call System.Boolean Husbandry.Herd.Cap::CertainlyUnder(System.Int32,System.Int32)
IL_0088: brfalse.s IL_008c
IL_008a: ldc.i4.1
IL_008b: ret
IL_008c: ldloc.3
IL_008d: ldloc.2
IL_008e: ldarg.0
IL_008f: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0094: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0099: ldarg.0
IL_009a: ldfld System.Single Procreation::m_totalCheckRange
IL_009f: callvirt System.Int32 Husbandry.Herd.Census::Within(System.Int32,UnityEngine.Vector3,System.Single)
IL_00a4: ldloc.1
IL_00a5: call System.Boolean Husbandry.Herd.Cap::Reached(System.Int32,System.Int32)
IL_00aa: brtrue.s IL_00ae
IL_00ac: ldc.i4.1
IL_00ad: ret
IL_00ae: call System.Int32 Husbandry.Patches.BreedPatch::get_Skipped()
IL_00b3: ldc.i4.1
IL_00b4: add
IL_00b5: call System.Void Husbandry.Patches.BreedPatch::set_Skipped(System.Int32)
IL_00ba: ldc.i4.0
IL_00bb: ret

// System.Boolean Husbandry.Patches.ShoveePatch::Prepare()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::Enabled
IL_0005: brfalse.s IL_0012
IL_0007: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::Enabled
IL_000c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0011: ret
IL_0012: ldc.i4.1
IL_0013: ret

// System.Boolean Husbandry.Patches.ShoveePatch::get_Armed()
.locals 
IL_0000: ldsfld System.Boolean Husbandry.Patches.ShoveePatch::<Armed>k__BackingField
IL_0005: ret

// System.Void Husbandry.Patches.ShoveePatch::set_Armed(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Boolean Husbandry.Patches.ShoveePatch::<Armed>k__BackingField
IL_0006: ret

// System.Void Husbandry.Patches.ShoveePatch::ResetForTests()
.locals 
IL_0000: ldc.i4.0
IL_0001: call System.Void Husbandry.Patches.ShoveePatch::set_Armed(System.Boolean)
IL_0006: ret

// System.Void Husbandry.Patches.ShoveePatch::Postfix()
.locals 
IL_0000: ldc.i4.1
IL_0001: call System.Void Husbandry.Patches.ShoveePatch::set_Armed(System.Boolean)
IL_0006: ret

// System.Boolean Husbandry.Patches.ShoveePatch::Prefix(Tameable,Humanoid,System.Boolean,System.Boolean,System.Boolean&)
.locals Character
IL_0000: ldarg.2
IL_0001: ldc.i4.0
IL_0002: ceq
IL_0004: ldarg.3
IL_0005: or
IL_0006: brfalse.s IL_000a
IL_0008: ldc.i4.1
IL_0009: ret
IL_000a: ldc.i4.1
IL_000b: call System.Void Husbandry.Patches.ShoveePatch::set_Armed(System.Boolean)
IL_0010: ldarg.0
IL_0011: ldnull
IL_0012: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0017: brtrue.s IL_0021
IL_0019: ldarg.0
IL_001a: callvirt !!0 UnityEngine.Component::GetComponent<Character>()
IL_001f: br.s IL_0022
IL_0021: ldnull
IL_0022: stloc.0
IL_0023: ldloc.0
IL_0024: ldnull
IL_0025: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_002a: brfalse.s IL_002e
IL_002c: ldc.i4.1
IL_002d: ret
IL_002e: ldloc.0
IL_002f: callvirt System.Boolean Character::IsTamed()
IL_0034: call System.Boolean Husbandry.Herd.Bumping::Mine(System.Boolean)
IL_0039: brtrue.s IL_003d
IL_003b: ldc.i4.1
IL_003c: ret
IL_003d: ldloc.0
IL_003e: call System.Boolean Husbandry.Herd.Shoving::Toggle(Character)
IL_0043: brtrue.s IL_0047
IL_0045: ldc.i4.1
IL_0046: ret
IL_0047: ldarg.1
IL_0048: ldnull
IL_0049: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_004e: brfalse.s IL_0075
IL_0050: ldarg.1
IL_0051: ldc.i4.2
IL_0052: ldloc.0
IL_0053: ldfld System.String Character::m_name
IL_0058: ldstr " "
IL_005d: ldloc.0
IL_005e: call System.Boolean Husbandry.Herd.Shoving::IsSolid(Character)
IL_0063: call System.String Husbandry.Herd.Bumping::Plain(System.Boolean)
IL_0068: call System.String System.String::Concat(System.String,System.String,System.String)
IL_006d: ldc.i4.0
IL_006e: ldnull
IL_006f: ldc.i4.0
IL_0070: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_0075: ldarg.s __result
IL_0077: ldc.i4.1
IL_0078: stind.i1
IL_0079: ldc.i4.0
IL_007a: ret

// System.Boolean Husbandry.Patches.TickPatch::Prepare()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::Enabled
IL_0005: brfalse.s IL_0012
IL_0007: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::Enabled
IL_000c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0011: ret
IL_0012: ldc.i4.1
IL_0013: ret

// System.Boolean Husbandry.Patches.TickPatch::Prefix(BaseAI,System.Single&,System.Boolean&)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: call System.Boolean Husbandry.Idle.Drowse::Skip(BaseAI,System.Single&)
IL_0007: brtrue.s IL_000b
IL_0009: ldc.i4.1
IL_000a: ret
IL_000b: ldarg.2
IL_000c: ldc.i4.0
IL_000d: stind.i1
IL_000e: ldc.i4.0
IL_000f: ret

// System.Double Husbandry.Offline.Clocks::Between(System.Int64,System.Int64)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: sub
IL_0003: conv.r8
IL_0004: ldc.r8 10000000
IL_000d: div
IL_000e: ret

// System.Boolean Husbandry.Offline.Clocks::Elapsed(System.Int64,System.Int64,System.Double)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: call System.Double Husbandry.Offline.Clocks::Between(System.Int64,System.Int64)
IL_0007: ldarg.2
IL_0008: cgt
IL_000a: ret

// System.Int64 Husbandry.Offline.Clocks::Ago(System.Int64,System.Double)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: ldc.r8 10000000
IL_000b: mul
IL_000c: conv.i8
IL_000d: sub
IL_000e: ret

// System.Int32 Husbandry.Offline.Courtship::get_Count()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<ZDOID,System.Single> Husbandry.Offline.Courtship::_last
IL_0006: callvirt System.Int32 System.Collections.Generic.Dictionary`2<ZDOID,System.Single>::get_Count()
IL_000b: ret

// System.Void Husbandry.Offline.Courtship::Clear()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<ZDOID,System.Single> Husbandry.Offline.Courtship::_last
IL_0006: callvirt System.Void System.Collections.Generic.Dictionary`2<ZDOID,System.Single>::Clear()
IL_000b: ret

// System.Boolean Husbandry.Offline.Courtship::Ready(ZDOID,System.Single,System.Single)
.locals System.Single
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<ZDOID,System.Single> Husbandry.Offline.Courtship::_last
IL_0006: ldarg.1
IL_0007: ldloca.s V_0
IL_0009: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,System.Single>::TryGetValue(!0,!1&)
IL_000e: brtrue.s IL_0012
IL_0010: ldc.i4.1
IL_0011: ret
IL_0012: ldarg.2
IL_0013: ldloc.0
IL_0014: sub
IL_0015: ldarg.3
IL_0016: clt.un
IL_0018: ldc.i4.0
IL_0019: ceq
IL_001b: ret

// System.Void Husbandry.Offline.Courtship::Courted(ZDOID,System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<ZDOID,System.Single> Husbandry.Offline.Courtship::_last
IL_0006: ldarg.1
IL_0007: ldarg.2
IL_0008: callvirt System.Void System.Collections.Generic.Dictionary`2<ZDOID,System.Single>::set_Item(!0,!1)
IL_000d: ret

// System.Int32 Husbandry.Offline.Courtship::Forget(System.Single,System.Single)
.locals System.Collections.Generic.List`1<ZDOID>, System.Collections.Generic.Dictionary`2/Enumerator<ZDOID,System.Single>, System.Collections.Generic.KeyValuePair`2<ZDOID,System.Single>, System.Collections.Generic.List`1/Enumerator<ZDOID>, ZDOID
IL_0000: newobj System.Void System.Collections.Generic.List`1<ZDOID>::.ctor()
IL_0005: stloc.0
IL_0006: ldarg.0
IL_0007: ldfld System.Collections.Generic.Dictionary`2<ZDOID,System.Single> Husbandry.Offline.Courtship::_last
IL_000c: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<ZDOID,System.Single>::GetEnumerator()
IL_0011: stloc.1
IL_0012: br.s IL_0035
IL_0014: ldloca.s V_1
IL_0016: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<ZDOID,System.Single>::get_Current()
IL_001b: stloc.2
IL_001c: ldarg.1
IL_001d: ldloca.s V_2
IL_001f: call !1 System.Collections.Generic.KeyValuePair`2<ZDOID,System.Single>::get_Value()
IL_0024: sub
IL_0025: ldarg.2
IL_0026: ble.un.s IL_0035
IL_0028: ldloc.0
IL_0029: ldloca.s V_2
IL_002b: call !0 System.Collections.Generic.KeyValuePair`2<ZDOID,System.Single>::get_Key()
IL_0030: callvirt System.Void System.Collections.Generic.List`1<ZDOID>::Add(!0)
IL_0035: ldloca.s V_1
IL_0037: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<ZDOID,System.Single>::MoveNext()
IL_003c: brtrue.s IL_0014
IL_003e: leave.s IL_004e
IL_0040: ldloca.s V_1
IL_0042: constrained. System.Collections.Generic.Dictionary`2/Enumerator<ZDOID,System.Single>
IL_0048: callvirt System.Void System.IDisposable::Dispose()
IL_004d: endfinally
IL_004e: ldloc.0
IL_004f: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<ZDOID>::GetEnumerator()
IL_0054: stloc.3
IL_0055: br.s IL_006e
IL_0057: ldloca.s V_3
IL_0059: call !0 System.Collections.Generic.List`1/Enumerator<ZDOID>::get_Current()
IL_005e: stloc.s V_4
IL_0060: ldarg.0
IL_0061: ldfld System.Collections.Generic.Dictionary`2<ZDOID,System.Single> Husbandry.Offline.Courtship::_last
IL_0066: ldloc.s V_4
IL_0068: callvirt System.Boolean System.Collections.Generic.Dictionary`2<ZDOID,System.Single>::Remove(!0)
IL_006d: pop
IL_006e: ldloca.s V_3
IL_0070: call System.Boolean System.Collections.Generic.List`1/Enumerator<ZDOID>::MoveNext()
IL_0075: brtrue.s IL_0057
IL_0077: leave.s IL_0087
IL_0079: ldloca.s V_3
IL_007b: constrained. System.Collections.Generic.List`1/Enumerator<ZDOID>
IL_0081: callvirt System.Void System.IDisposable::Dispose()
IL_0086: endfinally
IL_0087: ldloc.0
IL_0088: callvirt System.Int32 System.Collections.Generic.List`1<ZDOID>::get_Count()
IL_008d: ret
// EH Finally: 18 - 64 => 64 - 78
// EH Finally: 85 - 121 => 121 - 135

// System.Void Husbandry.Offline.Courtship::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: newobj System.Void System.Collections.Generic.Dictionary`2<ZDOID,System.Single>::.ctor()
IL_0006: stfld System.Collections.Generic.Dictionary`2<ZDOID,System.Single> Husbandry.Offline.Courtship::_last
IL_000b: ldarg.0
IL_000c: call System.Void System.Object::.ctor()
IL_0011: ret

// System.Single Husbandry.Offline.Mending::Restored(System.Single,System.Single,System.Single,System.Double)
.locals System.Single
IL_0000: ldarg.0
IL_0001: ldc.r4 0
IL_0006: bgt.un.s IL_000a
IL_0008: ldarg.0
IL_0009: ret
IL_000a: ldarg.0
IL_000b: ldarg.1
IL_000c: blt.un.s IL_0010
IL_000e: ldarg.0
IL_000f: ret
IL_0010: ldarg.2
IL_0011: ldc.r4 0
IL_0016: bgt.un.s IL_001a
IL_0018: ldarg.0
IL_0019: ret
IL_001a: ldarg.3
IL_001b: ldc.r8 0
IL_0024: bgt.un.s IL_0028
IL_0026: ldarg.0
IL_0027: ret
IL_0028: ldarg.0
IL_0029: ldarg.2
IL_002a: conv.r8
IL_002b: ldarg.3
IL_002c: mul
IL_002d: conv.r4
IL_002e: add
IL_002f: stloc.0
IL_0030: ldloc.0
IL_0031: ldarg.1
IL_0032: bgt.s IL_0036
IL_0034: ldloc.0
IL_0035: ret
IL_0036: ldarg.1
IL_0037: ret

// System.Boolean Husbandry.Offline.Mending::Worth(System.Single,System.Single)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: sub
IL_0003: ldc.r4 0.01
IL_0008: cgt
IL_000a: ret

// Husbandry.Offline.Pasture/Cursor Husbandry.Offline.Pasture::Next(Husbandry.Offline.Pasture/Cursor,System.Int32)
.locals System.Int32, System.Int32, Husbandry.Offline.Pasture/Cursor
IL_0000: ldarg.1
IL_0001: ldc.i4.0
IL_0002: bgt.s IL_000e
IL_0004: ldloca.s V_2
IL_0006: initobj Husbandry.Offline.Pasture/Cursor
IL_000c: ldloc.2
IL_000d: ret
IL_000e: ldarg.0
IL_000f: ldfld System.Int32 Husbandry.Offline.Pasture/Cursor::Prefab
IL_0014: ldc.i4.1
IL_0015: add
IL_0016: stloc.0
IL_0017: ldarg.0
IL_0018: ldfld System.Int32 Husbandry.Offline.Pasture/Cursor::Passes
IL_001d: stloc.1
IL_001e: ldloc.0
IL_001f: ldarg.1
IL_0020: blt.s IL_0028
IL_0022: ldc.i4.0
IL_0023: stloc.0
IL_0024: ldloc.1
IL_0025: ldc.i4.1
IL_0026: add
IL_0027: stloc.1
IL_0028: ldloca.s V_2
IL_002a: initobj Husbandry.Offline.Pasture/Cursor
IL_0030: ldloca.s V_2
IL_0032: ldloc.0
IL_0033: stfld System.Int32 Husbandry.Offline.Pasture/Cursor::Prefab
IL_0038: ldloca.s V_2
IL_003a: ldc.i4.0
IL_003b: stfld System.Int32 Husbandry.Offline.Pasture/Cursor::Index
IL_0040: ldloca.s V_2
IL_0042: ldloc.1
IL_0043: stfld System.Int32 Husbandry.Offline.Pasture/Cursor::Passes
IL_0048: ldloc.2
IL_0049: ret

// Husbandry.Offline.Pasture/Cursor Husbandry.Offline.Pasture::Continued(Husbandry.Offline.Pasture/Cursor,System.Int32)
.locals Husbandry.Offline.Pasture/Cursor
IL_0000: ldloca.s V_0
IL_0002: initobj Husbandry.Offline.Pasture/Cursor
IL_0008: ldloca.s V_0
IL_000a: ldarg.0
IL_000b: ldfld System.Int32 Husbandry.Offline.Pasture/Cursor::Prefab
IL_0010: stfld System.Int32 Husbandry.Offline.Pasture/Cursor::Prefab
IL_0015: ldloca.s V_0
IL_0017: ldarg.1
IL_0018: stfld System.Int32 Husbandry.Offline.Pasture/Cursor::Index
IL_001d: ldloca.s V_0
IL_001f: ldarg.0
IL_0020: ldfld System.Int32 Husbandry.Offline.Pasture/Cursor::Passes
IL_0025: stfld System.Int32 Husbandry.Offline.Pasture/Cursor::Passes
IL_002a: ldloc.0
IL_002b: ret

// System.Boolean Husbandry.Offline.Pasture::Valid(Husbandry.Offline.Pasture/Cursor,System.Int32)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.0
IL_0002: ble.s IL_0023
IL_0004: ldarg.0
IL_0005: ldfld System.Int32 Husbandry.Offline.Pasture/Cursor::Prefab
IL_000a: ldc.i4.0
IL_000b: blt.s IL_0023
IL_000d: ldarg.0
IL_000e: ldfld System.Int32 Husbandry.Offline.Pasture/Cursor::Prefab
IL_0013: ldarg.1
IL_0014: bge.s IL_0023
IL_0016: ldarg.0
IL_0017: ldfld System.Int32 Husbandry.Offline.Pasture/Cursor::Index
IL_001c: ldc.i4.0
IL_001d: clt
IL_001f: ldc.i4.0
IL_0020: ceq
IL_0022: ret
IL_0023: ldc.i4.0
IL_0024: ret

// System.Boolean Husbandry.Offline.Pasture::Wrapped(Husbandry.Offline.Pasture/Cursor,Husbandry.Offline.Pasture/Cursor)
.locals 
IL_0000: ldarg.1
IL_0001: ldfld System.Int32 Husbandry.Offline.Pasture/Cursor::Passes
IL_0006: ldarg.0
IL_0007: ldfld System.Int32 Husbandry.Offline.Pasture/Cursor::Passes
IL_000c: cgt
IL_000e: ret

// System.Collections.Generic.List`1<System.String> Husbandry.Offline.Pasture::Tameables(System.Collections.Generic.IEnumerable`1<UnityEngine.GameObject>)
.locals System.Collections.Generic.List`1<System.String>, System.Collections.Generic.IEnumerator`1<UnityEngine.GameObject>, UnityEngine.GameObject
IL_0000: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_0005: stloc.0
IL_0006: ldarg.0
IL_0007: brtrue.s IL_000b
IL_0009: ldloc.0
IL_000a: ret
IL_000b: ldarg.0
IL_000c: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<UnityEngine.GameObject>::GetEnumerator()
IL_0011: stloc.1
IL_0012: br.s IL_003e
IL_0014: ldloc.1
IL_0015: callvirt !0 System.Collections.Generic.IEnumerator`1<UnityEngine.GameObject>::get_Current()
IL_001a: stloc.2
IL_001b: ldloc.2
IL_001c: ldnull
IL_001d: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0022: brtrue.s IL_003e
IL_0024: ldloc.2
IL_0025: callvirt !!0 UnityEngine.GameObject::GetComponent<Tameable>()
IL_002a: ldnull
IL_002b: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0030: brtrue.s IL_003e
IL_0032: ldloc.0
IL_0033: ldloc.2
IL_0034: callvirt System.String UnityEngine.Object::get_name()
IL_0039: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_003e: ldloc.1
IL_003f: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0044: brtrue.s IL_0014
IL_0046: leave.s IL_0052
IL_0048: ldloc.1
IL_0049: brfalse.s IL_0051
IL_004b: ldloc.1
IL_004c: callvirt System.Void System.IDisposable::Dispose()
IL_0051: endfinally
IL_0052: ldloc.0
IL_0053: ret
// EH Finally: 18 - 72 => 72 - 82

// Husbandry.Offline.Verdict Husbandry.Offline.Quickening::Judge(System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Int32,System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: brtrue.s IL_0005
IL_0003: ldc.i4.0
IL_0004: ret
IL_0005: ldarg.1
IL_0006: brfalse.s IL_000a
IL_0008: ldc.i4.1
IL_0009: ret
IL_000a: ldarg.2
IL_000b: brtrue.s IL_000f
IL_000d: ldc.i4.2
IL_000e: ret
IL_000f: ldarg.3
IL_0010: brfalse.s IL_0014
IL_0012: ldc.i4.3
IL_0013: ret
IL_0014: ldarg.s underCap
IL_0016: brtrue.s IL_001a
IL_0018: ldc.i4.4
IL_0019: ret
IL_001a: ldarg.s required
IL_001c: ldc.i4.1
IL_001d: bge.s IL_0022
IL_001f: ldc.i4.1
IL_0020: starg.s required
IL_0022: ldarg.s lovePoints
IL_0024: ldc.i4.1
IL_0025: add
IL_0026: ldarg.s required
IL_0028: bge.s IL_002c
IL_002a: ldc.i4.5
IL_002b: ret
IL_002c: ldc.i4.6
IL_002d: ret

// System.Boolean Husbandry.Offline.Quickening::Carrying(System.Int64)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.0
IL_0002: conv.i8
IL_0003: cgt.un
IL_0005: ret

// System.Boolean Husbandry.Offline.Quickening::Courts(Husbandry.Offline.Verdict)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.5
IL_0002: ceq
IL_0004: ret

// System.Boolean Husbandry.Offline.Quickening::Conceives(Husbandry.Offline.Verdict)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.6
IL_0002: ceq
IL_0004: ret

// System.Boolean Husbandry.Offline.Quickening::Company(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.2
IL_0002: clt
IL_0004: ldc.i4.0
IL_0005: ceq
IL_0007: ret

// System.Boolean Husbandry.Offline.Steward::get_Running()
.locals 
IL_0000: ldsfld System.Boolean Husbandry.Offline.Steward::<Running>k__BackingField
IL_0005: ret

// System.Void Husbandry.Offline.Steward::set_Running(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Boolean Husbandry.Offline.Steward::<Running>k__BackingField
IL_0006: ret

// System.Int32 Husbandry.Offline.Steward::get_Considered()
.locals 
IL_0000: ldsfld System.Int32 Husbandry.Offline.Steward::<Considered>k__BackingField
IL_0005: ret

// System.Void Husbandry.Offline.Steward::set_Considered(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Int32 Husbandry.Offline.Steward::<Considered>k__BackingField
IL_0006: ret

// System.Int32 Husbandry.Offline.Steward::get_Attended()
.locals 
IL_0000: ldsfld System.Int32 Husbandry.Offline.Steward::<Attended>k__BackingField
IL_0005: ret

// System.Void Husbandry.Offline.Steward::set_Attended(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Int32 Husbandry.Offline.Steward::<Attended>k__BackingField
IL_0006: ret

// System.Int32 Husbandry.Offline.Steward::get_Healed()
.locals 
IL_0000: ldsfld System.Int32 Husbandry.Offline.Steward::<Healed>k__BackingField
IL_0005: ret

// System.Void Husbandry.Offline.Steward::set_Healed(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Int32 Husbandry.Offline.Steward::<Healed>k__BackingField
IL_0006: ret

// System.Int32 Husbandry.Offline.Steward::get_Courted()
.locals 
IL_0000: ldsfld System.Int32 Husbandry.Offline.Steward::<Courted>k__BackingField
IL_0005: ret

// System.Void Husbandry.Offline.Steward::set_Courted(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Int32 Husbandry.Offline.Steward::<Courted>k__BackingField
IL_0006: ret

// System.Int32 Husbandry.Offline.Steward::get_Conceived()
.locals 
IL_0000: ldsfld System.Int32 Husbandry.Offline.Steward::<Conceived>k__BackingField
IL_0005: ret

// System.Void Husbandry.Offline.Steward::set_Conceived(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Int32 Husbandry.Offline.Steward::<Conceived>k__BackingField
IL_0006: ret

// System.Int32 Husbandry.Offline.Steward::get_Capped()
.locals 
IL_0000: ldsfld System.Int32 Husbandry.Offline.Steward::<Capped>k__BackingField
IL_0005: ret

// System.Void Husbandry.Offline.Steward::set_Capped(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Int32 Husbandry.Offline.Steward::<Capped>k__BackingField
IL_0006: ret

// System.Void Husbandry.Offline.Steward::ResetForTests()
.locals 
IL_0000: ldc.i4.0
IL_0001: call System.Void Husbandry.Offline.Steward::set_Running(System.Boolean)
IL_0006: ldc.i4.0
IL_0007: dup
IL_0008: call System.Void Husbandry.Offline.Steward::set_Capped(System.Int32)
IL_000d: dup
IL_000e: call System.Void Husbandry.Offline.Steward::set_Conceived(System.Int32)
IL_0013: dup
IL_0014: call System.Void Husbandry.Offline.Steward::set_Courted(System.Int32)
IL_0019: dup
IL_001a: call System.Void Husbandry.Offline.Steward::set_Healed(System.Int32)
IL_001f: dup
IL_0020: call System.Void Husbandry.Offline.Steward::set_Attended(System.Int32)
IL_0025: call System.Void Husbandry.Offline.Steward::set_Considered(System.Int32)
IL_002a: ldc.r4 0
IL_002f: stsfld System.Single Husbandry.Offline.Steward::_next
IL_0034: ldsflda Husbandry.Offline.Pasture/Cursor Husbandry.Offline.Steward::_cursor
IL_0039: initobj Husbandry.Offline.Pasture/Cursor
IL_003f: ldnull
IL_0040: stsfld System.Collections.Generic.List`1<System.String> Husbandry.Offline.Steward::_tameables
IL_0045: ldsfld Husbandry.Herd.Kinds Husbandry.Offline.Steward::Species
IL_004a: callvirt System.Void Husbandry.Herd.Kinds::Clear()
IL_004f: ldsfld Husbandry.Offline.Courtship Husbandry.Offline.Steward::Courting
IL_0054: callvirt System.Void Husbandry.Offline.Courtship::Clear()
IL_0059: ldsfld Husbandry.Herd.Census Husbandry.Offline.Steward::Settled
IL_005e: callvirt System.Void Husbandry.Herd.Census::Clear()
IL_0063: ldsfld System.Collections.Generic.List`1<Husbandry.Herd.Census/Head> Husbandry.Offline.Steward::Building
IL_0068: callvirt System.Void System.Collections.Generic.List`1<Husbandry.Herd.Census/Head>::Clear()
IL_006d: ldsfld System.Collections.Generic.HashSet`1<System.Int64> Husbandry.Offline.Steward::Present
IL_0072: callvirt System.Void System.Collections.Generic.HashSet`1<System.Int64>::Clear()
IL_0077: ret

// System.Boolean Husbandry.Offline.Steward::ShouldRun(System.Boolean,System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: and
IL_0003: ret

// System.Void Husbandry.Offline.Steward::Begin()
.locals 
IL_0000: ldc.i4.1
IL_0001: call System.Void Husbandry.Offline.Steward::set_Running(System.Boolean)
IL_0006: ldstr "Husbandry is looking after unattended tames on this machine."
IL_000b: call System.Void Husbandry.Util.Log::Info(System.String)
IL_0010: ret

// System.Void Husbandry.Offline.Steward::Tick()
.locals ZDOMan, ZNet
IL_0000: call System.Boolean Husbandry.Offline.Steward::get_Running()
IL_0005: brtrue.s IL_0008
IL_0007: ret
IL_0008: call System.Single UnityEngine.Time::get_time()
IL_000d: ldsfld System.Single Husbandry.Offline.Steward::_next
IL_0012: bge.un.s IL_0015
IL_0014: ret
IL_0015: call System.Single UnityEngine.Time::get_time()
IL_001a: ldc.r4 1
IL_001f: add
IL_0020: stsfld System.Single Husbandry.Offline.Steward::_next
IL_0025: call ZDOMan ZDOMan::get_instance()
IL_002a: stloc.0
IL_002b: call ZNet ZNet::get_instance()
IL_0030: stloc.1
IL_0031: ldloc.0
IL_0032: brfalse.s IL_003d
IL_0034: ldloc.1
IL_0035: ldnull
IL_0036: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_003b: brfalse.s IL_003e
IL_003d: ret
IL_003e: ldloc.1
IL_003f: call System.Void Husbandry.Offline.Steward::Gather(ZNet)
IL_0044: call System.Boolean Husbandry.Offline.Steward::Prefabs()
IL_0049: brtrue.s IL_004c
IL_004b: ret
IL_004c: ldloc.0
IL_004d: call System.Void Husbandry.Offline.Steward::Slice(ZDOMan)
IL_0052: ldsfld Husbandry.Offline.Courtship Husbandry.Offline.Steward::Courting
IL_0057: call System.Single UnityEngine.Time::get_time()
IL_005c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Husbandry.Config.HusbandryConfig::ForgetAfter
IL_0061: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0066: callvirt System.Int32 Husbandry.Offline.Courtship::Forget(System.Single,System.Single)
IL_006b: pop
IL_006c: ret

// System.Void Husbandry.Offline.Steward::Gather(ZNet)
.locals System.Collections.Generic.List`1<ZNetPeer>, System.Collections.Generic.List`1/Enumerator<ZNetPeer>, ZNetPeer
IL_0000: ldsfld System.Collections.Generic.HashSet`1<System.Int64> Husbandry.Offline.Steward::Present
IL_0005: callvirt System.Void System.Collections.Generic.HashSet`1<System.Int64>::Clear()
IL_000a: ldsfld System.Collections.Generic.HashSet`1<System.Int64> Husbandry.Offline.Steward::Present
IL_000f: call System.Int64 ZDOMan::GetSessionID()
IL_0014: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.Int64>::Add(!0)
IL_0019: pop
IL_001a: ldarg.0
IL_001b: callvirt System.Collections.Generic.List`1<ZNetPeer> ZNet::GetPeers()
IL_0020: stloc.0
IL_0021: ldloc.0
IL_0022: brtrue.s IL_0025
IL_0024: ret
IL_0025: ldloc.0
IL_0026: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<ZNetPeer>::GetEnumerator()
IL_002b: stloc.1
IL_002c: br.s IL_004a
IL_002e: ldloca.s V_1
IL_0030: call !0 System.Collections.Generic.List`1/Enumerator<ZNetPeer>::get_Current()
IL_0035: stloc.2
IL_0036: ldloc.2
IL_0037: brfalse.s IL_004a
IL_0039: ldsfld System.Collections.Generic.HashSet`1<System.Int64> Husbandry.Offline.Steward::Present
IL_003e: ldloc.2
IL_003f: ldfld System.Int64 ZNetPeer::m_uid
IL_0044: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.Int64>::Add(!0)
IL_0049: pop
IL_004a: ldloca.s V_1
IL_004c: call System.Boolean System.Collections.Generic.List`1/Enumerator<ZNetPeer>::MoveNext()
IL_0051: brtrue.s IL_002e
IL_0053: leave.s IL_0063
IL_0055: ldloca.s V_1
IL_0057: constrained. System.Collections.Generic.List`1/Enumerator<ZNetPeer>
IL_005d: callvirt System.Void System.IDisposable::Dispose()
IL_0062: endfinally
IL_0063: ret
// EH Finally: 44 - 85 => 85 - 99

// System.Boolean Husbandry.Offline.Steward::Prefabs()
.locals ZNetScene, System.Int32
IL_0000: ldsfld System.Collections.Generic.List`1<System.String> Husbandry.Offline.Steward::_tameables
IL_0005: brfalse.s IL_0015
IL_0007: ldsfld System.Collections.Generic.List`1<System.String> Husbandry.Offline.Steward::_tameables
IL_000c: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_0011: ldc.i4.0
IL_0012: cgt
IL_0014: ret
IL_0015: call ZNetScene ZNetScene::get_instance()
IL_001a: stloc.0
IL_001b: ldloc.0
IL_001c: ldnull
IL_001d: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0022: brtrue.s IL_002c
IL_0024: ldloc.0
IL_0025: ldfld System.Collections.Generic.List`1<UnityEngine.GameObject> ZNetScene::m_prefabs
IL_002a: brtrue.s IL_002e
IL_002c: ldc.i4.0
IL_002d: ret
IL_002e: ldloc.0
IL_002f: ldfld System.Collections.Generic.List`1<UnityEngine.GameObject> ZNetScene::m_prefabs
IL_0034: call System.Collections.Generic.List`1<System.String> Husbandry.Offline.Pasture::Tameables(System.Collections.Generic.IEnumerable`1<UnityEngine.GameObject>)
IL_0039: stsfld System.Collections.Generic.List`1<System.String> Husbandry.Offline.Steward::_tameables
IL_003e: ldsfld Husbandry.Herd.Kinds Husbandry.Offline.Steward::Species
IL_0043: ldloc.0
IL_0044: ldfld System.Collections.Generic.List`1<UnityEngine.GameObject> ZNetScene::m_prefabs
IL_0049: call System.Collections.Generic.List`1<Husbandry.Herd.Kinds/Kind> Husbandry.Herd.Kinds::Read(System.Collections.Generic.IEnumerable`1<UnityEngine.GameObject>)
IL_004e: callvirt System.Void Husbandry.Herd.Kinds::Load(System.Collections.Generic.IEnumerable`1<Husbandry.Herd.Kinds/Kind>)
IL_0053: ldc.i4.5
IL_0054: newarr System.String
IL_0059: dup
IL_005a: ldc.i4.0
IL_005b: ldstr "Husbandry found "
IL_0060: stelem.ref
IL_0061: dup
IL_0062: ldc.i4.1
IL_0063: ldsfld System.Collections.Generic.List`1<System.String> Husbandry.Offline.Steward::_tameables
IL_0068: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_006d: stloc.1
IL_006e: ldloca.s V_1
IL_0070: call System.String System.Int32::ToString()
IL_0075: stelem.ref
IL_0076: dup
IL_0077: ldc.i4.2
IL_0078: ldstr " tameable prefab(s), "
IL_007d: stelem.ref
IL_007e: dup
IL_007f: ldc.i4.3
IL_0080: ldsfld Husbandry.Herd.Kinds Husbandry.Offline.Steward::Species
IL_0085: callvirt System.Int32 Husbandry.Herd.Kinds::get_Count()
IL_008a: stloc.1
IL_008b: ldloca.s V_1
IL_008d: call System.String System.Int32::ToString()
IL_0092: stelem.ref
IL_0093: dup
IL_0094: ldc.i4.4
IL_0095: ldstr " with numbers read off the prefab."
IL_009a: stelem.ref
IL_009b: call System.String System.String::Concat(System.String[])
IL_00a0: call System.Void Husbandry.Util.Log::Info(System.String)
IL_00a5: ldsfld System.Collections.Generic.List`1<System.String> Husbandry.Offline.Steward::_tameables
IL_00aa: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_00af: ldc.i4.0
IL_00b0: cgt
IL_00b2: ret

// System.Void Husbandry.Offline.Steward::Slice(ZDOMan)
.locals System.String, System.Int32, System.Boolean, Husbandry.Herd.Kinds/Kind, Husbandry.Offline.Pasture/Cursor, System.Collections.Generic.List`1/Enumerator<ZDO>
IL_0000: ldsfld Husbandry.Offline.Pasture/Cursor Husbandry.Offline.Steward::_cursor
IL_0005: ldsfld System.Collections.Generic.List`1<System.String> Husbandry.Offline.Steward::_tameables
IL_000a: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_000f: call System.Boolean Husbandry.Offline.Pasture::Valid(Husbandry.Offline.Pasture/Cursor,System.Int32)
IL_0014: brtrue.s IL_0021
IL_0016: ldsflda Husbandry.Offline.Pasture/Cursor Husbandry.Offline.Steward::_cursor
IL_001b: initobj Husbandry.Offline.Pasture/Cursor
IL_0021: ldsfld System.Collections.Generic.List`1<System.String> Husbandry.Offline.Steward::_tameables
IL_0026: ldsflda Husbandry.Offline.Pasture/Cursor Husbandry.Offline.Steward::_cursor
IL_002b: ldfld System.Int32 Husbandry.Offline.Pasture/Cursor::Prefab
IL_0030: callvirt !0 System.Collections.Generic.List`1<System.String>::get_Item(System.Int32)
IL_0035: stloc.0
IL_0036: ldsfld System.Collections.Generic.List`1<ZDO> Husbandry.Offline.Steward::Batch
IL_003b: callvirt System.Void System.Collections.Generic.List`1<ZDO>::Clear()
IL_0040: ldsflda Husbandry.Offline.Pasture/Cursor Husbandry.Offline.Steward::_cursor
IL_0045: ldfld System.Int32 Husbandry.Offline.Pasture/Cursor::Index
IL_004a: stloc.1
IL_004b: ldarg.0
IL_004c: ldloc.0
IL_004d: ldsfld System.Collections.Generic.List`1<ZDO> Husbandry.Offline.Steward::Batch
IL_0052: ldloca.s V_1
IL_0054: callvirt System.Boolean ZDOMan::GetAllZDOsWithPrefabIterative(System.String,System.Collections.Generic.List`1<ZDO>,System.Int32&)
IL_0059: stloc.2
IL_005a: ldsfld Husbandry.Herd.Kinds Husbandry.Offline.Steward::Species
IL_005f: ldloc.0
IL_0060: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0065: ldloca.s V_3
IL_0067: callvirt System.Boolean Husbandry.Herd.Kinds::Find(System.Int32,Husbandry.Herd.Kinds/Kind&)
IL_006c: pop
IL_006d: ldsfld System.Collections.Generic.List`1<ZDO> Husbandry.Offline.Steward::Batch
IL_0072: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<ZDO>::GetEnumerator()
IL_0077: stloc.s V_5
IL_0079: br.s IL_0088
IL_007b: ldloca.s V_5
IL_007d: call !0 System.Collections.Generic.List`1/Enumerator<ZDO>::get_Current()
IL_0082: ldloc.3
IL_0083: call System.Void Husbandry.Offline.Steward::Consider(ZDO,Husbandry.Herd.Kinds/Kind)
IL_0088: ldloca.s V_5
IL_008a: call System.Boolean System.Collections.Generic.List`1/Enumerator<ZDO>::MoveNext()
IL_008f: brtrue.s IL_007b
IL_0091: leave.s IL_00a1
IL_0093: ldloca.s V_5
IL_0095: constrained. System.Collections.Generic.List`1/Enumerator<ZDO>
IL_009b: callvirt System.Void System.IDisposable::Dispose()
IL_00a0: endfinally
IL_00a1: ldloc.2
IL_00a2: brtrue.s IL_00b1
IL_00a4: ldsfld Husbandry.Offline.Pasture/Cursor Husbandry.Offline.Steward::_cursor
IL_00a9: ldloc.1
IL_00aa: call Husbandry.Offline.Pasture/Cursor Husbandry.Offline.Pasture::Continued(Husbandry.Offline.Pasture/Cursor,System.Int32)
IL_00af: br.s IL_00c5
IL_00b1: ldsfld Husbandry.Offline.Pasture/Cursor Husbandry.Offline.Steward::_cursor
IL_00b6: ldsfld System.Collections.Generic.List`1<System.String> Husbandry.Offline.Steward::_tameables
IL_00bb: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_00c0: call Husbandry.Offline.Pasture/Cursor Husbandry.Offline.Pasture::Next(Husbandry.Offline.Pasture/Cursor,System.Int32)
IL_00c5: stloc.s V_4
IL_00c7: ldsfld Husbandry.Offline.Pasture/Cursor Husbandry.Offline.Steward::_cursor
IL_00cc: ldloc.s V_4
IL_00ce: call System.Boolean Husbandry.Offline.Pasture::Wrapped(Husbandry.Offline.Pasture/Cursor,Husbandry.Offline.Pasture/Cursor)
IL_00d3: brfalse.s IL_00f3
IL_00d5: ldsfld Husbandry.Herd.Census Husbandry.Offline.Steward::Settled
IL_00da: ldsfld System.Collections.Generic.List`1<Husbandry.Herd.Census/Head> Husbandry.Offline.Steward::Building
IL_00df: call System.Single UnityEngine.Time::get_time()
IL_00e4: callvirt System.Void Husbandry.Herd.Census::Take(System.Collections.Generic.IEnumerable`1<Husbandry.Herd.Census/Head>,System.Single)
IL_00e9: ldsfld System.Collections.Generic.List`1<Husbandry.Herd.Census/Head> Husbandry.Offline.Steward::Building
IL_00ee: callvirt System.Void System.Collections.Generic.List`1<Husbandry.Herd.Census/Head>::Clear()
IL_00f3: ldloc.s V_4
IL_00f5: stsfld Husbandry.Offline.Pasture/Cursor Husbandry.Offline.Steward::_cursor
IL_00fa: ret
// EH Finally: 121 - 147 => 147 - 161

// System.Void Husbandry.Offline.Steward::Consider(ZDO,Husbandry.Herd.Kinds/Kind)
.locals UnityEngine.Vector3, System.Int64, Husbandry.Herd.Census/Head, System.DateTime
IL_0000: ldarg.0
IL_0001: brtrue.s IL_0004
IL_0003: ret
IL_0004: ldarg.0
IL_0005: ldsfld System.Int32 ZDOVars::s_tamed
IL_000a: ldc.i4.0
IL_000b: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_0010: brtrue.s IL_0013
IL_0012: ret
IL_0013: ldarg.0
IL_0014: callvirt UnityEngine.Vector3 ZDO::GetPosition()
IL_0019: stloc.0
IL_001a: call System.Int32 Husbandry.Offline.Steward::get_Considered()
IL_001f: ldc.i4.1
IL_0020: add
IL_0021: call System.Void Husbandry.Offline.Steward::set_Considered(System.Int32)
IL_0026: ldsfld System.Collections.Generic.List`1<Husbandry.Herd.Census/Head> Husbandry.Offline.Steward::Building
IL_002b: ldloca.s V_2
IL_002d: initobj Husbandry.Herd.Census/Head
IL_0033: ldloca.s V_2
IL_0035: ldarg.1
IL_0036: ldfld System.Int32 Husbandry.Herd.Kinds/Kind::Hash
IL_003b: stfld System.Int32 Husbandry.Herd.Census/Head::Prefab
IL_0040: ldloca.s V_2
IL_0042: ldloc.0
IL_0043: stfld UnityEngine.Vector3 Husbandry.Herd.Census/Head::Where
IL_0048: ldloca.s V_2
IL_004a: ldc.i4.1
IL_004b: stfld System.Boolean Husbandry.Herd.Census/Head::Tamed
IL_0050: ldloc.2
IL_0051: callvirt System.Void System.Collections.Generic.List`1<Husbandry.Herd.Census/Head>::Add(!0)
IL_0056: ldarg.0
IL_0057: callvirt System.Boolean ZDO::HasOwner()
IL_005c: ldsfld System.Collections.Generic.HashSet`1<System.Int64> Husbandry.Offline.Steward::Present
IL_0061: ldarg.0
IL_0062: callvirt System.Int64 ZDO::GetOwner()
IL_0067: callvirt System.Boolean System.Collections.Generic.HashSet`1<System.Int64>::Contains(!0)
IL_006c: call System.Boolean Husbandry.Offline.Untended::Yes(System.Boolean,System.Boolean)
IL_0071: brtrue.s IL_0080
IL_0073: call System.Int32 Husbandry.Offline.Steward::get_Attended()
IL_0078: ldc.i4.1
IL_0079: add
IL_007a: call System.Void Husbandry.Offline.Steward::set_Attended(System.Int32)
IL_007f: ret
IL_0080: call ZNet ZNet::get_instance()
IL_0085: callvirt System.DateTime ZNet::GetTime()
IL_008a: stloc.3
IL_008b: ldloca.s V_3
IL_008d: call System.Int64 System.DateTime::get_Ticks()
IL_0092: stloc.1
IL_0093: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::OfflineHealing
IL_0098: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_009d: brfalse.s IL_00a6
IL_009f: ldarg.0
IL_00a0: ldarg.1
IL_00a1: call System.Void Husbandry.Offline.Steward::Mend(ZDO,Husbandry.Herd.Kinds/Kind)
IL_00a6: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::OfflineBreeding
IL_00ab: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_00b0: brfalse.s IL_00c3
IL_00b2: ldarg.1
IL_00b3: ldfld System.Boolean Husbandry.Herd.Kinds/Kind::Breeds
IL_00b8: brfalse.s IL_00c3
IL_00ba: ldarg.0
IL_00bb: ldarg.1
IL_00bc: ldloc.0
IL_00bd: ldloc.1
IL_00be: call System.Void Husbandry.Offline.Steward::Breed(ZDO,Husbandry.Herd.Kinds/Kind,UnityEngine.Vector3,System.Int64)
IL_00c3: ret

// System.Void Husbandry.Offline.Steward::Mend(ZDO,Husbandry.Herd.Kinds/Kind)
.locals System.Single, System.Single, System.Single
IL_0000: ldarg.0
IL_0001: ldsfld System.Int32 ZDOVars::s_health
IL_0006: ldc.r4 -1
IL_000b: callvirt System.Single ZDO::GetFloat(System.Int32,System.Single)
IL_0010: stloc.0
IL_0011: ldloc.0
IL_0012: ldc.r4 0
IL_0017: bge.un.s IL_001a
IL_0019: ret
IL_001a: ldarg.0
IL_001b: ldsfld System.Int32 ZDOVars::s_maxHealth
IL_0020: ldarg.1
IL_0021: ldfld System.Single Husbandry.Herd.Kinds/Kind::MaxHealth
IL_0026: callvirt System.Single ZDO::GetFloat(System.Int32,System.Single)
IL_002b: stloc.1
IL_002c: ldloc.0
IL_002d: ldloc.1
IL_002e: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Husbandry.Config.HusbandryConfig::HealPerSecond
IL_0033: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0038: ldc.r8 1
IL_0041: call System.Single Husbandry.Offline.Mending::Restored(System.Single,System.Single,System.Single,System.Double)
IL_0046: stloc.2
IL_0047: ldloc.0
IL_0048: ldloc.2
IL_0049: call System.Boolean Husbandry.Offline.Mending::Worth(System.Single,System.Single)
IL_004e: brtrue.s IL_0051
IL_0050: ret
IL_0051: ldarg.0
IL_0052: ldsfld System.Int32 ZDOVars::s_health
IL_0057: ldloc.2
IL_0058: callvirt System.Void ZDO::Set(System.Int32,System.Single)
IL_005d: call System.Int32 Husbandry.Offline.Steward::get_Healed()
IL_0062: ldc.i4.1
IL_0063: add
IL_0064: call System.Void Husbandry.Offline.Steward::set_Healed(System.Int32)
IL_0069: ret

// System.Void Husbandry.Offline.Steward::Breed(ZDO,Husbandry.Herd.Kinds/Kind,UnityEngine.Vector3,System.Int64)
.locals System.Boolean, System.Boolean, System.Boolean, System.Int32, System.Boolean, Husbandry.Offline.Verdict
IL_0000: ldsfld Husbandry.Offline.Courtship Husbandry.Offline.Steward::Courting
IL_0005: ldarg.0
IL_0006: ldfld ZDOID ZDO::m_uid
IL_000b: call System.Single UnityEngine.Time::get_time()
IL_0010: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Husbandry.Config.HusbandryConfig::CourtingInterval
IL_0015: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_001a: callvirt System.Boolean Husbandry.Offline.Courtship::Ready(ZDOID,System.Single,System.Single)
IL_001f: brtrue.s IL_0022
IL_0021: ret
IL_0022: ldarg.0
IL_0023: ldsfld System.Int32 ZDOVars::s_pregnant
IL_0028: ldc.i4.0
IL_0029: conv.i8
IL_002a: callvirt System.Int64 ZDO::GetLong(System.Int32,System.Int64)
IL_002f: call System.Boolean Husbandry.Offline.Quickening::Carrying(System.Int64)
IL_0034: stloc.0
IL_0035: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::OfflineHunger
IL_003a: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_003f: brfalse.s IL_005d
IL_0041: ldarg.0
IL_0042: ldsfld System.Int32 ZDOVars::s_tameLastFeeding
IL_0047: ldc.i4.0
IL_0048: conv.i8
IL_0049: callvirt System.Int64 ZDO::GetLong(System.Int32,System.Int64)
IL_004e: ldarg.3
IL_004f: ldarg.1
IL_0050: ldfld System.Single Husbandry.Herd.Kinds/Kind::FedDuration
IL_0055: conv.r8
IL_0056: call System.Boolean Husbandry.Offline.Clocks::Elapsed(System.Int64,System.Int64,System.Double)
IL_005b: br.s IL_005e
IL_005d: ldc.i4.0
IL_005e: stloc.1
IL_005f: ldsfld Husbandry.Herd.Census Husbandry.Offline.Steward::Settled
IL_0064: ldarg.1
IL_0065: ldfld System.Int32 Husbandry.Herd.Kinds/Kind::Hash
IL_006a: ldarg.2
IL_006b: ldarg.1
IL_006c: ldfld System.Single Husbandry.Herd.Kinds/Kind::PartnerCheckRange
IL_0071: callvirt System.Int32 Husbandry.Herd.Census::Within(System.Int32,UnityEngine.Vector3,System.Single)
IL_0076: call System.Boolean Husbandry.Offline.Quickening::Company(System.Int32)
IL_007b: stloc.2
IL_007c: ldarg.1
IL_007d: ldfld System.Int32 Husbandry.Herd.Kinds/Kind::MaxCreatures
IL_0082: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> Husbandry.Config.HusbandryConfig::SoftCap
IL_0087: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_008c: call System.Int32 Husbandry.Herd.Cap::Effective(System.Int32,System.Int32)
IL_0091: stloc.3
IL_0092: ldsfld Husbandry.Herd.Census Husbandry.Offline.Steward::Settled
IL_0097: ldarg.1
IL_0098: ldfld System.Int32 Husbandry.Herd.Kinds/Kind::Hash
IL_009d: callvirt System.Int32 Husbandry.Herd.Census::Total(System.Int32)
IL_00a2: ldloc.3
IL_00a3: call System.Boolean Husbandry.Herd.Cap::CertainlyUnder(System.Int32,System.Int32)
IL_00a8: brtrue.s IL_00cc
IL_00aa: ldsfld Husbandry.Herd.Census Husbandry.Offline.Steward::Settled
IL_00af: ldarg.1
IL_00b0: ldfld System.Int32 Husbandry.Herd.Kinds/Kind::Hash
IL_00b5: ldarg.2
IL_00b6: ldarg.1
IL_00b7: ldfld System.Single Husbandry.Herd.Kinds/Kind::TotalCheckRange
IL_00bc: callvirt System.Int32 Husbandry.Herd.Census::Within(System.Int32,UnityEngine.Vector3,System.Single)
IL_00c1: ldloc.3
IL_00c2: call System.Boolean Husbandry.Herd.Cap::Reached(System.Int32,System.Int32)
IL_00c7: ldc.i4.0
IL_00c8: ceq
IL_00ca: br.s IL_00cd
IL_00cc: ldc.i4.1
IL_00cd: stloc.s V_4
IL_00cf: ldc.i4.1
IL_00d0: ldloc.0
IL_00d1: ldloc.2
IL_00d2: ldloc.1
IL_00d3: ldloc.s V_4
IL_00d5: ldarg.0
IL_00d6: ldsfld System.Int32 ZDOVars::s_lovePoints
IL_00db: ldc.i4.0
IL_00dc: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_00e1: ldarg.1
IL_00e2: ldfld System.Int32 Husbandry.Herd.Kinds/Kind::RequiredLovePoints
IL_00e7: call Husbandry.Offline.Verdict Husbandry.Offline.Quickening::Judge(System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Int32,System.Int32)
IL_00ec: stloc.s V_5
IL_00ee: ldsfld Husbandry.Offline.Courtship Husbandry.Offline.Steward::Courting
IL_00f3: ldarg.0
IL_00f4: ldfld ZDOID ZDO::m_uid
IL_00f9: call System.Single UnityEngine.Time::get_time()
IL_00fe: callvirt System.Void Husbandry.Offline.Courtship::Courted(ZDOID,System.Single)
IL_0103: ldloc.s V_5
IL_0105: call System.Boolean Husbandry.Offline.Quickening::Courts(Husbandry.Offline.Verdict)
IL_010a: brfalse.s IL_0133
IL_010c: ldarg.0
IL_010d: ldsfld System.Int32 ZDOVars::s_lovePoints
IL_0112: ldarg.0
IL_0113: ldsfld System.Int32 ZDOVars::s_lovePoints
IL_0118: ldc.i4.0
IL_0119: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_011e: ldc.i4.1
IL_011f: add
IL_0120: ldc.i4.0
IL_0121: callvirt System.Void ZDO::Set(System.Int32,System.Int32,System.Boolean)
IL_0126: call System.Int32 Husbandry.Offline.Steward::get_Courted()
IL_012b: ldc.i4.1
IL_012c: add
IL_012d: call System.Void Husbandry.Offline.Steward::set_Courted(System.Int32)
IL_0132: ret
IL_0133: ldloc.s V_5
IL_0135: call System.Boolean Husbandry.Offline.Quickening::Conceives(Husbandry.Offline.Verdict)
IL_013a: brtrue.s IL_014e
IL_013c: ldloc.s V_5
IL_013e: ldc.i4.4
IL_013f: bne.un.s IL_014d
IL_0141: call System.Int32 Husbandry.Offline.Steward::get_Capped()
IL_0146: ldc.i4.1
IL_0147: add
IL_0148: call System.Void Husbandry.Offline.Steward::set_Capped(System.Int32)
IL_014d: ret
IL_014e: ldarg.0
IL_014f: ldsfld System.Int32 ZDOVars::s_pregnant
IL_0154: ldarg.3
IL_0155: callvirt System.Void ZDO::Set(System.Int32,System.Int64)
IL_015a: ldarg.0
IL_015b: ldsfld System.Int32 ZDOVars::s_lovePoints
IL_0160: ldc.i4.0
IL_0161: ldc.i4.0
IL_0162: callvirt System.Void ZDO::Set(System.Int32,System.Int32,System.Boolean)
IL_0167: call System.Int32 Husbandry.Offline.Steward::get_Conceived()
IL_016c: ldc.i4.1
IL_016d: add
IL_016e: call System.Void Husbandry.Offline.Steward::set_Conceived(System.Int32)
IL_0173: ldstr "husbandry: an unattended "
IL_0178: ldarg.1
IL_0179: ldfld System.String Husbandry.Herd.Kinds/Kind::Name
IL_017e: ldstr " is expecting"
IL_0183: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0188: call System.Void Husbandry.Util.Log::Debug(System.String)
IL_018d: ret

// System.Collections.Generic.List`1<System.String> Husbandry.Offline.Steward::Report()
.locals System.Collections.Generic.List`1<System.String>, System.Int32
IL_0000: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_0005: dup
IL_0006: ldstr "--- husbandry (offline) ---"
IL_000b: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0010: stloc.0
IL_0011: call System.Boolean Husbandry.Offline.Steward::get_Running()
IL_0016: brtrue.s IL_0025
IL_0018: ldloc.0
IL_0019: ldstr "  not running - this machine does not hold the world"
IL_001e: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0023: ldloc.0
IL_0024: ret
IL_0025: ldloc.0
IL_0026: ldc.i4.s 9
IL_0028: newarr System.String
IL_002d: dup
IL_002e: ldc.i4.0
IL_002f: ldstr "  watching   "
IL_0034: stelem.ref
IL_0035: dup
IL_0036: ldc.i4.1
IL_0037: ldsfld System.Collections.Generic.List`1<System.String> Husbandry.Offline.Steward::_tameables
IL_003c: brfalse.s IL_004a
IL_003e: ldsfld System.Collections.Generic.List`1<System.String> Husbandry.Offline.Steward::_tameables
IL_0043: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_0048: br.s IL_004b
IL_004a: ldc.i4.0
IL_004b: stloc.1
IL_004c: ldloca.s V_1
IL_004e: call System.String System.Int32::ToString()
IL_0053: stelem.ref
IL_0054: dup
IL_0055: ldc.i4.2
IL_0056: ldstr " tameable prefab(s), cursor "
IL_005b: stelem.ref
IL_005c: dup
IL_005d: ldc.i4.3
IL_005e: ldsflda Husbandry.Offline.Pasture/Cursor Husbandry.Offline.Steward::_cursor
IL_0063: ldflda System.Int32 Husbandry.Offline.Pasture/Cursor::Prefab
IL_0068: call System.String System.Int32::ToString()
IL_006d: stelem.ref
IL_006e: dup
IL_006f: ldc.i4.4
IL_0070: ldstr "/"
IL_0075: stelem.ref
IL_0076: dup
IL_0077: ldc.i4.5
IL_0078: ldsflda Husbandry.Offline.Pasture/Cursor Husbandry.Offline.Steward::_cursor
IL_007d: ldflda System.Int32 Husbandry.Offline.Pasture/Cursor::Index
IL_0082: call System.String System.Int32::ToString()
IL_0087: stelem.ref
IL_0088: dup
IL_0089: ldc.i4.6
IL_008a: ldstr ", "
IL_008f: stelem.ref
IL_0090: dup
IL_0091: ldc.i4.7
IL_0092: ldsflda Husbandry.Offline.Pasture/Cursor Husbandry.Offline.Steward::_cursor
IL_0097: ldflda System.Int32 Husbandry.Offline.Pasture/Cursor::Passes
IL_009c: call System.String System.Int32::ToString()
IL_00a1: stelem.ref
IL_00a2: dup
IL_00a3: ldc.i4.8
IL_00a4: ldstr " full pass(es)"
IL_00a9: stelem.ref
IL_00aa: call System.String System.String::Concat(System.String[])
IL_00af: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_00b4: ldloc.0
IL_00b5: ldc.i4.5
IL_00b6: newarr System.String
IL_00bb: dup
IL_00bc: ldc.i4.0
IL_00bd: ldstr "  census     "
IL_00c2: stelem.ref
IL_00c3: dup
IL_00c4: ldc.i4.1
IL_00c5: ldsfld Husbandry.Herd.Census Husbandry.Offline.Steward::Settled
IL_00ca: callvirt System.Int32 Husbandry.Herd.Census::get_Counted()
IL_00cf: stloc.1
IL_00d0: ldloca.s V_1
IL_00d2: call System.String System.Int32::ToString()
IL_00d7: stelem.ref
IL_00d8: dup
IL_00d9: ldc.i4.2
IL_00da: ldstr " tame(s) across "
IL_00df: stelem.ref
IL_00e0: dup
IL_00e1: ldc.i4.3
IL_00e2: ldsfld Husbandry.Herd.Census Husbandry.Offline.Steward::Settled
IL_00e7: callvirt System.Int32 Husbandry.Herd.Census::get_Species()
IL_00ec: stloc.1
IL_00ed: ldloca.s V_1
IL_00ef: call System.String System.Int32::ToString()
IL_00f4: stelem.ref
IL_00f5: dup
IL_00f6: ldc.i4.4
IL_00f7: ldstr " species"
IL_00fc: stelem.ref
IL_00fd: call System.String System.String::Concat(System.String[])
IL_0102: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0107: ldloc.0
IL_0108: ldc.i4.5
IL_0109: newarr System.String
IL_010e: dup
IL_010f: ldc.i4.0
IL_0110: ldstr "  tames      "
IL_0115: stelem.ref
IL_0116: dup
IL_0117: ldc.i4.1
IL_0118: call System.Int32 Husbandry.Offline.Steward::get_Considered()
IL_011d: stloc.1
IL_011e: ldloca.s V_1
IL_0120: call System.String System.Int32::ToString()
IL_0125: stelem.ref
IL_0126: dup
IL_0127: ldc.i4.2
IL_0128: ldstr " considered, "
IL_012d: stelem.ref
IL_012e: dup
IL_012f: ldc.i4.3
IL_0130: call System.Int32 Husbandry.Offline.Steward::get_Attended()
IL_0135: stloc.1
IL_0136: ldloca.s V_1
IL_0138: call System.String System.Int32::ToString()
IL_013d: stelem.ref
IL_013e: dup
IL_013f: ldc.i4.4
IL_0140: ldstr " left to the client holding them"
IL_0145: stelem.ref
IL_0146: call System.String System.String::Concat(System.String[])
IL_014b: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0150: ldloc.0
IL_0151: ldc.i4.s 9
IL_0153: newarr System.String
IL_0158: dup
IL_0159: ldc.i4.0
IL_015a: ldstr "  upkeep     "
IL_015f: stelem.ref
IL_0160: dup
IL_0161: ldc.i4.1
IL_0162: call System.Int32 Husbandry.Offline.Steward::get_Healed()
IL_0167: stloc.1
IL_0168: ldloca.s V_1
IL_016a: call System.String System.Int32::ToString()
IL_016f: stelem.ref
IL_0170: dup
IL_0171: ldc.i4.2
IL_0172: ldstr " healed, "
IL_0177: stelem.ref
IL_0178: dup
IL_0179: ldc.i4.3
IL_017a: call System.Int32 Husbandry.Offline.Steward::get_Courted()
IL_017f: stloc.1
IL_0180: ldloca.s V_1
IL_0182: call System.String System.Int32::ToString()
IL_0187: stelem.ref
IL_0188: dup
IL_0189: ldc.i4.4
IL_018a: ldstr " courting, "
IL_018f: stelem.ref
IL_0190: dup
IL_0191: ldc.i4.5
IL_0192: call System.Int32 Husbandry.Offline.Steward::get_Conceived()
IL_0197: stloc.1
IL_0198: ldloca.s V_1
IL_019a: call System.String System.Int32::ToString()
IL_019f: stelem.ref
IL_01a0: dup
IL_01a1: ldc.i4.6
IL_01a2: ldstr " expecting, "
IL_01a7: stelem.ref
IL_01a8: dup
IL_01a9: ldc.i4.7
IL_01aa: call System.Int32 Husbandry.Offline.Steward::get_Capped()
IL_01af: stloc.1
IL_01b0: ldloca.s V_1
IL_01b2: call System.String System.Int32::ToString()
IL_01b7: stelem.ref
IL_01b8: dup
IL_01b9: ldc.i4.8
IL_01ba: ldstr " held at the cap"
IL_01bf: stelem.ref
IL_01c0: call System.String System.String::Concat(System.String[])
IL_01c5: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_01ca: ldloc.0
IL_01cb: ldstr "  clocks     "
IL_01d0: ldsfld Husbandry.Offline.Courtship Husbandry.Offline.Steward::Courting
IL_01d5: callvirt System.Int32 Husbandry.Offline.Courtship::get_Count()
IL_01da: stloc.1
IL_01db: ldloca.s V_1
IL_01dd: call System.String System.Int32::ToString()
IL_01e2: ldstr " courting clock(s)"
IL_01e7: call System.String System.String::Concat(System.String,System.String,System.String)
IL_01ec: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_01f1: ldloc.0
IL_01f2: ret

// System.Void Husbandry.Offline.Steward::.cctor()
.locals 
IL_0000: newobj System.Void Husbandry.Herd.Kinds::.ctor()
IL_0005: stsfld Husbandry.Herd.Kinds Husbandry.Offline.Steward::Species
IL_000a: newobj System.Void Husbandry.Offline.Courtship::.ctor()
IL_000f: stsfld Husbandry.Offline.Courtship Husbandry.Offline.Steward::Courting
IL_0014: newobj System.Void Husbandry.Herd.Census::.ctor()
IL_0019: stsfld Husbandry.Herd.Census Husbandry.Offline.Steward::Settled
IL_001e: newobj System.Void System.Collections.Generic.List`1<Husbandry.Herd.Census/Head>::.ctor()
IL_0023: stsfld System.Collections.Generic.List`1<Husbandry.Herd.Census/Head> Husbandry.Offline.Steward::Building
IL_0028: newobj System.Void System.Collections.Generic.HashSet`1<System.Int64>::.ctor()
IL_002d: stsfld System.Collections.Generic.HashSet`1<System.Int64> Husbandry.Offline.Steward::Present
IL_0032: newobj System.Void System.Collections.Generic.List`1<ZDO>::.ctor()
IL_0037: stsfld System.Collections.Generic.List`1<ZDO> Husbandry.Offline.Steward::Batch
IL_003c: ret

// System.Boolean Husbandry.Offline.Untended::Yes(System.Boolean,System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: brfalse.s IL_0008
IL_0003: ldarg.1
IL_0004: ldc.i4.0
IL_0005: ceq
IL_0007: ret
IL_0008: ldc.i4.1
IL_0009: ret

// System.Int32 Husbandry.Idle.Cadence::Every(System.Single,System.Single,System.Single,System.Int32,System.Int32)
.locals 
IL_0000: ldarg.3
IL_0001: ldc.i4.1
IL_0002: bge.s IL_0007
IL_0004: ldc.i4.1
IL_0005: starg.s midSkip
IL_0007: ldarg.s farSkip
IL_0009: ldc.i4.1
IL_000a: bge.s IL_000f
IL_000c: ldc.i4.1
IL_000d: starg.s farSkip
IL_000f: ldarg.0
IL_0010: ldc.r4 0
IL_0015: blt.s IL_001f
IL_0017: ldarg.0
IL_0018: call System.Boolean System.Single::IsNaN(System.Single)
IL_001d: brfalse.s IL_0021
IL_001f: ldc.i4.1
IL_0020: ret
IL_0021: ldarg.0
IL_0022: ldarg.1
IL_0023: bgt.un.s IL_0027
IL_0025: ldc.i4.1
IL_0026: ret
IL_0027: ldarg.0
IL_0028: ldarg.2
IL_0029: bgt.un.s IL_002d
IL_002b: ldarg.3
IL_002c: ret
IL_002d: ldarg.s farSkip
IL_002f: ret

// System.Single Husbandry.Idle.Cadence::FromCamera(UnityEngine.Vector3,System.Boolean,UnityEngine.Vector3)
.locals 
IL_0000: ldarg.1
IL_0001: brtrue.s IL_0009
IL_0003: ldc.r4 -1
IL_0008: ret
IL_0009: ldarg.0
IL_000a: ldarg.2
IL_000b: call System.Single UnityEngine.Vector3::Distance(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0010: ret

// System.Int32 Husbandry.Idle.Drowse::get_Skipped()
.locals 
IL_0000: ldsfld System.Int32 Husbandry.Idle.Drowse::<Skipped>k__BackingField
IL_0005: ret

// System.Void Husbandry.Idle.Drowse::set_Skipped(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Int32 Husbandry.Idle.Drowse::<Skipped>k__BackingField
IL_0006: ret

// System.Int32 Husbandry.Idle.Drowse::get_Thought()
.locals 
IL_0000: ldsfld System.Int32 Husbandry.Idle.Drowse::<Thought>k__BackingField
IL_0005: ret

// System.Void Husbandry.Idle.Drowse::set_Thought(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Int32 Husbandry.Idle.Drowse::<Thought>k__BackingField
IL_0006: ret

// System.Int32 Husbandry.Idle.Drowse::get_Dozing()
.locals 
IL_0000: ldsfld System.Int32 Husbandry.Idle.Drowse::<Dozing>k__BackingField
IL_0005: ret

// System.Void Husbandry.Idle.Drowse::set_Dozing(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Int32 Husbandry.Idle.Drowse::<Dozing>k__BackingField
IL_0006: ret

// System.Void Husbandry.Idle.Drowse::ResetForTests()
.locals 
IL_0000: ldc.i4.0
IL_0001: call System.Void Husbandry.Idle.Drowse::set_Skipped(System.Int32)
IL_0006: ldc.i4.0
IL_0007: call System.Void Husbandry.Idle.Drowse::set_Thought(System.Int32)
IL_000c: ldc.i4.0
IL_000d: call System.Void Husbandry.Idle.Drowse::set_Dozing(System.Int32)
IL_0012: ret

// System.Boolean Husbandry.Idle.Drowse::Skip(BaseAI,System.Single&)
.locals Husbandry.Idle.Drowse/Holder, System.Int32, System.Single
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0007: brfalse.s IL_000b
IL_0009: ldc.i4.0
IL_000a: ret
IL_000b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::ThrottleIdle
IL_0010: brfalse.s IL_001e
IL_0012: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::ThrottleIdle
IL_0017: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_001c: brtrue.s IL_0020
IL_001e: ldc.i4.0
IL_001f: ret
IL_0020: ldsfld System.Runtime.CompilerServices.ConditionalWeakTable`2<BaseAI,Husbandry.Idle.Drowse/Holder> Husbandry.Idle.Drowse::Banks
IL_0025: ldarg.0
IL_0026: callvirt !1 System.Runtime.CompilerServices.ConditionalWeakTable`2<BaseAI,Husbandry.Idle.Drowse/Holder>::GetOrCreateValue(!0)
IL_002b: stloc.0
IL_002c: ldarg.0
IL_002d: call System.Boolean Husbandry.Idle.Drowse::Dozy(BaseAI)
IL_0032: brtrue.s IL_0051
IL_0034: ldarg.1
IL_0035: ldloc.0
IL_0036: ldflda Husbandry.Idle.Nap Husbandry.Idle.Drowse/Holder::Nap
IL_003b: ldarg.1
IL_003c: ldind.r4
IL_003d: call System.Single Husbandry.Idle.Nap::Wake(Husbandry.Idle.Nap&,System.Single)
IL_0042: stind.r4
IL_0043: call System.Int32 Husbandry.Idle.Drowse::get_Thought()
IL_0048: ldc.i4.1
IL_0049: add
IL_004a: call System.Void Husbandry.Idle.Drowse::set_Thought(System.Int32)
IL_004f: ldc.i4.0
IL_0050: ret
IL_0051: call System.Int32 Husbandry.Idle.Drowse::get_Dozing()
IL_0056: ldc.i4.1
IL_0057: add
IL_0058: call System.Void Husbandry.Idle.Drowse::set_Dozing(System.Int32)
IL_005d: ldarg.0
IL_005e: call System.Single Husbandry.Idle.Drowse::Distance(BaseAI)
IL_0063: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Husbandry.Config.HusbandryConfig::NearRange
IL_0068: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_006d: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Husbandry.Config.HusbandryConfig::FarRange
IL_0072: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0077: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> Husbandry.Config.HusbandryConfig::MidSkip
IL_007c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0081: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> Husbandry.Config.HusbandryConfig::FarSkip
IL_0086: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_008b: call System.Int32 Husbandry.Idle.Cadence::Every(System.Single,System.Single,System.Single,System.Int32,System.Int32)
IL_0090: stloc.1
IL_0091: ldloc.0
IL_0092: ldflda Husbandry.Idle.Nap Husbandry.Idle.Drowse/Holder::Nap
IL_0097: ldloc.1
IL_0098: ldarg.1
IL_0099: ldind.r4
IL_009a: ldloca.s V_2
IL_009c: call System.Boolean Husbandry.Idle.Nap::Think(Husbandry.Idle.Nap&,System.Int32,System.Single,System.Single&)
IL_00a1: brfalse.s IL_00b4
IL_00a3: ldarg.1
IL_00a4: ldloc.2
IL_00a5: stind.r4
IL_00a6: call System.Int32 Husbandry.Idle.Drowse::get_Thought()
IL_00ab: ldc.i4.1
IL_00ac: add
IL_00ad: call System.Void Husbandry.Idle.Drowse::set_Thought(System.Int32)
IL_00b2: ldc.i4.0
IL_00b3: ret
IL_00b4: call System.Int32 Husbandry.Idle.Drowse::get_Skipped()
IL_00b9: ldc.i4.1
IL_00ba: add
IL_00bb: call System.Void Husbandry.Idle.Drowse::set_Skipped(System.Int32)
IL_00c0: ldc.i4.1
IL_00c1: ret

// System.Boolean Husbandry.Idle.Drowse::Dozy(BaseAI)
.locals Character, ZNetView, MonsterAI, System.Boolean
IL_0000: ldarg.0
IL_0001: callvirt !!0 UnityEngine.Component::GetComponent<Character>()
IL_0006: stloc.0
IL_0007: ldarg.0
IL_0008: callvirt !!0 UnityEngine.Component::GetComponent<ZNetView>()
IL_000d: stloc.1
IL_000e: ldloc.0
IL_000f: ldnull
IL_0010: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0015: brfalse.s IL_001f
IL_0017: ldloc.0
IL_0018: callvirt System.Boolean Character::IsTamed()
IL_001d: br.s IL_0020
IL_001f: ldc.i4.0
IL_0020: ldloc.1
IL_0021: ldnull
IL_0022: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0027: brfalse.s IL_0031
IL_0029: ldloc.1
IL_002a: callvirt System.Boolean ZNetView::IsValid()
IL_002f: br.s IL_0032
IL_0031: ldc.i4.0
IL_0032: ldloc.1
IL_0033: ldnull
IL_0034: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0039: brfalse.s IL_0043
IL_003b: ldloc.1
IL_003c: callvirt System.Boolean ZNetView::IsOwner()
IL_0041: br.s IL_0044
IL_0043: ldc.i4.0
IL_0044: call System.Boolean Husbandry.Herd.Beast::Ours(System.Boolean,System.Boolean,System.Boolean)
IL_0049: ldarg.0
IL_004a: isinst MonsterAI
IL_004f: stloc.2
IL_0050: ldloc.2
IL_0051: ldnull
IL_0052: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0057: brfalse.s IL_0067
IL_0059: ldloc.2
IL_005a: callvirt UnityEngine.GameObject MonsterAI::GetFollowTarget()
IL_005f: ldnull
IL_0060: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0065: br.s IL_0068
IL_0067: ldc.i4.0
IL_0068: stloc.3
IL_0069: ldarg.0
IL_006a: callvirt System.Boolean BaseAI::IsAlerted()
IL_006f: ldarg.0
IL_0070: callvirt Character BaseAI::GetTargetCreature()
IL_0075: ldnull
IL_0076: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_007b: ldloc.3
IL_007c: call System.Boolean Husbandry.Herd.Beast::Dozy(System.Boolean,System.Boolean,System.Boolean,System.Boolean)
IL_0081: ret

// System.Single Husbandry.Idle.Drowse::Distance(BaseAI)
.locals Player
IL_0000: ldsfld Player Player::m_localPlayer
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldnull
IL_0008: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000d: brfalse.s IL_0015
IL_000f: ldc.r4 -1
IL_0014: ret
IL_0015: ldarg.0
IL_0016: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_001b: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0020: ldc.i4.1
IL_0021: ldloc.0
IL_0022: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0027: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_002c: call System.Single Husbandry.Idle.Cadence::FromCamera(UnityEngine.Vector3,System.Boolean,UnityEngine.Vector3)
IL_0031: ret

// System.Void Husbandry.Idle.Drowse::.cctor()
.locals 
IL_0000: newobj System.Void System.Runtime.CompilerServices.ConditionalWeakTable`2<BaseAI,Husbandry.Idle.Drowse/Holder>::.ctor()
IL_0005: stsfld System.Runtime.CompilerServices.ConditionalWeakTable`2<BaseAI,Husbandry.Idle.Drowse/Holder> Husbandry.Idle.Drowse::Banks
IL_000a: ret

// System.Void Husbandry.Idle.Drowse/Holder::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean Husbandry.Idle.Nap::Think(Husbandry.Idle.Nap&,System.Int32,System.Single,System.Single&)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.1
IL_0002: bgt.s IL_0017
IL_0004: ldarg.3
IL_0005: ldarg.2
IL_0006: ldarg.0
IL_0007: ldfld System.Single Husbandry.Idle.Nap::Banked
IL_000c: add
IL_000d: stind.r4
IL_000e: ldarg.0
IL_000f: initobj Husbandry.Idle.Nap
IL_0015: ldc.i4.1
IL_0016: ret
IL_0017: ldarg.0
IL_0018: ldflda System.Single Husbandry.Idle.Nap::Banked
IL_001d: dup
IL_001e: ldind.r4
IL_001f: ldarg.2
IL_0020: add
IL_0021: stind.r4
IL_0022: ldarg.0
IL_0023: ldflda System.Int32 Husbandry.Idle.Nap::Missed
IL_0028: dup
IL_0029: ldind.i4
IL_002a: ldc.i4.1
IL_002b: add
IL_002c: stind.i4
IL_002d: ldarg.0
IL_002e: ldfld System.Int32 Husbandry.Idle.Nap::Missed
IL_0033: ldarg.1
IL_0034: bge.s IL_003f
IL_0036: ldarg.3
IL_0037: ldc.r4 0
IL_003c: stind.r4
IL_003d: ldc.i4.0
IL_003e: ret
IL_003f: ldarg.3
IL_0040: ldarg.0
IL_0041: ldfld System.Single Husbandry.Idle.Nap::Banked
IL_0046: stind.r4
IL_0047: ldarg.0
IL_0048: initobj Husbandry.Idle.Nap
IL_004e: ldc.i4.1
IL_004f: ret

// System.Single Husbandry.Idle.Nap::Wake(Husbandry.Idle.Nap&,System.Single)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: ldfld System.Single Husbandry.Idle.Nap::Banked
IL_0007: add
IL_0008: ldarg.0
IL_0009: initobj Husbandry.Idle.Nap
IL_000f: ret

// System.Boolean Husbandry.Herd.Beast::Ours(System.Boolean,System.Boolean,System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: and
IL_0003: ldarg.2
IL_0004: and
IL_0005: ret

// System.Boolean Husbandry.Herd.Beast::Dozy(System.Boolean,System.Boolean,System.Boolean,System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: brfalse.s IL_000e
IL_0003: ldarg.1
IL_0004: brtrue.s IL_000e
IL_0006: ldarg.2
IL_0007: brtrue.s IL_000e
IL_0009: ldarg.3
IL_000a: ldc.i4.0
IL_000b: ceq
IL_000d: ret
IL_000e: ldc.i4.0
IL_000f: ret

// System.Boolean Husbandry.Herd.Bumping::Phased(System.Boolean,System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: brfalse.s IL_0008
IL_0003: ldarg.1
IL_0004: ldc.i4.0
IL_0005: ceq
IL_0007: ret
IL_0008: ldc.i4.0
IL_0009: ret

// System.Boolean Husbandry.Herd.Bumping::Toggled(System.Boolean,System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: brtrue.s IL_0005
IL_0003: ldarg.1
IL_0004: ret
IL_0005: ldarg.1
IL_0006: ldc.i4.0
IL_0007: ceq
IL_0009: ret

// System.Boolean Husbandry.Herd.Bumping::Mine(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: ret

// System.String Husbandry.Herd.Bumping::Says(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: brtrue.s IL_0009
IL_0003: ldstr "$msg_husbandry_phased"
IL_0008: ret
IL_0009: ldstr "$msg_husbandry_solid"
IL_000e: ret

// System.String Husbandry.Herd.Bumping::Plain(System.Boolean)
.locals 
IL_0000: ldarg.0
IL_0001: brtrue.s IL_0009
IL_0003: ldstr "will stay out of your way"
IL_0008: ret
IL_0009: ldstr "will get in your way again"
IL_000e: ret

// System.Int32 Husbandry.Herd.Cap::Effective(System.Int32,System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.0
IL_0002: bgt.s IL_000c
IL_0004: ldarg.1
IL_0005: ldc.i4.0
IL_0006: bgt.s IL_000a
IL_0008: ldc.i4.0
IL_0009: ret
IL_000a: ldarg.1
IL_000b: ret
IL_000c: ldarg.1
IL_000d: ldc.i4.0
IL_000e: bgt.s IL_0012
IL_0010: ldarg.0
IL_0011: ret
IL_0012: ldarg.0
IL_0013: ldarg.1
IL_0014: blt.s IL_0018
IL_0016: ldarg.1
IL_0017: ret
IL_0018: ldarg.0
IL_0019: ret

// System.Boolean Husbandry.Herd.Cap::Reached(System.Int32,System.Int32)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.0
IL_0002: ble.s IL_000c
IL_0004: ldarg.0
IL_0005: ldarg.1
IL_0006: clt
IL_0008: ldc.i4.0
IL_0009: ceq
IL_000b: ret
IL_000c: ldc.i4.0
IL_000d: ret

// System.Boolean Husbandry.Herd.Cap::CertainlyUnder(System.Int32,System.Int32)
.locals 
IL_0000: ldarg.1
IL_0001: ldc.i4.0
IL_0002: ble.s IL_0009
IL_0004: ldarg.0
IL_0005: ldarg.1
IL_0006: clt
IL_0008: ret
IL_0009: ldc.i4.0
IL_000a: ret

// System.Single Husbandry.Herd.Census::get_TakenAt()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Single Husbandry.Herd.Census::<TakenAt>k__BackingField
IL_0006: ret

// System.Void Husbandry.Herd.Census::set_TakenAt(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Single Husbandry.Herd.Census::<TakenAt>k__BackingField
IL_0007: ret

// System.Int32 Husbandry.Herd.Census::get_Counted()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 Husbandry.Herd.Census::<Counted>k__BackingField
IL_0006: ret

// System.Void Husbandry.Herd.Census::set_Counted(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.Int32 Husbandry.Herd.Census::<Counted>k__BackingField
IL_0007: ret

// System.Int32 Husbandry.Herd.Census::get_Species()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.Int32,System.Collections.Generic.List`1<UnityEngine.Vector3>> Husbandry.Herd.Census::_by
IL_0006: callvirt System.Int32 System.Collections.Generic.Dictionary`2<System.Int32,System.Collections.Generic.List`1<UnityEngine.Vector3>>::get_Count()
IL_000b: ret

// System.Void Husbandry.Herd.Census::Clear()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.Int32,System.Collections.Generic.List`1<UnityEngine.Vector3>> Husbandry.Herd.Census::_by
IL_0006: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Collections.Generic.List`1<UnityEngine.Vector3>>::Clear()
IL_000b: ldarg.0
IL_000c: ldc.i4.0
IL_000d: call System.Void Husbandry.Herd.Census::set_Counted(System.Int32)
IL_0012: ldarg.0
IL_0013: ldc.r4 -Infinity
IL_0018: call System.Void Husbandry.Herd.Census::set_TakenAt(System.Single)
IL_001d: ret

// System.Boolean Husbandry.Herd.Census::Stale(System.Single,System.Single)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: call System.Single Husbandry.Herd.Census::get_TakenAt()
IL_0007: sub
IL_0008: ldarg.2
IL_0009: clt.un
IL_000b: ldc.i4.0
IL_000c: ceq
IL_000e: ret

// System.Void Husbandry.Herd.Census::Take(System.Collections.Generic.IEnumerable`1<Husbandry.Herd.Census/Head>,System.Single)
.locals System.Collections.Generic.IEnumerator`1<Husbandry.Herd.Census/Head>, Husbandry.Herd.Census/Head, System.Collections.Generic.List`1<UnityEngine.Vector3>, System.Int32
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.Int32,System.Collections.Generic.List`1<UnityEngine.Vector3>> Husbandry.Herd.Census::_by
IL_0006: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Collections.Generic.List`1<UnityEngine.Vector3>>::Clear()
IL_000b: ldarg.0
IL_000c: ldc.i4.0
IL_000d: call System.Void Husbandry.Herd.Census::set_Counted(System.Int32)
IL_0012: ldarg.0
IL_0013: ldarg.2
IL_0014: call System.Void Husbandry.Herd.Census::set_TakenAt(System.Single)
IL_0019: ldarg.1
IL_001a: brtrue.s IL_001d
IL_001c: ret
IL_001d: ldarg.1
IL_001e: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<Husbandry.Herd.Census/Head>::GetEnumerator()
IL_0023: stloc.0
IL_0024: br.s IL_007e
IL_0026: ldloc.0
IL_0027: callvirt !0 System.Collections.Generic.IEnumerator`1<Husbandry.Herd.Census/Head>::get_Current()
IL_002c: stloc.1
IL_002d: ldloc.1
IL_002e: ldfld System.Boolean Husbandry.Herd.Census/Head::Tamed
IL_0033: brfalse.s IL_007e
IL_0035: ldarg.0
IL_0036: ldfld System.Collections.Generic.Dictionary`2<System.Int32,System.Collections.Generic.List`1<UnityEngine.Vector3>> Husbandry.Herd.Census::_by
IL_003b: ldloc.1
IL_003c: ldfld System.Int32 Husbandry.Herd.Census/Head::Prefab
IL_0041: ldloca.s V_2
IL_0043: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Collections.Generic.List`1<UnityEngine.Vector3>>::TryGetValue(!0,!1&)
IL_0048: brtrue.s IL_0062
IL_004a: newobj System.Void System.Collections.Generic.List`1<UnityEngine.Vector3>::.ctor()
IL_004f: stloc.2
IL_0050: ldarg.0
IL_0051: ldfld System.Collections.Generic.Dictionary`2<System.Int32,System.Collections.Generic.List`1<UnityEngine.Vector3>> Husbandry.Herd.Census::_by
IL_0056: ldloc.1
IL_0057: ldfld System.Int32 Husbandry.Herd.Census/Head::Prefab
IL_005c: ldloc.2
IL_005d: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Collections.Generic.List`1<UnityEngine.Vector3>>::set_Item(!0,!1)
IL_0062: ldloc.2
IL_0063: ldloc.1
IL_0064: ldfld UnityEngine.Vector3 Husbandry.Herd.Census/Head::Where
IL_0069: callvirt System.Void System.Collections.Generic.List`1<UnityEngine.Vector3>::Add(!0)
IL_006e: ldarg.0
IL_006f: call System.Int32 Husbandry.Herd.Census::get_Counted()
IL_0074: stloc.3
IL_0075: ldarg.0
IL_0076: ldloc.3
IL_0077: ldc.i4.1
IL_0078: add
IL_0079: call System.Void Husbandry.Herd.Census::set_Counted(System.Int32)
IL_007e: ldloc.0
IL_007f: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0084: brtrue.s IL_0026
IL_0086: leave.s IL_0092
IL_0088: ldloc.0
IL_0089: brfalse.s IL_0091
IL_008b: ldloc.0
IL_008c: callvirt System.Void System.IDisposable::Dispose()
IL_0091: endfinally
IL_0092: ret
// EH Finally: 36 - 136 => 136 - 146

// System.Int32 Husbandry.Herd.Census::Total(System.Int32)
.locals System.Collections.Generic.List`1<UnityEngine.Vector3>
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.Int32,System.Collections.Generic.List`1<UnityEngine.Vector3>> Husbandry.Herd.Census::_by
IL_0006: ldarg.1
IL_0007: ldloca.s V_0
IL_0009: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Collections.Generic.List`1<UnityEngine.Vector3>>::TryGetValue(!0,!1&)
IL_000e: brtrue.s IL_0012
IL_0010: ldc.i4.0
IL_0011: ret
IL_0012: ldloc.0
IL_0013: callvirt System.Int32 System.Collections.Generic.List`1<UnityEngine.Vector3>::get_Count()
IL_0018: ret

// System.Int32 Husbandry.Herd.Census::Within(System.Int32,UnityEngine.Vector3,System.Single)
.locals System.Collections.Generic.List`1<UnityEngine.Vector3>, System.Single, System.Int32, System.Collections.Generic.List`1/Enumerator<UnityEngine.Vector3>, System.Single, System.Single, System.Single
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.Int32,System.Collections.Generic.List`1<UnityEngine.Vector3>> Husbandry.Herd.Census::_by
IL_0006: ldarg.1
IL_0007: ldloca.s V_0
IL_0009: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Collections.Generic.List`1<UnityEngine.Vector3>>::TryGetValue(!0,!1&)
IL_000e: brtrue.s IL_0012
IL_0010: ldc.i4.0
IL_0011: ret
IL_0012: ldarg.3
IL_0013: ldc.r4 0
IL_0018: bgt.un.s IL_0021
IL_001a: ldloc.0
IL_001b: callvirt System.Int32 System.Collections.Generic.List`1<UnityEngine.Vector3>::get_Count()
IL_0020: ret
IL_0021: ldarg.3
IL_0022: ldarg.3
IL_0023: mul
IL_0024: stloc.1
IL_0025: ldc.i4.0
IL_0026: stloc.2
IL_0027: ldloc.0
IL_0028: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<UnityEngine.Vector3>::GetEnumerator()
IL_002d: stloc.3
IL_002e: br.s IL_007b
IL_0030: ldloca.s V_3
IL_0032: call !0 System.Collections.Generic.List`1/Enumerator<UnityEngine.Vector3>::get_Current()
IL_0037: dup
IL_0038: ldfld System.Single UnityEngine.Vector3::x
IL_003d: ldarg.2
IL_003e: ldfld System.Single UnityEngine.Vector3::x
IL_0043: sub
IL_0044: stloc.s V_4
IL_0046: dup
IL_0047: ldfld System.Single UnityEngine.Vector3::y
IL_004c: ldarg.2
IL_004d: ldfld System.Single UnityEngine.Vector3::y
IL_0052: sub
IL_0053: stloc.s V_5
IL_0055: ldfld System.Single UnityEngine.Vector3::z
IL_005a: ldarg.2
IL_005b: ldfld System.Single UnityEngine.Vector3::z
IL_0060: sub
IL_0061: stloc.s V_6
IL_0063: ldloc.s V_4
IL_0065: ldloc.s V_4
IL_0067: mul
IL_0068: ldloc.s V_5
IL_006a: ldloc.s V_5
IL_006c: mul
IL_006d: add
IL_006e: ldloc.s V_6
IL_0070: ldloc.s V_6
IL_0072: mul
IL_0073: add
IL_0074: ldloc.1
IL_0075: bgt.un.s IL_007b
IL_0077: ldloc.2
IL_0078: ldc.i4.1
IL_0079: add
IL_007a: stloc.2
IL_007b: ldloca.s V_3
IL_007d: call System.Boolean System.Collections.Generic.List`1/Enumerator<UnityEngine.Vector3>::MoveNext()
IL_0082: brtrue.s IL_0030
IL_0084: leave.s IL_0094
IL_0086: ldloca.s V_3
IL_0088: constrained. System.Collections.Generic.List`1/Enumerator<UnityEngine.Vector3>
IL_008e: callvirt System.Void System.IDisposable::Dispose()
IL_0093: endfinally
IL_0094: ldloc.2
IL_0095: ret
// EH Finally: 46 - 134 => 134 - 148

// System.Void Husbandry.Herd.Census::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: newobj System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Collections.Generic.List`1<UnityEngine.Vector3>>::.ctor()
IL_0006: stfld System.Collections.Generic.Dictionary`2<System.Int32,System.Collections.Generic.List`1<UnityEngine.Vector3>> Husbandry.Herd.Census::_by
IL_000b: ldarg.0
IL_000c: ldc.r4 -Infinity
IL_0011: stfld System.Single Husbandry.Herd.Census::<TakenAt>k__BackingField
IL_0016: ldarg.0
IL_0017: call System.Void System.Object::.ctor()
IL_001c: ret

// System.Int32 Husbandry.Herd.Kinds::get_Count()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.Int32,Husbandry.Herd.Kinds/Kind> Husbandry.Herd.Kinds::_by
IL_0006: callvirt System.Int32 System.Collections.Generic.Dictionary`2<System.Int32,Husbandry.Herd.Kinds/Kind>::get_Count()
IL_000b: ret

// System.Void Husbandry.Herd.Kinds::Clear()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.Int32,Husbandry.Herd.Kinds/Kind> Husbandry.Herd.Kinds::_by
IL_0006: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int32,Husbandry.Herd.Kinds/Kind>::Clear()
IL_000b: ret

// System.Void Husbandry.Herd.Kinds::Load(System.Collections.Generic.IEnumerable`1<Husbandry.Herd.Kinds/Kind>)
.locals System.Collections.Generic.IEnumerator`1<Husbandry.Herd.Kinds/Kind>, Husbandry.Herd.Kinds/Kind
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.Int32,Husbandry.Herd.Kinds/Kind> Husbandry.Herd.Kinds::_by
IL_0006: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int32,Husbandry.Herd.Kinds/Kind>::Clear()
IL_000b: ldarg.1
IL_000c: brtrue.s IL_000f
IL_000e: ret
IL_000f: ldarg.1
IL_0010: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<Husbandry.Herd.Kinds/Kind>::GetEnumerator()
IL_0015: stloc.0
IL_0016: br.s IL_0031
IL_0018: ldloc.0
IL_0019: callvirt !0 System.Collections.Generic.IEnumerator`1<Husbandry.Herd.Kinds/Kind>::get_Current()
IL_001e: stloc.1
IL_001f: ldarg.0
IL_0020: ldfld System.Collections.Generic.Dictionary`2<System.Int32,Husbandry.Herd.Kinds/Kind> Husbandry.Herd.Kinds::_by
IL_0025: ldloc.1
IL_0026: ldfld System.Int32 Husbandry.Herd.Kinds/Kind::Hash
IL_002b: ldloc.1
IL_002c: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int32,Husbandry.Herd.Kinds/Kind>::set_Item(!0,!1)
IL_0031: ldloc.0
IL_0032: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0037: brtrue.s IL_0018
IL_0039: leave.s IL_0045
IL_003b: ldloc.0
IL_003c: brfalse.s IL_0044
IL_003e: ldloc.0
IL_003f: callvirt System.Void System.IDisposable::Dispose()
IL_0044: endfinally
IL_0045: ret
// EH Finally: 22 - 59 => 59 - 69

// System.Boolean Husbandry.Herd.Kinds::Find(System.Int32,Husbandry.Herd.Kinds/Kind&)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Collections.Generic.Dictionary`2<System.Int32,Husbandry.Herd.Kinds/Kind> Husbandry.Herd.Kinds::_by
IL_0006: ldarg.1
IL_0007: ldarg.2
IL_0008: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,Husbandry.Herd.Kinds/Kind>::TryGetValue(!0,!1&)
IL_000d: ret

// System.Collections.Generic.List`1<Husbandry.Herd.Kinds/Kind> Husbandry.Herd.Kinds::Read(System.Collections.Generic.IEnumerable`1<UnityEngine.GameObject>)
.locals System.Collections.Generic.List`1<Husbandry.Herd.Kinds/Kind>, System.Collections.Generic.IEnumerator`1<UnityEngine.GameObject>, UnityEngine.GameObject, Tameable, Procreation, Character, Husbandry.Herd.Kinds/Kind
IL_0000: newobj System.Void System.Collections.Generic.List`1<Husbandry.Herd.Kinds/Kind>::.ctor()
IL_0005: stloc.0
IL_0006: ldarg.0
IL_0007: brtrue.s IL_000b
IL_0009: ldloc.0
IL_000a: ret
IL_000b: ldarg.0
IL_000c: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<UnityEngine.GameObject>::GetEnumerator()
IL_0011: stloc.1
IL_0012: br IL_014a
IL_0017: ldloc.1
IL_0018: callvirt !0 System.Collections.Generic.IEnumerator`1<UnityEngine.GameObject>::get_Current()
IL_001d: stloc.2
IL_001e: ldloc.2
IL_001f: ldnull
IL_0020: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0025: brtrue IL_014a
IL_002a: ldloc.2
IL_002b: callvirt !!0 UnityEngine.GameObject::GetComponent<Tameable>()
IL_0030: stloc.3
IL_0031: ldloc.3
IL_0032: ldnull
IL_0033: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0038: brtrue IL_014a
IL_003d: ldloc.2
IL_003e: callvirt !!0 UnityEngine.GameObject::GetComponent<Procreation>()
IL_0043: stloc.s V_4
IL_0045: ldloc.2
IL_0046: callvirt !!0 UnityEngine.GameObject::GetComponent<Character>()
IL_004b: stloc.s V_5
IL_004d: ldloc.0
IL_004e: ldloca.s V_6
IL_0050: initobj Husbandry.Herd.Kinds/Kind
IL_0056: ldloca.s V_6
IL_0058: ldloc.2
IL_0059: callvirt System.String UnityEngine.Object::get_name()
IL_005e: stfld System.String Husbandry.Herd.Kinds/Kind::Name
IL_0063: ldloca.s V_6
IL_0065: ldloc.2
IL_0066: callvirt System.String UnityEngine.Object::get_name()
IL_006b: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0070: stfld System.Int32 Husbandry.Herd.Kinds/Kind::Hash
IL_0075: ldloca.s V_6
IL_0077: ldloc.s V_4
IL_0079: ldnull
IL_007a: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_007f: stfld System.Boolean Husbandry.Herd.Kinds/Kind::Breeds
IL_0084: ldloca.s V_6
IL_0086: ldloc.3
IL_0087: ldfld System.Single Tameable::m_fedDuration
IL_008c: stfld System.Single Husbandry.Herd.Kinds/Kind::FedDuration
IL_0091: ldloca.s V_6
IL_0093: ldloc.s V_4
IL_0095: ldnull
IL_0096: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_009b: brtrue.s IL_00a6
IL_009d: ldloc.s V_4
IL_009f: ldfld System.Single Procreation::m_pregnancyDuration
IL_00a4: br.s IL_00ab
IL_00a6: ldc.r4 0
IL_00ab: stfld System.Single Husbandry.Herd.Kinds/Kind::PregnancyDuration
IL_00b0: ldloca.s V_6
IL_00b2: ldloc.s V_4
IL_00b4: ldnull
IL_00b5: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_00ba: brtrue.s IL_00c5
IL_00bc: ldloc.s V_4
IL_00be: ldfld System.Int32 Procreation::m_requiredLovePoints
IL_00c3: br.s IL_00c6
IL_00c5: ldc.i4.0
IL_00c6: stfld System.Int32 Husbandry.Herd.Kinds/Kind::RequiredLovePoints
IL_00cb: ldloca.s V_6
IL_00cd: ldloc.s V_4
IL_00cf: ldnull
IL_00d0: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_00d5: brtrue.s IL_00e0
IL_00d7: ldloc.s V_4
IL_00d9: ldfld System.Int32 Procreation::m_maxCreatures
IL_00de: br.s IL_00e1
IL_00e0: ldc.i4.0
IL_00e1: stfld System.Int32 Husbandry.Herd.Kinds/Kind::MaxCreatures
IL_00e6: ldloca.s V_6
IL_00e8: ldloc.s V_4
IL_00ea: ldnull
IL_00eb: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_00f0: brtrue.s IL_00fb
IL_00f2: ldloc.s V_4
IL_00f4: ldfld System.Single Procreation::m_totalCheckRange
IL_00f9: br.s IL_0100
IL_00fb: ldc.r4 0
IL_0100: stfld System.Single Husbandry.Herd.Kinds/Kind::TotalCheckRange
IL_0105: ldloca.s V_6
IL_0107: ldloc.s V_4
IL_0109: ldnull
IL_010a: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_010f: brtrue.s IL_011a
IL_0111: ldloc.s V_4
IL_0113: ldfld System.Single Procreation::m_partnerCheckRange
IL_0118: br.s IL_011f
IL_011a: ldc.r4 0
IL_011f: stfld System.Single Husbandry.Herd.Kinds/Kind::PartnerCheckRange
IL_0124: ldloca.s V_6
IL_0126: ldloc.s V_5
IL_0128: ldnull
IL_0129: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_012e: brtrue.s IL_0139
IL_0130: ldloc.s V_5
IL_0132: ldfld System.Single Character::m_health
IL_0137: br.s IL_013e
IL_0139: ldc.r4 0
IL_013e: stfld System.Single Husbandry.Herd.Kinds/Kind::MaxHealth
IL_0143: ldloc.s V_6
IL_0145: callvirt System.Void System.Collections.Generic.List`1<Husbandry.Herd.Kinds/Kind>::Add(!0)
IL_014a: ldloc.1
IL_014b: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0150: brtrue IL_0017
IL_0155: leave.s IL_0161
IL_0157: ldloc.1
IL_0158: brfalse.s IL_0160
IL_015a: ldloc.1
IL_015b: callvirt System.Void System.IDisposable::Dispose()
IL_0160: endfinally
IL_0161: ldloc.0
IL_0162: ret
// EH Finally: 18 - 343 => 343 - 353

// System.Void Husbandry.Herd.Kinds::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: newobj System.Void System.Collections.Generic.Dictionary`2<System.Int32,Husbandry.Herd.Kinds/Kind>::.ctor()
IL_0006: stfld System.Collections.Generic.Dictionary`2<System.Int32,Husbandry.Herd.Kinds/Kind> Husbandry.Herd.Kinds::_by
IL_000b: ldarg.0
IL_000c: call System.Void System.Object::.ctor()
IL_0011: ret

// System.Int32 Husbandry.Herd.Muster::get_Counted()
.locals 
IL_0000: ldsfld Husbandry.Herd.Census Husbandry.Herd.Muster::Taken
IL_0005: callvirt System.Int32 Husbandry.Herd.Census::get_Counted()
IL_000a: ret

// System.Int32 Husbandry.Herd.Muster::get_Species()
.locals 
IL_0000: ldsfld Husbandry.Herd.Census Husbandry.Herd.Muster::Taken
IL_0005: callvirt System.Int32 Husbandry.Herd.Census::get_Species()
IL_000a: ret

// System.Int32 Husbandry.Herd.Muster::get_Takings()
.locals 
IL_0000: ldsfld System.Int32 Husbandry.Herd.Muster::<Takings>k__BackingField
IL_0005: ret

// System.Void Husbandry.Herd.Muster::set_Takings(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Int32 Husbandry.Herd.Muster::<Takings>k__BackingField
IL_0006: ret

// System.Void Husbandry.Herd.Muster::ResetForTests()
.locals 
IL_0000: ldsfld Husbandry.Herd.Census Husbandry.Herd.Muster::Taken
IL_0005: callvirt System.Void Husbandry.Herd.Census::Clear()
IL_000a: ldsfld System.Collections.Generic.List`1<Husbandry.Herd.Census/Head> Husbandry.Herd.Muster::Heads
IL_000f: callvirt System.Void System.Collections.Generic.List`1<Husbandry.Herd.Census/Head>::Clear()
IL_0014: ldc.i4.0
IL_0015: call System.Void Husbandry.Herd.Muster::set_Takings(System.Int32)
IL_001a: ret

// Husbandry.Herd.Census Husbandry.Herd.Muster::Current(System.Single)
.locals System.Collections.Generic.List`1<BaseAI>, System.Collections.Generic.List`1/Enumerator<BaseAI>, BaseAI, Character, ZNetView, Husbandry.Herd.Census/Head
IL_0000: ldsfld Husbandry.Herd.Census Husbandry.Herd.Muster::Taken
IL_0005: ldarg.0
IL_0006: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Husbandry.Config.HusbandryConfig::CensusInterval
IL_000b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0010: callvirt System.Boolean Husbandry.Herd.Census::Stale(System.Single,System.Single)
IL_0015: brtrue.s IL_001d
IL_0017: ldsfld Husbandry.Herd.Census Husbandry.Herd.Muster::Taken
IL_001c: ret
IL_001d: ldsfld System.Collections.Generic.List`1<Husbandry.Herd.Census/Head> Husbandry.Herd.Muster::Heads
IL_0022: callvirt System.Void System.Collections.Generic.List`1<Husbandry.Herd.Census/Head>::Clear()
IL_0027: call System.Collections.Generic.List`1<BaseAI> BaseAI::get_BaseAIInstances()
IL_002c: stloc.0
IL_002d: ldloc.0
IL_002e: brfalse IL_00e0
IL_0033: ldloc.0
IL_0034: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<BaseAI>::GetEnumerator()
IL_0039: stloc.1
IL_003a: br IL_00c4
IL_003f: ldloca.s V_1
IL_0041: call !0 System.Collections.Generic.List`1/Enumerator<BaseAI>::get_Current()
IL_0046: stloc.2
IL_0047: ldloc.2
IL_0048: ldnull
IL_0049: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_004e: brtrue.s IL_00c4
IL_0050: ldloc.2
IL_0051: callvirt !!0 UnityEngine.Component::GetComponent<Character>()
IL_0056: stloc.3
IL_0057: ldloc.3
IL_0058: ldnull
IL_0059: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_005e: brtrue.s IL_00c4
IL_0060: ldloc.3
IL_0061: callvirt System.Boolean Character::IsTamed()
IL_0066: brfalse.s IL_00c4
IL_0068: ldloc.2
IL_0069: callvirt !!0 UnityEngine.Component::GetComponent<ZNetView>()
IL_006e: stloc.s V_4
IL_0070: ldloc.s V_4
IL_0072: ldnull
IL_0073: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0078: brtrue.s IL_00c4
IL_007a: ldloc.s V_4
IL_007c: callvirt System.Boolean ZNetView::IsValid()
IL_0081: brfalse.s IL_00c4
IL_0083: ldsfld System.Collections.Generic.List`1<Husbandry.Herd.Census/Head> Husbandry.Herd.Muster::Heads
IL_0088: ldloca.s V_5
IL_008a: initobj Husbandry.Herd.Census/Head
IL_0090: ldloca.s V_5
IL_0092: ldloc.s V_4
IL_0094: callvirt ZDO ZNetView::GetZDO()
IL_0099: callvirt System.Int32 ZDO::GetPrefab()
IL_009e: stfld System.Int32 Husbandry.Herd.Census/Head::Prefab
IL_00a3: ldloca.s V_5
IL_00a5: ldloc.2
IL_00a6: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00ab: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_00b0: stfld UnityEngine.Vector3 Husbandry.Herd.Census/Head::Where
IL_00b5: ldloca.s V_5
IL_00b7: ldc.i4.1
IL_00b8: stfld System.Boolean Husbandry.Herd.Census/Head::Tamed
IL_00bd: ldloc.s V_5
IL_00bf: callvirt System.Void System.Collections.Generic.List`1<Husbandry.Herd.Census/Head>::Add(!0)
IL_00c4: ldloca.s V_1
IL_00c6: call System.Boolean System.Collections.Generic.List`1/Enumerator<BaseAI>::MoveNext()
IL_00cb: brtrue IL_003f
IL_00d0: leave.s IL_00e0
IL_00d2: ldloca.s V_1
IL_00d4: constrained. System.Collections.Generic.List`1/Enumerator<BaseAI>
IL_00da: callvirt System.Void System.IDisposable::Dispose()
IL_00df: endfinally
IL_00e0: ldsfld Husbandry.Herd.Census Husbandry.Herd.Muster::Taken
IL_00e5: ldsfld System.Collections.Generic.List`1<Husbandry.Herd.Census/Head> Husbandry.Herd.Muster::Heads
IL_00ea: ldarg.0
IL_00eb: callvirt System.Void Husbandry.Herd.Census::Take(System.Collections.Generic.IEnumerable`1<Husbandry.Herd.Census/Head>,System.Single)
IL_00f0: call System.Int32 Husbandry.Herd.Muster::get_Takings()
IL_00f5: ldc.i4.1
IL_00f6: add
IL_00f7: call System.Void Husbandry.Herd.Muster::set_Takings(System.Int32)
IL_00fc: ldsfld Husbandry.Herd.Census Husbandry.Herd.Muster::Taken
IL_0101: ret
// EH Finally: 58 - 210 => 210 - 224

// System.Void Husbandry.Herd.Muster::.cctor()
.locals 
IL_0000: newobj System.Void Husbandry.Herd.Census::.ctor()
IL_0005: stsfld Husbandry.Herd.Census Husbandry.Herd.Muster::Taken
IL_000a: newobj System.Void System.Collections.Generic.List`1<Husbandry.Herd.Census/Head>::.ctor()
IL_000f: stsfld System.Collections.Generic.List`1<Husbandry.Herd.Census/Head> Husbandry.Herd.Muster::Heads
IL_0014: ret

// System.Int32 Husbandry.Herd.Shoving::get_Phased()
.locals 
IL_0000: ldsfld System.Int32 Husbandry.Herd.Shoving::<Phased>k__BackingField
IL_0005: ret

// System.Void Husbandry.Herd.Shoving::set_Phased(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Int32 Husbandry.Herd.Shoving::<Phased>k__BackingField
IL_0006: ret

// System.Int32 Husbandry.Herd.Shoving::get_Solid()
.locals 
IL_0000: ldsfld System.Int32 Husbandry.Herd.Shoving::<Solid>k__BackingField
IL_0005: ret

// System.Void Husbandry.Herd.Shoving::set_Solid(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Int32 Husbandry.Herd.Shoving::<Solid>k__BackingField
IL_0006: ret

// System.Int32 Husbandry.Herd.Shoving::get_Sweeps()
.locals 
IL_0000: ldsfld System.Int32 Husbandry.Herd.Shoving::<Sweeps>k__BackingField
IL_0005: ret

// System.Void Husbandry.Herd.Shoving::set_Sweeps(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: stsfld System.Int32 Husbandry.Herd.Shoving::<Sweeps>k__BackingField
IL_0006: ret

// System.Void Husbandry.Herd.Shoving::ResetForTests()
.locals 
IL_0000: ldc.i4.0
IL_0001: call System.Void Husbandry.Herd.Shoving::set_Phased(System.Int32)
IL_0006: ldc.i4.0
IL_0007: call System.Void Husbandry.Herd.Shoving::set_Solid(System.Int32)
IL_000c: ldc.i4.0
IL_000d: call System.Void Husbandry.Herd.Shoving::set_Sweeps(System.Int32)
IL_0012: ldc.r4 0
IL_0017: stsfld System.Single Husbandry.Herd.Shoving::_next
IL_001c: ldsfld System.Collections.Generic.Dictionary`2<System.Int64,System.Boolean> Husbandry.Herd.Shoving::Known
IL_0021: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int64,System.Boolean>::Clear()
IL_0026: ret

// System.Int64 Husbandry.Herd.Shoving::Pair(System.Int32,System.Int32)
.locals System.Int32
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: blt.s IL_0007
IL_0004: ldarg.1
IL_0005: br.s IL_0008
IL_0007: ldarg.0
IL_0008: ldarg.0
IL_0009: ldarg.1
IL_000a: blt.s IL_000f
IL_000c: ldarg.0
IL_000d: br.s IL_0010
IL_000f: ldarg.1
IL_0010: stloc.0
IL_0011: conv.i8
IL_0012: ldc.i4.s 32
IL_0014: shl
IL_0015: ldloc.0
IL_0016: conv.u8
IL_0017: xor
IL_0018: ret

// System.Boolean Husbandry.Herd.Shoving::get_Wanted()
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::Shoving
IL_0005: brfalse.s IL_0015
IL_0007: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::Shoving
IL_000c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0011: ldc.i4.0
IL_0012: ceq
IL_0014: ret
IL_0015: ldc.i4.1
IL_0016: ret

// System.Void Husbandry.Herd.Shoving::Tick(System.Single)
.locals 
IL_0000: ldarg.0
IL_0001: ldsfld System.Single Husbandry.Herd.Shoving::_next
IL_0006: bge.un.s IL_0009
IL_0008: ret
IL_0009: ldarg.0
IL_000a: ldc.r4 0.5
IL_000f: add
IL_0010: stsfld System.Single Husbandry.Herd.Shoving::_next
IL_0015: call System.Boolean Husbandry.Herd.Shoving::get_Wanted()
IL_001a: brtrue.s IL_002f
IL_001c: ldsfld System.Collections.Generic.Dictionary`2<System.Int64,System.Boolean> Husbandry.Herd.Shoving::Known
IL_0021: callvirt System.Int32 System.Collections.Generic.Dictionary`2<System.Int64,System.Boolean>::get_Count()
IL_0026: ldc.i4.0
IL_0027: ble.s IL_002e
IL_0029: call System.Void Husbandry.Herd.Shoving::Restore()
IL_002e: ret
IL_002f: call System.Void Husbandry.Herd.Shoving::Sweep()
IL_0034: ret

// System.Void Husbandry.Herd.Shoving::Restore()
.locals System.Collections.Generic.List`1<Character>, System.Collections.Generic.List`1<Character>, System.Collections.Generic.List`1<Character>, System.Collections.Generic.List`1/Enumerator<Character>, Character, UnityEngine.CapsuleCollider, System.Collections.Generic.List`1/Enumerator<Character>, UnityEngine.CapsuleCollider
IL_0000: call System.Collections.Generic.List`1<Character> Character::GetAllCharacters()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: brtrue.s IL_0014
IL_0009: ldsfld System.Collections.Generic.Dictionary`2<System.Int64,System.Boolean> Husbandry.Herd.Shoving::Known
IL_000e: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int64,System.Boolean>::Clear()
IL_0013: ret
IL_0014: newobj System.Void System.Collections.Generic.List`1<Character>::.ctor()
IL_0019: stloc.1
IL_001a: newobj System.Void System.Collections.Generic.List`1<Character>::.ctor()
IL_001f: stloc.2
IL_0020: ldloc.0
IL_0021: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Character>::GetEnumerator()
IL_0026: stloc.3
IL_0027: br.s IL_0060
IL_0029: ldloca.s V_3
IL_002b: call !0 System.Collections.Generic.List`1/Enumerator<Character>::get_Current()
IL_0030: stloc.s V_4
IL_0032: ldloc.s V_4
IL_0034: ldnull
IL_0035: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_003a: brtrue.s IL_0060
IL_003c: ldloc.s V_4
IL_003e: callvirt System.Boolean Character::IsPlayer()
IL_0043: brfalse.s IL_004f
IL_0045: ldloc.1
IL_0046: ldloc.s V_4
IL_0048: callvirt System.Void System.Collections.Generic.List`1<Character>::Add(!0)
IL_004d: br.s IL_0060
IL_004f: ldloc.s V_4
IL_0051: callvirt System.Boolean Character::IsTamed()
IL_0056: brfalse.s IL_0060
IL_0058: ldloc.2
IL_0059: ldloc.s V_4
IL_005b: callvirt System.Void System.Collections.Generic.List`1<Character>::Add(!0)
IL_0060: ldloca.s V_3
IL_0062: call System.Boolean System.Collections.Generic.List`1/Enumerator<Character>::MoveNext()
IL_0067: brtrue.s IL_0029
IL_0069: leave.s IL_0079
IL_006b: ldloca.s V_3
IL_006d: constrained. System.Collections.Generic.List`1/Enumerator<Character>
IL_0073: callvirt System.Void System.IDisposable::Dispose()
IL_0078: endfinally
IL_0079: ldloc.2
IL_007a: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Character>::GetEnumerator()
IL_007f: stloc.3
IL_0080: br.s IL_00df
IL_0082: ldloca.s V_3
IL_0084: call !0 System.Collections.Generic.List`1/Enumerator<Character>::get_Current()
IL_0089: callvirt UnityEngine.CapsuleCollider Character::GetCollider()
IL_008e: stloc.s V_5
IL_0090: ldloc.s V_5
IL_0092: ldnull
IL_0093: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0098: brtrue.s IL_00df
IL_009a: ldloc.1
IL_009b: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Character>::GetEnumerator()
IL_00a0: stloc.s V_6
IL_00a2: br.s IL_00c6
IL_00a4: ldloca.s V_6
IL_00a6: call !0 System.Collections.Generic.List`1/Enumerator<Character>::get_Current()
IL_00ab: callvirt UnityEngine.CapsuleCollider Character::GetCollider()
IL_00b0: stloc.s V_7
IL_00b2: ldloc.s V_7
IL_00b4: ldnull
IL_00b5: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_00ba: brtrue.s IL_00c6
IL_00bc: ldloc.s V_5
IL_00be: ldloc.s V_7
IL_00c0: ldc.i4.0
IL_00c1: call System.Void Husbandry.Herd.Shoving::Set(UnityEngine.Collider,UnityEngine.Collider,System.Boolean)
IL_00c6: ldloca.s V_6
IL_00c8: call System.Boolean System.Collections.Generic.List`1/Enumerator<Character>::MoveNext()
IL_00cd: brtrue.s IL_00a4
IL_00cf: leave.s IL_00df
IL_00d1: ldloca.s V_6
IL_00d3: constrained. System.Collections.Generic.List`1/Enumerator<Character>
IL_00d9: callvirt System.Void System.IDisposable::Dispose()
IL_00de: endfinally
IL_00df: ldloca.s V_3
IL_00e1: call System.Boolean System.Collections.Generic.List`1/Enumerator<Character>::MoveNext()
IL_00e6: brtrue.s IL_0082
IL_00e8: leave.s IL_00f8
IL_00ea: ldloca.s V_3
IL_00ec: constrained. System.Collections.Generic.List`1/Enumerator<Character>
IL_00f2: callvirt System.Void System.IDisposable::Dispose()
IL_00f7: endfinally
IL_00f8: ldsfld System.Collections.Generic.Dictionary`2<System.Int64,System.Boolean> Husbandry.Herd.Shoving::Known
IL_00fd: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int64,System.Boolean>::Clear()
IL_0102: ret
// EH Finally: 39 - 107 => 107 - 121
// EH Finally: 162 - 209 => 209 - 223
// EH Finally: 128 - 234 => 234 - 248

// System.Void Husbandry.Herd.Shoving::Sweep()
.locals System.Collections.Generic.List`1<Character>, System.Collections.Generic.List`1<Character>, System.Collections.Generic.List`1<Character>, System.Collections.Generic.List`1/Enumerator<Character>, Character, Character, UnityEngine.CapsuleCollider, System.Boolean, System.Collections.Generic.List`1/Enumerator<Character>, UnityEngine.CapsuleCollider
IL_0000: call System.Collections.Generic.List`1<Character> Character::GetAllCharacters()
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: brtrue.s IL_000a
IL_0009: ret
IL_000a: call System.Int32 Husbandry.Herd.Shoving::get_Sweeps()
IL_000f: ldc.i4.1
IL_0010: add
IL_0011: call System.Void Husbandry.Herd.Shoving::set_Sweeps(System.Int32)
IL_0016: newobj System.Void System.Collections.Generic.List`1<Character>::.ctor()
IL_001b: stloc.1
IL_001c: newobj System.Void System.Collections.Generic.List`1<Character>::.ctor()
IL_0021: stloc.2
IL_0022: ldloc.0
IL_0023: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Character>::GetEnumerator()
IL_0028: stloc.3
IL_0029: br.s IL_0062
IL_002b: ldloca.s V_3
IL_002d: call !0 System.Collections.Generic.List`1/Enumerator<Character>::get_Current()
IL_0032: stloc.s V_4
IL_0034: ldloc.s V_4
IL_0036: ldnull
IL_0037: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_003c: brtrue.s IL_0062
IL_003e: ldloc.s V_4
IL_0040: callvirt System.Boolean Character::IsPlayer()
IL_0045: brfalse.s IL_0051
IL_0047: ldloc.1
IL_0048: ldloc.s V_4
IL_004a: callvirt System.Void System.Collections.Generic.List`1<Character>::Add(!0)
IL_004f: br.s IL_0062
IL_0051: ldloc.s V_4
IL_0053: callvirt System.Boolean Character::IsTamed()
IL_0058: brfalse.s IL_0062
IL_005a: ldloc.2
IL_005b: ldloc.s V_4
IL_005d: callvirt System.Void System.Collections.Generic.List`1<Character>::Add(!0)
IL_0062: ldloca.s V_3
IL_0064: call System.Boolean System.Collections.Generic.List`1/Enumerator<Character>::MoveNext()
IL_0069: brtrue.s IL_002b
IL_006b: leave.s IL_007b
IL_006d: ldloca.s V_3
IL_006f: constrained. System.Collections.Generic.List`1/Enumerator<Character>
IL_0075: callvirt System.Void System.IDisposable::Dispose()
IL_007a: endfinally
IL_007b: ldloc.1
IL_007c: callvirt System.Int32 System.Collections.Generic.List`1<Character>::get_Count()
IL_0081: brfalse.s IL_008b
IL_0083: ldloc.2
IL_0084: callvirt System.Int32 System.Collections.Generic.List`1<Character>::get_Count()
IL_0089: brtrue.s IL_008c
IL_008b: ret
IL_008c: ldloc.2
IL_008d: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Character>::GetEnumerator()
IL_0092: stloc.3
IL_0093: br.s IL_0106
IL_0095: ldloca.s V_3
IL_0097: call !0 System.Collections.Generic.List`1/Enumerator<Character>::get_Current()
IL_009c: stloc.s V_5
IL_009e: ldloc.s V_5
IL_00a0: callvirt UnityEngine.CapsuleCollider Character::GetCollider()
IL_00a5: stloc.s V_6
IL_00a7: ldloc.s V_6
IL_00a9: ldnull
IL_00aa: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_00af: brtrue.s IL_0106
IL_00b1: ldc.i4.1
IL_00b2: ldloc.s V_5
IL_00b4: call System.Boolean Husbandry.Herd.Shoving::IsSolid(Character)
IL_00b9: call System.Boolean Husbandry.Herd.Bumping::Phased(System.Boolean,System.Boolean)
IL_00be: stloc.s V_7
IL_00c0: ldloc.1
IL_00c1: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Character>::GetEnumerator()
IL_00c6: stloc.s V_8
IL_00c8: br.s IL_00ed
IL_00ca: ldloca.s V_8
IL_00cc: call !0 System.Collections.Generic.List`1/Enumerator<Character>::get_Current()
IL_00d1: callvirt UnityEngine.CapsuleCollider Character::GetCollider()
IL_00d6: stloc.s V_9
IL_00d8: ldloc.s V_9
IL_00da: ldnull
IL_00db: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_00e0: brtrue.s IL_00ed
IL_00e2: ldloc.s V_6
IL_00e4: ldloc.s V_9
IL_00e6: ldloc.s V_7
IL_00e8: call System.Void Husbandry.Herd.Shoving::Set(UnityEngine.Collider,UnityEngine.Collider,System.Boolean)
IL_00ed: ldloca.s V_8
IL_00ef: call System.Boolean System.Collections.Generic.List`1/Enumerator<Character>::MoveNext()
IL_00f4: brtrue.s IL_00ca
IL_00f6: leave.s IL_0106
IL_00f8: ldloca.s V_8
IL_00fa: constrained. System.Collections.Generic.List`1/Enumerator<Character>
IL_0100: callvirt System.Void System.IDisposable::Dispose()
IL_0105: endfinally
IL_0106: ldloca.s V_3
IL_0108: call System.Boolean System.Collections.Generic.List`1/Enumerator<Character>::MoveNext()
IL_010d: brtrue.s IL_0095
IL_010f: leave.s IL_011f
IL_0111: ldloca.s V_3
IL_0113: constrained. System.Collections.Generic.List`1/Enumerator<Character>
IL_0119: callvirt System.Void System.IDisposable::Dispose()
IL_011e: endfinally
IL_011f: ret
// EH Finally: 41 - 109 => 109 - 123
// EH Finally: 200 - 248 => 248 - 262
// EH Finally: 147 - 273 => 273 - 287

// System.Void Husbandry.Herd.Shoving::Set(UnityEngine.Collider,UnityEngine.Collider,System.Boolean)
.locals System.Int64, System.Boolean
IL_0000: ldarg.0
IL_0001: callvirt System.Int32 UnityEngine.Object::GetInstanceID()
IL_0006: ldarg.1
IL_0007: callvirt System.Int32 UnityEngine.Object::GetInstanceID()
IL_000c: call System.Int64 Husbandry.Herd.Shoving::Pair(System.Int32,System.Int32)
IL_0011: stloc.0
IL_0012: ldsfld System.Collections.Generic.Dictionary`2<System.Int64,System.Boolean> Husbandry.Herd.Shoving::Known
IL_0017: ldloc.0
IL_0018: ldloca.s V_1
IL_001a: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.Int64,System.Boolean>::TryGetValue(!0,!1&)
IL_001f: brfalse.s IL_0026
IL_0021: ldloc.1
IL_0022: ldarg.2
IL_0023: bne.un.s IL_0026
IL_0025: ret
IL_0026: ldarg.0
IL_0027: ldarg.1
IL_0028: ldarg.2
IL_0029: call System.Void UnityEngine.Physics::IgnoreCollision(UnityEngine.Collider,UnityEngine.Collider,System.Boolean)
IL_002e: ldsfld System.Collections.Generic.Dictionary`2<System.Int64,System.Boolean> Husbandry.Herd.Shoving::Known
IL_0033: ldloc.0
IL_0034: ldarg.2
IL_0035: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int64,System.Boolean>::set_Item(!0,!1)
IL_003a: ldarg.2
IL_003b: brfalse.s IL_004a
IL_003d: call System.Int32 Husbandry.Herd.Shoving::get_Phased()
IL_0042: ldc.i4.1
IL_0043: add
IL_0044: call System.Void Husbandry.Herd.Shoving::set_Phased(System.Int32)
IL_0049: ret
IL_004a: call System.Int32 Husbandry.Herd.Shoving::get_Solid()
IL_004f: ldc.i4.1
IL_0050: add
IL_0051: call System.Void Husbandry.Herd.Shoving::set_Solid(System.Int32)
IL_0056: ret

// System.Boolean Husbandry.Herd.Shoving::IsSolid(Character)
.locals ZNetView
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0007: brtrue.s IL_0011
IL_0009: ldarg.0
IL_000a: callvirt !!0 UnityEngine.Component::GetComponent<ZNetView>()
IL_000f: br.s IL_0012
IL_0011: ldnull
IL_0012: stloc.0
IL_0013: ldloc.0
IL_0014: ldnull
IL_0015: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_001a: brtrue.s IL_0024
IL_001c: ldloc.0
IL_001d: callvirt System.Boolean ZNetView::IsValid()
IL_0022: brtrue.s IL_0026
IL_0024: ldc.i4.0
IL_0025: ret
IL_0026: ldloc.0
IL_0027: callvirt ZDO ZNetView::GetZDO()
IL_002c: ldstr "husbandry_solid"
IL_0031: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0036: ldc.i4.0
IL_0037: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_003c: ret

// System.Boolean Husbandry.Herd.Shoving::Toggle(Character)
.locals ZNetView, System.Boolean
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0007: brtrue.s IL_0016
IL_0009: ldarg.0
IL_000a: callvirt System.Boolean Character::IsTamed()
IL_000f: call System.Boolean Husbandry.Herd.Bumping::Mine(System.Boolean)
IL_0014: brtrue.s IL_0018
IL_0016: ldc.i4.0
IL_0017: ret
IL_0018: ldarg.0
IL_0019: callvirt !!0 UnityEngine.Component::GetComponent<ZNetView>()
IL_001e: stloc.0
IL_001f: ldloc.0
IL_0020: ldnull
IL_0021: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0026: brtrue.s IL_0030
IL_0028: ldloc.0
IL_0029: callvirt System.Boolean ZNetView::IsValid()
IL_002e: brtrue.s IL_0032
IL_0030: ldc.i4.0
IL_0031: ret
IL_0032: ldloc.0
IL_0033: callvirt System.Void ZNetView::ClaimOwnership()
IL_0038: ldc.i4.1
IL_0039: ldarg.0
IL_003a: call System.Boolean Husbandry.Herd.Shoving::IsSolid(Character)
IL_003f: call System.Boolean Husbandry.Herd.Bumping::Toggled(System.Boolean,System.Boolean)
IL_0044: stloc.1
IL_0045: ldloc.0
IL_0046: callvirt ZDO ZNetView::GetZDO()
IL_004b: ldstr "husbandry_solid"
IL_0050: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0055: ldloc.1
IL_0056: callvirt System.Void ZDO::Set(System.Int32,System.Boolean)
IL_005b: ldsfld System.Collections.Generic.Dictionary`2<System.Int64,System.Boolean> Husbandry.Herd.Shoving::Known
IL_0060: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Int64,System.Boolean>::Clear()
IL_0065: call System.Void Husbandry.Herd.Shoving::Sweep()
IL_006a: ldstr "Husbandry: "
IL_006f: ldarg.0
IL_0070: ldfld System.String Character::m_name
IL_0075: ldstr " "
IL_007a: ldloc.1
IL_007b: call System.String Husbandry.Herd.Bumping::Plain(System.Boolean)
IL_0080: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_0085: call System.Void Husbandry.Util.Log::Debug(System.String)
IL_008a: ldc.i4.1
IL_008b: ret

// System.Void Husbandry.Herd.Shoving::.cctor()
.locals 
IL_0000: newobj System.Void System.Collections.Generic.Dictionary`2<System.Int64,System.Boolean>::.ctor()
IL_0005: stsfld System.Collections.Generic.Dictionary`2<System.Int64,System.Boolean> Husbandry.Herd.Shoving::Known
IL_000a: ret

// System.Void Husbandry.Config.HusbandryConfig::Bind(BepInEx.Configuration.ConfigFile)
.locals 
IL_0000: ldarg.0
IL_0001: ldstr "General"
IL_0006: ldstr "Enabled"
IL_000b: ldc.i4.1
IL_000c: ldstr "Master switch. Off means this mod does nothing at all."
IL_0011: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_0016: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::Enabled
IL_001b: ldarg.0
IL_001c: ldstr "Throttle"
IL_0021: ldstr "ThrottleIdle"
IL_0026: ldc.i4.1
IL_0027: ldstr "Let a tame that is standing around doing nothing think less often. It only ever applies to a TAMED creature that is not alerted, has nothing targeted and is following nobody - so it never touches anything hostile, anything in a fight, or anything at your heel. The time a skipped tick would have had is handed to the next one, so every timer inside the AI still lands where it would have."
IL_002c: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_0031: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::ThrottleIdle
IL_0036: ldarg.0
IL_0037: ldstr "Throttle"
IL_003c: ldstr "NearRange"
IL_0041: ldc.r4 24
IL_0046: ldstr "Inside this many metres nothing is throttled at all, so the animals you are actually looking at behave exactly as they always did."
IL_004b: ldc.r4 5
IL_0050: ldc.r4 128
IL_0055: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Single>::.ctor(!0,!0)
IL_005a: call !!0[] System.Array::Empty<System.Object>()
IL_005f: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0064: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0069: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Husbandry.Config.HusbandryConfig::NearRange
IL_006e: ldarg.0
IL_006f: ldstr "Throttle"
IL_0074: ldstr "FarRange"
IL_0079: ldc.r4 48
IL_007e: ldstr "Past this, the far band applies. Between the two, the mid band does."
IL_0083: ldc.r4 10
IL_0088: ldc.r4 256
IL_008d: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Single>::.ctor(!0,!0)
IL_0092: call !!0[] System.Array::Empty<System.Object>()
IL_0097: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_009c: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_00a1: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Husbandry.Config.HusbandryConfig::FarRange
IL_00a6: ldarg.0
IL_00a7: ldstr "Throttle"
IL_00ac: ldstr "MidSkip"
IL_00b1: ldc.i4.4
IL_00b2: ldstr "An idle tame in the middle band thinks one physics tick in this many. At 4 that is about twelve times a second instead of fifty."
IL_00b7: ldc.i4.1
IL_00b8: ldc.i4.s 25
IL_00ba: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Int32>::.ctor(!0,!0)
IL_00bf: call !!0[] System.Array::Empty<System.Object>()
IL_00c4: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_00c9: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Int32>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_00ce: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> Husbandry.Config.HusbandryConfig::MidSkip
IL_00d3: ldarg.0
IL_00d4: ldstr "Throttle"
IL_00d9: ldstr "FarSkip"
IL_00de: ldc.i4.s 10
IL_00e0: ldstr "The same, for idle tames past FarRange. This is the number that does the work in a big pen. Worst case it costs an animal a fifth of a second noticing something, and only ever an animal that was standing still, unalerted, with nothing targeted, a long way off."
IL_00e5: ldc.i4.1
IL_00e6: ldc.i4.s 50
IL_00e8: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Int32>::.ctor(!0,!0)
IL_00ed: call !!0[] System.Array::Empty<System.Object>()
IL_00f2: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_00f7: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Int32>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_00fc: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> Husbandry.Config.HusbandryConfig::FarSkip
IL_0101: ldarg.0
IL_0102: ldstr "Breeding"
IL_0107: ldstr "CheapCensus"
IL_010c: ldc.i4.1
IL_010d: ldstr "Replace the breeding system's population count with one shared count. Vanilla's runs per animal, walks EVERY ai in the world, compares object names as strings and does a GetComponent per match - four times per breeding round, per animal. That is the one cost that grows with the SQUARE of the herd. This changes no behaviour; it only stops asking the same question sixty times."
IL_0112: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_0117: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::CheapCensus
IL_011c: ldarg.0
IL_011d: ldstr "Breeding"
IL_0122: ldstr "CensusInterval"
IL_0127: ldc.r4 3
IL_012c: ldstr "Seconds between shared population counts. Breeding runs on a ten-second invoke and pregnancies take minutes, so a count a few seconds old cannot change any decision that depends on it."
IL_0131: ldc.r4 0.5
IL_0136: ldc.r4 60
IL_013b: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Single>::.ctor(!0,!0)
IL_0140: call !!0[] System.Array::Empty<System.Object>()
IL_0145: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_014a: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_014f: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Husbandry.Config.HusbandryConfig::CensusInterval
IL_0154: ldarg.0
IL_0155: ldstr "Breeding"
IL_015a: ldstr "SoftCap"
IL_015f: ldc.i4.0
IL_0160: ldstr "Stop breeding once this many of a species are within the prefab's own check range. 0 uses the game's own cap unchanged. This can only ever make breeding stop SOONER than vanilla, never later - and it never removes an animal, only births."
IL_0165: ldc.i4.0
IL_0166: ldc.i4 200
IL_016b: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Int32>::.ctor(!0,!0)
IL_0170: call !!0[] System.Array::Empty<System.Object>()
IL_0175: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_017a: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Int32>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_017f: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> Husbandry.Config.HusbandryConfig::SoftCap
IL_0184: ldarg.0
IL_0185: ldstr "Herd"
IL_018a: ldstr "Shoving"
IL_018f: ldc.i4.0
IL_0190: ldstr "Whether your own tamed animals can push you around. Off by default, which is the point: one wolf is a companion and forty are a moving wall that puts you in the water. Hostile creatures are never affected - walking through something that wants to eat you is a cheat rather than a convenience. Hold E on any tame to make that one solid again; the choice is stored on the animal and survives a relog."
IL_0195: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_019a: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::Shoving
IL_019f: ldarg.0
IL_01a0: ldstr "Offline"
IL_01a5: ldstr "OfflineUpkeep"
IL_01aa: ldc.i4.1
IL_01ab: ldstr "Look after tames in zones nobody has loaded. Runs only where the whole ZDO table lives - a dedicated server, a host, or single-player - and only on animals no connected machine is simulating."
IL_01b0: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_01b5: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::OfflineUpkeep
IL_01ba: ldarg.0
IL_01bb: ldstr "Offline"
IL_01c0: ldstr "OfflineHealing"
IL_01c5: ldc.i4.1
IL_01c6: ldstr "Let an unattended tame slowly heal. It never raises one that is dying or dead, and never takes one above its own maximum."
IL_01cb: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_01d0: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::OfflineHealing
IL_01d5: ldarg.0
IL_01d6: ldstr "Offline"
IL_01db: ldstr "HealPerSecond"
IL_01e0: ldc.r4 0.25
IL_01e5: ldstr "Health per real second for an unattended tame. A wolf left in a corner of the map comes back whole in a few minutes rather than never."
IL_01ea: ldc.r4 0
IL_01ef: ldc.r4 20
IL_01f4: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Single>::.ctor(!0,!0)
IL_01f9: call !!0[] System.Array::Empty<System.Object>()
IL_01fe: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0203: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0208: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Husbandry.Config.HusbandryConfig::HealPerSecond
IL_020d: ldarg.0
IL_020e: ldstr "Offline"
IL_0213: ldstr "OfflineBreeding"
IL_0218: ldc.i4.1
IL_0219: ldstr "Let unattended pairs get on with it, slowly. This does NOT create an animal: it sets the same pregnancy stamp the game sets, and the game itself gives birth - with the right level, the right tamed flag and its own cap check - on the first frame somebody loads the zone."
IL_021e: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_0223: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::OfflineBreeding
IL_0228: ldarg.0
IL_0229: ldstr "Offline"
IL_022e: ldstr "CourtingInterval"
IL_0233: ldc.r4 180
IL_0238: ldstr "Seconds between one step of courting and the next, for an unattended animal. Loaded, the game grants these every few seconds; this is the setting that makes away-from-home breeding a trickle rather than a population you come home to."
IL_023d: ldc.r4 5
IL_0242: ldc.r4 3600
IL_0247: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Single>::.ctor(!0,!0)
IL_024c: call !!0[] System.Array::Empty<System.Object>()
IL_0251: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0256: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_025b: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Husbandry.Config.HusbandryConfig::CourtingInterval
IL_0260: ldarg.0
IL_0261: ldstr "Offline"
IL_0266: ldstr "OfflineHunger"
IL_026b: ldc.i4.1
IL_026c: ldstr "Honour hunger when deciding whether an unattended pair may breed. Worth knowing: unloaded tames ALREADY get hungry, in vanilla, because the feeding timer is a world-time stamp rather than a loaded timer. Turning this off does not feed them; it only stops hunger holding up offline breeding."
IL_0271: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_0276: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::OfflineHunger
IL_027b: ldarg.0
IL_027c: ldstr "Advanced"
IL_0281: ldstr "ForgetAfter"
IL_0286: ldc.r4 600
IL_028b: ldstr "Seconds before this mod stops remembering an animal it has not seen. Only affects in-memory clocks; nothing is stored in your save."
IL_0290: ldc.r4 60
IL_0295: ldc.r4 7200
IL_029a: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Single>::.ctor(!0,!0)
IL_029f: call !!0[] System.Array::Empty<System.Object>()
IL_02a4: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_02a9: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_02ae: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Husbandry.Config.HusbandryConfig::ForgetAfter
IL_02b3: ldarg.0
IL_02b4: ldstr "Advanced"
IL_02b9: ldstr "Verbose"
IL_02be: ldc.i4.0
IL_02bf: ldstr "Log every decision. Useful for a bug report, noisy otherwise."
IL_02c4: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_02c9: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::Verbose
IL_02ce: ret

// System.Void Husbandry.Commands.HusbandryCommand::Register()
.locals 
IL_0000: ldstr "husbandry"
IL_0005: ldstr "what Husbandry is doing"
IL_000a: ldsfld Terminal/ConsoleEvent Husbandry.Commands.HusbandryCommand/<>c::<>9__0_0
IL_000f: dup
IL_0010: brtrue.s IL_0029
IL_0012: pop
IL_0013: ldsfld Husbandry.Commands.HusbandryCommand/<>c Husbandry.Commands.HusbandryCommand/<>c::<>9
IL_0018: ldftn System.Void Husbandry.Commands.HusbandryCommand/<>c::<Register>b__0_0(Terminal/ConsoleEventArgs)
IL_001e: newobj System.Void Terminal/ConsoleEvent::.ctor(System.Object,System.IntPtr)
IL_0023: dup
IL_0024: stsfld Terminal/ConsoleEvent Husbandry.Commands.HusbandryCommand/<>c::<>9__0_0
IL_0029: ldc.i4.0
IL_002a: ldc.i4.0
IL_002b: ldc.i4.0
IL_002c: ldc.i4.0
IL_002d: ldc.i4.0
IL_002e: ldc.i4.0
IL_002f: ldnull
IL_0030: ldc.i4.0
IL_0031: ldc.i4.0
IL_0032: ldc.i4.0
IL_0033: newobj System.Void Terminal/ConsoleCommand::.ctor(System.String,System.String,Terminal/ConsoleEvent,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,System.Boolean,Terminal/ConsoleOptionsFetcher,System.Boolean,System.Boolean,System.Boolean)
IL_0038: pop
IL_0039: ret

// System.Collections.Generic.List`1<System.String> Husbandry.Commands.HusbandryCommand::Report()
.locals System.Collections.Generic.List`1<System.String>, System.Single, System.Int32
IL_0000: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_0005: dup
IL_0006: ldstr "--- husbandry 1.1.0 ---"
IL_000b: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0010: stloc.0
IL_0011: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> Husbandry.Config.HusbandryConfig::ThrottleIdle
IL_0016: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_001b: brfalse IL_0111
IL_0020: ldloc.0
IL_0021: ldc.i4.s 9
IL_0023: newarr System.String
IL_0028: dup
IL_0029: ldc.i4.0
IL_002a: ldstr "  throttle   on: nothing inside "
IL_002f: stelem.ref
IL_0030: dup
IL_0031: ldc.i4.1
IL_0032: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Husbandry.Config.HusbandryConfig::NearRange
IL_0037: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_003c: stloc.1
IL_003d: ldloca.s V_1
IL_003f: call System.String System.Single::ToString()
IL_0044: stelem.ref
IL_0045: dup
IL_0046: ldc.i4.2
IL_0047: ldstr "m, one tick in "
IL_004c: stelem.ref
IL_004d: dup
IL_004e: ldc.i4.3
IL_004f: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> Husbandry.Config.HusbandryConfig::MidSkip
IL_0054: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0059: stloc.2
IL_005a: ldloca.s V_2
IL_005c: call System.String System.Int32::ToString()
IL_0061: stelem.ref
IL_0062: dup
IL_0063: ldc.i4.4
IL_0064: ldstr " out to "
IL_0069: stelem.ref
IL_006a: dup
IL_006b: ldc.i4.5
IL_006c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> Husbandry.Config.HusbandryConfig::FarRange
IL_0071: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0076: stloc.1
IL_0077: ldloca.s V_1
IL_0079: call System.String System.Single::ToString()
IL_007e: stelem.ref
IL_007f: dup
IL_0080: ldc.i4.6
IL_0081: ldstr "m, one in "
IL_0086: stelem.ref
IL_0087: dup
IL_0088: ldc.i4.7
IL_0089: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> Husbandry.Config.HusbandryConfig::FarSkip
IL_008e: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0093: stloc.2
IL_0094: ldloca.s V_2
IL_0096: call System.String System.Int32::ToString()
IL_009b: stelem.ref
IL_009c: dup
IL_009d: ldc.i4.8
IL_009e: ldstr " beyond"
IL_00a3: stelem.ref
IL_00a4: call System.String System.String::Concat(System.String[])
IL_00a9: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_00ae: ldloc.0
IL_00af: ldc.i4.7
IL_00b0: newarr System.String
IL_00b5: dup
IL_00b6: ldc.i4.0
IL_00b7: ldstr "  ticks      "
IL_00bc: stelem.ref
IL_00bd: dup
IL_00be: ldc.i4.1
IL_00bf: call System.Int32 Husbandry.Idle.Drowse::get_Thought()
IL_00c4: stloc.2
IL_00c5: ldloca.s V_2
IL_00c7: call System.String System.Int32::ToString()
IL_00cc: stelem.ref
IL_00cd: dup
IL_00ce: ldc.i4.2
IL_00cf: ldstr " thought, "
IL_00d4: stelem.ref
IL_00d5: dup
IL_00d6: ldc.i4.3
IL_00d7: call System.Int32 Husbandry.Idle.Drowse::get_Skipped()
IL_00dc: stloc.2
IL_00dd: ldloca.s V_2
IL_00df: call System.String System.Int32::ToString()
IL_00e4: stelem.ref
IL_00e5: dup
IL_00e6: ldc.i4.4
IL_00e7: ldstr " skipped, "
IL_00ec: stelem.ref
IL_00ed: dup
IL_00ee: ldc.i4.5
IL_00ef: call System.Int32 Husbandry.Idle.Drowse::get_Dozing()
IL_00f4: stloc.2
IL_00f5: ldloca.s V_2
IL_00f7: call System.String System.Int32::ToString()
IL_00fc: stelem.ref
IL_00fd: dup
IL_00fe: ldc.i4.6
IL_00ff: ldstr " idle-tame frame(s) seen"
IL_0104: stelem.ref
IL_0105: call System.String System.String::Concat(System.String[])
IL_010a: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_010f: br.s IL_011c
IL_0111: ldloc.0
IL_0112: ldstr "  throttle   off"
IL_0117: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_011c: ldloc.0
IL_011d: ldc.i4.7
IL_011e: newarr System.String
IL_0123: dup
IL_0124: ldc.i4.0
IL_0125: ldstr "  census     "
IL_012a: stelem.ref
IL_012b: dup
IL_012c: ldc.i4.1
IL_012d: call System.Int32 Husbandry.Herd.Muster::get_Counted()
IL_0132: stloc.2
IL_0133: ldloca.s V_2
IL_0135: call System.String System.Int32::ToString()
IL_013a: stelem.ref
IL_013b: dup
IL_013c: ldc.i4.2
IL_013d: ldstr " tame(s) across "
IL_0142: stelem.ref
IL_0143: dup
IL_0144: ldc.i4.3
IL_0145: call System.Int32 Husbandry.Herd.Muster::get_Species()
IL_014a: stloc.2
IL_014b: ldloca.s V_2
IL_014d: call System.String System.Int32::ToString()
IL_0152: stelem.ref
IL_0153: dup
IL_0154: ldc.i4.4
IL_0155: ldstr " species, taken "
IL_015a: stelem.ref
IL_015b: dup
IL_015c: ldc.i4.5
IL_015d: call System.Int32 Husbandry.Herd.Muster::get_Takings()
IL_0162: stloc.2
IL_0163: ldloca.s V_2
IL_0165: call System.String System.Int32::ToString()
IL_016a: stelem.ref
IL_016b: dup
IL_016c: ldc.i4.6
IL_016d: ldstr " time(s)"
IL_0172: stelem.ref
IL_0173: call System.String System.String::Concat(System.String[])
IL_0178: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_017d: ldloc.0
IL_017e: ldstr "  breeding   "
IL_0183: call System.Int32 Husbandry.Patches.BreedPatch::get_Skipped()
IL_0188: stloc.2
IL_0189: ldloca.s V_2
IL_018b: call System.String System.Int32::ToString()
IL_0190: ldstr " round(s) skipped at the cap"
IL_0195: call System.String System.String::Concat(System.String,System.String,System.String)
IL_019a: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_019f: ldloc.0
IL_01a0: call System.Collections.Generic.List`1<System.String> Husbandry.Offline.Steward::Report()
IL_01a5: callvirt System.Void System.Collections.Generic.List`1<System.String>::AddRange(System.Collections.Generic.IEnumerable`1<!0>)
IL_01aa: ldloc.0
IL_01ab: ret

// System.Void Husbandry.Commands.HusbandryCommand/<>c::.cctor()
.locals 
IL_0000: newobj System.Void Husbandry.Commands.HusbandryCommand/<>c::.ctor()
IL_0005: stsfld Husbandry.Commands.HusbandryCommand/<>c Husbandry.Commands.HusbandryCommand/<>c::<>9
IL_000a: ret

// System.Void Husbandry.Commands.HusbandryCommand/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void Husbandry.Commands.HusbandryCommand/<>c::<Register>b__0_0(Terminal/ConsoleEventArgs)
.locals System.Collections.Generic.List`1/Enumerator<System.String>, System.String
IL_0000: call System.Collections.Generic.List`1<System.String> Husbandry.Commands.HusbandryCommand::Report()
IL_0005: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<System.String>::GetEnumerator()
IL_000a: stloc.0
IL_000b: br.s IL_0021
IL_000d: ldloca.s V_0
IL_000f: call !0 System.Collections.Generic.List`1/Enumerator<System.String>::get_Current()
IL_0014: stloc.1
IL_0015: ldarg.1
IL_0016: ldfld Terminal Terminal/ConsoleEventArgs::Context
IL_001b: ldloc.1
IL_001c: callvirt System.Void Terminal::AddString(System.String)
IL_0021: ldloca.s V_0
IL_0023: call System.Boolean System.Collections.Generic.List`1/Enumerator<System.String>::MoveNext()
IL_0028: brtrue.s IL_000d
IL_002a: leave.s IL_003a
IL_002c: ldloca.s V_0
IL_002e: constrained. System.Collections.Generic.List`1/Enumerator<System.String>
IL_0034: callvirt System.Void System.IDisposable::Dispose()
IL_0039: endfinally
IL_003a: ret
// EH Finally: 11 - 44 => 44 - 58
