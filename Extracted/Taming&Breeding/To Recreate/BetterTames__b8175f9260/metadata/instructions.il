
// System.Void Microsoft.CodeAnalysis.EmbeddedAttribute::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: ret

// System.Void System.Runtime.CompilerServices.NullableAttribute::.ctor(System.Byte)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: ldarg.0
IL_0007: ldc.i4.1
IL_0008: newarr System.Byte
IL_000d: dup
IL_000e: ldc.i4.0
IL_000f: ldarg.1
IL_0010: stelem.i1
IL_0011: stfld System.Byte[] System.Runtime.CompilerServices.NullableAttribute::NullableFlags
IL_0016: ret

// System.Void System.Runtime.CompilerServices.NullableAttribute::.ctor(System.Byte[])
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: stfld System.Byte[] System.Runtime.CompilerServices.NullableAttribute::NullableFlags
IL_000d: ret

// System.Void System.Runtime.CompilerServices.NullableContextAttribute::.ctor(System.Byte)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: stfld System.Byte System.Runtime.CompilerServices.NullableContextAttribute::Flag
IL_000d: ret

// System.Void BetterTames.Plugin::Awake()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BetterTames.Plugin::InitializeConfig()
IL_0006: ldstr "xtav1m.BetterTames"
IL_000b: newobj System.Void HarmonyLib.Harmony::.ctor(System.String)
IL_0010: call System.Void HarmonyLib.Harmony::PatchAll()
IL_0015: ldsfld BepInEx.Logging.ManualLogSource BetterTames.Plugin::Logger
IL_001a: ldstr "BetterTames 0.9.0 loaded"
IL_001f: callvirt System.Void BepInEx.Logging.ManualLogSource::LogInfo(System.Object)
IL_0024: ret

// System.Void BetterTames.Plugin::Update()
.locals 
IL_0000: call System.Void BetterTames.Scripts.Commands.Commands::Tick()
IL_0005: call System.Void BetterTames.Scripts.CatchUp.CatchUp::Tick()
IL_000a: call System.Void BetterTames.Scripts.Protection.Protection::Tick()
IL_000f: ret

// BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
.locals BepInEx.Configuration.ConfigDescription, BepInEx.Configuration.ConfigEntry`1<T>
IL_0000: ldarg.s description
IL_0002: callvirt System.String BepInEx.Configuration.ConfigDescription::get_Description()
IL_0007: ldarg.s synchronizedSetting
IL_0009: brtrue IL_0018
IL_000e: ldstr " [Not Synced with Server]"
IL_0013: br IL_001d
IL_0018: ldstr " [Synced with Server]"
IL_001d: call System.String System.String::Concat(System.String,System.String)
IL_0022: ldarg.s description
IL_0024: callvirt BepInEx.Configuration.AcceptableValueBase BepInEx.Configuration.ConfigDescription::get_AcceptableValues()
IL_0029: ldarg.s description
IL_002b: callvirt System.Object[] BepInEx.Configuration.ConfigDescription::get_Tags()
IL_0030: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0035: stloc.0
IL_0036: ldarg.0
IL_0037: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_003c: ldarg.1
IL_003d: ldarg.2
IL_003e: ldarg.3
IL_003f: ldloc.0
IL_0040: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<T>(System.String,System.String,!!0,BepInEx.Configuration.ConfigDescription)
IL_0045: stloc.1
IL_0046: ldsfld ServerSync.ConfigSync BetterTames.Plugin::configSync
IL_004b: ldloc.1
IL_004c: callvirt ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync::AddConfigEntry<T>(BepInEx.Configuration.ConfigEntry`1<T>)
IL_0051: ldarg.s synchronizedSetting
IL_0053: stfld System.Boolean ServerSync.OwnConfigEntryBase::SynchronizedConfig
IL_0058: ldloc.1
IL_0059: ret

// System.Void BetterTames.Plugin::InitializeConfig()
.locals BepInEx.Configuration.ConfigEntry`1<System.Boolean>
IL_0000: ldarg.0
IL_0001: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0006: ldc.i4.0
IL_0007: callvirt System.Void BepInEx.Configuration.ConfigFile::set_SaveOnConfigSet(System.Boolean)
IL_000c: ldarg.0
IL_000d: ldstr "1 - General"
IL_0012: ldstr "Lock Configuration"
IL_0017: ldc.i4.1
IL_0018: ldstr "If enabled, the configuration is locked and can be changed by server admins only."
IL_001d: ldnull
IL_001e: call !!0[] System.Array::Empty<System.Object>()
IL_0023: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0028: ldc.i4.1
IL_0029: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_002e: stloc.0
IL_002f: ldsfld ServerSync.ConfigSync BetterTames.Plugin::configSync
IL_0034: ldloc.0
IL_0035: callvirt ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync::AddLockingConfigEntry<System.Boolean>(BepInEx.Configuration.ConfigEntry`1<T>)
IL_003a: pop
IL_003b: ldarg.0
IL_003c: ldstr "2 - Timers"
IL_0041: ldstr "Show Taming Timer"
IL_0046: ldc.i4.1
IL_0047: ldstr "Show how long a creature you are taming has left, counting any taming boost from players nearby. The timer is marked paused while the creature is hungry or frightened, since taming stops then."
IL_004c: ldnull
IL_004d: call !!0[] System.Array::Empty<System.Object>()
IL_0052: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0057: ldc.i4.0
IL_0058: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_005d: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::showTamingTimer
IL_0062: ldarg.0
IL_0063: ldstr "2 - Timers"
IL_0068: ldstr "Show Breeding Timer"
IL_006d: ldc.i4.1
IL_006e: ldstr "Show how long a pregnant tame has left before giving birth. A tame that is not pregnant shows its love points instead: it gains one now and then while fed, calm and next to a partner, and gets pregnant when they are full."
IL_0073: ldnull
IL_0074: call !!0[] System.Array::Empty<System.Object>()
IL_0079: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_007e: ldc.i4.0
IL_007f: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_0084: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::showBreedingTimer
IL_0089: ldarg.0
IL_008a: ldstr "2 - Timers"
IL_008f: ldstr "Show Growth Timer"
IL_0094: ldc.i4.1
IL_0095: ldstr "Show how long offspring have left before growing up."
IL_009a: ldnull
IL_009b: call !!0[] System.Array::Empty<System.Object>()
IL_00a0: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_00a5: ldc.i4.0
IL_00a6: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_00ab: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::showGrowthTimer
IL_00b0: ldarg.0
IL_00b1: ldstr "3 - Taming"
IL_00b6: ldstr "Taming Time"
IL_00bb: ldc.i4.s 30
IL_00bd: ldstr "Minutes of feeding it takes to tame any creature."
IL_00c2: ldc.i4.1
IL_00c3: ldc.i4 180
IL_00c8: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Int32>::.ctor(!0,!0)
IL_00cd: call !!0[] System.Array::Empty<System.Object>()
IL_00d2: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_00d7: ldc.i4.1
IL_00d8: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Int32>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_00dd: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::tamingTime
IL_00e2: ldarg.0
IL_00e3: ldstr "4 - Breeding"
IL_00e8: ldstr "Love Points Needed"
IL_00ed: ldc.i4.3
IL_00ee: ldstr "Love points a tame needs before it gets pregnant. It gains one now and then while fed, calm and next to a partner."
IL_00f3: ldc.i4.1
IL_00f4: ldc.i4.s 20
IL_00f6: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Int32>::.ctor(!0,!0)
IL_00fb: call !!0[] System.Array::Empty<System.Object>()
IL_0100: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0105: ldc.i4.1
IL_0106: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Int32>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_010b: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::lovePoints
IL_0110: ldarg.0
IL_0111: ldstr "4 - Breeding"
IL_0116: ldstr "Growth Time"
IL_011b: ldc.i4.s 30
IL_011d: ldstr "Minutes offspring take to grow up."
IL_0122: ldc.i4.1
IL_0123: ldc.i4 180
IL_0128: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Int32>::.ctor(!0,!0)
IL_012d: call !!0[] System.Array::Empty<System.Object>()
IL_0132: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0137: ldc.i4.1
IL_0138: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Int32>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_013d: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::growthTime
IL_0142: ldarg.0
IL_0143: ldstr "4 - Breeding"
IL_0148: ldstr "Crowd Limit"
IL_014d: ldc.i4.6
IL_014e: ldstr "How many creatures of the same kind can be nearby before breeding stops."
IL_0153: ldc.i4.1
IL_0154: ldc.i4.s 20
IL_0156: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Int32>::.ctor(!0,!0)
IL_015b: call !!0[] System.Array::Empty<System.Object>()
IL_0160: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0165: ldc.i4.1
IL_0166: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Int32>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_016b: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::maxCreaturesNearby
IL_0170: ldarg.0
IL_0171: ldstr "4 - Breeding"
IL_0176: ldstr "Crowd Range"
IL_017b: ldc.r4 10
IL_0180: ldstr "How far, in meters, Crowd Limit counts around a breeding pair."
IL_0185: ldc.r4 1
IL_018a: ldc.r4 200
IL_018f: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Single>::.ctor(!0,!0)
IL_0194: call !!0[] System.Array::Empty<System.Object>()
IL_0199: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_019e: ldc.i4.1
IL_019f: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Single>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_01a4: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> BetterTames.Plugin::maxCreaturesRange
IL_01a9: ldarg.0
IL_01aa: ldstr "4 - Breeding"
IL_01af: ldstr "Offspring Star Chance"
IL_01b4: ldc.i4.s 25
IL_01b6: ldstr "Percent chance a newborn is one star above the tame giving birth, up to 2 stars. Eggs are not affected."
IL_01bb: ldc.i4.0
IL_01bc: ldc.i4.s 100
IL_01be: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Int32>::.ctor(!0,!0)
IL_01c3: call !!0[] System.Array::Empty<System.Object>()
IL_01c8: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_01cd: ldc.i4.1
IL_01ce: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Int32>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_01d3: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::offspringStarChance
IL_01d8: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::tamingTime
IL_01dd: ldsfld System.EventHandler BetterTames.Plugin/<>c::<>9__38_0
IL_01e2: dup
IL_01e3: brtrue IL_01ff
IL_01e8: pop
IL_01e9: ldsfld BetterTames.Plugin/<>c BetterTames.Plugin/<>c::<>9
IL_01ee: ldftn System.Void BetterTames.Plugin/<>c::<InitializeConfig>b__38_0(System.Object,System.EventArgs)
IL_01f4: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_01f9: dup
IL_01fa: stsfld System.EventHandler BetterTames.Plugin/<>c::<>9__38_0
IL_01ff: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<System.Int32>::add_SettingChanged(System.EventHandler)
IL_0204: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::lovePoints
IL_0209: ldsfld System.EventHandler BetterTames.Plugin/<>c::<>9__38_1
IL_020e: dup
IL_020f: brtrue IL_022b
IL_0214: pop
IL_0215: ldsfld BetterTames.Plugin/<>c BetterTames.Plugin/<>c::<>9
IL_021a: ldftn System.Void BetterTames.Plugin/<>c::<InitializeConfig>b__38_1(System.Object,System.EventArgs)
IL_0220: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_0225: dup
IL_0226: stsfld System.EventHandler BetterTames.Plugin/<>c::<>9__38_1
IL_022b: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<System.Int32>::add_SettingChanged(System.EventHandler)
IL_0230: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::growthTime
IL_0235: ldsfld System.EventHandler BetterTames.Plugin/<>c::<>9__38_2
IL_023a: dup
IL_023b: brtrue IL_0257
IL_0240: pop
IL_0241: ldsfld BetterTames.Plugin/<>c BetterTames.Plugin/<>c::<>9
IL_0246: ldftn System.Void BetterTames.Plugin/<>c::<InitializeConfig>b__38_2(System.Object,System.EventArgs)
IL_024c: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_0251: dup
IL_0252: stsfld System.EventHandler BetterTames.Plugin/<>c::<>9__38_2
IL_0257: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<System.Int32>::add_SettingChanged(System.EventHandler)
IL_025c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::maxCreaturesNearby
IL_0261: ldsfld System.EventHandler BetterTames.Plugin/<>c::<>9__38_3
IL_0266: dup
IL_0267: brtrue IL_0283
IL_026c: pop
IL_026d: ldsfld BetterTames.Plugin/<>c BetterTames.Plugin/<>c::<>9
IL_0272: ldftn System.Void BetterTames.Plugin/<>c::<InitializeConfig>b__38_3(System.Object,System.EventArgs)
IL_0278: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_027d: dup
IL_027e: stsfld System.EventHandler BetterTames.Plugin/<>c::<>9__38_3
IL_0283: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<System.Int32>::add_SettingChanged(System.EventHandler)
IL_0288: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> BetterTames.Plugin::maxCreaturesRange
IL_028d: ldsfld System.EventHandler BetterTames.Plugin/<>c::<>9__38_4
IL_0292: dup
IL_0293: brtrue IL_02af
IL_0298: pop
IL_0299: ldsfld BetterTames.Plugin/<>c BetterTames.Plugin/<>c::<>9
IL_029e: ldftn System.Void BetterTames.Plugin/<>c::<InitializeConfig>b__38_4(System.Object,System.EventArgs)
IL_02a4: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_02a9: dup
IL_02aa: stsfld System.EventHandler BetterTames.Plugin/<>c::<>9__38_4
IL_02af: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<System.Single>::add_SettingChanged(System.EventHandler)
IL_02b4: ldarg.0
IL_02b5: ldstr "5 - Commands"
IL_02ba: ldstr "Command Any Tame"
IL_02bf: ldc.i4.1
IL_02c0: ldstr "Press E on any tame to make it follow you or stay, not only on wolves, lox and the others the game allows. Off leaves each creature as the game or its mod made it."
IL_02c5: ldnull
IL_02c6: call !!0[] System.Array::Empty<System.Object>()
IL_02cb: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_02d0: ldc.i4.1
IL_02d1: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_02d6: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::commandAllTames
IL_02db: ldarg.0
IL_02dc: ldstr "5 - Commands"
IL_02e1: ldstr "Follow All Key"
IL_02e6: ldc.i4.s 102
IL_02e8: ldc.i4.1
IL_02e9: newarr UnityEngine.KeyCode
IL_02ee: dup
IL_02ef: ldc.i4.0
IL_02f0: ldc.i4 308
IL_02f5: stelem.i4
IL_02f6: newobj System.Void BepInEx.Configuration.KeyboardShortcut::.ctor(UnityEngine.KeyCode,UnityEngine.KeyCode[])
IL_02fb: ldstr "Every tame in range that is not following anyone starts following you."
IL_0300: ldnull
IL_0301: call !!0[] System.Array::Empty<System.Object>()
IL_0306: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_030b: ldc.i4.0
IL_030c: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<BepInEx.Configuration.KeyboardShortcut>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_0311: stsfld BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> BetterTames.Plugin::massFollowKey
IL_0316: ldarg.0
IL_0317: ldstr "5 - Commands"
IL_031c: ldstr "Stay All Key"
IL_0321: ldc.i4.s 103
IL_0323: ldc.i4.1
IL_0324: newarr UnityEngine.KeyCode
IL_0329: dup
IL_032a: ldc.i4.0
IL_032b: ldc.i4 308
IL_0330: stelem.i4
IL_0331: newobj System.Void BepInEx.Configuration.KeyboardShortcut::.ctor(UnityEngine.KeyCode,UnityEngine.KeyCode[])
IL_0336: ldstr "Every tame in range that is following you stays where it is."
IL_033b: ldnull
IL_033c: call !!0[] System.Array::Empty<System.Object>()
IL_0341: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0346: ldc.i4.0
IL_0347: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<BepInEx.Configuration.KeyboardShortcut>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_034c: stsfld BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> BetterTames.Plugin::massStayKey
IL_0351: ldarg.0
IL_0352: ldstr "5 - Commands"
IL_0357: ldstr "Follow/Stay All Range"
IL_035c: ldc.r4 30
IL_0361: ldstr "How far, in meters, the Follow All and Stay All keys reach."
IL_0366: ldc.r4 5
IL_036b: ldc.r4 100
IL_0370: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Single>::.ctor(!0,!0)
IL_0375: call !!0[] System.Array::Empty<System.Object>()
IL_037a: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_037f: ldc.i4.1
IL_0380: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Single>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_0385: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> BetterTames.Plugin::massCommandRange
IL_038a: ldarg.0
IL_038b: ldstr "1 - General"
IL_0390: ldstr "Tames Fight Their Own Kind"
IL_0395: ldc.i4.1
IL_0396: ldstr "A tame fights wild creatures of its own kind that are in a fight, like a tamed wolf defending you from wild wolves. Calm ones, and ones you are partway through taming, are left alone. The game normally keeps them on the same side."
IL_039b: ldnull
IL_039c: call !!0[] System.Array::Empty<System.Object>()
IL_03a1: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_03a6: ldc.i4.1
IL_03a7: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_03ac: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::tamesFightOwnKind
IL_03b1: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::commandAllTames
IL_03b6: ldsfld System.EventHandler BetterTames.Plugin/<>c::<>9__38_5
IL_03bb: dup
IL_03bc: brtrue IL_03d8
IL_03c1: pop
IL_03c2: ldsfld BetterTames.Plugin/<>c BetterTames.Plugin/<>c::<>9
IL_03c7: ldftn System.Void BetterTames.Plugin/<>c::<InitializeConfig>b__38_5(System.Object,System.EventArgs)
IL_03cd: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_03d2: dup
IL_03d3: stsfld System.EventHandler BetterTames.Plugin/<>c::<>9__38_5
IL_03d8: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<System.Boolean>::add_SettingChanged(System.EventHandler)
IL_03dd: ldarg.0
IL_03de: ldstr "6 - Teleport"
IL_03e3: ldstr "Teleport Lost Tames"
IL_03e8: ldc.i4.1
IL_03e9: ldstr "A tame that is following you teleports to you if it falls too far behind, and after you die and respawn. Vanilla following has no distance limit, so a tame stuck on terrain or left behind at your death is otherwise stuck or lost for good."
IL_03ee: ldnull
IL_03ef: call !!0[] System.Array::Empty<System.Object>()
IL_03f4: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_03f9: ldc.i4.1
IL_03fa: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_03ff: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::catchUpTeleport
IL_0404: ldarg.0
IL_0405: ldstr "6 - Teleport"
IL_040a: ldstr "Teleport Distance"
IL_040f: ldc.r4 30
IL_0414: ldstr "How far, in meters, a following tame can fall behind before it teleports to you."
IL_0419: ldc.r4 20
IL_041e: ldc.r4 50
IL_0423: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Single>::.ctor(!0,!0)
IL_0428: call !!0[] System.Array::Empty<System.Object>()
IL_042d: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0432: ldc.i4.1
IL_0433: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Single>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_0438: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> BetterTames.Plugin::catchUpDistance
IL_043d: ldarg.0
IL_043e: ldstr "6 - Teleport"
IL_0443: ldstr "Teleport Tames Key"
IL_0448: ldc.i4.s 104
IL_044a: ldc.i4.1
IL_044b: newarr UnityEngine.KeyCode
IL_0450: dup
IL_0451: ldc.i4.0
IL_0452: ldc.i4 308
IL_0457: stelem.i4
IL_0458: newobj System.Void BepInEx.Configuration.KeyboardShortcut::.ctor(UnityEngine.KeyCode,UnityEngine.KeyCode[])
IL_045d: ldstr "Every tame following you teleports to you right away."
IL_0462: ldnull
IL_0463: call !!0[] System.Array::Empty<System.Object>()
IL_0468: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_046d: ldc.i4.0
IL_046e: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<BepInEx.Configuration.KeyboardShortcut>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_0473: stsfld BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> BetterTames.Plugin::teleportFollowersKey
IL_0478: ldarg.0
IL_0479: ldstr "6 - Teleport"
IL_047e: ldstr "Big Tames Enter Dungeons"
IL_0483: ldc.i4.0
IL_0484: ldstr "Following tames come with you into dungeons and back out. Turn off to leave big tames, like lox, outside, since they get stuck in narrow corridors."
IL_0489: ldnull
IL_048a: call !!0[] System.Array::Empty<System.Object>()
IL_048f: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0494: ldc.i4.1
IL_0495: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_049a: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::bigTamesEnterDungeons
IL_049f: ldarg.0
IL_04a0: ldstr "6 - Teleport"
IL_04a5: ldstr "Tames Follow Through Portals"
IL_04aa: ldc.i4.1
IL_04ab: ldstr "Tames following you near a portal come through it with you. The game normally leaves them behind."
IL_04b0: ldnull
IL_04b1: call !!0[] System.Array::Empty<System.Object>()
IL_04b6: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_04bb: ldc.i4.1
IL_04bc: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_04c1: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::portalTeleport
IL_04c6: ldarg.0
IL_04c7: ldstr "7 - Leveling"
IL_04cc: ldstr "Gain Stars From Kills"
IL_04d1: ldc.i4.1
IL_04d2: ldstr "A tame has a chance to gain a star whenever it kills an enemy, up to 2 stars. The chance is higher the more stars the enemy has over the tame; killing something the same star or lower gives no bonus."
IL_04d7: ldnull
IL_04d8: call !!0[] System.Array::Empty<System.Object>()
IL_04dd: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_04e2: ldc.i4.1
IL_04e3: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_04e8: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::starUpOnKill
IL_04ed: ldarg.0
IL_04ee: ldstr "7 - Leveling"
IL_04f3: ldstr "Star Chance"
IL_04f8: ldc.i4.s 10
IL_04fa: ldstr "Base percent chance to gain a star on a kill."
IL_04ff: ldc.i4.0
IL_0500: ldc.i4.s 100
IL_0502: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Int32>::.ctor(!0,!0)
IL_0507: call !!0[] System.Array::Empty<System.Object>()
IL_050c: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0511: ldc.i4.1
IL_0512: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Int32>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_0517: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::starUpBaseChance
IL_051c: ldarg.0
IL_051d: ldstr "7 - Leveling"
IL_0522: ldstr "Bonus Chance Per Star"
IL_0527: ldc.i4.5
IL_0528: ldstr "Percent added per star the killed enemy has over the tame."
IL_052d: ldc.i4.0
IL_052e: ldc.i4.s 100
IL_0530: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Int32>::.ctor(!0,!0)
IL_0535: call !!0[] System.Array::Empty<System.Object>()
IL_053a: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_053f: ldc.i4.1
IL_0540: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Int32>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_0545: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::starUpBonusPerStar
IL_054a: ldarg.0
IL_054b: ldstr "7 - Leveling"
IL_0550: ldstr "Heal On New Star"
IL_0555: ldc.i4.1
IL_0556: ldstr "A tame that gains a star from a kill is healed to full."
IL_055b: ldnull
IL_055c: call !!0[] System.Array::Empty<System.Object>()
IL_0561: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0566: ldc.i4.1
IL_0567: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_056c: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::healOnStarUp
IL_0571: ldarg.0
IL_0572: ldstr "8 - Health"
IL_0577: ldstr "Full Heal Time"
IL_057c: ldc.i4 3600
IL_0581: ldstr "Seconds a tame takes to heal from empty to full. Lower is faster. Regeneration pauses while a tame is hungry, the same as the game's own creatures."
IL_0586: ldc.i4.s 60
IL_0588: ldc.i4 7200
IL_058d: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Int32>::.ctor(!0,!0)
IL_0592: call !!0[] System.Array::Empty<System.Object>()
IL_0597: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_059c: ldc.i4.1
IL_059d: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Int32>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_05a2: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::regenTime
IL_05a7: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::regenTime
IL_05ac: ldsfld System.EventHandler BetterTames.Plugin/<>c::<>9__38_6
IL_05b1: dup
IL_05b2: brtrue IL_05ce
IL_05b7: pop
IL_05b8: ldsfld BetterTames.Plugin/<>c BetterTames.Plugin/<>c::<>9
IL_05bd: ldftn System.Void BetterTames.Plugin/<>c::<InitializeConfig>b__38_6(System.Object,System.EventArgs)
IL_05c3: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_05c8: dup
IL_05c9: stsfld System.EventHandler BetterTames.Plugin/<>c::<>9__38_6
IL_05ce: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<System.Int32>::add_SettingChanged(System.EventHandler)
IL_05d3: ldarg.0
IL_05d4: ldstr "8 - Health"
IL_05d9: ldstr "Protect All Tames"
IL_05de: ldc.i4.1
IL_05df: ldstr "A tame that would die lies down to recover instead. Enemies leave it alone while it is down. A butcher knife still kills it. Individual tames can be switched with the Protection Key."
IL_05e4: ldnull
IL_05e5: call !!0[] System.Array::Empty<System.Object>()
IL_05ea: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_05ef: ldc.i4.1
IL_05f0: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_05f5: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::protectAllTames
IL_05fa: ldarg.0
IL_05fb: ldstr "8 - Health"
IL_0600: ldstr "Recovery Time"
IL_0605: ldc.i4.s 60
IL_0607: ldstr "Seconds a recovering tame rests, healing back to full, before it gets up."
IL_060c: ldc.i4.s 10
IL_060e: ldc.i4 600
IL_0613: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Int32>::.ctor(!0,!0)
IL_0618: call !!0[] System.Array::Empty<System.Object>()
IL_061d: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0622: ldc.i4.1
IL_0623: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Int32>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_0628: stsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::recoveryTime
IL_062d: ldarg.0
IL_062e: ldstr "8 - Health"
IL_0633: ldstr "Protection Key"
IL_0638: ldc.i4.s 101
IL_063a: ldc.i4.1
IL_063b: newarr UnityEngine.KeyCode
IL_0640: dup
IL_0641: ldc.i4.0
IL_0642: ldc.i4 308
IL_0647: stelem.i4
IL_0648: newobj System.Void BepInEx.Configuration.KeyboardShortcut::.ctor(UnityEngine.KeyCode,UnityEngine.KeyCode[])
IL_064d: ldstr "Switch protection on or off for the tame you are looking at, overriding Protect All Tames for that tame."
IL_0652: ldnull
IL_0653: call !!0[] System.Array::Empty<System.Object>()
IL_0658: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_065d: ldc.i4.0
IL_065e: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<BepInEx.Configuration.KeyboardShortcut>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_0663: stsfld BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> BetterTames.Plugin::toggleProtectionKey
IL_0668: ldarg.0
IL_0669: ldstr "8 - Health"
IL_066e: ldstr "Show Recovering Tames"
IL_0673: ldc.i4.1
IL_0674: ldstr "Show the name and health bar of a recovering tame when you look at it. The game hides sleeping creatures from the crosshair, so with this off a recovering tame shows no name or health bar and the Protection Key can't reach it."
IL_0679: ldnull
IL_067a: call !!0[] System.Array::Empty<System.Object>()
IL_067f: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0684: ldc.i4.0
IL_0685: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_068a: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::showDownedTames
IL_068f: ldarg.0
IL_0690: ldstr "9 - Feeding"
IL_0695: ldstr "Wild Creatures Eat From Chests"
IL_069a: ldc.i4.1
IL_069b: ldstr "A hungry creature you are taming eats from a nearby chest when there is no food on the ground, so taming keeps going without dropping food by hand."
IL_06a0: ldnull
IL_06a1: call !!0[] System.Array::Empty<System.Object>()
IL_06a6: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_06ab: ldc.i4.1
IL_06ac: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_06b1: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::wildEatFromChests
IL_06b6: ldarg.0
IL_06b7: ldstr "9 - Feeding"
IL_06bc: ldstr "Tames Eat From Chests"
IL_06c1: ldc.i4.1
IL_06c2: ldstr "A hungry tame eats from a nearby chest when there is no food on the ground, which keeps it healing and breeding."
IL_06c7: ldnull
IL_06c8: call !!0[] System.Array::Empty<System.Object>()
IL_06cd: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_06d2: ldc.i4.1
IL_06d3: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_06d8: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::tamesEatFromChests
IL_06dd: ldarg.0
IL_06de: ldstr "9 - Feeding"
IL_06e3: ldstr "Chest Range"
IL_06e8: ldc.r4 10
IL_06ed: ldstr "How far, in meters, a creature reaches for a chest. It eats in place and never walks to it. Only chests a player built count, not dungeon or other world loot."
IL_06f2: ldc.r4 2
IL_06f7: ldc.r4 30
IL_06fc: newobj System.Void BepInEx.Configuration.AcceptableValueRange`1<System.Single>::.ctor(!0,!0)
IL_0701: call !!0[] System.Array::Empty<System.Object>()
IL_0706: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_070b: ldc.i4.1
IL_070c: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Single>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_0711: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> BetterTames.Plugin::chestRange
IL_0716: ldarg.0
IL_0717: ldstr "9 - Feeding"
IL_071c: ldstr "Only Food Chests"
IL_0721: ldc.i4.0
IL_0722: ldstr "Only eat from a chest that holds nothing but food this creature eats, so a feeding chest can sit next to your storage without being raided."
IL_0727: ldnull
IL_0728: call !!0[] System.Array::Empty<System.Object>()
IL_072d: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0732: ldc.i4.1
IL_0733: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_0738: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::chestRequireOnlyFood
IL_073d: ldarg.0
IL_073e: ldstr "Debug"
IL_0743: ldstr "Debug Mode"
IL_0748: ldc.i4.0
IL_0749: ldstr "Log what the mod is doing to tamed creatures."
IL_074e: ldnull
IL_074f: call !!0[] System.Array::Empty<System.Object>()
IL_0754: newobj System.Void BepInEx.Configuration.ConfigDescription::.ctor(System.String,BepInEx.Configuration.AcceptableValueBase,System.Object[])
IL_0759: ldc.i4.0
IL_075a: call BepInEx.Configuration.ConfigEntry`1<T> BetterTames.Plugin::ConfigSync<System.Boolean>(System.String,System.String,T,BepInEx.Configuration.ConfigDescription,System.Boolean)
IL_075f: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::debugMode
IL_0764: ldarg.0
IL_0765: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_076a: ldc.i4.1
IL_076b: callvirt System.Void BepInEx.Configuration.ConfigFile::set_SaveOnConfigSet(System.Boolean)
IL_0770: ldarg.0
IL_0771: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0776: callvirt System.Void BepInEx.Configuration.ConfigFile::Save()
IL_077b: ret

// System.Void BetterTames.Plugin::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BepInEx.BaseUnityPlugin::.ctor()
IL_0006: ret

// System.Void BetterTames.Plugin::.cctor()
.locals 
IL_0000: ldstr "BetterTames"
IL_0005: call BepInEx.Logging.ManualLogSource BepInEx.Logging.Logger::CreateLogSource(System.String)
IL_000a: stsfld BepInEx.Logging.ManualLogSource BetterTames.Plugin::Logger
IL_000f: ldstr "xtav1m.BetterTames"
IL_0014: newobj System.Void ServerSync.ConfigSync::.ctor(System.String)
IL_0019: dup
IL_001a: ldstr "BetterTames"
IL_001f: stfld System.String ServerSync.ConfigSync::DisplayName
IL_0024: dup
IL_0025: ldstr "0.9.0"
IL_002a: stfld System.String ServerSync.ConfigSync::CurrentVersion
IL_002f: dup
IL_0030: ldstr "0.9.0"
IL_0035: stfld System.String ServerSync.ConfigSync::MinimumRequiredVersion
IL_003a: stsfld ServerSync.ConfigSync BetterTames.Plugin::configSync
IL_003f: ret

// System.Void BetterTames.Plugin/<>c::.cctor()
.locals 
IL_0000: newobj System.Void BetterTames.Plugin/<>c::.ctor()
IL_0005: stsfld BetterTames.Plugin/<>c BetterTames.Plugin/<>c::<>9
IL_000a: ret

// System.Void BetterTames.Plugin/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void BetterTames.Plugin/<>c::<InitializeConfig>b__38_0(System.Object,System.EventArgs)
.locals 
IL_0000: call System.Void BetterTames.Scripts.Tuning.Tuning::ApplyAll()
IL_0005: ret

// System.Void BetterTames.Plugin/<>c::<InitializeConfig>b__38_1(System.Object,System.EventArgs)
.locals 
IL_0000: call System.Void BetterTames.Scripts.Tuning.Tuning::ApplyAll()
IL_0005: ret

// System.Void BetterTames.Plugin/<>c::<InitializeConfig>b__38_2(System.Object,System.EventArgs)
.locals 
IL_0000: call System.Void BetterTames.Scripts.Tuning.Tuning::ApplyAll()
IL_0005: ret

// System.Void BetterTames.Plugin/<>c::<InitializeConfig>b__38_3(System.Object,System.EventArgs)
.locals 
IL_0000: call System.Void BetterTames.Scripts.Tuning.Tuning::ApplyAll()
IL_0005: ret

// System.Void BetterTames.Plugin/<>c::<InitializeConfig>b__38_4(System.Object,System.EventArgs)
.locals 
IL_0000: call System.Void BetterTames.Scripts.Tuning.Tuning::ApplyAll()
IL_0005: ret

// System.Void BetterTames.Plugin/<>c::<InitializeConfig>b__38_5(System.Object,System.EventArgs)
.locals 
IL_0000: call System.Void BetterTames.Scripts.Commands.Commands::ApplyAll()
IL_0005: ret

// System.Void BetterTames.Plugin/<>c::<InitializeConfig>b__38_6(System.Object,System.EventArgs)
.locals 
IL_0000: call System.Void BetterTames.Scripts.Tuning.Tuning::ApplyAll()
IL_0005: ret

// System.Void BetterTames.Scripts.Breeding.Offspring::BeginProcreate(Procreation)
.locals 
IL_0000: ldarg.0
IL_0001: callvirt !!0 UnityEngine.Component::GetComponent<Character>()
IL_0006: stsfld Character BetterTames.Scripts.Breeding.Offspring::birthingParent
IL_000b: ret

// System.Void BetterTames.Scripts.Breeding.Offspring::EndProcreate()
.locals 
IL_0000: ldnull
IL_0001: stsfld Character BetterTames.Scripts.Breeding.Offspring::birthingParent
IL_0006: ret

// System.Void BetterTames.Scripts.Breeding.Offspring::AdjustNewbornLevel(Character,System.Int32&)
.locals 
IL_0000: ldsfld Character BetterTames.Scripts.Breeding.Offspring::birthingParent
IL_0005: ldnull
IL_0006: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000b: brtrue IL_0020
IL_0010: ldarg.0
IL_0011: ldsfld Character BetterTames.Scripts.Breeding.Offspring::birthingParent
IL_0016: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_001b: brfalse IL_0021
IL_0020: ret
IL_0021: ldnull
IL_0022: stsfld Character BetterTames.Scripts.Breeding.Offspring::birthingParent
IL_0027: ldarg.1
IL_0028: ldind.i4
IL_0029: ldc.i4.6
IL_002a: blt IL_0030
IL_002f: ret
IL_0030: ldc.r4 0
IL_0035: ldc.r4 100
IL_003a: call System.Single UnityEngine.Random::Range(System.Single,System.Single)
IL_003f: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::offspringStarChance
IL_0044: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0049: conv.r4
IL_004a: bge.un IL_0055
IL_004f: ldarg.1
IL_0050: ldarg.1
IL_0051: ldind.i4
IL_0052: ldc.i4.1
IL_0053: add
IL_0054: stind.i4
IL_0055: ret

// System.Void BetterTames.Scripts.Breeding.OffspringPatches::Procreation_Procreate_Prefix(Procreation)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BetterTames.Scripts.Breeding.Offspring::BeginProcreate(Procreation)
IL_0006: ret

// System.Void BetterTames.Scripts.Breeding.OffspringPatches::Procreation_Procreate_Finalizer()
.locals 
IL_0000: call System.Void BetterTames.Scripts.Breeding.Offspring::EndProcreate()
IL_0005: ret

// System.Void BetterTames.Scripts.Breeding.OffspringPatches::Character_SetLevel_Prefix(Character,System.Int32&)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: call System.Void BetterTames.Scripts.Breeding.Offspring::AdjustNewbornLevel(Character,System.Int32&)
IL_0007: ret

// System.Int64 BetterTames.Scripts.Protection.Protection::get_Now()
.locals System.DateTime
IL_0000: call ZNet ZNet::get_instance()
IL_0005: callvirt System.DateTime ZNet::GetTime()
IL_000a: stloc.0
IL_000b: ldloca.s V_0
IL_000d: call System.Int64 System.DateTime::get_Ticks()
IL_0012: ret

// System.Void BetterTames.Scripts.Protection.Protection::DebugLog(Character,MonsterAI,System.String)
.locals UnityEngine.Animator, System.Boolean, UnityEngine.AnimatorControllerParameter[], System.Int32
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::debugMode
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue IL_0010
IL_000f: ret
IL_0010: ldarg.0
IL_0011: callvirt !!0 UnityEngine.Component::GetComponentInChildren<UnityEngine.Animator>()
IL_0016: stloc.0
IL_0017: ldc.i4.0
IL_0018: stloc.1
IL_0019: ldloc.0
IL_001a: ldnull
IL_001b: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0020: brfalse IL_005a
IL_0025: ldloc.0
IL_0026: callvirt UnityEngine.AnimatorControllerParameter[] UnityEngine.Animator::get_parameters()
IL_002b: stloc.2
IL_002c: ldc.i4.0
IL_002d: stloc.3
IL_002e: br IL_0054
IL_0033: ldloc.2
IL_0034: ldloc.3
IL_0035: ldelem.any UnityEngine.AnimatorControllerParameter
IL_003a: callvirt System.String UnityEngine.AnimatorControllerParameter::get_name()
IL_003f: ldstr "sleeping"
IL_0044: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0049: brfalse IL_0050
IL_004e: ldc.i4.1
IL_004f: stloc.1
IL_0050: ldloc.3
IL_0051: ldc.i4.1
IL_0052: add
IL_0053: stloc.3
IL_0054: ldloc.3
IL_0055: ldloc.2
IL_0056: ldlen
IL_0057: conv.i4
IL_0058: blt.s IL_0033
IL_005a: ldsfld BepInEx.Logging.ManualLogSource BetterTames.Plugin::Logger
IL_005f: ldstr "[Protection] {0} {1}: sleepParam={2} sleeping={3} "
IL_0064: ldc.i4.4
IL_0065: newarr System.Object
IL_006a: dup
IL_006b: ldc.i4.0
IL_006c: ldarg.2
IL_006d: stelem.ref
IL_006e: dup
IL_006f: ldc.i4.1
IL_0070: ldarg.0
IL_0071: ldfld System.String Character::m_name
IL_0076: stelem.ref
IL_0077: dup
IL_0078: ldc.i4.2
IL_0079: ldloc.1
IL_007a: box System.Boolean
IL_007f: stelem.ref
IL_0080: dup
IL_0081: ldc.i4.3
IL_0082: ldsfld System.Func`2<MonsterAI,System.Boolean> BetterTames.Scripts.Protection.Protection::IsSleeping
IL_0087: ldarg.1
IL_0088: callvirt !1 System.Func`2<MonsterAI,System.Boolean>::Invoke(!0)
IL_008d: box System.Boolean
IL_0092: stelem.ref
IL_0093: call System.String System.String::Format(System.String,System.Object[])
IL_0098: ldstr "moveDir={0} currentVel={1} "
IL_009d: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,UnityEngine.Vector3> BetterTames.Scripts.Protection.Protection::MoveDir
IL_00a2: ldarg.0
IL_00a3: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,UnityEngine.Vector3>::Invoke(!0)
IL_00a8: ldobj UnityEngine.Vector3
IL_00ad: box UnityEngine.Vector3
IL_00b2: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,UnityEngine.Vector3> BetterTames.Scripts.Protection.Protection::CurrentVel
IL_00b7: ldarg.0
IL_00b8: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,UnityEngine.Vector3>::Invoke(!0)
IL_00bd: ldobj UnityEngine.Vector3
IL_00c2: box UnityEngine.Vector3
IL_00c7: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_00cc: ldstr "forward_speed={0:0.00} "
IL_00d1: ldloc.0
IL_00d2: ldnull
IL_00d3: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_00d8: brtrue IL_00e7
IL_00dd: ldc.r4 -1
IL_00e2: br IL_00f2
IL_00e7: ldloc.0
IL_00e8: ldstr "forward_speed"
IL_00ed: callvirt System.Single UnityEngine.Animator::GetFloat(System.String)
IL_00f2: box System.Single
IL_00f7: call System.String System.String::Format(System.String,System.Object)
IL_00fc: ldstr "animSleeping={0}"
IL_0101: ldloc.0
IL_0102: ldnull
IL_0103: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0108: ldloc.1
IL_0109: and
IL_010a: brfalse IL_011f
IL_010f: ldloc.0
IL_0110: ldstr "sleeping"
IL_0115: callvirt System.Boolean UnityEngine.Animator::GetBool(System.String)
IL_011a: br IL_0120
IL_011f: ldc.i4.0
IL_0120: box System.Boolean
IL_0125: call System.String System.String::Format(System.String,System.Object)
IL_012a: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_012f: callvirt System.Void BepInEx.Logging.ManualLogSource::LogInfo(System.Object)
IL_0134: ret

// System.Boolean BetterTames.Scripts.Protection.Protection::WildWillFight(Character)
.locals BaseAI, Tameable, ZNetView
IL_0000: ldarg.0
IL_0001: callvirt BaseAI Character::GetBaseAI()
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: ldnull
IL_0009: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000e: brtrue IL_001e
IL_0013: ldloc.0
IL_0014: callvirt System.Boolean BaseAI::IsAlerted()
IL_0019: brtrue IL_0020
IL_001e: ldc.i4.0
IL_001f: ret
IL_0020: ldarg.0
IL_0021: ldloca.s V_1
IL_0023: callvirt System.Boolean UnityEngine.Component::TryGetComponent<Tameable>(!!0&)
IL_0028: brtrue IL_002f
IL_002d: ldc.i4.1
IL_002e: ret
IL_002f: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView> BetterTames.Scripts.Protection.Protection::NView
IL_0034: ldarg.0
IL_0035: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView>::Invoke(!0)
IL_003a: ldind.ref
IL_003b: stloc.2
IL_003c: ldloc.2
IL_003d: ldnull
IL_003e: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0043: brtrue IL_0053
IL_0048: ldloc.2
IL_0049: callvirt System.Boolean ZNetView::IsValid()
IL_004e: brtrue IL_0055
IL_0053: ldc.i4.1
IL_0054: ret
IL_0055: ldloc.2
IL_0056: callvirt ZDO ZNetView::GetZDO()
IL_005b: ldsfld System.Int32 ZDOVars::s_tameTimeLeft
IL_0060: ldloc.1
IL_0061: ldfld System.Single Tameable::m_tamingTime
IL_0066: callvirt System.Single ZDO::GetFloat(System.Int32,System.Single)
IL_006b: ldloc.1
IL_006c: ldfld System.Single Tameable::m_tamingTime
IL_0071: clt.un
IL_0073: ldc.i4.0
IL_0074: ceq
IL_0076: ret

// System.Boolean BetterTames.Scripts.Protection.Protection::IsDowned(Character)
.locals ZNetView
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0007: brtrue IL_0017
IL_000c: ldarg.0
IL_000d: callvirt System.Boolean Character::IsTamed()
IL_0012: brtrue IL_0019
IL_0017: ldc.i4.0
IL_0018: ret
IL_0019: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView> BetterTames.Scripts.Protection.Protection::NView
IL_001e: ldarg.0
IL_001f: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView>::Invoke(!0)
IL_0024: ldind.ref
IL_0025: stloc.0
IL_0026: ldloc.0
IL_0027: ldnull
IL_0028: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_002d: brfalse IL_0054
IL_0032: ldloc.0
IL_0033: callvirt System.Boolean ZNetView::IsValid()
IL_0038: brfalse IL_0054
IL_003d: ldloc.0
IL_003e: callvirt ZDO ZNetView::GetZDO()
IL_0043: ldsfld System.Int32 BetterTames.Scripts.Protection.Protection::RecoverUntilKey
IL_0048: ldc.i4.0
IL_0049: conv.i8
IL_004a: callvirt System.Int64 ZDO::GetLong(System.Int32,System.Int64)
IL_004f: ldc.i4.0
IL_0050: conv.i8
IL_0051: cgt.un
IL_0053: ret
IL_0054: ldc.i4.0
IL_0055: ret

// System.Boolean BetterTames.Scripts.Protection.Protection::TryDown(Character)
.locals MonsterAI, ZNetView, ZDO, System.TimeSpan
IL_0000: ldarg.0
IL_0001: callvirt System.Boolean Character::IsTamed()
IL_0006: brfalse IL_0020
IL_000b: ldsfld System.Func`2<Character,System.Single> BetterTames.Scripts.Protection.Protection::GetHealth
IL_0010: ldarg.0
IL_0011: callvirt !1 System.Func`2<Character,System.Single>::Invoke(!0)
IL_0016: ldc.r4 0
IL_001b: ble.un IL_0022
IL_0020: ldc.i4.0
IL_0021: ret
IL_0022: ldarg.0
IL_0023: ldloca.s V_0
IL_0025: callvirt System.Boolean UnityEngine.Component::TryGetComponent<MonsterAI>(!!0&)
IL_002a: brtrue IL_0031
IL_002f: ldc.i4.0
IL_0030: ret
IL_0031: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView> BetterTames.Scripts.Protection.Protection::NView
IL_0036: ldarg.0
IL_0037: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView>::Invoke(!0)
IL_003c: ldind.ref
IL_003d: stloc.1
IL_003e: ldloc.1
IL_003f: ldnull
IL_0040: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0045: brtrue IL_0060
IL_004a: ldloc.1
IL_004b: callvirt System.Boolean ZNetView::IsValid()
IL_0050: brfalse IL_0060
IL_0055: ldloc.1
IL_0056: callvirt System.Boolean ZNetView::IsOwner()
IL_005b: brtrue IL_0062
IL_0060: ldc.i4.0
IL_0061: ret
IL_0062: ldloc.1
IL_0063: callvirt ZDO ZNetView::GetZDO()
IL_0068: stloc.2
IL_0069: ldloc.2
IL_006a: call System.Boolean BetterTames.Scripts.Protection.Protection::IsProtected(ZDO)
IL_006f: brfalse IL_007f
IL_0074: ldarg.0
IL_0075: call System.Boolean BetterTames.Scripts.Protection.Protection::KilledWithButcherKnife(Character)
IL_007a: brfalse IL_0081
IL_007f: ldc.i4.0
IL_0080: ret
IL_0081: ldloc.2
IL_0082: ldsfld System.Int32 BetterTames.Scripts.Protection.Protection::RecoverUntilKey
IL_0087: call System.Int64 BetterTames.Scripts.Protection.Protection::get_Now()
IL_008c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::recoveryTime
IL_0091: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0096: conv.r8
IL_0097: call System.TimeSpan System.TimeSpan::FromSeconds(System.Double)
IL_009c: stloc.3
IL_009d: ldloca.s V_3
IL_009f: call System.Int64 System.TimeSpan::get_Ticks()
IL_00a4: add
IL_00a5: callvirt System.Void ZDO::Set(System.Int32,System.Int64)
IL_00aa: ldsfld System.Action`2<Character,System.Single> BetterTames.Scripts.Protection.Protection::SetHealth
IL_00af: ldarg.0
IL_00b0: ldc.r4 1
IL_00b5: callvirt System.Void System.Action`2<Character,System.Single>::Invoke(!0,!1)
IL_00ba: ldloc.0
IL_00bb: ldarg.0
IL_00bc: call System.Void BetterTames.Scripts.Protection.Protection::Calm(MonsterAI,Character)
IL_00c1: ldsfld System.Action`1<MonsterAI> BetterTames.Scripts.Protection.Protection::Sleep
IL_00c6: ldloc.0
IL_00c7: callvirt System.Void System.Action`1<MonsterAI>::Invoke(!0)
IL_00cc: ldsfld System.Collections.Generic.HashSet`1<Character> BetterTames.Scripts.Protection.Protection::Downed
IL_00d1: ldarg.0
IL_00d2: callvirt System.Boolean System.Collections.Generic.HashSet`1<Character>::Add(!0)
IL_00d7: pop
IL_00d8: ldarg.0
IL_00d9: ldloc.0
IL_00da: ldstr "downed"
IL_00df: call System.Void BetterTames.Scripts.Protection.Protection::DebugLog(Character,MonsterAI,System.String)
IL_00e4: ldc.i4.1
IL_00e5: ret

// System.Boolean BetterTames.Scripts.Protection.Protection::UpdateRecovery(MonsterAI)
.locals Character, ZNetView, ZDO, System.Int64, System.Int64, System.Single, System.TimeSpan, System.Int64, System.Single
IL_0000: ldarg.0
IL_0001: ldloca.s V_0
IL_0003: callvirt System.Boolean UnityEngine.Component::TryGetComponent<Character>(!!0&)
IL_0008: brtrue IL_000f
IL_000d: ldc.i4.0
IL_000e: ret
IL_000f: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView> BetterTames.Scripts.Protection.Protection::NView
IL_0014: ldloc.0
IL_0015: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView>::Invoke(!0)
IL_001a: ldind.ref
IL_001b: stloc.1
IL_001c: ldloc.1
IL_001d: ldnull
IL_001e: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0023: brtrue IL_0033
IL_0028: ldloc.1
IL_0029: callvirt System.Boolean ZNetView::IsValid()
IL_002e: brtrue IL_0035
IL_0033: ldc.i4.0
IL_0034: ret
IL_0035: ldloc.1
IL_0036: callvirt ZDO ZNetView::GetZDO()
IL_003b: stloc.2
IL_003c: ldloc.2
IL_003d: ldsfld System.Int32 BetterTames.Scripts.Protection.Protection::RecoverUntilKey
IL_0042: ldc.i4.0
IL_0043: conv.i8
IL_0044: callvirt System.Int64 ZDO::GetLong(System.Int32,System.Int64)
IL_0049: stloc.3
IL_004a: ldloc.3
IL_004b: brtrue IL_0052
IL_0050: ldc.i4.0
IL_0051: ret
IL_0052: ldsfld System.Collections.Generic.HashSet`1<Character> BetterTames.Scripts.Protection.Protection::Downed
IL_0057: ldloc.0
IL_0058: callvirt System.Boolean System.Collections.Generic.HashSet`1<Character>::Add(!0)
IL_005d: pop
IL_005e: ldloc.1
IL_005f: callvirt System.Boolean ZNetView::IsOwner()
IL_0064: brtrue IL_006b
IL_0069: ldc.i4.1
IL_006a: ret
IL_006b: ldarg.0
IL_006c: ldloc.0
IL_006d: call System.Void BetterTames.Scripts.Protection.Protection::Calm(MonsterAI,Character)
IL_0072: ldsfld System.Func`2<MonsterAI,System.Boolean> BetterTames.Scripts.Protection.Protection::IsSleeping
IL_0077: ldarg.0
IL_0078: callvirt !1 System.Func`2<MonsterAI,System.Boolean>::Invoke(!0)
IL_007d: brtrue IL_008d
IL_0082: ldsfld System.Action`1<MonsterAI> BetterTames.Scripts.Protection.Protection::Sleep
IL_0087: ldarg.0
IL_0088: callvirt System.Void System.Action`1<MonsterAI>::Invoke(!0)
IL_008d: call System.Single UnityEngine.Time::get_time()
IL_0092: ldsfld System.Single BetterTames.Scripts.Protection.Protection::lastDebugLog
IL_0097: sub
IL_0098: ldc.r4 2
IL_009d: ble.un IL_00b8
IL_00a2: call System.Single UnityEngine.Time::get_time()
IL_00a7: stsfld System.Single BetterTames.Scripts.Protection.Protection::lastDebugLog
IL_00ac: ldloc.0
IL_00ad: ldarg.0
IL_00ae: ldstr "recovering"
IL_00b3: call System.Void BetterTames.Scripts.Protection.Protection::DebugLog(Character,MonsterAI,System.String)
IL_00b8: call System.Int64 BetterTames.Scripts.Protection.Protection::get_Now()
IL_00bd: stloc.s V_4
IL_00bf: ldsfld System.Func`2<Character,System.Single> BetterTames.Scripts.Protection.Protection::GetMaxHealth
IL_00c4: ldloc.0
IL_00c5: callvirt !1 System.Func`2<Character,System.Single>::Invoke(!0)
IL_00ca: stloc.s V_5
IL_00cc: ldloc.s V_4
IL_00ce: ldloc.3
IL_00cf: blt IL_0107
IL_00d4: ldloc.2
IL_00d5: ldsfld System.Int32 BetterTames.Scripts.Protection.Protection::RecoverUntilKey
IL_00da: ldc.i4.0
IL_00db: conv.i8
IL_00dc: callvirt System.Void ZDO::Set(System.Int32,System.Int64)
IL_00e1: ldsfld System.Action`2<Character,System.Single> BetterTames.Scripts.Protection.Protection::SetHealth
IL_00e6: ldloc.0
IL_00e7: ldloc.s V_5
IL_00e9: callvirt System.Void System.Action`2<Character,System.Single>::Invoke(!0,!1)
IL_00ee: ldsfld System.Action`1<MonsterAI> BetterTames.Scripts.Protection.Protection::Wakeup
IL_00f3: ldarg.0
IL_00f4: callvirt System.Void System.Action`1<MonsterAI>::Invoke(!0)
IL_00f9: ldsfld System.Collections.Generic.HashSet`1<Character> BetterTames.Scripts.Protection.Protection::Downed
IL_00fe: ldloc.0
IL_00ff: callvirt System.Boolean System.Collections.Generic.HashSet`1<Character>::Remove(!0)
IL_0104: pop
IL_0105: ldc.i4.1
IL_0106: ret
IL_0107: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::recoveryTime
IL_010c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0111: conv.r8
IL_0112: call System.TimeSpan System.TimeSpan::FromSeconds(System.Double)
IL_0117: stloc.s V_6
IL_0119: ldloca.s V_6
IL_011b: call System.Int64 System.TimeSpan::get_Ticks()
IL_0120: stloc.s V_7
IL_0122: ldloc.s V_5
IL_0124: ldc.r4 1
IL_0129: ldloc.3
IL_012a: ldloc.s V_4
IL_012c: sub
IL_012d: conv.r4
IL_012e: ldloc.s V_7
IL_0130: conv.r4
IL_0131: div
IL_0132: sub
IL_0133: mul
IL_0134: stloc.s V_8
IL_0136: ldloc.s V_8
IL_0138: ldsfld System.Func`2<Character,System.Single> BetterTames.Scripts.Protection.Protection::GetHealth
IL_013d: ldloc.0
IL_013e: callvirt !1 System.Func`2<Character,System.Single>::Invoke(!0)
IL_0143: ble.un IL_0155
IL_0148: ldsfld System.Action`2<Character,System.Single> BetterTames.Scripts.Protection.Protection::SetHealth
IL_014d: ldloc.0
IL_014e: ldloc.s V_8
IL_0150: callvirt System.Void System.Action`2<Character,System.Single>::Invoke(!0,!1)
IL_0155: ldc.i4.1
IL_0156: ret

// System.Void BetterTames.Scripts.Protection.Protection::Calm(MonsterAI,Character)
.locals UnityEngine.Rigidbody, ZSyncAnimation
IL_0000: ldsfld System.Action`1<BaseAI> BetterTames.Scripts.Protection.Protection::StopMoving
IL_0005: ldarg.0
IL_0006: callvirt System.Void System.Action`1<BaseAI>::Invoke(!0)
IL_000b: ldsfld System.Action`2<MonsterAI,System.Boolean> BetterTames.Scripts.Protection.Protection::SetAlerted
IL_0010: ldarg.0
IL_0011: ldc.i4.0
IL_0012: callvirt System.Void System.Action`2<MonsterAI,System.Boolean>::Invoke(!0,!1)
IL_0017: ldsfld System.Action`2<BaseAI,ZDOID> BetterTames.Scripts.Protection.Protection::SetTargetInfo
IL_001c: ldarg.0
IL_001d: ldsfld ZDOID ZDOID::None
IL_0022: callvirt System.Void System.Action`2<BaseAI,ZDOID>::Invoke(!0,!1)
IL_0027: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,UnityEngine.Vector3> BetterTames.Scripts.Protection.Protection::CurrentVel
IL_002c: ldarg.1
IL_002d: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,UnityEngine.Vector3>::Invoke(!0)
IL_0032: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_0037: stobj UnityEngine.Vector3
IL_003c: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,UnityEngine.Rigidbody> BetterTames.Scripts.Protection.Protection::Body
IL_0041: ldarg.1
IL_0042: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,UnityEngine.Rigidbody>::Invoke(!0)
IL_0047: ldind.ref
IL_0048: stloc.0
IL_0049: ldloc.0
IL_004a: ldnull
IL_004b: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0050: brfalse IL_0075
IL_0055: ldloc.0
IL_0056: ldc.r4 0
IL_005b: ldloc.0
IL_005c: callvirt UnityEngine.Vector3 UnityEngine.Rigidbody::get_linearVelocity()
IL_0061: ldfld System.Single UnityEngine.Vector3::y
IL_0066: ldc.r4 0
IL_006b: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0070: callvirt System.Void UnityEngine.Rigidbody::set_linearVelocity(UnityEngine.Vector3)
IL_0075: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,ZSyncAnimation> BetterTames.Scripts.Protection.Protection::ZAnim
IL_007a: ldarg.1
IL_007b: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,ZSyncAnimation>::Invoke(!0)
IL_0080: ldind.ref
IL_0081: stloc.1
IL_0082: ldloc.1
IL_0083: ldnull
IL_0084: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0089: brfalse IL_008f
IL_008e: ret
IL_008f: ldsfld System.Action`3<ZSyncAnimation,System.Int32,System.Single> BetterTames.Scripts.Protection.Protection::SetAnimFloat
IL_0094: ldloc.1
IL_0095: ldsfld System.Int32 BetterTames.Scripts.Protection.Protection::ForwardSpeed
IL_009a: ldc.r4 0
IL_009f: callvirt System.Void System.Action`3<ZSyncAnimation,System.Int32,System.Single>::Invoke(!0,!1,!2)
IL_00a4: ldsfld System.Action`3<ZSyncAnimation,System.Int32,System.Single> BetterTames.Scripts.Protection.Protection::SetAnimFloat
IL_00a9: ldloc.1
IL_00aa: ldsfld System.Int32 BetterTames.Scripts.Protection.Protection::SidewaySpeed
IL_00af: ldc.r4 0
IL_00b4: callvirt System.Void System.Action`3<ZSyncAnimation,System.Int32,System.Single>::Invoke(!0,!1,!2)
IL_00b9: ldsfld System.Action`3<ZSyncAnimation,System.Int32,System.Single> BetterTames.Scripts.Protection.Protection::SetAnimFloat
IL_00be: ldloc.1
IL_00bf: ldsfld System.Int32 BetterTames.Scripts.Protection.Protection::TurnSpeed
IL_00c4: ldc.r4 0
IL_00c9: callvirt System.Void System.Action`3<ZSyncAnimation,System.Int32,System.Single>::Invoke(!0,!1,!2)
IL_00ce: ret

// System.String BetterTames.Scripts.Protection.Protection::HoverLine(Character,ZDO)
.locals MonsterAI, System.Int64, System.Int32
IL_0000: ldarg.0
IL_0001: callvirt System.Boolean Character::IsTamed()
IL_0006: brfalse IL_0018
IL_000b: ldarg.0
IL_000c: ldloca.s V_0
IL_000e: callvirt System.Boolean UnityEngine.Component::TryGetComponent<MonsterAI>(!!0&)
IL_0013: brtrue IL_001a
IL_0018: ldnull
IL_0019: ret
IL_001a: ldarg.1
IL_001b: ldsfld System.Int32 BetterTames.Scripts.Protection.Protection::RecoverUntilKey
IL_0020: ldc.i4.0
IL_0021: conv.i8
IL_0022: callvirt System.Int64 ZDO::GetLong(System.Int32,System.Int64)
IL_0027: stloc.1
IL_0028: ldloc.1
IL_0029: brtrue IL_0030
IL_002e: ldnull
IL_002f: ret
IL_0030: ldstr "Recovering "
IL_0035: ldc.i4.0
IL_0036: ldloc.1
IL_0037: call System.Int64 BetterTames.Scripts.Protection.Protection::get_Now()
IL_003c: sub
IL_003d: conv.r4
IL_003e: ldc.r4 10000000
IL_0043: div
IL_0044: call System.Int32 UnityEngine.Mathf::CeilToInt(System.Single)
IL_0049: call System.Int32 UnityEngine.Mathf::Max(System.Int32,System.Int32)
IL_004e: stloc.2
IL_004f: ldloca.s V_2
IL_0051: call System.String System.Int32::ToString()
IL_0056: ldstr "s"
IL_005b: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0060: ret

// System.String BetterTames.Scripts.Protection.Protection::AddPrompt(Character,System.String)
.locals MonsterAI, ZNetView, System.String
IL_0000: ldarg.1
IL_0001: callvirt System.Int32 System.String::get_Length()
IL_0006: brfalse IL_0023
IL_000b: ldarg.0
IL_000c: callvirt System.Boolean Character::IsTamed()
IL_0011: brfalse IL_0023
IL_0016: ldarg.0
IL_0017: ldloca.s V_0
IL_0019: callvirt System.Boolean UnityEngine.Component::TryGetComponent<MonsterAI>(!!0&)
IL_001e: brtrue IL_0025
IL_0023: ldarg.1
IL_0024: ret
IL_0025: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView> BetterTames.Scripts.Protection.Protection::NView
IL_002a: ldarg.0
IL_002b: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView>::Invoke(!0)
IL_0030: ldind.ref
IL_0031: stloc.1
IL_0032: ldloc.1
IL_0033: ldnull
IL_0034: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0039: brtrue IL_0049
IL_003e: ldloc.1
IL_003f: callvirt System.Boolean ZNetView::IsValid()
IL_0044: brtrue IL_004b
IL_0049: ldarg.1
IL_004a: ret
IL_004b: ldloc.1
IL_004c: callvirt ZDO ZNetView::GetZDO()
IL_0051: call System.Boolean BetterTames.Scripts.Protection.Protection::IsProtected(ZDO)
IL_0056: brtrue IL_0065
IL_005b: ldstr "Off"
IL_0060: br IL_006a
IL_0065: ldstr "On"
IL_006a: stloc.2
IL_006b: ldc.i4.5
IL_006c: newarr System.String
IL_0071: dup
IL_0072: ldc.i4.0
IL_0073: ldarg.1
IL_0074: stelem.ref
IL_0075: dup
IL_0076: ldc.i4.1
IL_0077: ldstr "
[<color=yellow><b>"
IL_007c: stelem.ref
IL_007d: dup
IL_007e: ldc.i4.2
IL_007f: ldsfld BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> BetterTames.Plugin::toggleProtectionKey
IL_0084: callvirt !0 BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>::get_Value()
IL_0089: call System.String BetterTames.Scripts.Protection.Protection::KeyText(BepInEx.Configuration.KeyboardShortcut)
IL_008e: stelem.ref
IL_008f: dup
IL_0090: ldc.i4.3
IL_0091: ldstr "</b></color>] Protection: "
IL_0096: stelem.ref
IL_0097: dup
IL_0098: ldc.i4.4
IL_0099: ldloc.2
IL_009a: stelem.ref
IL_009b: call System.String System.String::Concat(System.String[])
IL_00a0: ret

// System.Void BetterTames.Scripts.Protection.Protection::TintNameplates(EnemyHud)
.locals System.Collections.IDictionary, System.Collections.IDictionaryEnumerator, System.Collections.DictionaryEntry, Character, System.String, TMPro.TMP_Text, System.IDisposable
IL_0000: ldsfld System.Collections.Generic.HashSet`1<Character> BetterTames.Scripts.Protection.Protection::Downed
IL_0005: ldsfld System.Predicate`1<Character> BetterTames.Scripts.Protection.Protection::IsGone
IL_000a: callvirt System.Int32 System.Collections.Generic.HashSet`1<Character>::RemoveWhere(System.Predicate`1<!0>)
IL_000f: pop
IL_0010: ldsfld System.Reflection.FieldInfo BetterTames.Scripts.Protection.Protection::HudsField
IL_0015: ldarg.0
IL_0016: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_001b: isinst System.Collections.IDictionary
IL_0020: stloc.0
IL_0021: ldloc.0
IL_0022: brtrue IL_0028
IL_0027: ret
IL_0028: ldloc.0
IL_0029: callvirt System.Collections.IDictionaryEnumerator System.Collections.IDictionary::GetEnumerator()
IL_002e: stloc.1
IL_002f: br IL_00d7
IL_0034: ldloc.1
IL_0035: callvirt System.Object System.Collections.IEnumerator::get_Current()
IL_003a: unbox.any System.Collections.DictionaryEntry
IL_003f: stloc.2
IL_0040: ldloca.s V_2
IL_0042: call System.Object System.Collections.DictionaryEntry::get_Key()
IL_0047: isinst Character
IL_004c: stloc.3
IL_004d: ldloc.3
IL_004e: brfalse IL_00d7
IL_0053: ldloc.3
IL_0054: ldnull
IL_0055: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_005a: brtrue IL_00d7
IL_005f: ldloc.3
IL_0060: call System.String BetterTames.Scripts.Protection.Protection::NameColor(Character)
IL_0065: stloc.s V_4
IL_0067: ldloc.s V_4
IL_0069: brfalse IL_00d7
IL_006e: ldsfld System.Reflection.FieldInfo BetterTames.Scripts.Protection.Protection::HudNameField
IL_0073: ldloca.s V_2
IL_0075: call System.Object System.Collections.DictionaryEntry::get_Value()
IL_007a: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_007f: isinst TMPro.TMP_Text
IL_0084: stloc.s V_5
IL_0086: ldloc.s V_5
IL_0088: brfalse IL_00d7
IL_008d: ldloc.s V_5
IL_008f: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0094: callvirt System.Boolean UnityEngine.GameObject::get_activeInHierarchy()
IL_0099: brfalse IL_00d7
IL_009e: ldloc.s V_5
IL_00a0: ldc.i4.5
IL_00a1: newarr System.String
IL_00a6: dup
IL_00a7: ldc.i4.0
IL_00a8: ldstr "<color="
IL_00ad: stelem.ref
IL_00ae: dup
IL_00af: ldc.i4.1
IL_00b0: ldloc.s V_4
IL_00b2: stelem.ref
IL_00b3: dup
IL_00b4: ldc.i4.2
IL_00b5: ldstr ">"
IL_00ba: stelem.ref
IL_00bb: dup
IL_00bc: ldc.i4.3
IL_00bd: ldloc.s V_5
IL_00bf: callvirt System.String TMPro.TMP_Text::get_text()
IL_00c4: stelem.ref
IL_00c5: dup
IL_00c6: ldc.i4.4
IL_00c7: ldstr "</color>"
IL_00cc: stelem.ref
IL_00cd: call System.String System.String::Concat(System.String[])
IL_00d2: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_00d7: ldloc.1
IL_00d8: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_00dd: brtrue IL_0034
IL_00e2: leave IL_00fe
IL_00e7: ldloc.1
IL_00e8: isinst System.IDisposable
IL_00ed: stloc.s V_6
IL_00ef: ldloc.s V_6
IL_00f1: brfalse IL_00fd
IL_00f6: ldloc.s V_6
IL_00f8: callvirt System.Void System.IDisposable::Dispose()
IL_00fd: endfinally
IL_00fe: ret
// EH Finally: 47 - 231 => 231 - 254

// System.String BetterTames.Scripts.Protection.Protection::NameColor(Character)
.locals MonsterAI, ZNetView, ZDO
IL_0000: ldarg.0
IL_0001: callvirt System.Boolean Character::IsTamed()
IL_0006: brfalse IL_0018
IL_000b: ldarg.0
IL_000c: ldloca.s V_0
IL_000e: callvirt System.Boolean UnityEngine.Component::TryGetComponent<MonsterAI>(!!0&)
IL_0013: brtrue IL_001a
IL_0018: ldnull
IL_0019: ret
IL_001a: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView> BetterTames.Scripts.Protection.Protection::NView
IL_001f: ldarg.0
IL_0020: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView>::Invoke(!0)
IL_0025: ldind.ref
IL_0026: stloc.1
IL_0027: ldloc.1
IL_0028: ldnull
IL_0029: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_002e: brtrue IL_003e
IL_0033: ldloc.1
IL_0034: callvirt System.Boolean ZNetView::IsValid()
IL_0039: brtrue IL_0040
IL_003e: ldnull
IL_003f: ret
IL_0040: ldloc.1
IL_0041: callvirt ZDO ZNetView::GetZDO()
IL_0046: stloc.2
IL_0047: ldloc.2
IL_0048: ldsfld System.Int32 BetterTames.Scripts.Protection.Protection::RecoverUntilKey
IL_004d: ldc.i4.0
IL_004e: conv.i8
IL_004f: callvirt System.Int64 ZDO::GetLong(System.Int32,System.Int64)
IL_0054: brfalse IL_006b
IL_0059: ldsfld System.Collections.Generic.HashSet`1<Character> BetterTames.Scripts.Protection.Protection::Downed
IL_005e: ldarg.0
IL_005f: callvirt System.Boolean System.Collections.Generic.HashSet`1<Character>::Add(!0)
IL_0064: pop
IL_0065: ldstr "#FFD24A"
IL_006a: ret
IL_006b: ldsfld System.Collections.Generic.HashSet`1<Character> BetterTames.Scripts.Protection.Protection::Downed
IL_0070: ldarg.0
IL_0071: callvirt System.Boolean System.Collections.Generic.HashSet`1<Character>::Remove(!0)
IL_0076: pop
IL_0077: ldloc.2
IL_0078: call System.Boolean BetterTames.Scripts.Protection.Protection::IsProtected(ZDO)
IL_007d: brtrue IL_0084
IL_0082: ldnull
IL_0083: ret
IL_0084: ldstr "#4FA3FF"
IL_0089: ret

// System.Void BetterTames.Scripts.Protection.Protection::FindDownedHover(Player,Character&)
.locals UnityEngine.Transform, System.Int32, Character, System.Single, System.Int32, UnityEngine.RaycastHit, Character
IL_0000: ldarg.1
IL_0001: ldind.ref
IL_0002: ldnull
IL_0003: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0008: brtrue IL_003b
IL_000d: ldsfld System.Collections.Generic.HashSet`1<Character> BetterTames.Scripts.Protection.Protection::Downed
IL_0012: callvirt System.Int32 System.Collections.Generic.HashSet`1<Character>::get_Count()
IL_0017: brfalse IL_003b
IL_001c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::showDownedTames
IL_0021: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0026: brfalse IL_003b
IL_002b: call GameCamera GameCamera::get_instance()
IL_0030: ldnull
IL_0031: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0036: brfalse IL_003c
IL_003b: ret
IL_003c: call GameCamera GameCamera::get_instance()
IL_0041: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0046: stloc.0
IL_0047: ldloc.0
IL_0048: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_004d: ldloc.0
IL_004e: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_forward()
IL_0053: ldsfld UnityEngine.RaycastHit[] BetterTames.Scripts.Protection.Protection::HoverHits
IL_0058: ldc.r4 50
IL_005d: ldsfld HarmonyLib.AccessTools/FieldRef`2<Player,System.Int32> BetterTames.Scripts.Protection.Protection::InteractMask
IL_0062: ldarg.0
IL_0063: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Player,System.Int32>::Invoke(!0)
IL_0068: ldind.i4
IL_0069: call System.Int32 UnityEngine.Physics::RaycastNonAlloc(UnityEngine.Vector3,UnityEngine.Vector3,UnityEngine.RaycastHit[],System.Single,System.Int32)
IL_006e: stloc.1
IL_006f: ldnull
IL_0070: stloc.2
IL_0071: ldc.r4 3.4028235E+38
IL_0076: stloc.3
IL_0077: ldc.i4.0
IL_0078: stloc.s V_4
IL_007a: br IL_0100
IL_007f: ldsfld UnityEngine.RaycastHit[] BetterTames.Scripts.Protection.Protection::HoverHits
IL_0084: ldloc.s V_4
IL_0086: ldelem.any UnityEngine.RaycastHit
IL_008b: stloc.s V_5
IL_008d: ldloca.s V_5
IL_008f: call UnityEngine.Collider UnityEngine.RaycastHit::get_collider()
IL_0094: callvirt UnityEngine.Rigidbody UnityEngine.Collider::get_attachedRigidbody()
IL_0099: ldnull
IL_009a: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_009f: brtrue IL_00b5
IL_00a4: ldloca.s V_5
IL_00a6: call UnityEngine.Collider UnityEngine.RaycastHit::get_collider()
IL_00ab: callvirt !!0 UnityEngine.Component::GetComponent<Character>()
IL_00b0: br IL_00c6
IL_00b5: ldloca.s V_5
IL_00b7: call UnityEngine.Collider UnityEngine.RaycastHit::get_collider()
IL_00bc: callvirt UnityEngine.Rigidbody UnityEngine.Collider::get_attachedRigidbody()
IL_00c1: callvirt !!0 UnityEngine.Component::GetComponent<Character>()
IL_00c6: stloc.s V_6
IL_00c8: ldloc.s V_6
IL_00ca: ldnull
IL_00cb: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_00d0: brtrue IL_00fa
IL_00d5: ldloc.s V_6
IL_00d7: ldarg.0
IL_00d8: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_00dd: brtrue IL_00fa
IL_00e2: ldloca.s V_5
IL_00e4: call System.Single UnityEngine.RaycastHit::get_distance()
IL_00e9: ldloc.3
IL_00ea: bge IL_00fa
IL_00ef: ldloc.s V_6
IL_00f1: stloc.2
IL_00f2: ldloca.s V_5
IL_00f4: call System.Single UnityEngine.RaycastHit::get_distance()
IL_00f9: stloc.3
IL_00fa: ldloc.s V_4
IL_00fc: ldc.i4.1
IL_00fd: add
IL_00fe: stloc.s V_4
IL_0100: ldloc.s V_4
IL_0102: ldloc.1
IL_0103: blt IL_007f
IL_0108: ldloc.2
IL_0109: ldnull
IL_010a: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_010f: brfalse IL_0127
IL_0114: ldsfld System.Collections.Generic.HashSet`1<Character> BetterTames.Scripts.Protection.Protection::Downed
IL_0119: ldloc.2
IL_011a: callvirt System.Boolean System.Collections.Generic.HashSet`1<Character>::Contains(!0)
IL_011f: brfalse IL_0127
IL_0124: ldarg.1
IL_0125: ldloc.2
IL_0126: stind.ref
IL_0127: ret

// System.Boolean BetterTames.Scripts.Protection.Protection::SwallowsInteract(Tameable)
.locals BepInEx.Configuration.KeyboardShortcut, Character
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> BetterTames.Plugin::toggleProtectionKey
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>::get_Value()
IL_000a: stloc.0
IL_000b: ldloca.s V_0
IL_000d: call System.Boolean BepInEx.Configuration.KeyboardShortcut::IsPressed()
IL_0012: brfalse IL_002b
IL_0017: ldarg.0
IL_0018: ldloca.s V_1
IL_001a: callvirt System.Boolean UnityEngine.Component::TryGetComponent<Character>(!!0&)
IL_001f: brfalse IL_002b
IL_0024: ldloc.1
IL_0025: callvirt System.Boolean Character::IsTamed()
IL_002a: ret
IL_002b: ldc.i4.0
IL_002c: ret

// System.Void BetterTames.Scripts.Protection.Protection::Tick()
.locals Player, BepInEx.Configuration.KeyboardShortcut, Character, MonsterAI, ZNetView, System.Boolean
IL_0000: ldsfld Player Player::m_localPlayer
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldnull
IL_0008: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000d: brtrue IL_0039
IL_0012: ldsfld System.Func`2<Player,System.Boolean> BetterTames.Scripts.Protection.Protection::TakeInput
IL_0017: ldloc.0
IL_0018: callvirt !1 System.Func`2<Player,System.Boolean>::Invoke(!0)
IL_001d: brfalse IL_0039
IL_0022: ldsfld BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> BetterTames.Plugin::toggleProtectionKey
IL_0027: callvirt !0 BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>::get_Value()
IL_002c: stloc.1
IL_002d: ldloca.s V_1
IL_002f: call System.Boolean BepInEx.Configuration.KeyboardShortcut::IsDown()
IL_0034: brtrue IL_003a
IL_0039: ret
IL_003a: ldsfld HarmonyLib.AccessTools/FieldRef`2<Player,Character> BetterTames.Scripts.Protection.Protection::HoveringCreature
IL_003f: ldloc.0
IL_0040: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Player,Character>::Invoke(!0)
IL_0045: ldind.ref
IL_0046: stloc.2
IL_0047: ldloc.2
IL_0048: ldnull
IL_0049: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_004e: brtrue IL_006b
IL_0053: ldloc.2
IL_0054: callvirt System.Boolean Character::IsTamed()
IL_0059: brfalse IL_006b
IL_005e: ldloc.2
IL_005f: ldloca.s V_3
IL_0061: callvirt System.Boolean UnityEngine.Component::TryGetComponent<MonsterAI>(!!0&)
IL_0066: brtrue IL_006c
IL_006b: ret
IL_006c: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView> BetterTames.Scripts.Protection.Protection::NView
IL_0071: ldloc.2
IL_0072: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView>::Invoke(!0)
IL_0077: ldind.ref
IL_0078: stloc.s V_4
IL_007a: ldloc.s V_4
IL_007c: ldnull
IL_007d: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0082: brtrue IL_0093
IL_0087: ldloc.s V_4
IL_0089: callvirt System.Boolean ZNetView::IsValid()
IL_008e: brtrue IL_0094
IL_0093: ret
IL_0094: ldsfld System.Action`1<ZNetView> BetterTames.Scripts.Protection.Protection::ClaimOwnership
IL_0099: ldloc.s V_4
IL_009b: callvirt System.Void System.Action`1<ZNetView>::Invoke(!0)
IL_00a0: ldloc.s V_4
IL_00a2: callvirt ZDO ZNetView::GetZDO()
IL_00a7: dup
IL_00a8: call System.Boolean BetterTames.Scripts.Protection.Protection::IsProtected(ZDO)
IL_00ad: ldc.i4.0
IL_00ae: ceq
IL_00b0: stloc.s V_5
IL_00b2: ldsfld System.Int32 BetterTames.Scripts.Protection.Protection::ProtectionKey
IL_00b7: ldloc.s V_5
IL_00b9: brtrue IL_00c4
IL_00be: ldc.i4.m1
IL_00bf: br IL_00c5
IL_00c4: ldc.i4.1
IL_00c5: ldc.i4.0
IL_00c6: callvirt System.Void ZDO::Set(System.Int32,System.Int32,System.Boolean)
IL_00cb: ldloc.0
IL_00cc: ldc.i4.2
IL_00cd: ldloc.2
IL_00ce: callvirt System.String Character::GetHoverName()
IL_00d3: ldstr " "
IL_00d8: ldloc.s V_5
IL_00da: brtrue IL_00e9
IL_00df: ldstr "not protected"
IL_00e4: br IL_00ee
IL_00e9: ldstr "protected"
IL_00ee: call System.String System.String::Concat(System.String,System.String,System.String)
IL_00f3: ldc.i4.0
IL_00f4: ldnull
IL_00f5: ldc.i4.0
IL_00f6: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_00fb: ret

// System.String BetterTames.Scripts.Protection.Protection::KeyText(BepInEx.Configuration.KeyboardShortcut)
.locals System.String, System.Collections.Generic.IEnumerator`1<UnityEngine.KeyCode>, UnityEngine.KeyCode
IL_0000: ldstr ""
IL_0005: stloc.0
IL_0006: ldarga.s shortcut
IL_0008: call System.Collections.Generic.IEnumerable`1<UnityEngine.KeyCode> BepInEx.Configuration.KeyboardShortcut::get_Modifiers()
IL_000d: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<UnityEngine.KeyCode>::GetEnumerator()
IL_0012: stloc.1
IL_0013: br IL_0031
IL_0018: ldloc.1
IL_0019: callvirt !0 System.Collections.Generic.IEnumerator`1<UnityEngine.KeyCode>::get_Current()
IL_001e: stloc.2
IL_001f: ldloc.0
IL_0020: ldloc.2
IL_0021: call System.String BetterTames.Scripts.Protection.Protection::KeyName(UnityEngine.KeyCode)
IL_0026: ldstr " + "
IL_002b: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0030: stloc.0
IL_0031: ldloc.1
IL_0032: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0037: brtrue.s IL_0018
IL_0039: leave IL_004b
IL_003e: ldloc.1
IL_003f: brfalse IL_004a
IL_0044: ldloc.1
IL_0045: callvirt System.Void System.IDisposable::Dispose()
IL_004a: endfinally
IL_004b: ldloc.0
IL_004c: ldarga.s shortcut
IL_004e: call UnityEngine.KeyCode BepInEx.Configuration.KeyboardShortcut::get_MainKey()
IL_0053: call System.String BetterTames.Scripts.Protection.Protection::KeyName(UnityEngine.KeyCode)
IL_0058: call System.String System.String::Concat(System.String,System.String)
IL_005d: ret
// EH Finally: 19 - 62 => 62 - 75

// System.String BetterTames.Scripts.Protection.Protection::KeyName(UnityEngine.KeyCode)
.locals System.String
IL_0000: ldarg.0
IL_0001: ldc.i4 303
IL_0006: sub
IL_0007: switch IL_0034,IL_0034,IL_003f,IL_003f,IL_0029,IL_0029
IL_0024: br IL_004a
IL_0029: ldstr "Alt"
IL_002e: stloc.0
IL_002f: br IL_0058
IL_0034: ldstr "Shift"
IL_0039: stloc.0
IL_003a: br IL_0058
IL_003f: ldstr "Ctrl"
IL_0044: stloc.0
IL_0045: br IL_0058
IL_004a: ldarga.s key
IL_004c: constrained. UnityEngine.KeyCode
IL_0052: callvirt System.String System.Object::ToString()
IL_0057: stloc.0
IL_0058: ldloc.0
IL_0059: ret

// System.Boolean BetterTames.Scripts.Protection.Protection::IsProtected(ZDO)
.locals System.Int32, System.Boolean
IL_0000: ldarg.0
IL_0001: ldsfld System.Int32 BetterTames.Scripts.Protection.Protection::ProtectionKey
IL_0006: ldc.i4.0
IL_0007: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: ldc.i4.m1
IL_000f: beq IL_0022
IL_0014: ldloc.0
IL_0015: ldc.i4.1
IL_0016: bne.un IL_0029
IL_001b: ldc.i4.1
IL_001c: stloc.1
IL_001d: br IL_0034
IL_0022: ldc.i4.0
IL_0023: stloc.1
IL_0024: br IL_0034
IL_0029: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::protectAllTames
IL_002e: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0033: stloc.1
IL_0034: ldloc.1
IL_0035: ret

// System.Boolean BetterTames.Scripts.Protection.Protection::KilledWithButcherKnife(Character)
.locals Humanoid
IL_0000: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,HitData> BetterTames.Scripts.Protection.Protection::LastHit
IL_0005: ldarg.0
IL_0006: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,HitData>::Invoke(!0)
IL_000b: ldind.ref
IL_000c: dup
IL_000d: brtrue IL_0019
IL_0012: pop
IL_0013: ldnull
IL_0014: br IL_001e
IL_0019: call Character HitData::GetAttacker()
IL_001e: isinst Humanoid
IL_0023: stloc.0
IL_0024: ldloc.0
IL_0025: brfalse IL_0054
IL_002a: ldloc.0
IL_002b: callvirt System.Boolean Character::IsPlayer()
IL_0030: brfalse IL_0054
IL_0035: ldsfld System.Func`2<Humanoid,ItemDrop/ItemData> BetterTames.Scripts.Protection.Protection::GetCurrentWeapon
IL_003a: ldloc.0
IL_003b: callvirt !1 System.Func`2<Humanoid,ItemDrop/ItemData>::Invoke(!0)
IL_0040: dup
IL_0041: brtrue IL_0049
IL_0046: pop
IL_0047: ldc.i4.0
IL_0048: ret
IL_0049: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_004e: ldfld System.Boolean ItemDrop/ItemData/SharedData::m_tamedOnly
IL_0053: ret
IL_0054: ldc.i4.0
IL_0055: ret

// System.Void BetterTames.Scripts.Protection.Protection::.cctor()
.locals 
IL_0000: ldstr "BetterTames_RecoverUntil"
IL_0005: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_000a: stsfld System.Int32 BetterTames.Scripts.Protection.Protection::RecoverUntilKey
IL_000f: ldstr "BetterTames_Protection"
IL_0014: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0019: stsfld System.Int32 BetterTames.Scripts.Protection.Protection::ProtectionKey
IL_001e: ldstr "m_nview"
IL_0023: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Character,ZNetView>(System.String)
IL_0028: stsfld HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView> BetterTames.Scripts.Protection.Protection::NView
IL_002d: ldstr "m_lastHit"
IL_0032: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Character,HitData>(System.String)
IL_0037: stsfld HarmonyLib.AccessTools/FieldRef`2<Character,HitData> BetterTames.Scripts.Protection.Protection::LastHit
IL_003c: ldstr "m_hoveringCreature"
IL_0041: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Player,Character>(System.String)
IL_0046: stsfld HarmonyLib.AccessTools/FieldRef`2<Player,Character> BetterTames.Scripts.Protection.Protection::HoveringCreature
IL_004b: ldtoken Character
IL_0050: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0055: ldstr "GetHealth"
IL_005a: ldnull
IL_005b: ldnull
IL_005c: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0061: ldnull
IL_0062: ldc.i4.1
IL_0063: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Func`2<Character,System.Single>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_0068: stsfld System.Func`2<Character,System.Single> BetterTames.Scripts.Protection.Protection::GetHealth
IL_006d: ldtoken Character
IL_0072: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0077: ldstr "GetMaxHealth"
IL_007c: ldnull
IL_007d: ldnull
IL_007e: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0083: ldnull
IL_0084: ldc.i4.1
IL_0085: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Func`2<Character,System.Single>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_008a: stsfld System.Func`2<Character,System.Single> BetterTames.Scripts.Protection.Protection::GetMaxHealth
IL_008f: ldtoken Character
IL_0094: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0099: ldstr "SetHealth"
IL_009e: ldnull
IL_009f: ldnull
IL_00a0: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_00a5: ldnull
IL_00a6: ldc.i4.1
IL_00a7: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Action`2<Character,System.Single>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_00ac: stsfld System.Action`2<Character,System.Single> BetterTames.Scripts.Protection.Protection::SetHealth
IL_00b1: ldtoken Humanoid
IL_00b6: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00bb: ldstr "GetCurrentWeapon"
IL_00c0: ldnull
IL_00c1: ldnull
IL_00c2: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_00c7: ldnull
IL_00c8: ldc.i4.1
IL_00c9: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Func`2<Humanoid,ItemDrop/ItemData>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_00ce: stsfld System.Func`2<Humanoid,ItemDrop/ItemData> BetterTames.Scripts.Protection.Protection::GetCurrentWeapon
IL_00d3: ldtoken MonsterAI
IL_00d8: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00dd: ldstr "Sleep"
IL_00e2: ldnull
IL_00e3: ldnull
IL_00e4: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_00e9: ldnull
IL_00ea: ldc.i4.1
IL_00eb: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Action`1<MonsterAI>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_00f0: stsfld System.Action`1<MonsterAI> BetterTames.Scripts.Protection.Protection::Sleep
IL_00f5: ldtoken MonsterAI
IL_00fa: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00ff: ldstr "Wakeup"
IL_0104: ldnull
IL_0105: ldnull
IL_0106: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_010b: ldnull
IL_010c: ldc.i4.1
IL_010d: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Action`1<MonsterAI>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_0112: stsfld System.Action`1<MonsterAI> BetterTames.Scripts.Protection.Protection::Wakeup
IL_0117: ldtoken BaseAI
IL_011c: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0121: ldstr "StopMoving"
IL_0126: ldnull
IL_0127: ldnull
IL_0128: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_012d: ldnull
IL_012e: ldc.i4.1
IL_012f: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Action`1<BaseAI>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_0134: stsfld System.Action`1<BaseAI> BetterTames.Scripts.Protection.Protection::StopMoving
IL_0139: ldtoken MonsterAI
IL_013e: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0143: ldstr "SetAlerted"
IL_0148: ldnull
IL_0149: ldnull
IL_014a: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_014f: ldnull
IL_0150: ldc.i4.1
IL_0151: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Action`2<MonsterAI,System.Boolean>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_0156: stsfld System.Action`2<MonsterAI,System.Boolean> BetterTames.Scripts.Protection.Protection::SetAlerted
IL_015b: ldtoken BaseAI
IL_0160: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0165: ldstr "SetTargetInfo"
IL_016a: ldnull
IL_016b: ldnull
IL_016c: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0171: ldnull
IL_0172: ldc.i4.1
IL_0173: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Action`2<BaseAI,ZDOID>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_0178: stsfld System.Action`2<BaseAI,ZDOID> BetterTames.Scripts.Protection.Protection::SetTargetInfo
IL_017d: ldtoken MonsterAI
IL_0182: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0187: ldstr "IsSleeping"
IL_018c: ldnull
IL_018d: ldnull
IL_018e: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0193: ldnull
IL_0194: ldc.i4.1
IL_0195: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Func`2<MonsterAI,System.Boolean>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_019a: stsfld System.Func`2<MonsterAI,System.Boolean> BetterTames.Scripts.Protection.Protection::IsSleeping
IL_019f: ldtoken ZNetView
IL_01a4: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_01a9: ldstr "ClaimOwnership"
IL_01ae: ldnull
IL_01af: ldnull
IL_01b0: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_01b5: ldnull
IL_01b6: ldc.i4.1
IL_01b7: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Action`1<ZNetView>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_01bc: stsfld System.Action`1<ZNetView> BetterTames.Scripts.Protection.Protection::ClaimOwnership
IL_01c1: ldtoken Player
IL_01c6: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_01cb: ldstr "TakeInput"
IL_01d0: ldnull
IL_01d1: ldnull
IL_01d2: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_01d7: ldnull
IL_01d8: ldc.i4.1
IL_01d9: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Func`2<Player,System.Boolean>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_01de: stsfld System.Func`2<Player,System.Boolean> BetterTames.Scripts.Protection.Protection::TakeInput
IL_01e3: ldstr "m_moveDir"
IL_01e8: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Character,UnityEngine.Vector3>(System.String)
IL_01ed: stsfld HarmonyLib.AccessTools/FieldRef`2<Character,UnityEngine.Vector3> BetterTames.Scripts.Protection.Protection::MoveDir
IL_01f2: ldstr "m_currentVel"
IL_01f7: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Character,UnityEngine.Vector3>(System.String)
IL_01fc: stsfld HarmonyLib.AccessTools/FieldRef`2<Character,UnityEngine.Vector3> BetterTames.Scripts.Protection.Protection::CurrentVel
IL_0201: ldstr "m_body"
IL_0206: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Character,UnityEngine.Rigidbody>(System.String)
IL_020b: stsfld HarmonyLib.AccessTools/FieldRef`2<Character,UnityEngine.Rigidbody> BetterTames.Scripts.Protection.Protection::Body
IL_0210: ldstr "m_zanim"
IL_0215: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Character,ZSyncAnimation>(System.String)
IL_021a: stsfld HarmonyLib.AccessTools/FieldRef`2<Character,ZSyncAnimation> BetterTames.Scripts.Protection.Protection::ZAnim
IL_021f: ldtoken ZSyncAnimation
IL_0224: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0229: ldstr "SetFloat"
IL_022e: ldc.i4.2
IL_022f: newarr System.Type
IL_0234: dup
IL_0235: ldc.i4.0
IL_0236: ldtoken System.Int32
IL_023b: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0240: stelem.ref
IL_0241: dup
IL_0242: ldc.i4.1
IL_0243: ldtoken System.Single
IL_0248: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_024d: stelem.ref
IL_024e: ldnull
IL_024f: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0254: ldnull
IL_0255: ldc.i4.1
IL_0256: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Action`3<ZSyncAnimation,System.Int32,System.Single>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_025b: stsfld System.Action`3<ZSyncAnimation,System.Int32,System.Single> BetterTames.Scripts.Protection.Protection::SetAnimFloat
IL_0260: ldstr "forward_speed"
IL_0265: call System.Int32 ZSyncAnimation::GetHash(System.String)
IL_026a: stsfld System.Int32 BetterTames.Scripts.Protection.Protection::ForwardSpeed
IL_026f: ldstr "sideway_speed"
IL_0274: call System.Int32 ZSyncAnimation::GetHash(System.String)
IL_0279: stsfld System.Int32 BetterTames.Scripts.Protection.Protection::SidewaySpeed
IL_027e: ldstr "turn_speed"
IL_0283: call System.Int32 ZSyncAnimation::GetHash(System.String)
IL_0288: stsfld System.Int32 BetterTames.Scripts.Protection.Protection::TurnSpeed
IL_028d: ldstr "m_interactMask"
IL_0292: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Player,System.Int32>(System.String)
IL_0297: stsfld HarmonyLib.AccessTools/FieldRef`2<Player,System.Int32> BetterTames.Scripts.Protection.Protection::InteractMask
IL_029c: newobj System.Void System.Collections.Generic.HashSet`1<Character>::.ctor()
IL_02a1: stsfld System.Collections.Generic.HashSet`1<Character> BetterTames.Scripts.Protection.Protection::Downed
IL_02a6: ldsfld BetterTames.Scripts.Protection.Protection/<>c BetterTames.Scripts.Protection.Protection/<>c::<>9
IL_02ab: ldftn System.Boolean BetterTames.Scripts.Protection.Protection/<>c::<.cctor>b__53_0(Character)
IL_02b1: newobj System.Void System.Predicate`1<Character>::.ctor(System.Object,System.IntPtr)
IL_02b6: stsfld System.Predicate`1<Character> BetterTames.Scripts.Protection.Protection::IsGone
IL_02bb: ldc.i4.s 32
IL_02bd: newarr UnityEngine.RaycastHit
IL_02c2: stsfld UnityEngine.RaycastHit[] BetterTames.Scripts.Protection.Protection::HoverHits
IL_02c7: ldtoken EnemyHud
IL_02cc: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_02d1: ldstr "m_huds"
IL_02d6: call System.Reflection.FieldInfo HarmonyLib.AccessTools::Field(System.Type,System.String)
IL_02db: stsfld System.Reflection.FieldInfo BetterTames.Scripts.Protection.Protection::HudsField
IL_02e0: ldtoken EnemyHud
IL_02e5: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_02ea: ldstr "HudData"
IL_02ef: call System.Type HarmonyLib.AccessTools::Inner(System.Type,System.String)
IL_02f4: ldstr "m_name"
IL_02f9: call System.Reflection.FieldInfo HarmonyLib.AccessTools::Field(System.Type,System.String)
IL_02fe: stsfld System.Reflection.FieldInfo BetterTames.Scripts.Protection.Protection::HudNameField
IL_0303: ret

// System.Void BetterTames.Scripts.Protection.Protection/<>c::.cctor()
.locals 
IL_0000: newobj System.Void BetterTames.Scripts.Protection.Protection/<>c::.ctor()
IL_0005: stsfld BetterTames.Scripts.Protection.Protection/<>c BetterTames.Scripts.Protection.Protection/<>c::<>9
IL_000a: ret

// System.Void BetterTames.Scripts.Protection.Protection/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean BetterTames.Scripts.Protection.Protection/<>c::<.cctor>b__53_0(Character)
.locals 
IL_0000: ldarg.1
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0007: ret

// System.Boolean BetterTames.Scripts.Protection.ProtectionPatches::Character_CheckDeath_Prefix(Character)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean BetterTames.Scripts.Protection.Protection::TryDown(Character)
IL_0006: ldc.i4.0
IL_0007: ceq
IL_0009: ret

// System.Boolean BetterTames.Scripts.Protection.ProtectionPatches::Character_ApplyDamage_Prefix(Character)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean BetterTames.Scripts.Protection.Protection::IsDowned(Character)
IL_0006: ldc.i4.0
IL_0007: ceq
IL_0009: ret

// System.Boolean BetterTames.Scripts.Protection.ProtectionPatches::Procreation_Procreate_Prefix(Procreation)
.locals 
IL_0000: ldarg.0
IL_0001: callvirt !!0 UnityEngine.Component::GetComponent<Character>()
IL_0006: call System.Boolean BetterTames.Scripts.Protection.Protection::IsDowned(Character)
IL_000b: ldc.i4.0
IL_000c: ceq
IL_000e: ret

// System.Void BetterTames.Scripts.Protection.ProtectionPatches::Procreation_ReadyForProcreation_Postfix(Procreation,System.Boolean&)
.locals 
IL_0000: ldarg.1
IL_0001: ldind.u1
IL_0002: brfalse IL_001a
IL_0007: ldarg.0
IL_0008: callvirt !!0 UnityEngine.Component::GetComponent<Character>()
IL_000d: call System.Boolean BetterTames.Scripts.Protection.Protection::IsDowned(Character)
IL_0012: brfalse IL_001a
IL_0017: ldarg.1
IL_0018: ldc.i4.0
IL_0019: stind.i1
IL_001a: ret

// System.Boolean BetterTames.Scripts.Protection.ProtectionPatches::MonsterAI_UpdateSleep_Prefix(MonsterAI)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean BetterTames.Scripts.Protection.Protection::UpdateRecovery(MonsterAI)
IL_0006: ldc.i4.0
IL_0007: ceq
IL_0009: ret

// System.Boolean BetterTames.Scripts.Protection.ProtectionPatches::Tameable_Interact_Prefix(Tameable,System.Boolean&)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Boolean BetterTames.Scripts.Protection.Protection::SwallowsInteract(Tameable)
IL_0006: brtrue IL_000d
IL_000b: ldc.i4.1
IL_000c: ret
IL_000d: ldarg.1
IL_000e: ldc.i4.1
IL_000f: stind.i1
IL_0010: ldc.i4.0
IL_0011: ret

// System.Void BetterTames.Scripts.Protection.ProtectionPatches::Character_GetHoverText_Postfix(Character,System.String&)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: ldarg.1
IL_0003: ldind.ref
IL_0004: call System.String BetterTames.Scripts.Protection.Protection::AddPrompt(Character,System.String)
IL_0009: stind.ref
IL_000a: ret

// System.Void BetterTames.Scripts.Protection.ProtectionPatches::EnemyHud_UpdateHuds_Postfix(EnemyHud)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BetterTames.Scripts.Protection.Protection::TintNameplates(EnemyHud)
IL_0006: ret

// System.Void BetterTames.Scripts.Protection.ProtectionPatches::Player_FindHoverObject_Postfix(Player,Character&)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: call System.Void BetterTames.Scripts.Protection.Protection::FindDownedHover(Player,Character&)
IL_0007: ret

// System.Void BetterTames.Scripts.Protection.ProtectionPatches::BaseAI_IsEnemy_Postfix(Character,Character,System.Boolean&)
.locals System.String
IL_0000: ldarg.2
IL_0001: ldind.u1
IL_0002: brtrue IL_00a4
IL_0007: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::tamesFightOwnKind
IL_000c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0011: brfalse IL_00a4
IL_0016: ldarg.0
IL_0017: ldnull
IL_0018: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_001d: brfalse IL_00a4
IL_0022: ldarg.1
IL_0023: ldnull
IL_0024: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0029: brfalse IL_00a4
IL_002e: ldarg.0
IL_002f: ldarg.1
IL_0030: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0035: brfalse IL_00a4
IL_003a: ldarg.0
IL_003b: callvirt System.Boolean Character::IsTamed()
IL_0040: ldarg.1
IL_0041: callvirt System.Boolean Character::IsTamed()
IL_0046: beq IL_00a4
IL_004b: ldarg.0
IL_004c: callvirt System.Boolean Character::IsPlayer()
IL_0051: brtrue IL_00a4
IL_0056: ldarg.1
IL_0057: callvirt System.Boolean Character::IsPlayer()
IL_005c: brtrue IL_00a4
IL_0061: ldarg.0
IL_0062: callvirt System.String Character::GetGroup()
IL_0067: stloc.0
IL_0068: ldloc.0
IL_0069: callvirt System.Int32 System.String::get_Length()
IL_006e: ldc.i4.0
IL_006f: ble IL_00a4
IL_0074: ldloc.0
IL_0075: ldarg.1
IL_0076: callvirt System.String Character::GetGroup()
IL_007b: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0080: brfalse IL_00a4
IL_0085: ldarg.0
IL_0086: callvirt System.Boolean Character::IsTamed()
IL_008b: brtrue IL_0096
IL_0090: ldarg.0
IL_0091: br IL_0097
IL_0096: ldarg.1
IL_0097: call System.Boolean BetterTames.Scripts.Protection.Protection::WildWillFight(Character)
IL_009c: brfalse IL_00a4
IL_00a1: ldarg.2
IL_00a2: ldc.i4.1
IL_00a3: stind.i1
IL_00a4: ldarg.2
IL_00a5: ldind.u1
IL_00a6: brfalse IL_00c4
IL_00ab: ldarg.0
IL_00ac: call System.Boolean BetterTames.Scripts.Protection.Protection::IsDowned(Character)
IL_00b1: brtrue IL_00c1
IL_00b6: ldarg.1
IL_00b7: call System.Boolean BetterTames.Scripts.Protection.Protection::IsDowned(Character)
IL_00bc: brfalse IL_00c4
IL_00c1: ldarg.2
IL_00c2: ldc.i4.0
IL_00c3: stind.i1
IL_00c4: ret

// System.Void BetterTames.Scripts.Feeding.Feeding::Register(Container)
.locals 
IL_0000: ldsfld System.Collections.Generic.List`1<Container> BetterTames.Scripts.Feeding.Feeding::Chests
IL_0005: ldarg.0
IL_0006: callvirt System.Boolean System.Collections.Generic.List`1<Container>::Contains(!0)
IL_000b: brtrue IL_001b
IL_0010: ldsfld System.Collections.Generic.List`1<Container> BetterTames.Scripts.Feeding.Feeding::Chests
IL_0015: ldarg.0
IL_0016: callvirt System.Void System.Collections.Generic.List`1<Container>::Add(!0)
IL_001b: ret

// System.Void BetterTames.Scripts.Feeding.Feeding::TryEatFromChest(MonsterAI)
.locals Character, Tameable, ZNetView, System.Collections.Generic.List`1<ItemDrop>, UnityEngine.Vector3, System.Single, System.Int32, Container, ZNetView, Inventory, ItemDrop/ItemData, ItemDrop, Humanoid, ZDOID
IL_0000: ldarg.0
IL_0001: ldloca.s V_0
IL_0003: callvirt System.Boolean UnityEngine.Component::TryGetComponent<Character>(!!0&)
IL_0008: brfalse IL_001a
IL_000d: ldarg.0
IL_000e: ldloca.s V_1
IL_0010: callvirt System.Boolean UnityEngine.Component::TryGetComponent<Tameable>(!!0&)
IL_0015: brtrue IL_001b
IL_001a: ret
IL_001b: ldloc.0
IL_001c: callvirt System.Boolean Character::IsTamed()
IL_0021: brtrue IL_0035
IL_0026: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::wildEatFromChests
IL_002b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0030: br IL_003f
IL_0035: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::tamesEatFromChests
IL_003a: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_003f: brtrue IL_0045
IL_0044: ret
IL_0045: ldarg.0
IL_0046: callvirt !!0 UnityEngine.Component::GetComponent<ZNetView>()
IL_004b: stloc.2
IL_004c: ldloc.2
IL_004d: ldnull
IL_004e: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0053: brtrue IL_006e
IL_0058: ldloc.2
IL_0059: callvirt System.Boolean ZNetView::IsValid()
IL_005e: brfalse IL_006e
IL_0063: ldloc.2
IL_0064: callvirt System.Boolean ZNetView::IsOwner()
IL_0069: brtrue IL_006f
IL_006e: ret
IL_006f: ldsfld HarmonyLib.AccessTools/FieldRef`2<MonsterAI,System.Collections.Generic.List`1<ItemDrop>> BetterTames.Scripts.Feeding.Feeding::ConsumeItems
IL_0074: ldarg.0
IL_0075: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<MonsterAI,System.Collections.Generic.List`1<ItemDrop>>::Invoke(!0)
IL_007a: ldind.ref
IL_007b: stloc.3
IL_007c: ldloc.3
IL_007d: brfalse IL_008d
IL_0082: ldloc.3
IL_0083: callvirt System.Int32 System.Collections.Generic.List`1<ItemDrop>::get_Count()
IL_0088: brtrue IL_008e
IL_008d: ret
IL_008e: ldloc.0
IL_008f: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0094: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0099: stloc.s V_4
IL_009b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> BetterTames.Plugin::chestRange
IL_00a0: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_00a5: stloc.s V_5
IL_00a7: ldsfld System.Collections.Generic.List`1<Container> BetterTames.Scripts.Feeding.Feeding::Chests
IL_00ac: callvirt System.Int32 System.Collections.Generic.List`1<Container>::get_Count()
IL_00b1: ldc.i4.1
IL_00b2: sub
IL_00b3: stloc.s V_6
IL_00b5: br IL_01d5
IL_00ba: ldsfld System.Collections.Generic.List`1<Container> BetterTames.Scripts.Feeding.Feeding::Chests
IL_00bf: ldloc.s V_6
IL_00c1: callvirt !0 System.Collections.Generic.List`1<Container>::get_Item(System.Int32)
IL_00c6: stloc.s V_7
IL_00c8: ldloc.s V_7
IL_00ca: ldnull
IL_00cb: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_00d0: brfalse IL_00e6
IL_00d5: ldsfld System.Collections.Generic.List`1<Container> BetterTames.Scripts.Feeding.Feeding::Chests
IL_00da: ldloc.s V_6
IL_00dc: callvirt System.Void System.Collections.Generic.List`1<Container>::RemoveAt(System.Int32)
IL_00e1: br IL_01cf
IL_00e6: ldloc.s V_7
IL_00e8: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00ed: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_00f2: ldloc.s V_4
IL_00f4: call System.Single UnityEngine.Vector3::Distance(UnityEngine.Vector3,UnityEngine.Vector3)
IL_00f9: ldloc.s V_5
IL_00fb: bgt IL_01cf
IL_0100: ldloc.s V_7
IL_0102: ldloca.s V_8
IL_0104: call System.Boolean BetterTames.Scripts.Feeding.Feeding::IsPlayerChest(Container,ZNetView&)
IL_0109: brfalse IL_01cf
IL_010e: ldloc.s V_8
IL_0110: callvirt System.Boolean ZNetView::IsOwner()
IL_0115: brfalse IL_01cf
IL_011a: ldsfld System.Func`2<Container,Inventory> BetterTames.Scripts.Feeding.Feeding::GetInventory
IL_011f: ldloc.s V_7
IL_0121: callvirt !1 System.Func`2<Container,Inventory>::Invoke(!0)
IL_0126: stloc.s V_9
IL_0128: ldloc.s V_9
IL_012a: brfalse IL_01cf
IL_012f: ldloc.s V_9
IL_0131: ldloc.3
IL_0132: ldloca.s V_10
IL_0134: ldloca.s V_11
IL_0136: call System.Boolean BetterTames.Scripts.Feeding.Feeding::FindFood(Inventory,System.Collections.Generic.List`1<ItemDrop>,ItemDrop/ItemData&,ItemDrop&)
IL_013b: brfalse IL_01cf
IL_0140: ldloc.s V_9
IL_0142: ldloc.s V_10
IL_0144: ldc.i4.1
IL_0145: callvirt System.Boolean Inventory::RemoveItem(ItemDrop/ItemData,System.Int32)
IL_014a: pop
IL_014b: ldsfld HarmonyLib.AccessTools/FieldRef`2<BaseAI,ZSyncAnimation> BetterTames.Scripts.Feeding.Feeding::Animator
IL_0150: ldarg.0
IL_0151: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<BaseAI,ZSyncAnimation>::Invoke(!0)
IL_0156: ldind.ref
IL_0157: dup
IL_0158: brtrue IL_0163
IL_015d: pop
IL_015e: br IL_016d
IL_0163: ldstr "consume"
IL_0168: call System.Void ZSyncAnimation::SetTrigger(System.String)
IL_016d: ldloc.0
IL_016e: isinst Humanoid
IL_0173: stloc.s V_12
IL_0175: ldloc.s V_12
IL_0177: brfalse IL_01b3
IL_017c: ldsfld HarmonyLib.AccessTools/FieldRef`2<Humanoid,EffectList> BetterTames.Scripts.Feeding.Feeding::ConsumeEffects
IL_0181: ldloc.s V_12
IL_0183: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Humanoid,EffectList>::Invoke(!0)
IL_0188: ldind.ref
IL_0189: dup
IL_018a: brtrue IL_0195
IL_018f: pop
IL_0190: br IL_01b3
IL_0195: ldloc.s V_4
IL_0197: call UnityEngine.Quaternion UnityEngine.Quaternion::get_identity()
IL_019c: ldnull
IL_019d: ldc.r4 1
IL_01a2: ldc.i4.m1
IL_01a3: ldloca.s V_13
IL_01a5: initobj ZDOID
IL_01ab: ldloc.s V_13
IL_01ad: call UnityEngine.GameObject[] EffectList::Create(UnityEngine.Vector3,UnityEngine.Quaternion,UnityEngine.Transform,System.Single,System.Int32,ZDOID)
IL_01b2: pop
IL_01b3: ldsfld HarmonyLib.AccessTools/FieldRef`2<MonsterAI,System.Action`1<ItemDrop>> BetterTames.Scripts.Feeding.Feeding::OnConsumedItem
IL_01b8: ldarg.0
IL_01b9: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<MonsterAI,System.Action`1<ItemDrop>>::Invoke(!0)
IL_01be: ldind.ref
IL_01bf: dup
IL_01c0: brtrue IL_01c7
IL_01c5: pop
IL_01c6: ret
IL_01c7: ldloc.s V_11
IL_01c9: callvirt System.Void System.Action`1<ItemDrop>::Invoke(!0)
IL_01ce: ret
IL_01cf: ldloc.s V_6
IL_01d1: ldc.i4.1
IL_01d2: sub
IL_01d3: stloc.s V_6
IL_01d5: ldloc.s V_6
IL_01d7: ldc.i4.0
IL_01d8: bge IL_00ba
IL_01dd: ret

// System.Boolean BetterTames.Scripts.Feeding.Feeding::IsPlayerChest(Container,ZNetView&)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: callvirt !!0 UnityEngine.Component::GetComponent<ZNetView>()
IL_0007: stind.ref
IL_0008: ldarg.1
IL_0009: ldind.ref
IL_000a: ldnull
IL_000b: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0010: brfalse IL_0039
IL_0015: ldarg.1
IL_0016: ldind.ref
IL_0017: callvirt System.Boolean ZNetView::IsValid()
IL_001c: brfalse IL_0039
IL_0021: ldarg.1
IL_0022: ldind.ref
IL_0023: callvirt ZDO ZNetView::GetZDO()
IL_0028: ldsfld System.Int32 ZDOVars::s_creator
IL_002d: ldc.i4.0
IL_002e: conv.i8
IL_002f: callvirt System.Int64 ZDO::GetLong(System.Int32,System.Int64)
IL_0034: ldc.i4.0
IL_0035: conv.i8
IL_0036: cgt.un
IL_0038: ret
IL_0039: ldc.i4.0
IL_003a: ret

// System.Boolean BetterTames.Scripts.Feeding.Feeding::FindFood(Inventory,System.Collections.Generic.List`1<ItemDrop>,ItemDrop/ItemData&,ItemDrop&)
.locals System.Collections.Generic.List`1/Enumerator<ItemDrop/ItemData>, ItemDrop/ItemData, ItemDrop, System.Boolean
IL_0000: ldarg.2
IL_0001: ldnull
IL_0002: stind.ref
IL_0003: ldarg.3
IL_0004: ldnull
IL_0005: stind.ref
IL_0006: ldarg.0
IL_0007: callvirt System.Collections.Generic.List`1<ItemDrop/ItemData> Inventory::GetAllItems()
IL_000c: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<ItemDrop/ItemData>::GetEnumerator()
IL_0011: stloc.0
IL_0012: br IL_006c
IL_0017: ldloca.s V_0
IL_0019: call !0 System.Collections.Generic.List`1/Enumerator<ItemDrop/ItemData>::get_Current()
IL_001e: stloc.1
IL_001f: ldloc.1
IL_0020: ldarg.1
IL_0021: call ItemDrop BetterTames.Scripts.Feeding.Feeding::Match(ItemDrop/ItemData,System.Collections.Generic.List`1<ItemDrop>)
IL_0026: stloc.2
IL_0027: ldloc.2
IL_0028: ldnull
IL_0029: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_002e: brfalse IL_0049
IL_0033: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::chestRequireOnlyFood
IL_0038: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_003d: brfalse IL_006c
IL_0042: ldc.i4.0
IL_0043: stloc.3
IL_0044: leave IL_008e
IL_0049: ldarg.2
IL_004a: ldind.ref
IL_004b: brtrue IL_006c
IL_0050: ldarg.2
IL_0051: ldloc.1
IL_0052: stind.ref
IL_0053: ldarg.3
IL_0054: ldloc.2
IL_0055: stind.ref
IL_0056: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::chestRequireOnlyFood
IL_005b: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0060: brtrue IL_006c
IL_0065: ldc.i4.1
IL_0066: stloc.3
IL_0067: leave IL_008e
IL_006c: ldloca.s V_0
IL_006e: call System.Boolean System.Collections.Generic.List`1/Enumerator<ItemDrop/ItemData>::MoveNext()
IL_0073: brtrue.s IL_0017
IL_0075: leave IL_0088
IL_007a: ldloca.s V_0
IL_007c: constrained. System.Collections.Generic.List`1/Enumerator<ItemDrop/ItemData>
IL_0082: callvirt System.Void System.IDisposable::Dispose()
IL_0087: endfinally
IL_0088: ldarg.2
IL_0089: ldind.ref
IL_008a: ldnull
IL_008b: cgt.un
IL_008d: ret
IL_008e: ldloc.3
IL_008f: ret
// EH Finally: 18 - 122 => 122 - 136

// ItemDrop BetterTames.Scripts.Feeding.Feeding::Match(ItemDrop/ItemData,System.Collections.Generic.List`1<ItemDrop>)
.locals System.Collections.Generic.List`1/Enumerator<ItemDrop>, ItemDrop, ItemDrop
IL_0000: ldarg.1
IL_0001: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<ItemDrop>::GetEnumerator()
IL_0006: stloc.0
IL_0007: br IL_0040
IL_000c: ldloca.s V_0
IL_000e: call !0 System.Collections.Generic.List`1/Enumerator<ItemDrop>::get_Current()
IL_0013: stloc.1
IL_0014: ldloc.1
IL_0015: ldfld ItemDrop/ItemData ItemDrop::m_itemData
IL_001a: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_001f: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_0024: ldarg.0
IL_0025: ldfld ItemDrop/ItemData/SharedData ItemDrop/ItemData::m_shared
IL_002a: ldfld System.String ItemDrop/ItemData/SharedData::m_name
IL_002f: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0034: brfalse IL_0040
IL_0039: ldloc.1
IL_003a: stloc.2
IL_003b: leave IL_005e
IL_0040: ldloca.s V_0
IL_0042: call System.Boolean System.Collections.Generic.List`1/Enumerator<ItemDrop>::MoveNext()
IL_0047: brtrue.s IL_000c
IL_0049: leave IL_005c
IL_004e: ldloca.s V_0
IL_0050: constrained. System.Collections.Generic.List`1/Enumerator<ItemDrop>
IL_0056: callvirt System.Void System.IDisposable::Dispose()
IL_005b: endfinally
IL_005c: ldnull
IL_005d: ret
IL_005e: ldloc.2
IL_005f: ret
// EH Finally: 7 - 78 => 78 - 92

// System.Void BetterTames.Scripts.Feeding.Feeding::.cctor()
.locals 
IL_0000: ldstr "m_consumeItems"
IL_0005: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<MonsterAI,System.Collections.Generic.List`1<ItemDrop>>(System.String)
IL_000a: stsfld HarmonyLib.AccessTools/FieldRef`2<MonsterAI,System.Collections.Generic.List`1<ItemDrop>> BetterTames.Scripts.Feeding.Feeding::ConsumeItems
IL_000f: ldstr "m_onConsumedItem"
IL_0014: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<MonsterAI,System.Action`1<ItemDrop>>(System.String)
IL_0019: stsfld HarmonyLib.AccessTools/FieldRef`2<MonsterAI,System.Action`1<ItemDrop>> BetterTames.Scripts.Feeding.Feeding::OnConsumedItem
IL_001e: ldstr "m_animator"
IL_0023: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<BaseAI,ZSyncAnimation>(System.String)
IL_0028: stsfld HarmonyLib.AccessTools/FieldRef`2<BaseAI,ZSyncAnimation> BetterTames.Scripts.Feeding.Feeding::Animator
IL_002d: ldstr "m_consumeItemEffects"
IL_0032: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Humanoid,EffectList>(System.String)
IL_0037: stsfld HarmonyLib.AccessTools/FieldRef`2<Humanoid,EffectList> BetterTames.Scripts.Feeding.Feeding::ConsumeEffects
IL_003c: ldtoken Container
IL_0041: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0046: ldstr "GetInventory"
IL_004b: ldnull
IL_004c: ldnull
IL_004d: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0052: ldnull
IL_0053: ldc.i4.1
IL_0054: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Func`2<Container,Inventory>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_0059: stsfld System.Func`2<Container,Inventory> BetterTames.Scripts.Feeding.Feeding::GetInventory
IL_005e: newobj System.Void System.Collections.Generic.List`1<Container>::.ctor()
IL_0063: stsfld System.Collections.Generic.List`1<Container> BetterTames.Scripts.Feeding.Feeding::Chests
IL_0068: ret

// System.Void BetterTames.Scripts.Feeding.FeedingPatches::Container_Awake_Postfix(Container)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BetterTames.Scripts.Feeding.Feeding::Register(Container)
IL_0006: ret

// System.Void BetterTames.Scripts.Feeding.FeedingPatches::MonsterAI_FindClosestConsumableItem_Postfix(MonsterAI,ItemDrop)
.locals 
IL_0000: ldarg.1
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0007: brfalse IL_0012
IL_000c: ldarg.0
IL_000d: call System.Void BetterTames.Scripts.Feeding.Feeding::TryEatFromChest(MonsterAI)
IL_0012: ret

// System.Void BetterTames.Scripts.Leveling.Leveling::OnDeath(Character)
.locals Character, ZNetView, System.Int32, System.Int32
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::starUpOnKill
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue IL_0010
IL_000f: ret
IL_0010: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,HitData> BetterTames.Scripts.Leveling.Leveling::LastHit
IL_0015: ldarg.0
IL_0016: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,HitData>::Invoke(!0)
IL_001b: ldind.ref
IL_001c: dup
IL_001d: brtrue IL_0029
IL_0022: pop
IL_0023: ldnull
IL_0024: br IL_002e
IL_0029: call Character HitData::GetAttacker()
IL_002e: stloc.0
IL_002f: ldloc.0
IL_0030: ldnull
IL_0031: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0036: brtrue IL_0052
IL_003b: ldloc.0
IL_003c: callvirt System.Boolean Character::IsTamed()
IL_0041: brfalse IL_0052
IL_0046: ldloc.0
IL_0047: callvirt System.Int32 Character::GetLevel()
IL_004c: ldc.i4.6
IL_004d: blt IL_0053
IL_0052: ret
IL_0053: ldloc.0
IL_0054: callvirt !!0 UnityEngine.Component::GetComponent<ZNetView>()
IL_0059: stloc.1
IL_005a: ldloc.1
IL_005b: ldnull
IL_005c: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0061: brtrue IL_007c
IL_0066: ldloc.1
IL_0067: callvirt System.Boolean ZNetView::IsValid()
IL_006c: brfalse IL_007c
IL_0071: ldloc.1
IL_0072: callvirt System.Boolean ZNetView::IsOwner()
IL_0077: brtrue IL_007d
IL_007c: ret
IL_007d: ldc.i4.0
IL_007e: ldarg.0
IL_007f: callvirt System.Int32 Character::GetLevel()
IL_0084: ldloc.0
IL_0085: callvirt System.Int32 Character::GetLevel()
IL_008a: sub
IL_008b: call System.Int32 UnityEngine.Mathf::Max(System.Int32,System.Int32)
IL_0090: stloc.2
IL_0091: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::starUpBaseChance
IL_0096: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_009b: ldloc.2
IL_009c: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::starUpBonusPerStar
IL_00a1: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_00a6: mul
IL_00a7: add
IL_00a8: stloc.3
IL_00a9: ldc.r4 0
IL_00ae: ldc.r4 100
IL_00b3: call System.Single UnityEngine.Random::Range(System.Single,System.Single)
IL_00b8: ldloc.3
IL_00b9: conv.r4
IL_00ba: blt.un IL_00c0
IL_00bf: ret
IL_00c0: ldloc.0
IL_00c1: ldloc.0
IL_00c2: callvirt System.Int32 Character::GetLevel()
IL_00c7: ldc.i4.1
IL_00c8: add
IL_00c9: callvirt System.Void Character::SetLevel(System.Int32)
IL_00ce: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::healOnStarUp
IL_00d3: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_00d8: brfalse IL_00f3
IL_00dd: ldsfld System.Action`2<Character,System.Single> BetterTames.Scripts.Leveling.Leveling::SetHealth
IL_00e2: ldloc.0
IL_00e3: ldsfld System.Func`2<Character,System.Single> BetterTames.Scripts.Leveling.Leveling::GetMaxHealth
IL_00e8: ldloc.0
IL_00e9: callvirt !1 System.Func`2<Character,System.Single>::Invoke(!0)
IL_00ee: callvirt System.Void System.Action`2<Character,System.Single>::Invoke(!0,!1)
IL_00f3: ret

// System.Void BetterTames.Scripts.Leveling.Leveling::.cctor()
.locals 
IL_0000: ldstr "m_lastHit"
IL_0005: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Character,HitData>(System.String)
IL_000a: stsfld HarmonyLib.AccessTools/FieldRef`2<Character,HitData> BetterTames.Scripts.Leveling.Leveling::LastHit
IL_000f: ldtoken Character
IL_0014: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0019: ldstr "GetMaxHealth"
IL_001e: ldnull
IL_001f: ldnull
IL_0020: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0025: ldnull
IL_0026: ldc.i4.1
IL_0027: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Func`2<Character,System.Single>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_002c: stsfld System.Func`2<Character,System.Single> BetterTames.Scripts.Leveling.Leveling::GetMaxHealth
IL_0031: ldtoken Character
IL_0036: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_003b: ldstr "SetHealth"
IL_0040: ldnull
IL_0041: ldnull
IL_0042: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0047: ldnull
IL_0048: ldc.i4.1
IL_0049: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Action`2<Character,System.Single>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_004e: stsfld System.Action`2<Character,System.Single> BetterTames.Scripts.Leveling.Leveling::SetHealth
IL_0053: ret

// System.Void BetterTames.Scripts.Leveling.LevelingPatches::Character_OnDeath_Postfix(Character)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BetterTames.Scripts.Leveling.Leveling::OnDeath(Character)
IL_0006: ret

// System.Void BetterTames.Scripts.Portals.Portals::OnTeleport(TeleportWorld,Player)
.locals UnityEngine.Vector3, System.Single, System.Collections.Generic.IEnumerator`1<Character>, Character, UnityEngine.Vector3, ZNetView
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::portalTeleport
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue IL_0010
IL_000f: ret
IL_0010: ldarg.1
IL_0011: ldsfld Player Player::m_localPlayer
IL_0016: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_001b: brtrue IL_002b
IL_0020: ldarg.1
IL_0021: callvirt System.Boolean Character::IsTeleporting()
IL_0026: brtrue IL_002c
IL_002b: ret
IL_002c: ldarg.0
IL_002d: ldloca.s V_0
IL_002f: call System.Boolean BetterTames.Scripts.Portals.Portals::TryGetExit(TeleportWorld,UnityEngine.Vector3&)
IL_0034: brtrue IL_003a
IL_0039: ret
IL_003a: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> BetterTames.Plugin::massCommandRange
IL_003f: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0044: stloc.1
IL_0045: ldarg.1
IL_0046: callvirt System.String Player::GetPlayerName()
IL_004b: call System.Collections.Generic.IEnumerable`1<Character> BetterTames.Scripts.CatchUp.CatchUp::FollowersOf(System.String)
IL_0050: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<Character>::GetEnumerator()
IL_0055: stloc.2
IL_0056: br IL_00c7
IL_005b: ldloc.2
IL_005c: callvirt !0 System.Collections.Generic.IEnumerator`1<Character>::get_Current()
IL_0061: stloc.3
IL_0062: ldloc.3
IL_0063: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0068: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_006d: ldarg.1
IL_006e: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0073: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0078: call System.Single UnityEngine.Vector3::Distance(UnityEngine.Vector3,UnityEngine.Vector3)
IL_007d: ldloc.1
IL_007e: bgt IL_00c7
IL_0083: ldloc.3
IL_0084: ldloc.0
IL_0085: call UnityEngine.Vector3 BetterTames.Scripts.CatchUp.CatchUp::MoveTo(Character,UnityEngine.Vector3)
IL_008a: stloc.s V_4
IL_008c: ldloc.3
IL_008d: callvirt !!0 UnityEngine.Component::GetComponent<ZNetView>()
IL_0092: stloc.s V_5
IL_0094: ldloc.s V_5
IL_0096: ldnull
IL_0097: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_009c: brfalse IL_00c7
IL_00a1: ldloc.s V_5
IL_00a3: callvirt System.Boolean ZNetView::IsValid()
IL_00a8: brfalse IL_00c7
IL_00ad: ldloc.s V_5
IL_00af: callvirt System.Boolean ZNetView::IsOwner()
IL_00b4: brfalse IL_00c7
IL_00b9: ldloc.s V_5
IL_00bb: callvirt ZDO ZNetView::GetZDO()
IL_00c0: ldloc.s V_4
IL_00c2: callvirt System.Void ZDO::SetPosition(UnityEngine.Vector3)
IL_00c7: ldloc.2
IL_00c8: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_00cd: brtrue.s IL_005b
IL_00cf: leave IL_00e1
IL_00d4: ldloc.2
IL_00d5: brfalse IL_00e0
IL_00da: ldloc.2
IL_00db: callvirt System.Void System.IDisposable::Dispose()
IL_00e0: endfinally
IL_00e1: ret
// EH Finally: 86 - 212 => 212 - 225

// System.Boolean BetterTames.Scripts.Portals.Portals::TryGetExit(TeleportWorld,UnityEngine.Vector3&)
.locals ZNetView, ZDO, UnityEngine.Quaternion
IL_0000: ldarg.1
IL_0001: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_0006: stobj UnityEngine.Vector3
IL_000b: ldsfld HarmonyLib.AccessTools/FieldRef`2<TeleportWorld,ZNetView> BetterTames.Scripts.Portals.Portals::PortalView
IL_0010: ldarg.0
IL_0011: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<TeleportWorld,ZNetView>::Invoke(!0)
IL_0016: ldind.ref
IL_0017: stloc.0
IL_0018: ldloc.0
IL_0019: ldnull
IL_001a: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_001f: brtrue IL_002f
IL_0024: ldloc.0
IL_0025: callvirt System.Boolean ZNetView::IsValid()
IL_002a: brtrue IL_0031
IL_002f: ldc.i4.0
IL_0030: ret
IL_0031: call ZDOMan ZDOMan::get_instance()
IL_0036: ldloc.0
IL_0037: callvirt ZDO ZNetView::GetZDO()
IL_003c: ldc.i4.1
IL_003d: callvirt ZDOID ZDO::GetConnectionZDOID(ZDOExtraData/ConnectionType)
IL_0042: callvirt ZDO ZDOMan::GetZDO(ZDOID)
IL_0047: stloc.1
IL_0048: ldloc.1
IL_0049: brtrue IL_0050
IL_004e: ldc.i4.0
IL_004f: ret
IL_0050: ldloc.1
IL_0051: callvirt UnityEngine.Quaternion ZDO::GetRotation()
IL_0056: stloc.2
IL_0057: ldarg.1
IL_0058: ldloc.1
IL_0059: callvirt UnityEngine.Vector3 ZDO::GetPosition()
IL_005e: ldloc.2
IL_005f: call UnityEngine.Vector3 UnityEngine.Vector3::get_forward()
IL_0064: call UnityEngine.Vector3 UnityEngine.Quaternion::op_Multiply(UnityEngine.Quaternion,UnityEngine.Vector3)
IL_0069: ldsfld HarmonyLib.AccessTools/FieldRef`2<TeleportWorld,System.Single> BetterTames.Scripts.Portals.Portals::ExitDistance
IL_006e: ldarg.0
IL_006f: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<TeleportWorld,System.Single>::Invoke(!0)
IL_0074: ldind.r4
IL_0075: call UnityEngine.Vector3 UnityEngine.Vector3::op_Multiply(UnityEngine.Vector3,System.Single)
IL_007a: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_007f: call UnityEngine.Vector3 UnityEngine.Vector3::get_up()
IL_0084: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0089: stobj UnityEngine.Vector3
IL_008e: ldc.i4.1
IL_008f: ret

// System.Void BetterTames.Scripts.Portals.Portals::.cctor()
.locals 
IL_0000: ldstr "m_nview"
IL_0005: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<TeleportWorld,ZNetView>(System.String)
IL_000a: stsfld HarmonyLib.AccessTools/FieldRef`2<TeleportWorld,ZNetView> BetterTames.Scripts.Portals.Portals::PortalView
IL_000f: ldstr "m_exitDistance"
IL_0014: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<TeleportWorld,System.Single>(System.String)
IL_0019: stsfld HarmonyLib.AccessTools/FieldRef`2<TeleportWorld,System.Single> BetterTames.Scripts.Portals.Portals::ExitDistance
IL_001e: ret

// System.Void BetterTames.Scripts.Portals.PortalPatches::TeleportWorld_Teleport_Postfix(TeleportWorld,Player)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: call System.Void BetterTames.Scripts.Portals.Portals::OnTeleport(TeleportWorld,Player)
IL_0007: ret

// System.Void BetterTames.Scripts.CatchUp.CatchUp::Tick()
.locals Player, BepInEx.Configuration.KeyboardShortcut, System.Collections.Generic.IEnumerator`1<Character>, Character
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::catchUpTeleport
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue IL_0010
IL_000f: ret
IL_0010: ldsfld Player Player::m_localPlayer
IL_0015: stloc.0
IL_0016: ldloc.0
IL_0017: ldnull
IL_0018: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_001d: brfalse IL_004f
IL_0022: ldsfld System.Func`2<Player,System.Boolean> BetterTames.Scripts.CatchUp.CatchUp::TakeInput
IL_0027: ldloc.0
IL_0028: callvirt !1 System.Func`2<Player,System.Boolean>::Invoke(!0)
IL_002d: brfalse IL_004f
IL_0032: ldsfld BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> BetterTames.Plugin::teleportFollowersKey
IL_0037: callvirt !0 BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>::get_Value()
IL_003c: stloc.1
IL_003d: ldloca.s V_1
IL_003f: call System.Boolean BepInEx.Configuration.KeyboardShortcut::IsDown()
IL_0044: brfalse IL_004f
IL_0049: ldloc.0
IL_004a: call System.Void BetterTames.Scripts.CatchUp.CatchUp::TeleportFollowers(Player)
IL_004f: ldloc.0
IL_0050: ldnull
IL_0051: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0056: brtrue IL_0070
IL_005b: call System.Single UnityEngine.Time::get_time()
IL_0060: ldsfld System.Single BetterTames.Scripts.CatchUp.CatchUp::lastCheck
IL_0065: sub
IL_0066: ldc.r4 2
IL_006b: bge.un IL_0071
IL_0070: ret
IL_0071: call System.Single UnityEngine.Time::get_time()
IL_0076: stsfld System.Single BetterTames.Scripts.CatchUp.CatchUp::lastCheck
IL_007b: ldloc.0
IL_007c: callvirt System.String Player::GetPlayerName()
IL_0081: call System.Collections.Generic.IEnumerable`1<Character> BetterTames.Scripts.CatchUp.CatchUp::FollowersOf(System.String)
IL_0086: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<Character>::GetEnumerator()
IL_008b: stloc.2
IL_008c: br IL_00d5
IL_0091: ldloc.2
IL_0092: callvirt !0 System.Collections.Generic.IEnumerator`1<Character>::get_Current()
IL_0097: stloc.3
IL_0098: ldloc.3
IL_0099: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_009e: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_00a3: ldloc.0
IL_00a4: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00a9: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_00ae: call System.Single UnityEngine.Vector3::Distance(UnityEngine.Vector3,UnityEngine.Vector3)
IL_00b3: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> BetterTames.Plugin::catchUpDistance
IL_00b8: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_00bd: ble.un IL_00d5
IL_00c2: ldloc.3
IL_00c3: ldloc.0
IL_00c4: call System.Boolean BetterTames.Scripts.CatchUp.CatchUp::CanReach(Character,Player)
IL_00c9: brfalse IL_00d5
IL_00ce: ldloc.3
IL_00cf: ldloc.0
IL_00d0: call System.Void BetterTames.Scripts.CatchUp.CatchUp::MoveTo(Character,Player)
IL_00d5: ldloc.2
IL_00d6: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_00db: brtrue.s IL_0091
IL_00dd: leave IL_00ef
IL_00e2: ldloc.2
IL_00e3: brfalse IL_00ee
IL_00e8: ldloc.2
IL_00e9: callvirt System.Void System.IDisposable::Dispose()
IL_00ee: endfinally
IL_00ef: ret
// EH Finally: 140 - 226 => 226 - 239

// System.Void BetterTames.Scripts.CatchUp.CatchUp::OnRespawn(Player)
.locals System.String, System.Collections.Generic.HashSet`1<ZDOID>, System.Collections.Generic.IEnumerator`1<Character>, Character, ZNetView, System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<ZDOID,ZDO>, ZDO
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::catchUpTeleport
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue IL_0010
IL_000f: ret
IL_0010: ldarg.0
IL_0011: callvirt System.String Player::GetPlayerName()
IL_0016: stloc.0
IL_0017: newobj System.Void System.Collections.Generic.HashSet`1<ZDOID>::.ctor()
IL_001c: stloc.1
IL_001d: ldloc.0
IL_001e: call System.Collections.Generic.IEnumerable`1<Character> BetterTames.Scripts.CatchUp.CatchUp::FollowersOf(System.String)
IL_0023: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<Character>::GetEnumerator()
IL_0028: stloc.2
IL_0029: br IL_0062
IL_002e: ldloc.2
IL_002f: callvirt !0 System.Collections.Generic.IEnumerator`1<Character>::get_Current()
IL_0034: stloc.3
IL_0035: ldloc.3
IL_0036: ldarg.0
IL_0037: call System.Void BetterTames.Scripts.CatchUp.CatchUp::MoveTo(Character,Player)
IL_003c: ldsfld HarmonyLib.AccessTools/FieldRef`2<Tameable,ZNetView> BetterTames.Scripts.CatchUp.CatchUp::TameView
IL_0041: ldloc.3
IL_0042: callvirt !!0 UnityEngine.Component::GetComponent<Tameable>()
IL_0047: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Tameable,ZNetView>::Invoke(!0)
IL_004c: ldind.ref
IL_004d: stloc.s V_4
IL_004f: ldloc.1
IL_0050: ldloc.s V_4
IL_0052: callvirt ZDO ZNetView::GetZDO()
IL_0057: ldfld ZDOID ZDO::m_uid
IL_005c: callvirt System.Boolean System.Collections.Generic.HashSet`1<ZDOID>::Add(!0)
IL_0061: pop
IL_0062: ldloc.2
IL_0063: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0068: brtrue.s IL_002e
IL_006a: leave IL_007c
IL_006f: ldloc.2
IL_0070: brfalse IL_007b
IL_0075: ldloc.2
IL_0076: callvirt System.Void System.IDisposable::Dispose()
IL_007b: endfinally
IL_007c: ldsfld HarmonyLib.AccessTools/FieldRef`2<ZDOMan,System.Collections.Generic.Dictionary`2<ZDOID,ZDO>> BetterTames.Scripts.CatchUp.CatchUp::AllZDOs
IL_0081: call ZDOMan ZDOMan::get_instance()
IL_0086: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<ZDOMan,System.Collections.Generic.Dictionary`2<ZDOID,ZDO>>::Invoke(!0)
IL_008b: ldind.ref
IL_008c: callvirt System.Collections.Generic.Dictionary`2/ValueCollection<!0,!1> System.Collections.Generic.Dictionary`2<ZDOID,ZDO>::get_Values()
IL_0091: callvirt System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2/ValueCollection<ZDOID,ZDO>::GetEnumerator()
IL_0096: stloc.s V_5
IL_0098: br IL_010e
IL_009d: ldloca.s V_5
IL_009f: call !1 System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<ZDOID,ZDO>::get_Current()
IL_00a4: stloc.s V_6
IL_00a6: ldloc.1
IL_00a7: ldloc.s V_6
IL_00a9: ldfld ZDOID ZDO::m_uid
IL_00ae: callvirt System.Boolean System.Collections.Generic.HashSet`1<ZDOID>::Contains(!0)
IL_00b3: brtrue IL_010e
IL_00b8: ldloc.s V_6
IL_00ba: callvirt System.Boolean ZDO::IsOwner()
IL_00bf: brfalse IL_010e
IL_00c4: ldloc.s V_6
IL_00c6: ldsfld System.Int32 ZDOVars::s_tamed
IL_00cb: ldc.i4.0
IL_00cc: callvirt System.Boolean ZDO::GetBool(System.Int32,System.Boolean)
IL_00d1: brfalse IL_010e
IL_00d6: ldloc.s V_6
IL_00d8: ldsfld System.Int32 ZDOVars::s_follow
IL_00dd: ldstr ""
IL_00e2: callvirt System.String ZDO::GetString(System.Int32,System.String)
IL_00e7: ldloc.0
IL_00e8: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_00ed: brtrue IL_010e
IL_00f2: ldloc.s V_6
IL_00f4: ldarg.0
IL_00f5: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_00fa: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_00ff: call UnityEngine.Vector3 BetterTames.Scripts.CatchUp.CatchUp::RandomOffset()
IL_0104: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0109: callvirt System.Void ZDO::SetPosition(UnityEngine.Vector3)
IL_010e: ldloca.s V_5
IL_0110: call System.Boolean System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<ZDOID,ZDO>::MoveNext()
IL_0115: brtrue.s IL_009d
IL_0117: leave IL_012a
IL_011c: ldloca.s V_5
IL_011e: constrained. System.Collections.Generic.Dictionary`2/ValueCollection/Enumerator<ZDOID,ZDO>
IL_0124: callvirt System.Void System.IDisposable::Dispose()
IL_0129: endfinally
IL_012a: ret
// EH Finally: 41 - 111 => 111 - 124
// EH Finally: 152 - 284 => 284 - 298

// System.Void BetterTames.Scripts.CatchUp.CatchUp::TeleportFollowers(Player)
.locals System.Int32, System.Collections.Generic.IEnumerator`1<Character>, Character, System.String
IL_0000: ldc.i4.0
IL_0001: stloc.0
IL_0002: ldarg.0
IL_0003: callvirt System.String Player::GetPlayerName()
IL_0008: call System.Collections.Generic.IEnumerable`1<Character> BetterTames.Scripts.CatchUp.CatchUp::FollowersOf(System.String)
IL_000d: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<Character>::GetEnumerator()
IL_0012: stloc.1
IL_0013: br IL_0036
IL_0018: ldloc.1
IL_0019: callvirt !0 System.Collections.Generic.IEnumerator`1<Character>::get_Current()
IL_001e: stloc.2
IL_001f: ldloc.2
IL_0020: ldarg.0
IL_0021: call System.Boolean BetterTames.Scripts.CatchUp.CatchUp::CanReach(Character,Player)
IL_0026: brfalse IL_0036
IL_002b: ldloc.2
IL_002c: ldarg.0
IL_002d: call System.Void BetterTames.Scripts.CatchUp.CatchUp::MoveTo(Character,Player)
IL_0032: ldloc.0
IL_0033: ldc.i4.1
IL_0034: add
IL_0035: stloc.0
IL_0036: ldloc.1
IL_0037: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_003c: brtrue.s IL_0018
IL_003e: leave IL_0050
IL_0043: ldloc.1
IL_0044: brfalse IL_004f
IL_0049: ldloc.1
IL_004a: callvirt System.Void System.IDisposable::Dispose()
IL_004f: endfinally
IL_0050: ldloc.0
IL_0051: brfalse IL_0081
IL_0056: ldstr "{0} {1} teleported to you"
IL_005b: ldloc.0
IL_005c: box System.Int32
IL_0061: ldloc.0
IL_0062: ldc.i4.1
IL_0063: beq IL_0072
IL_0068: ldstr "tames"
IL_006d: br IL_0077
IL_0072: ldstr "tame"
IL_0077: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_007c: br IL_0086
IL_0081: ldstr "No tames following you"
IL_0086: stloc.3
IL_0087: ldarg.0
IL_0088: ldc.i4.2
IL_0089: ldloc.3
IL_008a: ldc.i4.0
IL_008b: ldnull
IL_008c: ldc.i4.0
IL_008d: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_0092: ret
// EH Finally: 19 - 67 => 67 - 80

// System.Collections.Generic.IEnumerable`1<Character> BetterTames.Scripts.CatchUp.CatchUp::FollowersOf(System.String)
.locals 
IL_0000: ldc.i4.s -2
IL_0002: newobj System.Void BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::.ctor(System.Int32)
IL_0007: dup
IL_0008: ldarg.0
IL_0009: stfld System.String BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>3__playerName
IL_000e: ret

// System.Boolean BetterTames.Scripts.CatchUp.CatchUp::CanReach(Character,Player)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::bigTamesEnterDungeons
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse IL_0011
IL_000f: ldc.i4.1
IL_0010: ret
IL_0011: ldarg.0
IL_0012: call System.Boolean BetterTames.Scripts.CatchUp.CatchUp::IsBig(Character)
IL_0017: brtrue IL_001e
IL_001c: ldc.i4.1
IL_001d: ret
IL_001e: ldarg.0
IL_001f: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0024: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0029: call System.Boolean Character::InInterior(UnityEngine.Vector3)
IL_002e: ldarg.1
IL_002f: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0034: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0039: call System.Boolean Character::InInterior(UnityEngine.Vector3)
IL_003e: ceq
IL_0040: ret

// System.Boolean BetterTames.Scripts.CatchUp.CatchUp::IsBig(Character)
.locals BaseAI, Pathfinding/AgentType
IL_0000: ldarg.0
IL_0001: callvirt BaseAI Character::GetBaseAI()
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: ldnull
IL_0009: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000e: brfalse IL_0015
IL_0013: ldc.i4.0
IL_0014: ret
IL_0015: ldsfld HarmonyLib.AccessTools/FieldRef`2<BaseAI,Pathfinding/AgentType> BetterTames.Scripts.CatchUp.CatchUp::PathAgent
IL_001a: ldloc.0
IL_001b: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<BaseAI,Pathfinding/AgentType>::Invoke(!0)
IL_0020: ldind.i4
IL_0021: stloc.1
IL_0022: ldloc.1
IL_0023: ldc.i4.1
IL_0024: beq IL_0032
IL_0029: ldloc.1
IL_002a: ldc.i4.5
IL_002b: sub
IL_002c: ldc.i4.1
IL_002d: bgt.un IL_0034
IL_0032: ldc.i4.0
IL_0033: ret
IL_0034: ldc.i4.1
IL_0035: ret

// System.Void BetterTames.Scripts.CatchUp.CatchUp::MoveTo(Character,Player)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0007: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_000c: call UnityEngine.Vector3 BetterTames.Scripts.CatchUp.CatchUp::MoveTo(Character,UnityEngine.Vector3)
IL_0011: pop
IL_0012: ret

// UnityEngine.Vector3 BetterTames.Scripts.CatchUp.CatchUp::MoveTo(Character,UnityEngine.Vector3)
.locals UnityEngine.Vector3, ZNetView, UnityEngine.Rigidbody
IL_0000: ldarg.1
IL_0001: call UnityEngine.Vector3 BetterTames.Scripts.CatchUp.CatchUp::RandomOffset()
IL_0006: call UnityEngine.Vector3 UnityEngine.Vector3::op_Addition(UnityEngine.Vector3,UnityEngine.Vector3)
IL_000b: stloc.0
IL_000c: ldarg.0
IL_000d: callvirt !!0 UnityEngine.Component::GetComponent<ZNetView>()
IL_0012: stloc.1
IL_0013: ldloc.1
IL_0014: ldnull
IL_0015: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_001a: brfalse IL_0040
IL_001f: ldloc.1
IL_0020: callvirt System.Boolean ZNetView::IsValid()
IL_0025: brfalse IL_0040
IL_002a: ldloc.1
IL_002b: callvirt System.Boolean ZNetView::IsOwner()
IL_0030: brtrue IL_0040
IL_0035: ldsfld System.Action`1<ZNetView> BetterTames.Scripts.CatchUp.CatchUp::ClaimOwnership
IL_003a: ldloc.1
IL_003b: callvirt System.Void System.Action`1<ZNetView>::Invoke(!0)
IL_0040: ldarg.0
IL_0041: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0046: ldloc.0
IL_0047: callvirt System.Void UnityEngine.Transform::set_position(UnityEngine.Vector3)
IL_004c: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,UnityEngine.Rigidbody> BetterTames.Scripts.CatchUp.CatchUp::CharacterBody
IL_0051: ldarg.0
IL_0052: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,UnityEngine.Rigidbody>::Invoke(!0)
IL_0057: ldind.ref
IL_0058: stloc.2
IL_0059: ldloc.2
IL_005a: ldnull
IL_005b: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0060: brfalse IL_006c
IL_0065: ldloc.2
IL_0066: ldloc.0
IL_0067: callvirt System.Void UnityEngine.Rigidbody::set_position(UnityEngine.Vector3)
IL_006c: ldloc.0
IL_006d: ret

// UnityEngine.Vector3 BetterTames.Scripts.CatchUp.CatchUp::RandomOffset()
.locals UnityEngine.Vector2
IL_0000: call UnityEngine.Vector2 UnityEngine.Random::get_insideUnitCircle()
IL_0005: ldc.r4 2
IL_000a: call UnityEngine.Vector2 UnityEngine.Vector2::op_Multiply(UnityEngine.Vector2,System.Single)
IL_000f: stloc.0
IL_0010: ldloc.0
IL_0011: ldfld System.Single UnityEngine.Vector2::x
IL_0016: ldc.r4 0
IL_001b: ldloc.0
IL_001c: ldfld System.Single UnityEngine.Vector2::y
IL_0021: newobj System.Void UnityEngine.Vector3::.ctor(System.Single,System.Single,System.Single)
IL_0026: ret

// System.Void BetterTames.Scripts.CatchUp.CatchUp::.cctor()
.locals 
IL_0000: ldstr "m_nview"
IL_0005: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Tameable,ZNetView>(System.String)
IL_000a: stsfld HarmonyLib.AccessTools/FieldRef`2<Tameable,ZNetView> BetterTames.Scripts.CatchUp.CatchUp::TameView
IL_000f: ldstr "m_body"
IL_0014: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Character,UnityEngine.Rigidbody>(System.String)
IL_0019: stsfld HarmonyLib.AccessTools/FieldRef`2<Character,UnityEngine.Rigidbody> BetterTames.Scripts.CatchUp.CatchUp::CharacterBody
IL_001e: ldtoken Player
IL_0023: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0028: ldstr "TakeInput"
IL_002d: ldnull
IL_002e: ldnull
IL_002f: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0034: ldnull
IL_0035: ldc.i4.1
IL_0036: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Func`2<Player,System.Boolean>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_003b: stsfld System.Func`2<Player,System.Boolean> BetterTames.Scripts.CatchUp.CatchUp::TakeInput
IL_0040: ldstr "m_objectsByID"
IL_0045: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<ZDOMan,System.Collections.Generic.Dictionary`2<ZDOID,ZDO>>(System.String)
IL_004a: stsfld HarmonyLib.AccessTools/FieldRef`2<ZDOMan,System.Collections.Generic.Dictionary`2<ZDOID,ZDO>> BetterTames.Scripts.CatchUp.CatchUp::AllZDOs
IL_004f: ldstr "m_pathAgentType"
IL_0054: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<BaseAI,Pathfinding/AgentType>(System.String)
IL_0059: stsfld HarmonyLib.AccessTools/FieldRef`2<BaseAI,Pathfinding/AgentType> BetterTames.Scripts.CatchUp.CatchUp::PathAgent
IL_005e: ldtoken ZNetView
IL_0063: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0068: ldstr "ClaimOwnership"
IL_006d: ldnull
IL_006e: ldnull
IL_006f: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0074: ldnull
IL_0075: ldc.i4.1
IL_0076: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Action`1<ZNetView>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_007b: stsfld System.Action`1<ZNetView> BetterTames.Scripts.CatchUp.CatchUp::ClaimOwnership
IL_0080: ret

// System.Void BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::.ctor(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ldarg.0
IL_0007: ldarg.1
IL_0008: stfld System.Int32 BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>1__state
IL_000d: ldarg.0
IL_000e: call System.Int32 System.Environment::get_CurrentManagedThreadId()
IL_0013: stfld System.Int32 BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>l__initialThreadId
IL_0018: ret

// System.Void BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::System.IDisposable.Dispose()
.locals System.Int32
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>1__state
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: ldc.i4.s -3
IL_000a: beq IL_0016
IL_000f: ldloc.0
IL_0010: ldc.i4.1
IL_0011: bne.un IL_0023
IL_0016: nop
IL_0017: leave IL_0023
IL_001c: ldarg.0
IL_001d: call System.Void BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>m__Finally1()
IL_0022: endfinally
IL_0023: ldarg.0
IL_0024: ldflda System.Collections.Generic.List`1/Enumerator<Character> BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>7__wrap1
IL_0029: initobj System.Collections.Generic.List`1/Enumerator<Character>
IL_002f: ldarg.0
IL_0030: ldc.i4.s -2
IL_0032: stfld System.Int32 BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>1__state
IL_0037: ret
// EH Finally: 23 - 28 => 28 - 35

// System.Boolean BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::MoveNext()
.locals System.Int32, System.Boolean, Character, Tameable, ZNetView
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>1__state
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: brfalse IL_001b
IL_000d: ldloc.0
IL_000e: ldc.i4.1
IL_000f: beq IL_00c5
IL_0014: ldc.i4.0
IL_0015: stloc.1
IL_0016: leave IL_00fd
IL_001b: ldarg.0
IL_001c: ldc.i4.m1
IL_001d: stfld System.Int32 BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>1__state
IL_0022: ldarg.0
IL_0023: call System.Collections.Generic.List`1<Character> Character::GetAllCharacters()
IL_0028: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Character>::GetEnumerator()
IL_002d: stfld System.Collections.Generic.List`1/Enumerator<Character> BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>7__wrap1
IL_0032: ldarg.0
IL_0033: ldc.i4.s -3
IL_0035: stfld System.Int32 BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>1__state
IL_003a: br IL_00cd
IL_003f: ldarg.0
IL_0040: ldflda System.Collections.Generic.List`1/Enumerator<Character> BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>7__wrap1
IL_0045: call !0 System.Collections.Generic.List`1/Enumerator<Character>::get_Current()
IL_004a: stloc.2
IL_004b: ldloc.2
IL_004c: callvirt System.Boolean Character::IsTamed()
IL_0051: brfalse IL_00cd
IL_0056: ldloc.2
IL_0057: ldloca.s V_3
IL_0059: callvirt System.Boolean UnityEngine.Component::TryGetComponent<Tameable>(!!0&)
IL_005e: brfalse IL_00cd
IL_0063: ldsfld HarmonyLib.AccessTools/FieldRef`2<Tameable,ZNetView> BetterTames.Scripts.CatchUp.CatchUp::TameView
IL_0068: ldloc.3
IL_0069: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Tameable,ZNetView>::Invoke(!0)
IL_006e: ldind.ref
IL_006f: stloc.s V_4
IL_0071: ldloc.s V_4
IL_0073: ldnull
IL_0074: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0079: brtrue IL_00cd
IL_007e: ldloc.s V_4
IL_0080: callvirt System.Boolean ZNetView::IsValid()
IL_0085: brfalse IL_00cd
IL_008a: ldloc.s V_4
IL_008c: callvirt ZDO ZNetView::GetZDO()
IL_0091: ldsfld System.Int32 ZDOVars::s_follow
IL_0096: ldstr ""
IL_009b: callvirt System.String ZDO::GetString(System.Int32,System.String)
IL_00a0: ldarg.0
IL_00a1: ldfld System.String BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::playerName
IL_00a6: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_00ab: brtrue IL_00cd
IL_00b0: ldarg.0
IL_00b1: ldloc.2
IL_00b2: stfld Character BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>2__current
IL_00b7: ldarg.0
IL_00b8: ldc.i4.1
IL_00b9: stfld System.Int32 BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>1__state
IL_00be: ldc.i4.1
IL_00bf: stloc.1
IL_00c0: leave IL_00fd
IL_00c5: ldarg.0
IL_00c6: ldc.i4.s -3
IL_00c8: stfld System.Int32 BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>1__state
IL_00cd: ldarg.0
IL_00ce: ldflda System.Collections.Generic.List`1/Enumerator<Character> BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>7__wrap1
IL_00d3: call System.Boolean System.Collections.Generic.List`1/Enumerator<Character>::MoveNext()
IL_00d8: brtrue IL_003f
IL_00dd: ldarg.0
IL_00de: call System.Void BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>m__Finally1()
IL_00e3: ldarg.0
IL_00e4: ldflda System.Collections.Generic.List`1/Enumerator<Character> BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>7__wrap1
IL_00e9: initobj System.Collections.Generic.List`1/Enumerator<Character>
IL_00ef: ldc.i4.0
IL_00f0: stloc.1
IL_00f1: leave IL_00fd
IL_00f6: ldarg.0
IL_00f7: call System.Void BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::System.IDisposable.Dispose()
IL_00fc: endfinally
IL_00fd: ldloc.1
IL_00fe: ret
// EH Fault: 0 - 246 => 246 - 253

// System.Void BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>m__Finally1()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.m1
IL_0002: stfld System.Int32 BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>1__state
IL_0007: ldarg.0
IL_0008: ldflda System.Collections.Generic.List`1/Enumerator<Character> BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>7__wrap1
IL_000d: constrained. System.Collections.Generic.List`1/Enumerator<Character>
IL_0013: callvirt System.Void System.IDisposable::Dispose()
IL_0018: ret

// Character BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::System.Collections.Generic.IEnumerator<Character>.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld Character BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>2__current
IL_0006: ret

// System.Void BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::System.Collections.IEnumerator.Reset()
.locals 
IL_0000: newobj System.Void System.NotSupportedException::.ctor()
IL_0005: throw

// System.Object BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::System.Collections.IEnumerator.get_Current()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld Character BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>2__current
IL_0006: ret

// System.Collections.Generic.IEnumerator`1<Character> BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::System.Collections.Generic.IEnumerable<Character>.GetEnumerator()
.locals BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>1__state
IL_0006: ldc.i4.s -2
IL_0008: bne.un IL_002b
IL_000d: ldarg.0
IL_000e: ldfld System.Int32 BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>l__initialThreadId
IL_0013: call System.Int32 System.Environment::get_CurrentManagedThreadId()
IL_0018: bne.un IL_002b
IL_001d: ldarg.0
IL_001e: ldc.i4.0
IL_001f: stfld System.Int32 BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>1__state
IL_0024: ldarg.0
IL_0025: stloc.0
IL_0026: br IL_0032
IL_002b: ldc.i4.0
IL_002c: newobj System.Void BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::.ctor(System.Int32)
IL_0031: stloc.0
IL_0032: ldloc.0
IL_0033: ldarg.0
IL_0034: ldfld System.String BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::<>3__playerName
IL_0039: stfld System.String BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::playerName
IL_003e: ldloc.0
IL_003f: ret

// System.Collections.IEnumerator BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::System.Collections.IEnumerable.GetEnumerator()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Collections.Generic.IEnumerator`1<Character> BetterTames.Scripts.CatchUp.CatchUp/<FollowersOf>d__11::System.Collections.Generic.IEnumerable<Character>.GetEnumerator()
IL_0006: ret

// System.Void BetterTames.Scripts.CatchUp.CatchUpPatches::Player_OnSpawned_Postfix(Player)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BetterTames.Scripts.CatchUp.CatchUp::OnRespawn(Player)
IL_0006: ret

// System.Void BetterTames.Scripts.Commands.Commands::Apply(Tameable)
.locals UnityEngine.GameObject, Tameable
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::commandAllTames
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse IL_0028
IL_000f: ldarg.0
IL_0010: callvirt !!0 UnityEngine.Component::GetComponent<MonsterAI>()
IL_0015: ldnull
IL_0016: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_001b: brfalse IL_0028
IL_0020: ldarg.0
IL_0021: ldc.i4.1
IL_0022: stfld System.Boolean Tameable::m_commandable
IL_0027: ret
IL_0028: call ZNetScene ZNetScene::get_instance()
IL_002d: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0032: brtrue IL_003d
IL_0037: ldnull
IL_0038: br IL_0052
IL_003d: call ZNetScene ZNetScene::get_instance()
IL_0042: ldarg.0
IL_0043: callvirt UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL_0048: call System.String Utils::GetPrefabName(UnityEngine.GameObject)
IL_004d: callvirt UnityEngine.GameObject ZNetScene::GetPrefab(System.String)
IL_0052: stloc.0
IL_0053: ldloc.0
IL_0054: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0059: brtrue IL_0064
IL_005e: ldnull
IL_005f: br IL_006a
IL_0064: ldloc.0
IL_0065: callvirt !!0 UnityEngine.GameObject::GetComponent<Tameable>()
IL_006a: stloc.1
IL_006b: ldloc.1
IL_006c: ldnull
IL_006d: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0072: brfalse IL_0083
IL_0077: ldarg.0
IL_0078: ldloc.1
IL_0079: ldfld System.Boolean Tameable::m_commandable
IL_007e: stfld System.Boolean Tameable::m_commandable
IL_0083: ret

// System.Void BetterTames.Scripts.Commands.Commands::ApplyAll()
.locals System.Collections.Generic.List`1/Enumerator<Character>, Tameable
IL_0000: call System.Collections.Generic.List`1<Character> Character::GetAllCharacters()
IL_0005: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Character>::GetEnumerator()
IL_000a: stloc.0
IL_000b: br IL_0029
IL_0010: ldloca.s V_0
IL_0012: call !0 System.Collections.Generic.List`1/Enumerator<Character>::get_Current()
IL_0017: ldloca.s V_1
IL_0019: callvirt System.Boolean UnityEngine.Component::TryGetComponent<Tameable>(!!0&)
IL_001e: brfalse IL_0029
IL_0023: ldloc.1
IL_0024: call System.Void BetterTames.Scripts.Commands.Commands::Apply(Tameable)
IL_0029: ldloca.s V_0
IL_002b: call System.Boolean System.Collections.Generic.List`1/Enumerator<Character>::MoveNext()
IL_0030: brtrue.s IL_0010
IL_0032: leave IL_0045
IL_0037: ldloca.s V_0
IL_0039: constrained. System.Collections.Generic.List`1/Enumerator<Character>
IL_003f: callvirt System.Void System.IDisposable::Dispose()
IL_0044: endfinally
IL_0045: ret
// EH Finally: 11 - 55 => 55 - 69

// System.Void BetterTames.Scripts.Commands.Commands::Tick()
.locals Player, BepInEx.Configuration.KeyboardShortcut
IL_0000: ldsfld Player Player::m_localPlayer
IL_0005: stloc.0
IL_0006: ldloc.0
IL_0007: ldnull
IL_0008: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_000d: brtrue IL_0022
IL_0012: ldsfld System.Func`2<Player,System.Boolean> BetterTames.Scripts.Commands.Commands::TakeInput
IL_0017: ldloc.0
IL_0018: callvirt !1 System.Func`2<Player,System.Boolean>::Invoke(!0)
IL_001d: brtrue IL_0023
IL_0022: ret
IL_0023: ldsfld BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> BetterTames.Plugin::massFollowKey
IL_0028: callvirt !0 BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>::get_Value()
IL_002d: stloc.1
IL_002e: ldloca.s V_1
IL_0030: call System.Boolean BepInEx.Configuration.KeyboardShortcut::IsDown()
IL_0035: brfalse IL_0042
IL_003a: ldloc.0
IL_003b: ldc.i4.1
IL_003c: call System.Void BetterTames.Scripts.Commands.Commands::MassCommand(Player,System.Boolean)
IL_0041: ret
IL_0042: ldsfld BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut> BetterTames.Plugin::massStayKey
IL_0047: callvirt !0 BepInEx.Configuration.ConfigEntry`1<BepInEx.Configuration.KeyboardShortcut>::get_Value()
IL_004c: stloc.1
IL_004d: ldloca.s V_1
IL_004f: call System.Boolean BepInEx.Configuration.KeyboardShortcut::IsDown()
IL_0054: brfalse IL_0060
IL_0059: ldloc.0
IL_005a: ldc.i4.0
IL_005b: call System.Void BetterTames.Scripts.Commands.Commands::MassCommand(Player,System.Boolean)
IL_0060: ret

// System.Void BetterTames.Scripts.Commands.Commands::MassCommand(Player,System.Boolean)
.locals System.String, System.Single, System.Int32, System.Collections.Generic.List`1/Enumerator<Character>, Character, Tameable, ZNetView, System.String, System.String
IL_0000: call System.Single UnityEngine.Time::get_time()
IL_0005: ldsfld System.Single BetterTames.Scripts.Commands.Commands::lastMassCommand
IL_000a: sub
IL_000b: ldc.r4 1
IL_0010: bge.un IL_0016
IL_0015: ret
IL_0016: call System.Single UnityEngine.Time::get_time()
IL_001b: stsfld System.Single BetterTames.Scripts.Commands.Commands::lastMassCommand
IL_0020: ldarg.0
IL_0021: callvirt System.String Player::GetPlayerName()
IL_0026: stloc.0
IL_0027: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> BetterTames.Plugin::massCommandRange
IL_002c: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0031: stloc.1
IL_0032: ldc.i4.0
IL_0033: stloc.2
IL_0034: call System.Collections.Generic.List`1<Character> Character::GetAllCharacters()
IL_0039: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Character>::GetEnumerator()
IL_003e: stloc.3
IL_003f: br IL_0116
IL_0044: ldloca.s V_3
IL_0046: call !0 System.Collections.Generic.List`1/Enumerator<Character>::get_Current()
IL_004b: stloc.s V_4
IL_004d: ldloc.s V_4
IL_004f: callvirt System.Boolean Character::IsTamed()
IL_0054: brfalse IL_0116
IL_0059: ldloc.s V_4
IL_005b: ldloca.s V_5
IL_005d: callvirt System.Boolean UnityEngine.Component::TryGetComponent<Tameable>(!!0&)
IL_0062: brfalse IL_0116
IL_0067: ldloc.s V_5
IL_0069: ldfld System.Boolean Tameable::m_commandable
IL_006e: brfalse IL_0116
IL_0073: ldloc.s V_4
IL_0075: callvirt !!0 UnityEngine.Component::GetComponent<MonsterAI>()
IL_007a: ldnull
IL_007b: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0080: brtrue IL_0116
IL_0085: ldloc.s V_4
IL_0087: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_008c: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_0091: ldarg.0
IL_0092: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0097: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_009c: call System.Single UnityEngine.Vector3::Distance(UnityEngine.Vector3,UnityEngine.Vector3)
IL_00a1: ldloc.1
IL_00a2: bgt IL_0116
IL_00a7: ldsfld HarmonyLib.AccessTools/FieldRef`2<Tameable,ZNetView> BetterTames.Scripts.Commands.Commands::TameView
IL_00ac: ldloc.s V_5
IL_00ae: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Tameable,ZNetView>::Invoke(!0)
IL_00b3: ldind.ref
IL_00b4: stloc.s V_6
IL_00b6: ldloc.s V_6
IL_00b8: ldnull
IL_00b9: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_00be: brtrue IL_0116
IL_00c3: ldloc.s V_6
IL_00c5: callvirt System.Boolean ZNetView::IsValid()
IL_00ca: brfalse IL_0116
IL_00cf: ldloc.s V_6
IL_00d1: callvirt ZDO ZNetView::GetZDO()
IL_00d6: ldsfld System.Int32 ZDOVars::s_follow
IL_00db: ldstr ""
IL_00e0: callvirt System.String ZDO::GetString(System.Int32,System.String)
IL_00e5: stloc.s V_7
IL_00e7: ldarg.1
IL_00e8: brtrue IL_00fa
IL_00ed: ldloc.s V_7
IL_00ef: ldloc.0
IL_00f0: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_00f5: br IL_0104
IL_00fa: ldloc.s V_7
IL_00fc: callvirt System.Int32 System.String::get_Length()
IL_0101: ldc.i4.0
IL_0102: cgt
IL_0104: brtrue IL_0116
IL_0109: ldloc.s V_5
IL_010b: ldarg.0
IL_010c: ldc.i4.0
IL_010d: callvirt System.Void Tameable::Command(Humanoid,System.Boolean)
IL_0112: ldloc.2
IL_0113: ldc.i4.1
IL_0114: add
IL_0115: stloc.2
IL_0116: ldloca.s V_3
IL_0118: call System.Boolean System.Collections.Generic.List`1/Enumerator<Character>::MoveNext()
IL_011d: brtrue IL_0044
IL_0122: leave IL_0135
IL_0127: ldloca.s V_3
IL_0129: constrained. System.Collections.Generic.List`1/Enumerator<Character>
IL_012f: callvirt System.Void System.IDisposable::Dispose()
IL_0134: endfinally
IL_0135: ldloc.2
IL_0136: brfalse IL_017b
IL_013b: ldstr "{0} {1} {2}"
IL_0140: ldloc.2
IL_0141: box System.Int32
IL_0146: ldloc.2
IL_0147: ldc.i4.1
IL_0148: beq IL_0157
IL_014d: ldstr "tames"
IL_0152: br IL_015c
IL_0157: ldstr "tame"
IL_015c: ldarg.1
IL_015d: brtrue IL_016c
IL_0162: ldstr "staying"
IL_0167: br IL_0171
IL_016c: ldstr "following"
IL_0171: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_0176: br IL_0190
IL_017b: ldarg.1
IL_017c: brtrue IL_018b
IL_0181: ldstr "No tames following you"
IL_0186: br IL_0190
IL_018b: ldstr "No tames to follow you"
IL_0190: stloc.s V_8
IL_0192: ldarg.0
IL_0193: ldc.i4.2
IL_0194: ldloc.s V_8
IL_0196: ldc.i4.0
IL_0197: ldnull
IL_0198: ldc.i4.0
IL_0199: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_019e: ret
// EH Finally: 63 - 295 => 295 - 309

// System.Void BetterTames.Scripts.Commands.Commands::.cctor()
.locals 
IL_0000: ldstr "m_nview"
IL_0005: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Tameable,ZNetView>(System.String)
IL_000a: stsfld HarmonyLib.AccessTools/FieldRef`2<Tameable,ZNetView> BetterTames.Scripts.Commands.Commands::TameView
IL_000f: ldtoken Player
IL_0014: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0019: ldstr "TakeInput"
IL_001e: ldnull
IL_001f: ldnull
IL_0020: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_0025: ldnull
IL_0026: ldc.i4.1
IL_0027: call !!0 HarmonyLib.AccessTools::MethodDelegate<System.Func`2<Player,System.Boolean>>(System.Reflection.MethodInfo,System.Object,System.Boolean)
IL_002c: stsfld System.Func`2<Player,System.Boolean> BetterTames.Scripts.Commands.Commands::TakeInput
IL_0031: ret

// System.Void BetterTames.Scripts.Commands.CommandPatches::Tameable_Awake_Postfix(Tameable)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BetterTames.Scripts.Commands.Commands::Apply(Tameable)
IL_0006: ret

// System.Void BetterTames.Scripts.Tuning.Tuning::Apply(Tameable)
.locals ZNetView, ZDO
IL_0000: ldarg.0
IL_0001: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::tamingTime
IL_0006: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_000b: conv.r4
IL_000c: ldc.r4 60
IL_0011: mul
IL_0012: stfld System.Single Tameable::m_tamingTime
IL_0017: ldsfld HarmonyLib.AccessTools/FieldRef`2<Tameable,ZNetView> BetterTames.Scripts.Tuning.Tuning::TameView
IL_001c: ldarg.0
IL_001d: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Tameable,ZNetView>::Invoke(!0)
IL_0022: ldind.ref
IL_0023: stloc.0
IL_0024: ldloc.0
IL_0025: ldnull
IL_0026: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_002b: brtrue IL_0046
IL_0030: ldloc.0
IL_0031: callvirt System.Boolean ZNetView::IsValid()
IL_0036: brfalse IL_0046
IL_003b: ldloc.0
IL_003c: callvirt System.Boolean ZNetView::IsOwner()
IL_0041: brtrue IL_0047
IL_0046: ret
IL_0047: ldloc.0
IL_0048: callvirt ZDO ZNetView::GetZDO()
IL_004d: stloc.1
IL_004e: ldloc.1
IL_004f: ldsfld System.Int32 ZDOVars::s_tameTimeLeft
IL_0054: ldarg.0
IL_0055: ldfld System.Single Tameable::m_tamingTime
IL_005a: callvirt System.Single ZDO::GetFloat(System.Int32,System.Single)
IL_005f: ldarg.0
IL_0060: ldfld System.Single Tameable::m_tamingTime
IL_0065: ble.un IL_007b
IL_006a: ldloc.1
IL_006b: ldsfld System.Int32 ZDOVars::s_tameTimeLeft
IL_0070: ldarg.0
IL_0071: ldfld System.Single Tameable::m_tamingTime
IL_0076: callvirt System.Void ZDO::Set(System.Int32,System.Single)
IL_007b: ret

// System.Void BetterTames.Scripts.Tuning.Tuning::Apply(Procreation)
.locals 
IL_0000: ldarg.0
IL_0001: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::lovePoints
IL_0006: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_000b: stfld System.Int32 Procreation::m_requiredLovePoints
IL_0010: ldarg.0
IL_0011: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::maxCreaturesNearby
IL_0016: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_001b: stfld System.Int32 Procreation::m_maxCreatures
IL_0020: ldarg.0
IL_0021: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> BetterTames.Plugin::maxCreaturesRange
IL_0026: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_002b: stfld System.Single Procreation::m_totalCheckRange
IL_0030: ret

// System.Void BetterTames.Scripts.Tuning.Tuning::Apply(Growup)
.locals 
IL_0000: ldarg.0
IL_0001: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::growthTime
IL_0006: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_000b: conv.r4
IL_000c: ldc.r4 60
IL_0011: mul
IL_0012: stfld System.Single Growup::m_growTime
IL_0017: ret

// System.Void BetterTames.Scripts.Tuning.Tuning::Apply(Character)
.locals 
IL_0000: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,System.Single> BetterTames.Scripts.Tuning.Tuning::RegenAllHpTime
IL_0005: ldarg.0
IL_0006: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,System.Single>::Invoke(!0)
IL_000b: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Int32> BetterTames.Plugin::regenTime
IL_0010: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Int32>::get_Value()
IL_0015: conv.r4
IL_0016: stind.r4
IL_0017: ret

// System.Void BetterTames.Scripts.Tuning.Tuning::ApplyAll()
.locals System.Collections.Generic.List`1/Enumerator<Character>, Character, Tameable, Procreation, Growup
IL_0000: call System.Collections.Generic.List`1<Character> Character::GetAllCharacters()
IL_0005: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Character>::GetEnumerator()
IL_000a: stloc.0
IL_000b: br IL_0063
IL_0010: ldloca.s V_0
IL_0012: call !0 System.Collections.Generic.List`1/Enumerator<Character>::get_Current()
IL_0017: stloc.1
IL_0018: ldloc.1
IL_0019: ldloca.s V_2
IL_001b: callvirt System.Boolean UnityEngine.Component::TryGetComponent<Tameable>(!!0&)
IL_0020: brfalse IL_002b
IL_0025: ldloc.2
IL_0026: call System.Void BetterTames.Scripts.Tuning.Tuning::Apply(Tameable)
IL_002b: ldloc.1
IL_002c: ldloca.s V_3
IL_002e: callvirt System.Boolean UnityEngine.Component::TryGetComponent<Procreation>(!!0&)
IL_0033: brfalse IL_003e
IL_0038: ldloc.3
IL_0039: call System.Void BetterTames.Scripts.Tuning.Tuning::Apply(Procreation)
IL_003e: ldloc.1
IL_003f: ldloca.s V_4
IL_0041: callvirt System.Boolean UnityEngine.Component::TryGetComponent<Growup>(!!0&)
IL_0046: brfalse IL_0052
IL_004b: ldloc.s V_4
IL_004d: call System.Void BetterTames.Scripts.Tuning.Tuning::Apply(Growup)
IL_0052: ldloc.1
IL_0053: callvirt System.Boolean Character::IsTamed()
IL_0058: brfalse IL_0063
IL_005d: ldloc.1
IL_005e: call System.Void BetterTames.Scripts.Tuning.Tuning::Apply(Character)
IL_0063: ldloca.s V_0
IL_0065: call System.Boolean System.Collections.Generic.List`1/Enumerator<Character>::MoveNext()
IL_006a: brtrue.s IL_0010
IL_006c: leave IL_007f
IL_0071: ldloca.s V_0
IL_0073: constrained. System.Collections.Generic.List`1/Enumerator<Character>
IL_0079: callvirt System.Void System.IDisposable::Dispose()
IL_007e: endfinally
IL_007f: ret
// EH Finally: 11 - 113 => 113 - 127

// System.Void BetterTames.Scripts.Tuning.Tuning::.cctor()
.locals 
IL_0000: ldstr "m_nview"
IL_0005: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Tameable,ZNetView>(System.String)
IL_000a: stsfld HarmonyLib.AccessTools/FieldRef`2<Tameable,ZNetView> BetterTames.Scripts.Tuning.Tuning::TameView
IL_000f: ldstr "m_regenAllHPTime"
IL_0014: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Character,System.Single>(System.String)
IL_0019: stsfld HarmonyLib.AccessTools/FieldRef`2<Character,System.Single> BetterTames.Scripts.Tuning.Tuning::RegenAllHpTime
IL_001e: ret

// System.Void BetterTames.Scripts.Tuning.TuningPatches::Tameable_Awake_Postfix(Tameable)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BetterTames.Scripts.Tuning.Tuning::Apply(Tameable)
IL_0006: ret

// System.Void BetterTames.Scripts.Tuning.TuningPatches::Procreation_Awake_Postfix(Procreation)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BetterTames.Scripts.Tuning.Tuning::Apply(Procreation)
IL_0006: ret

// System.Void BetterTames.Scripts.Tuning.TuningPatches::Growup_Start_Postfix(Growup)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BetterTames.Scripts.Tuning.Tuning::Apply(Growup)
IL_0006: ret

// System.Void BetterTames.Scripts.Tuning.TuningPatches::Character_RPC_SetTamed_Postfix(Character,System.Boolean)
.locals 
IL_0000: ldarg.1
IL_0001: brfalse IL_000c
IL_0006: ldarg.0
IL_0007: call System.Void BetterTames.Scripts.Tuning.Tuning::Apply(Character)
IL_000c: ret

// System.Void BetterTames.Scripts.Tuning.TuningPatches::Character_Awake_Postfix(Character)
.locals 
IL_0000: ldarg.0
IL_0001: callvirt System.Boolean Character::IsTamed()
IL_0006: brfalse IL_0011
IL_000b: ldarg.0
IL_000c: call System.Void BetterTames.Scripts.Tuning.Tuning::Apply(Character)
IL_0011: ret

// System.String BetterTames.Scripts.Timers.Timers::AddTo(Character,System.String)
.locals ZNetView, ZDO, System.String, System.Int32
IL_0000: ldsfld HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView> BetterTames.Scripts.Timers.Timers::NView
IL_0005: ldarg.0
IL_0006: callvirt !1& HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView>::Invoke(!0)
IL_000b: ldind.ref
IL_000c: stloc.0
IL_000d: ldloc.0
IL_000e: ldnull
IL_000f: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0014: brtrue IL_0034
IL_0019: ldloc.0
IL_001a: callvirt System.Boolean ZNetView::IsValid()
IL_001f: brfalse IL_0034
IL_0024: call ZNet ZNet::get_instance()
IL_0029: ldnull
IL_002a: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_002f: brfalse IL_0036
IL_0034: ldarg.1
IL_0035: ret
IL_0036: ldloc.0
IL_0037: callvirt ZDO ZNetView::GetZDO()
IL_003c: stloc.1
IL_003d: ldsfld System.Collections.Generic.List`1<System.String> BetterTames.Scripts.Timers.Timers::Lines
IL_0042: callvirt System.Void System.Collections.Generic.List`1<System.String>::Clear()
IL_0047: ldarg.0
IL_0048: ldloc.1
IL_0049: call System.String BetterTames.Scripts.Timers.Timers::Taming(Character,ZDO)
IL_004e: call System.Void BetterTames.Scripts.Timers.Timers::Add(System.String)
IL_0053: ldarg.0
IL_0054: ldloc.1
IL_0055: call System.String BetterTames.Scripts.Timers.Timers::Breeding(Character,ZDO)
IL_005a: call System.Void BetterTames.Scripts.Timers.Timers::Add(System.String)
IL_005f: ldarg.0
IL_0060: ldloc.1
IL_0061: call System.String BetterTames.Scripts.Timers.Timers::Growth(Character,ZDO)
IL_0066: call System.Void BetterTames.Scripts.Timers.Timers::Add(System.String)
IL_006b: ldarg.0
IL_006c: ldloc.1
IL_006d: call System.String BetterTames.Scripts.Protection.Protection::HoverLine(Character,ZDO)
IL_0072: call System.Void BetterTames.Scripts.Timers.Timers::Add(System.String)
IL_0077: ldsfld System.Collections.Generic.List`1<System.String> BetterTames.Scripts.Timers.Timers::Lines
IL_007c: callvirt System.Int32 System.Collections.Generic.List`1<System.String>::get_Count()
IL_0081: brtrue IL_0088
IL_0086: ldarg.1
IL_0087: ret
IL_0088: ldstr "
"
IL_008d: ldsfld System.Collections.Generic.List`1<System.String> BetterTames.Scripts.Timers.Timers::Lines
IL_0092: call System.String System.String::Join(System.String,System.Collections.Generic.IEnumerable`1<System.String>)
IL_0097: stloc.2
IL_0098: ldarg.1
IL_0099: callvirt System.Int32 System.String::get_Length()
IL_009e: brtrue IL_00b5
IL_00a3: ldarg.0
IL_00a4: callvirt System.String Character::GetHoverName()
IL_00a9: ldstr "
"
IL_00ae: ldloc.2
IL_00af: call System.String System.String::Concat(System.String,System.String,System.String)
IL_00b4: ret
IL_00b5: ldarg.1
IL_00b6: ldc.i4.s 10
IL_00b8: callvirt System.Int32 System.String::IndexOf(System.Char)
IL_00bd: stloc.3
IL_00be: ldloc.3
IL_00bf: ldc.i4.0
IL_00c0: blt IL_00e0
IL_00c5: ldarg.1
IL_00c6: ldc.i4.0
IL_00c7: ldloc.3
IL_00c8: callvirt System.String System.String::Substring(System.Int32,System.Int32)
IL_00cd: ldstr "
"
IL_00d2: ldloc.2
IL_00d3: ldarg.1
IL_00d4: ldloc.3
IL_00d5: callvirt System.String System.String::Substring(System.Int32)
IL_00da: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_00df: ret
IL_00e0: ldarg.1
IL_00e1: ldstr "
"
IL_00e6: ldloc.2
IL_00e7: call System.String System.String::Concat(System.String,System.String,System.String)
IL_00ec: ret

// System.Void BetterTames.Scripts.Timers.Timers::Add(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: brfalse IL_0011
IL_0006: ldsfld System.Collections.Generic.List`1<System.String> BetterTames.Scripts.Timers.Timers::Lines
IL_000b: ldarg.0
IL_000c: callvirt System.Void System.Collections.Generic.List`1<System.String>::Add(!0)
IL_0011: ret

// System.String BetterTames.Scripts.Timers.Timers::Taming(Character,ZDO)
.locals Tameable, System.Single, System.String, BaseAI
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::showTamingTimer
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse IL_001a
IL_000f: ldarg.0
IL_0010: callvirt System.Boolean Character::IsTamed()
IL_0015: brfalse IL_001c
IL_001a: ldnull
IL_001b: ret
IL_001c: ldarg.0
IL_001d: callvirt !!0 UnityEngine.Component::GetComponent<Tameable>()
IL_0022: stloc.0
IL_0023: ldloc.0
IL_0024: ldnull
IL_0025: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_002a: brfalse IL_0031
IL_002f: ldnull
IL_0030: ret
IL_0031: ldarg.1
IL_0032: ldsfld System.Int32 ZDOVars::s_tameTimeLeft
IL_0037: ldloc.0
IL_0038: ldfld System.Single Tameable::m_tamingTime
IL_003d: callvirt System.Single ZDO::GetFloat(System.Int32,System.Single)
IL_0042: stloc.1
IL_0043: ldloc.1
IL_0044: ldloc.0
IL_0045: ldfld System.Single Tameable::m_tamingTime
IL_004a: blt.un IL_0051
IL_004f: ldnull
IL_0050: ret
IL_0051: ldstr "Tamed in "
IL_0056: ldloc.1
IL_0057: ldloc.0
IL_0058: call System.Single BetterTames.Scripts.Timers.Timers::TamingSpeed(Tameable)
IL_005d: div
IL_005e: conv.r8
IL_005f: call System.String BetterTames.Scripts.Timers.Timers::Format(System.Double)
IL_0064: call System.String System.String::Concat(System.String,System.String)
IL_0069: stloc.2
IL_006a: ldarg.0
IL_006b: callvirt BaseAI Character::GetBaseAI()
IL_0070: stloc.3
IL_0071: ldloc.0
IL_0072: callvirt System.Boolean Tameable::IsHungry()
IL_0077: brtrue IL_0093
IL_007c: ldloc.3
IL_007d: ldnull
IL_007e: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0083: brfalse IL_009f
IL_0088: ldloc.3
IL_0089: callvirt System.Boolean BaseAI::IsAlerted()
IL_008e: brfalse IL_009f
IL_0093: ldloc.2
IL_0094: ldstr " (paused)"
IL_0099: call System.String System.String::Concat(System.String,System.String)
IL_009e: stloc.2
IL_009f: ldloc.2
IL_00a0: ret

// System.Single BetterTames.Scripts.Timers.Timers::TamingSpeed(Tameable)
.locals System.Single, System.Collections.Generic.List`1/Enumerator<Player>
IL_0000: ldc.r4 1
IL_0005: stloc.0
IL_0006: ldsfld System.Collections.Generic.List`1<Player> BetterTames.Scripts.Timers.Timers::NearbyPlayers
IL_000b: callvirt System.Void System.Collections.Generic.List`1<Player>::Clear()
IL_0010: ldarg.0
IL_0011: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0016: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_001b: ldarg.0
IL_001c: ldfld System.Single Tameable::m_tamingSpeedMultiplierRange
IL_0021: ldsfld System.Collections.Generic.List`1<Player> BetterTames.Scripts.Timers.Timers::NearbyPlayers
IL_0026: call System.Void Player::GetPlayersInRange(UnityEngine.Vector3,System.Single,System.Collections.Generic.List`1<Player>)
IL_002b: ldsfld System.Collections.Generic.List`1<Player> BetterTames.Scripts.Timers.Timers::NearbyPlayers
IL_0030: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<Player>::GetEnumerator()
IL_0035: stloc.1
IL_0036: br IL_005b
IL_003b: ldloca.s V_1
IL_003d: call !0 System.Collections.Generic.List`1/Enumerator<Player>::get_Current()
IL_0042: callvirt SEMan Character::GetSEMan()
IL_0047: ldc.i4.8
IL_0048: callvirt System.Boolean SEMan::HaveStatusAttribute(StatusEffect/StatusAttribute)
IL_004d: brfalse IL_005b
IL_0052: ldloc.0
IL_0053: ldarg.0
IL_0054: ldfld System.Single Tameable::m_tamingBoostMultiplier
IL_0059: mul
IL_005a: stloc.0
IL_005b: ldloca.s V_1
IL_005d: call System.Boolean System.Collections.Generic.List`1/Enumerator<Player>::MoveNext()
IL_0062: brtrue.s IL_003b
IL_0064: leave IL_0077
IL_0069: ldloca.s V_1
IL_006b: constrained. System.Collections.Generic.List`1/Enumerator<Player>
IL_0071: callvirt System.Void System.IDisposable::Dispose()
IL_0076: endfinally
IL_0077: ldloc.0
IL_0078: ret
// EH Finally: 54 - 105 => 105 - 119

// System.String BetterTames.Scripts.Timers.Timers::Breeding(Character,ZDO)
.locals Procreation, System.Int64, System.Double
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::showBreedingTimer
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse IL_001a
IL_000f: ldarg.0
IL_0010: callvirt System.Boolean Character::IsTamed()
IL_0015: brtrue IL_001c
IL_001a: ldnull
IL_001b: ret
IL_001c: ldarg.0
IL_001d: callvirt !!0 UnityEngine.Component::GetComponent<Procreation>()
IL_0022: stloc.0
IL_0023: ldloc.0
IL_0024: ldnull
IL_0025: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_002a: brfalse IL_0031
IL_002f: ldnull
IL_0030: ret
IL_0031: ldarg.1
IL_0032: ldsfld System.Int32 ZDOVars::s_pregnant
IL_0037: ldc.i4.0
IL_0038: conv.i8
IL_0039: callvirt System.Int64 ZDO::GetLong(System.Int32,System.Int64)
IL_003e: stloc.1
IL_003f: ldloc.1
IL_0040: brtrue IL_006c
IL_0045: ldstr "Love {0}/{1}"
IL_004a: ldarg.1
IL_004b: ldsfld System.Int32 ZDOVars::s_lovePoints
IL_0050: ldc.i4.0
IL_0051: callvirt System.Int32 ZDO::GetInt(System.Int32,System.Int32)
IL_0056: box System.Int32
IL_005b: ldloc.0
IL_005c: ldfld System.Int32 Procreation::m_requiredLovePoints
IL_0061: box System.Int32
IL_0066: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_006b: ret
IL_006c: ldloc.0
IL_006d: ldfld System.Single Procreation::m_pregnancyDuration
IL_0072: conv.r8
IL_0073: ldloc.1
IL_0074: call System.Double BetterTames.Scripts.Timers.Timers::SecondsSince(System.Int64)
IL_0079: sub
IL_007a: stloc.2
IL_007b: ldloc.2
IL_007c: ldc.r8 0
IL_0085: bgt IL_0090
IL_008a: ldstr "Giving birth"
IL_008f: ret
IL_0090: ldstr "Gives birth in "
IL_0095: ldloc.2
IL_0096: call System.String BetterTames.Scripts.Timers.Timers::Format(System.Double)
IL_009b: call System.String System.String::Concat(System.String,System.String)
IL_00a0: ret

// System.String BetterTames.Scripts.Timers.Timers::Growth(Character,ZDO)
.locals Growup, System.Int64, System.Double
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> BetterTames.Plugin::showGrowthTimer
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue IL_0011
IL_000f: ldnull
IL_0010: ret
IL_0011: ldarg.0
IL_0012: callvirt !!0 UnityEngine.Component::GetComponent<Growup>()
IL_0017: stloc.0
IL_0018: ldloc.0
IL_0019: ldnull
IL_001a: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_001f: brfalse IL_0026
IL_0024: ldnull
IL_0025: ret
IL_0026: ldarg.1
IL_0027: ldsfld System.Int32 ZDOVars::s_spawnTime
IL_002c: ldc.i4.0
IL_002d: conv.i8
IL_002e: callvirt System.Int64 ZDO::GetLong(System.Int32,System.Int64)
IL_0033: stloc.1
IL_0034: ldloc.1
IL_0035: brtrue IL_003c
IL_003a: ldnull
IL_003b: ret
IL_003c: ldloc.0
IL_003d: ldfld System.Single Growup::m_growTime
IL_0042: conv.r8
IL_0043: ldloc.1
IL_0044: call System.Double BetterTames.Scripts.Timers.Timers::SecondsSince(System.Int64)
IL_0049: sub
IL_004a: stloc.2
IL_004b: ldloc.2
IL_004c: ldc.r8 0
IL_0055: bgt IL_0060
IL_005a: ldstr "Growing up"
IL_005f: ret
IL_0060: ldstr "Grows up in "
IL_0065: ldloc.2
IL_0066: call System.String BetterTames.Scripts.Timers.Timers::Format(System.Double)
IL_006b: call System.String System.String::Concat(System.String,System.String)
IL_0070: ret

// System.Double BetterTames.Scripts.Timers.Timers::SecondsSince(System.Int64)
.locals System.TimeSpan
IL_0000: call ZNet ZNet::get_instance()
IL_0005: callvirt System.DateTime ZNet::GetTime()
IL_000a: ldarg.0
IL_000b: newobj System.Void System.DateTime::.ctor(System.Int64)
IL_0010: call System.TimeSpan System.DateTime::op_Subtraction(System.DateTime,System.DateTime)
IL_0015: stloc.0
IL_0016: ldloca.s V_0
IL_0018: call System.Double System.TimeSpan::get_TotalSeconds()
IL_001d: ret

// System.String BetterTames.Scripts.Timers.Timers::Format(System.Double)
.locals System.Int32
IL_0000: ldarg.0
IL_0001: conv.r4
IL_0002: call System.Int32 UnityEngine.Mathf::CeilToInt(System.Single)
IL_0007: stloc.0
IL_0008: ldloc.0
IL_0009: ldc.i4 3600
IL_000e: blt IL_0039
IL_0013: ldstr "{0}h {1}m"
IL_0018: ldloc.0
IL_0019: ldc.i4 3600
IL_001e: div
IL_001f: box System.Int32
IL_0024: ldloc.0
IL_0025: ldc.i4 3600
IL_002a: rem
IL_002b: ldc.i4.s 60
IL_002d: div
IL_002e: box System.Int32
IL_0033: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_0038: ret
IL_0039: ldloc.0
IL_003a: ldc.i4.s 60
IL_003c: blt IL_005e
IL_0041: ldstr "{0}m {1}s"
IL_0046: ldloc.0
IL_0047: ldc.i4.s 60
IL_0049: div
IL_004a: box System.Int32
IL_004f: ldloc.0
IL_0050: ldc.i4.s 60
IL_0052: rem
IL_0053: box System.Int32
IL_0058: call System.String System.String::Format(System.String,System.Object,System.Object)
IL_005d: ret
IL_005e: ldstr "{0}s"
IL_0063: ldloc.0
IL_0064: box System.Int32
IL_0069: call System.String System.String::Format(System.String,System.Object)
IL_006e: ret

// System.Void BetterTames.Scripts.Timers.Timers::.cctor()
.locals 
IL_0000: ldstr "m_nview"
IL_0005: call HarmonyLib.AccessTools/FieldRef`2<!!0,!!1> HarmonyLib.AccessTools::FieldRefAccess<Character,ZNetView>(System.String)
IL_000a: stsfld HarmonyLib.AccessTools/FieldRef`2<Character,ZNetView> BetterTames.Scripts.Timers.Timers::NView
IL_000f: newobj System.Void System.Collections.Generic.List`1<Player>::.ctor()
IL_0014: stsfld System.Collections.Generic.List`1<Player> BetterTames.Scripts.Timers.Timers::NearbyPlayers
IL_0019: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor()
IL_001e: stsfld System.Collections.Generic.List`1<System.String> BetterTames.Scripts.Timers.Timers::Lines
IL_0023: ret

// System.Void BetterTames.Scripts.Timers.TimerPatches::Character_GetHoverText_Postfix(Character,System.String&)
.locals 
IL_0000: ldarg.1
IL_0001: ldarg.0
IL_0002: ldarg.1
IL_0003: ldind.ref
IL_0004: call System.String BetterTames.Scripts.Timers.Timers::AddTo(Character,System.String)
IL_0009: stind.ref
IL_000a: ret

// System.Void Microsoft.CodeAnalysis.ServerSync.EmbeddedAttribute::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: nop
IL_0007: ret

// System.Void System.Runtime.CompilerServices.ServerSync.NullableAttribute::.ctor(System.Byte)
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
IL_0012: stfld System.Byte[] System.Runtime.CompilerServices.ServerSync.NullableAttribute::NullableFlags
IL_0017: ret

// System.Void System.Runtime.CompilerServices.ServerSync.NullableAttribute::.ctor(System.Byte[])
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldarg.1
IL_0009: stfld System.Byte[] System.Runtime.CompilerServices.ServerSync.NullableAttribute::NullableFlags
IL_000e: ret

// System.Void System.Runtime.CompilerServices.ServerSync.NullableContextAttribute::.ctor(System.Byte)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldarg.1
IL_0009: stfld System.Byte System.Runtime.CompilerServices.ServerSync.NullableContextAttribute::Flag
IL_000e: ret

// System.Void System.Runtime.CompilerServices.RefSafetyRulesAttribute::.ctor(System.Int32)
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Attribute::.ctor()
IL_0006: nop
IL_0007: ldarg.0
IL_0008: ldarg.1
IL_0009: stfld System.Int32 System.Runtime.CompilerServices.RefSafetyRulesAttribute::Version
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
IL_000c: brfalse IL_0020
IL_0011: nop
IL_0012: ldarg.0
IL_0013: ldarg.1
IL_0014: call System.Void ServerSync.SyncedConfigEntry`1<T>::set_Value(T)
IL_0019: nop
IL_001a: nop
IL_001b: br IL_002e
IL_0020: nop
IL_0021: ldarg.0
IL_0022: ldarg.1
IL_0023: box T
IL_0028: stfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_002d: nop
IL_002e: ret

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
IL_000f: brtrue IL_001a
IL_0014: pop
IL_0015: br IL_0020
IL_001a: callvirt System.Void System.Action::Invoke()
IL_001f: nop
IL_0020: ret

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
IL_0009: brfalse IL_001d
IL_000e: nop
IL_000f: ldarg.0
IL_0010: ldarg.1
IL_0011: call System.Void ServerSync.CustomSyncedValue`1<T>::set_Value(T)
IL_0016: nop
IL_0017: nop
IL_0018: br IL_002b
IL_001d: nop
IL_001e: ldarg.0
IL_001f: ldarg.1
IL_0020: box T
IL_0025: stfld System.Object ServerSync.CustomSyncedValueBase::LocalBaseValue
IL_002a: nop
IL_002b: ret

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
IL_000e: brtrue IL_004b
IL_0013: ldarg.0
IL_0014: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::lockedConfig
IL_0019: brfalse IL_0045
IL_001e: ldarg.0
IL_001f: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::lockedConfig
IL_0024: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_0029: callvirt System.Object BepInEx.Configuration.ConfigEntryBase::get_BoxedValue()
IL_002e: castclass System.IConvertible
IL_0033: call System.Globalization.CultureInfo System.Globalization.CultureInfo::get_InvariantCulture()
IL_0038: callvirt System.Int32 System.IConvertible::ToInt32(System.IFormatProvider)
IL_003d: ldc.i4.0
IL_003e: cgt.un
IL_0040: br IL_0046
IL_0045: ldc.i4.0
IL_0046: br IL_0052
IL_004b: ldloca.s V_0
IL_004d: call !0 System.Nullable`1<System.Boolean>::GetValueOrDefault()
IL_0052: brfalse IL_0064
IL_0057: ldsfld System.Boolean ServerSync.ConfigSync::lockExempt
IL_005c: ldc.i4.0
IL_005d: ceq
IL_005f: br IL_0065
IL_0064: ldc.i4.0
IL_0065: ret

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
IL_0005: brtrue IL_0015
IL_000a: ldarg.0
IL_000b: ldfld System.Boolean ServerSync.ConfigSync::isSourceOfTruth
IL_0010: br IL_0016
IL_0015: ldc.i4.1
IL_0016: ret

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
IL_000f: brfalse IL_0036
IL_0014: nop
IL_0015: ldarg.0
IL_0016: ldarg.1
IL_0017: stfld System.Boolean ServerSync.ConfigSync::isSourceOfTruth
IL_001c: ldarg.0
IL_001d: ldfld System.Action`1<System.Boolean> ServerSync.ConfigSync::SourceOfTruthChanged
IL_0022: dup
IL_0023: brtrue IL_002e
IL_0028: pop
IL_0029: br IL_0035
IL_002e: ldarg.1
IL_002f: callvirt System.Void System.Action`1<System.Boolean>::Invoke(!0)
IL_0034: nop
IL_0035: nop
IL_0036: ret

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
.locals ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>, ServerSync.OwnConfigEntryBase, System.Boolean, ServerSync.SyncedConfigEntry`1<T>
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
IL_0020: stloc.1
IL_0021: ldloc.0
IL_0022: ldloc.1
IL_0023: isinst ServerSync.SyncedConfigEntry`1<T>
IL_0028: stfld ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::syncedEntry
IL_002d: ldloc.0
IL_002e: ldfld ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::syncedEntry
IL_0033: ldnull
IL_0034: cgt.un
IL_0036: ldc.i4.0
IL_0037: ceq
IL_0039: stloc.2
IL_003a: ldloc.2
IL_003b: brfalse IL_00ea
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
IL_0090: brtrue IL_009b
IL_0095: pop
IL_0096: call !!0[] System.Array::Empty<System.Object>()
IL_009b: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Concat<System.Object>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_00a0: ldc.i4.1
IL_00a1: newarr ServerSync.SyncedConfigEntry`1<T>
IL_00a6: dup
IL_00a7: ldc.i4.0
IL_00a8: ldloc.0
IL_00a9: ldfld ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::syncedEntry
IL_00ae: stelem.ref
IL_00af: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Concat<System.Object>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_00b4: call !!0[] System.Linq.Enumerable::ToArray<System.Object>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_00b9: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_00be: nop
IL_00bf: ldloc.0
IL_00c0: ldfld BepInEx.Configuration.ConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::configEntry
IL_00c5: ldloc.0
IL_00c6: ldftn System.Void ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::<AddConfigEntry>b__0(System.Object,System.EventArgs)
IL_00cc: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_00d1: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<T>::add_SettingChanged(System.EventHandler)
IL_00d6: nop
IL_00d7: ldarg.0
IL_00d8: ldfld System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase> ServerSync.ConfigSync::allConfigs
IL_00dd: ldloc.0
IL_00de: ldfld ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::syncedEntry
IL_00e3: callvirt System.Boolean System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase>::Add(!0)
IL_00e8: pop
IL_00e9: nop
IL_00ea: ldloc.0
IL_00eb: ldfld ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::syncedEntry
IL_00f0: stloc.3
IL_00f1: br IL_00f6
IL_00f6: ldloc.3
IL_00f7: ret

// ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync::AddLockingConfigEntry(BepInEx.Configuration.ConfigEntry`1<T>)
.locals System.Boolean, ServerSync.SyncedConfigEntry`1<T>
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::lockedConfig
IL_0007: ldnull
IL_0008: cgt.un
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: brfalse IL_001d
IL_0011: nop
IL_0012: ldstr "Cannot initialize locking ConfigEntry twice"
IL_0017: newobj System.Void System.Exception::.ctor(System.String)
IL_001c: throw
IL_001d: ldarg.0
IL_001e: ldarg.0
IL_001f: ldarg.1
IL_0020: call ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync::AddConfigEntry<T>(BepInEx.Configuration.ConfigEntry`1<T>)
IL_0025: stfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::lockedConfig
IL_002a: ldarg.1
IL_002b: ldarg.0
IL_002c: ldftn System.Void ServerSync.ConfigSync::<AddLockingConfigEntry>b__35_0<T>(System.Object,System.EventArgs)
IL_0032: newobj System.Void System.EventHandler::.ctor(System.Object,System.IntPtr)
IL_0037: callvirt System.Void BepInEx.Configuration.ConfigEntry`1<T>::add_SettingChanged(System.EventHandler)
IL_003c: nop
IL_003d: ldarg.0
IL_003e: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::lockedConfig
IL_0043: castclass ServerSync.SyncedConfigEntry`1<T>
IL_0048: stloc.1
IL_0049: br IL_004e
IL_004e: ldloc.1
IL_004f: ret

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
IL_0021: brtrue IL_003d
IL_0026: pop
IL_0027: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_002c: ldftn System.String ServerSync.ConfigSync/<>c::<AddCustomValue>b__36_2(ServerSync.CustomSyncedValueBase)
IL_0032: newobj System.Void System.Func`2<ServerSync.CustomSyncedValueBase,System.String>::.ctor(System.Object,System.IntPtr)
IL_0037: dup
IL_0038: stsfld System.Func`2<ServerSync.CustomSyncedValueBase,System.String> ServerSync.ConfigSync/<>c::<>9__36_2
IL_003d: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::Select<ServerSync.CustomSyncedValueBase,System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0042: ldc.i4.1
IL_0043: newarr System.String
IL_0048: dup
IL_0049: ldc.i4.0
IL_004a: ldstr "serverversion"
IL_004f: stelem.ref
IL_0050: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Concat<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_0055: ldloc.0
IL_0056: ldfld ServerSync.CustomSyncedValueBase ServerSync.ConfigSync/<>c__DisplayClass36_0::customValue
IL_005b: ldfld System.String ServerSync.CustomSyncedValueBase::Identifier
IL_0060: call System.Boolean System.Linq.Enumerable::Contains<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,!!0)
IL_0065: stloc.1
IL_0066: ldloc.1
IL_0067: brfalse IL_0078
IL_006c: nop
IL_006d: ldstr "Cannot have multiple settings with the same name or with a reserved name (serverversion)"
IL_0072: newobj System.Void System.Exception::.ctor(System.String)
IL_0077: throw
IL_0078: ldarg.0
IL_0079: ldfld System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync::allCustomValues
IL_007e: ldloc.0
IL_007f: ldfld ServerSync.CustomSyncedValueBase ServerSync.ConfigSync/<>c__DisplayClass36_0::customValue
IL_0084: callvirt System.Boolean System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase>::Add(!0)
IL_0089: pop
IL_008a: ldarg.0
IL_008b: ldarg.0
IL_008c: ldfld System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync::allCustomValues
IL_0091: ldsfld System.Func`2<ServerSync.CustomSyncedValueBase,System.Int32> ServerSync.ConfigSync/<>c::<>9__36_0
IL_0096: dup
IL_0097: brtrue IL_00b3
IL_009c: pop
IL_009d: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_00a2: ldftn System.Int32 ServerSync.ConfigSync/<>c::<AddCustomValue>b__36_0(ServerSync.CustomSyncedValueBase)
IL_00a8: newobj System.Void System.Func`2<ServerSync.CustomSyncedValueBase,System.Int32>::.ctor(System.Object,System.IntPtr)
IL_00ad: dup
IL_00ae: stsfld System.Func`2<ServerSync.CustomSyncedValueBase,System.Int32> ServerSync.ConfigSync/<>c::<>9__36_0
IL_00b3: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::OrderByDescending<ServerSync.CustomSyncedValueBase,System.Int32>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_00b8: newobj System.Void System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase>::.ctor(System.Collections.Generic.IEnumerable`1<!0>)
IL_00bd: stfld System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync::allCustomValues
IL_00c2: ldloc.0
IL_00c3: ldfld ServerSync.CustomSyncedValueBase ServerSync.ConfigSync/<>c__DisplayClass36_0::customValue
IL_00c8: ldloc.0
IL_00c9: ldftn System.Void ServerSync.ConfigSync/<>c__DisplayClass36_0::<AddCustomValue>b__1()
IL_00cf: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_00d4: callvirt System.Void ServerSync.CustomSyncedValueBase::add_ValueChanged(System.Action)
IL_00d9: nop
IL_00da: ret

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
IL_0028: brfalse IL_0037
IL_002d: nop
IL_002e: ldarg.0
IL_002f: ldc.i4.1
IL_0030: call System.Void ServerSync.ConfigSync::set_InitialSyncDone(System.Boolean)
IL_0035: nop
IL_0036: nop
IL_0037: ret

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
.locals System.String, System.Boolean, System.Reflection.MethodInfo, SyncedList, System.Boolean, System.Boolean, System.Boolean, System.Byte, System.Boolean, System.Int64, System.String, System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>, System.Boolean, System.DateTimeOffset, System.Int32, System.Int32, System.Boolean, System.Boolean, System.Byte[], System.IO.MemoryStream, System.IO.MemoryStream, System.IO.Compression.DeflateStream, System.Boolean, ServerSync.ConfigSync/ParsedConfigs, BepInEx.Configuration.ConfigFile, System.Boolean, System.Collections.Generic.Dictionary`2/Enumerator<ServerSync.OwnConfigEntryBase,System.Object>, System.Collections.Generic.KeyValuePair`2<ServerSync.OwnConfigEntryBase,System.Object>, System.Boolean, System.Boolean, System.Boolean, System.Collections.Generic.Dictionary`2/Enumerator<ServerSync.CustomSyncedValueBase,System.Object>, System.Collections.Generic.KeyValuePair`2<ServerSync.CustomSyncedValueBase,System.Object>, System.Boolean, ServerSync.CustomSyncedValueBase, System.Boolean
IL_0000: nop
IL_0001: nop
IL_0002: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_0007: brfalse IL_004a
IL_000c: ldarg.0
IL_000d: call System.Boolean ServerSync.ConfigSync::get_IsLocked()
IL_0012: brfalse IL_004a
IL_0017: ldsfld ZRpc ServerSync.ConfigSync/SnatchCurrentlyHandlingRPC::currentRpc
IL_001c: dup
IL_001d: brtrue IL_0029
IL_0022: pop
IL_0023: ldnull
IL_0024: br IL_0040
IL_0029: call ISocket ZRpc::GetSocket()
IL_002e: dup
IL_002f: brtrue IL_003b
IL_0034: pop
IL_0035: ldnull
IL_0036: br IL_0040
IL_003b: callvirt System.String ISocket::GetHostName()
IL_0040: stloc.0
IL_0041: ldloc.0
IL_0042: ldnull
IL_0043: cgt.un
IL_0045: br IL_004b
IL_004a: ldc.i4.0
IL_004b: stloc.1
IL_004c: ldloc.1
IL_004d: brfalse IL_00d8
IL_0052: nop
IL_0053: ldtoken ZNet
IL_0058: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_005d: ldstr "ListContainsId"
IL_0062: ldnull
IL_0063: ldnull
IL_0064: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_0069: stloc.2
IL_006a: ldtoken ZNet
IL_006f: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0074: ldstr "m_adminList"
IL_0079: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_007e: call ZNet ZNet::get_instance()
IL_0083: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_0088: castclass SyncedList
IL_008d: stloc.3
IL_008e: ldloc.2
IL_008f: brfalse IL_00b7
IL_0094: ldloc.2
IL_0095: call ZNet ZNet::get_instance()
IL_009a: ldc.i4.2
IL_009b: newarr System.Object
IL_00a0: dup
IL_00a1: ldc.i4.0
IL_00a2: ldloc.3
IL_00a3: stelem.ref
IL_00a4: dup
IL_00a5: ldc.i4.1
IL_00a6: ldloc.0
IL_00a7: stelem.ref
IL_00a8: callvirt System.Object System.Reflection.MethodBase::Invoke(System.Object,System.Object[])
IL_00ad: unbox.any System.Boolean
IL_00b2: br IL_00be
IL_00b7: ldloc.3
IL_00b8: ldloc.0
IL_00b9: callvirt System.Boolean SyncedList::Contains(System.String)
IL_00be: stloc.s V_4
IL_00c0: ldloc.s V_4
IL_00c2: ldc.i4.0
IL_00c3: ceq
IL_00c5: stloc.s V_5
IL_00c7: ldloc.s V_5
IL_00c9: brfalse IL_00d7
IL_00ce: nop
IL_00cf: ldc.i4.0
IL_00d0: stloc.s V_6
IL_00d2: leave IL_04dd
IL_00d7: nop
IL_00d8: ldarg.0
IL_00d9: ldfld System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>> ServerSync.ConfigSync::cacheExpirations
IL_00de: ldarg.0
IL_00df: ldftn System.Boolean ServerSync.ConfigSync::<HandleConfigSyncRPC>b__47_0(System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>)
IL_00e5: newobj System.Void System.Predicate`1<System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>>::.ctor(System.Object,System.IntPtr)
IL_00ea: callvirt System.Int32 System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>>::RemoveAll(System.Predicate`1<!0>)
IL_00ef: pop
IL_00f0: ldarg.2
IL_00f1: callvirt System.Byte ZPackage::ReadByte()
IL_00f6: stloc.s V_7
IL_00f8: ldloc.s V_7
IL_00fa: ldc.i4.2
IL_00fb: and
IL_00fc: ldc.i4.0
IL_00fd: cgt.un
IL_00ff: stloc.s V_8
IL_0101: ldloc.s V_8
IL_0103: brfalse IL_021b
IL_0108: nop
IL_0109: ldarg.2
IL_010a: callvirt System.Int64 ZPackage::ReadLong()
IL_010f: stloc.s V_9
IL_0111: ldarga.s sender
IL_0113: call System.String System.Int64::ToString()
IL_0118: ldloca.s V_9
IL_011a: call System.String System.Int64::ToString()
IL_011f: call System.String System.String::Concat(System.String,System.String)
IL_0124: stloc.s V_10
IL_0126: ldarg.0
IL_0127: ldfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>> ServerSync.ConfigSync::configValueCache
IL_012c: ldloc.s V_10
IL_012e: ldloca.s V_11
IL_0130: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>>::TryGetValue(!0,!1&)
IL_0135: ldc.i4.0
IL_0136: ceq
IL_0138: stloc.s V_12
IL_013a: ldloc.s V_12
IL_013c: brfalse IL_018d
IL_0141: nop
IL_0142: newobj System.Void System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>::.ctor()
IL_0147: stloc.s V_11
IL_0149: ldarg.0
IL_014a: ldfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>> ServerSync.ConfigSync::configValueCache
IL_014f: ldloc.s V_10
IL_0151: ldloc.s V_11
IL_0153: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>>::set_Item(!0,!1)
IL_0158: nop
IL_0159: ldarg.0
IL_015a: ldfld System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>> ServerSync.ConfigSync::cacheExpirations
IL_015f: call System.DateTimeOffset System.DateTimeOffset::get_Now()
IL_0164: stloc.s V_13
IL_0166: ldloca.s V_13
IL_0168: ldc.r8 60
IL_0171: call System.DateTimeOffset System.DateTimeOffset::AddSeconds(System.Double)
IL_0176: stloc.s V_13
IL_0178: ldloca.s V_13
IL_017a: call System.Int64 System.DateTimeOffset::get_Ticks()
IL_017f: ldloc.s V_10
IL_0181: newobj System.Void System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>::.ctor(!0,!1)
IL_0186: callvirt System.Void System.Collections.Generic.List`1<System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>>::Add(!0)
IL_018b: nop
IL_018c: nop
IL_018d: ldarg.2
IL_018e: callvirt System.Int32 ZPackage::ReadInt()
IL_0193: stloc.s V_14
IL_0195: ldarg.2
IL_0196: callvirt System.Int32 ZPackage::ReadInt()
IL_019b: stloc.s V_15
IL_019d: ldloc.s V_11
IL_019f: ldloc.s V_14
IL_01a1: ldarg.2
IL_01a2: callvirt System.Byte[] ZPackage::ReadByteArray()
IL_01a7: callvirt System.Void System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>::Add(!0,!1)
IL_01ac: nop
IL_01ad: ldloc.s V_11
IL_01af: callvirt System.Int32 System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>::get_Count()
IL_01b4: ldloc.s V_15
IL_01b6: clt
IL_01b8: stloc.s V_16
IL_01ba: ldloc.s V_16
IL_01bc: brfalse IL_01ca
IL_01c1: nop
IL_01c2: ldc.i4.0
IL_01c3: stloc.s V_6
IL_01c5: leave IL_04dd
IL_01ca: ldarg.0
IL_01cb: ldfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>> ServerSync.ConfigSync::configValueCache
IL_01d0: ldloc.s V_10
IL_01d2: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>>::Remove(!0)
IL_01d7: pop
IL_01d8: ldloc.s V_11
IL_01da: callvirt System.Collections.Generic.SortedDictionary`2/ValueCollection<!0,!1> System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>::get_Values()
IL_01df: ldsfld System.Func`2<System.Byte[],System.Collections.Generic.IEnumerable`1<System.Byte>> ServerSync.ConfigSync/<>c::<>9__47_1
IL_01e4: dup
IL_01e5: brtrue IL_0201
IL_01ea: pop
IL_01eb: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_01f0: ldftn System.Collections.Generic.IEnumerable`1<System.Byte> ServerSync.ConfigSync/<>c::<HandleConfigSyncRPC>b__47_1(System.Byte[])
IL_01f6: newobj System.Void System.Func`2<System.Byte[],System.Collections.Generic.IEnumerable`1<System.Byte>>::.ctor(System.Object,System.IntPtr)
IL_01fb: dup
IL_01fc: stsfld System.Func`2<System.Byte[],System.Collections.Generic.IEnumerable`1<System.Byte>> ServerSync.ConfigSync/<>c::<>9__47_1
IL_0201: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::SelectMany<System.Byte[],System.Byte>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Collections.Generic.IEnumerable`1<!!1>>)
IL_0206: call !!0[] System.Linq.Enumerable::ToArray<System.Byte>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_020b: newobj System.Void ZPackage::.ctor(System.Byte[])
IL_0210: starg.s package
IL_0212: ldarg.2
IL_0213: callvirt System.Byte ZPackage::ReadByte()
IL_0218: stloc.s V_7
IL_021a: nop
IL_021b: ldc.i4.1
IL_021c: stsfld System.Boolean ServerSync.ConfigSync::ProcessingServerUpdate
IL_0221: ldloc.s V_7
IL_0223: ldc.i4.4
IL_0224: and
IL_0225: ldc.i4.0
IL_0226: cgt.un
IL_0228: stloc.s V_17
IL_022a: ldloc.s V_17
IL_022c: brfalse IL_028c
IL_0231: nop
IL_0232: ldarg.2
IL_0233: callvirt System.Byte[] ZPackage::ReadByteArray()
IL_0238: stloc.s V_18
IL_023a: ldloc.s V_18
IL_023c: newobj System.Void System.IO.MemoryStream::.ctor(System.Byte[])
IL_0241: stloc.s V_19
IL_0243: newobj System.Void System.IO.MemoryStream::.ctor()
IL_0248: stloc.s V_20
IL_024a: ldloc.s V_19
IL_024c: ldc.i4.0
IL_024d: newobj System.Void System.IO.Compression.DeflateStream::.ctor(System.IO.Stream,System.IO.Compression.CompressionMode)
IL_0252: stloc.s V_21
IL_0254: nop
IL_0255: ldloc.s V_21
IL_0257: ldloc.s V_20
IL_0259: callvirt System.Void System.IO.Stream::CopyTo(System.IO.Stream)
IL_025e: nop
IL_025f: nop
IL_0260: leave IL_0275
IL_0265: ldloc.s V_21
IL_0267: brfalse IL_0274
IL_026c: ldloc.s V_21
IL_026e: callvirt System.Void System.IDisposable::Dispose()
IL_0273: nop
IL_0274: endfinally
IL_0275: ldloc.s V_20
IL_0277: callvirt System.Byte[] System.IO.MemoryStream::ToArray()
IL_027c: newobj System.Void ZPackage::.ctor(System.Byte[])
IL_0281: starg.s package
IL_0283: ldarg.2
IL_0284: callvirt System.Byte ZPackage::ReadByte()
IL_0289: stloc.s V_7
IL_028b: nop
IL_028c: ldloc.s V_7
IL_028e: ldc.i4.1
IL_028f: and
IL_0290: ldc.i4.0
IL_0291: ceq
IL_0293: stloc.s V_22
IL_0295: ldloc.s V_22
IL_0297: brfalse IL_02a5
IL_029c: nop
IL_029d: ldarg.0
IL_029e: call System.Void ServerSync.ConfigSync::resetConfigsFromServer()
IL_02a3: nop
IL_02a4: nop
IL_02a5: ldarg.0
IL_02a6: ldarg.2
IL_02a7: call ServerSync.ConfigSync/ParsedConfigs ServerSync.ConfigSync::ReadConfigsFromPackage(ZPackage)
IL_02ac: stloc.s V_23
IL_02ae: ldnull
IL_02af: stloc.s V_24
IL_02b1: ldc.i4.0
IL_02b2: stloc.s V_25
IL_02b4: nop
IL_02b5: ldloc.s V_23
IL_02b7: ldfld System.Collections.Generic.Dictionary`2<ServerSync.OwnConfigEntryBase,System.Object> ServerSync.ConfigSync/ParsedConfigs::configValues
IL_02bc: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<ServerSync.OwnConfigEntryBase,System.Object>::GetEnumerator()
IL_02c1: stloc.s V_26
IL_02c3: br IL_0368
IL_02c8: ldloca.s V_26
IL_02ca: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<ServerSync.OwnConfigEntryBase,System.Object>::get_Current()
IL_02cf: stloc.s V_27
IL_02d1: nop
IL_02d2: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_02d7: brtrue IL_02f0
IL_02dc: ldloca.s V_27
IL_02de: call !0 System.Collections.Generic.KeyValuePair`2<ServerSync.OwnConfigEntryBase,System.Object>::get_Key()
IL_02e3: ldfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_02e8: ldnull
IL_02e9: ceq
IL_02eb: br IL_02f1
IL_02f0: ldc.i4.0
IL_02f1: stloc.s V_28
IL_02f3: ldloc.s V_28
IL_02f5: brfalse IL_0319
IL_02fa: nop
IL_02fb: ldloca.s V_27
IL_02fd: call !0 System.Collections.Generic.KeyValuePair`2<ServerSync.OwnConfigEntryBase,System.Object>::get_Key()
IL_0302: ldloca.s V_27
IL_0304: call !0 System.Collections.Generic.KeyValuePair`2<ServerSync.OwnConfigEntryBase,System.Object>::get_Key()
IL_0309: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_030e: callvirt System.Object BepInEx.Configuration.ConfigEntryBase::get_BoxedValue()
IL_0313: stfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_0318: nop
IL_0319: ldloc.s V_24
IL_031b: ldnull
IL_031c: ceq
IL_031e: stloc.s V_29
IL_0320: ldloc.s V_29
IL_0322: brfalse IL_034e
IL_0327: nop
IL_0328: ldloca.s V_27
IL_032a: call !0 System.Collections.Generic.KeyValuePair`2<ServerSync.OwnConfigEntryBase,System.Object>::get_Key()
IL_032f: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_0334: callvirt BepInEx.Configuration.ConfigFile BepInEx.Configuration.ConfigEntryBase::get_ConfigFile()
IL_0339: stloc.s V_24
IL_033b: ldloc.s V_24
IL_033d: callvirt System.Boolean BepInEx.Configuration.ConfigFile::get_SaveOnConfigSet()
IL_0342: stloc.s V_25
IL_0344: ldloc.s V_24
IL_0346: ldc.i4.0
IL_0347: callvirt System.Void BepInEx.Configuration.ConfigFile::set_SaveOnConfigSet(System.Boolean)
IL_034c: nop
IL_034d: nop
IL_034e: ldloca.s V_27
IL_0350: call !0 System.Collections.Generic.KeyValuePair`2<ServerSync.OwnConfigEntryBase,System.Object>::get_Key()
IL_0355: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_035a: ldloca.s V_27
IL_035c: call !1 System.Collections.Generic.KeyValuePair`2<ServerSync.OwnConfigEntryBase,System.Object>::get_Value()
IL_0361: callvirt System.Void BepInEx.Configuration.ConfigEntryBase::set_BoxedValue(System.Object)
IL_0366: nop
IL_0367: nop
IL_0368: ldloca.s V_26
IL_036a: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<ServerSync.OwnConfigEntryBase,System.Object>::MoveNext()
IL_036f: brtrue IL_02c8
IL_0374: leave IL_0388
IL_0379: ldloca.s V_26
IL_037b: constrained. System.Collections.Generic.Dictionary`2/Enumerator<ServerSync.OwnConfigEntryBase,System.Object>
IL_0381: callvirt System.Void System.IDisposable::Dispose()
IL_0386: nop
IL_0387: endfinally
IL_0388: ldloc.s V_24
IL_038a: ldnull
IL_038b: cgt.un
IL_038d: stloc.s V_30
IL_038f: ldloc.s V_30
IL_0391: brfalse IL_03aa
IL_0396: nop
IL_0397: ldloc.s V_24
IL_0399: ldloc.s V_25
IL_039b: callvirt System.Void BepInEx.Configuration.ConfigFile::set_SaveOnConfigSet(System.Boolean)
IL_03a0: nop
IL_03a1: ldloc.s V_24
IL_03a3: callvirt System.Void BepInEx.Configuration.ConfigFile::Save()
IL_03a8: nop
IL_03a9: nop
IL_03aa: nop
IL_03ab: ldloc.s V_23
IL_03ad: ldfld System.Collections.Generic.Dictionary`2<ServerSync.CustomSyncedValueBase,System.Object> ServerSync.ConfigSync/ParsedConfigs::customValues
IL_03b2: callvirt System.Collections.Generic.Dictionary`2/Enumerator<!0,!1> System.Collections.Generic.Dictionary`2<ServerSync.CustomSyncedValueBase,System.Object>::GetEnumerator()
IL_03b7: stloc.s V_31
IL_03b9: br IL_0418
IL_03be: ldloca.s V_31
IL_03c0: call System.Collections.Generic.KeyValuePair`2<!0,!1> System.Collections.Generic.Dictionary`2/Enumerator<ServerSync.CustomSyncedValueBase,System.Object>::get_Current()
IL_03c5: stloc.s V_32
IL_03c7: nop
IL_03c8: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_03cd: ldc.i4.0
IL_03ce: ceq
IL_03d0: stloc.s V_33
IL_03d2: ldloc.s V_33
IL_03d4: brfalse IL_0403
IL_03d9: nop
IL_03da: ldloca.s V_32
IL_03dc: call !0 System.Collections.Generic.KeyValuePair`2<ServerSync.CustomSyncedValueBase,System.Object>::get_Key()
IL_03e1: stloc.s V_34
IL_03e3: ldloc.s V_34
IL_03e5: ldfld System.Object ServerSync.CustomSyncedValueBase::LocalBaseValue
IL_03ea: brtrue IL_0402
IL_03ef: ldloc.s V_34
IL_03f1: ldloca.s V_32
IL_03f3: call !0 System.Collections.Generic.KeyValuePair`2<ServerSync.CustomSyncedValueBase,System.Object>::get_Key()
IL_03f8: callvirt System.Object ServerSync.CustomSyncedValueBase::get_BoxedValue()
IL_03fd: stfld System.Object ServerSync.CustomSyncedValueBase::LocalBaseValue
IL_0402: nop
IL_0403: ldloca.s V_32
IL_0405: call !0 System.Collections.Generic.KeyValuePair`2<ServerSync.CustomSyncedValueBase,System.Object>::get_Key()
IL_040a: ldloca.s V_32
IL_040c: call !1 System.Collections.Generic.KeyValuePair`2<ServerSync.CustomSyncedValueBase,System.Object>::get_Value()
IL_0411: callvirt System.Void ServerSync.CustomSyncedValueBase::set_BoxedValue(System.Object)
IL_0416: nop
IL_0417: nop
IL_0418: ldloca.s V_31
IL_041a: call System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<ServerSync.CustomSyncedValueBase,System.Object>::MoveNext()
IL_041f: brtrue.s IL_03be
IL_0421: leave IL_0435
IL_0426: ldloca.s V_31
IL_0428: constrained. System.Collections.Generic.Dictionary`2/Enumerator<ServerSync.CustomSyncedValueBase,System.Object>
IL_042e: callvirt System.Void System.IDisposable::Dispose()
IL_0433: nop
IL_0434: endfinally
IL_0435: ldstr "Received {0} configs and {1} custom values from {2} for mod {3}"
IL_043a: ldc.i4.4
IL_043b: newarr System.Object
IL_0440: dup
IL_0441: ldc.i4.0
IL_0442: ldloc.s V_23
IL_0444: ldfld System.Collections.Generic.Dictionary`2<ServerSync.OwnConfigEntryBase,System.Object> ServerSync.ConfigSync/ParsedConfigs::configValues
IL_0449: callvirt System.Int32 System.Collections.Generic.Dictionary`2<ServerSync.OwnConfigEntryBase,System.Object>::get_Count()
IL_044e: box System.Int32
IL_0453: stelem.ref
IL_0454: dup
IL_0455: ldc.i4.1
IL_0456: ldloc.s V_23
IL_0458: ldfld System.Collections.Generic.Dictionary`2<ServerSync.CustomSyncedValueBase,System.Object> ServerSync.ConfigSync/ParsedConfigs::customValues
IL_045d: callvirt System.Int32 System.Collections.Generic.Dictionary`2<ServerSync.CustomSyncedValueBase,System.Object>::get_Count()
IL_0462: box System.Int32
IL_0467: stelem.ref
IL_0468: dup
IL_0469: ldc.i4.2
IL_046a: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_046f: ldarg.3
IL_0470: or
IL_0471: brtrue IL_0480
IL_0476: ldstr "the server"
IL_047b: br IL_0490
IL_0480: ldstr "client {0}"
IL_0485: ldarg.1
IL_0486: box System.Int64
IL_048b: call System.String System.String::Format(System.String,System.Object)
IL_0490: stelem.ref
IL_0491: dup
IL_0492: ldc.i4.3
IL_0493: ldarg.0
IL_0494: ldfld System.String ServerSync.ConfigSync::DisplayName
IL_0499: dup
IL_049a: brtrue IL_04a6
IL_049f: pop
IL_04a0: ldarg.0
IL_04a1: ldfld System.String ServerSync.ConfigSync::Name
IL_04a6: stelem.ref
IL_04a7: call System.String System.String::Format(System.String,System.Object[])
IL_04ac: call System.Void UnityEngine.Debug::Log(System.Object)
IL_04b1: nop
IL_04b2: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_04b7: ldc.i4.0
IL_04b8: ceq
IL_04ba: stloc.s V_35
IL_04bc: ldloc.s V_35
IL_04be: brfalse IL_04cc
IL_04c3: nop
IL_04c4: ldarg.0
IL_04c5: call System.Void ServerSync.ConfigSync::serverLockedSettingChanged()
IL_04ca: nop
IL_04cb: nop
IL_04cc: ldc.i4.1
IL_04cd: stloc.s V_6
IL_04cf: leave IL_04dd
IL_04d4: nop
IL_04d5: ldc.i4.0
IL_04d6: stsfld System.Boolean ServerSync.ConfigSync::ProcessingServerUpdate
IL_04db: nop
IL_04dc: endfinally
IL_04dd: ldloc.s V_6
IL_04df: ret
// EH Finally: 596 - 613 => 613 - 629
// EH Finally: 707 - 889 => 889 - 904
// EH Finally: 953 - 1062 => 1062 - 1077
// EH Finally: 1 - 1236 => 1236 - 1245

// ServerSync.ConfigSync/ParsedConfigs ServerSync.ConfigSync::ReadConfigsFromPackage(ZPackage)
.locals ServerSync.ConfigSync/ParsedConfigs, System.Collections.Generic.Dictionary`2<System.String,ServerSync.OwnConfigEntryBase>, System.Collections.Generic.Dictionary`2<System.String,ServerSync.CustomSyncedValueBase>, System.Int32, System.Int32, System.String, System.String, System.String, System.Type, System.Boolean, System.Object, ServerSync.ConfigSync/InvalidDeserializationTypeException, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, ServerSync.CustomSyncedValueBase, System.Boolean, System.Boolean, ServerSync.OwnConfigEntryBase, System.Boolean, System.Type, System.Boolean, ServerSync.ConfigSync/ParsedConfigs, System.Boolean
IL_0000: nop
IL_0001: newobj System.Void ServerSync.ConfigSync/ParsedConfigs::.ctor()
IL_0006: stloc.0
IL_0007: ldarg.0
IL_0008: ldfld System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase> ServerSync.ConfigSync::allConfigs
IL_000d: ldsfld System.Func`2<ServerSync.OwnConfigEntryBase,System.Boolean> ServerSync.ConfigSync/<>c::<>9__49_0
IL_0012: dup
IL_0013: brtrue IL_002f
IL_0018: pop
IL_0019: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_001e: ldftn System.Boolean ServerSync.ConfigSync/<>c::<ReadConfigsFromPackage>b__49_0(ServerSync.OwnConfigEntryBase)
IL_0024: newobj System.Void System.Func`2<ServerSync.OwnConfigEntryBase,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0029: dup
IL_002a: stsfld System.Func`2<ServerSync.OwnConfigEntryBase,System.Boolean> ServerSync.ConfigSync/<>c::<>9__49_0
IL_002f: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ServerSync.OwnConfigEntryBase>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0034: ldsfld System.Func`2<ServerSync.OwnConfigEntryBase,System.String> ServerSync.ConfigSync/<>c::<>9__49_1
IL_0039: dup
IL_003a: brtrue IL_0056
IL_003f: pop
IL_0040: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_0045: ldftn System.String ServerSync.ConfigSync/<>c::<ReadConfigsFromPackage>b__49_1(ServerSync.OwnConfigEntryBase)
IL_004b: newobj System.Void System.Func`2<ServerSync.OwnConfigEntryBase,System.String>::.ctor(System.Object,System.IntPtr)
IL_0050: dup
IL_0051: stsfld System.Func`2<ServerSync.OwnConfigEntryBase,System.String> ServerSync.ConfigSync/<>c::<>9__49_1
IL_0056: ldsfld System.Func`2<ServerSync.OwnConfigEntryBase,ServerSync.OwnConfigEntryBase> ServerSync.ConfigSync/<>c::<>9__49_2
IL_005b: dup
IL_005c: brtrue IL_0078
IL_0061: pop
IL_0062: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_0067: ldftn ServerSync.OwnConfigEntryBase ServerSync.ConfigSync/<>c::<ReadConfigsFromPackage>b__49_2(ServerSync.OwnConfigEntryBase)
IL_006d: newobj System.Void System.Func`2<ServerSync.OwnConfigEntryBase,ServerSync.OwnConfigEntryBase>::.ctor(System.Object,System.IntPtr)
IL_0072: dup
IL_0073: stsfld System.Func`2<ServerSync.OwnConfigEntryBase,ServerSync.OwnConfigEntryBase> ServerSync.ConfigSync/<>c::<>9__49_2
IL_0078: call System.Collections.Generic.Dictionary`2<!!1,!!2> System.Linq.Enumerable::ToDictionary<ServerSync.OwnConfigEntryBase,System.String,ServerSync.OwnConfigEntryBase>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>,System.Func`2<!!0,!!2>)
IL_007d: stloc.1
IL_007e: ldarg.0
IL_007f: ldfld System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync::allCustomValues
IL_0084: ldsfld System.Func`2<ServerSync.CustomSyncedValueBase,System.String> ServerSync.ConfigSync/<>c::<>9__49_3
IL_0089: dup
IL_008a: brtrue IL_00a6
IL_008f: pop
IL_0090: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_0095: ldftn System.String ServerSync.ConfigSync/<>c::<ReadConfigsFromPackage>b__49_3(ServerSync.CustomSyncedValueBase)
IL_009b: newobj System.Void System.Func`2<ServerSync.CustomSyncedValueBase,System.String>::.ctor(System.Object,System.IntPtr)
IL_00a0: dup
IL_00a1: stsfld System.Func`2<ServerSync.CustomSyncedValueBase,System.String> ServerSync.ConfigSync/<>c::<>9__49_3
IL_00a6: ldsfld System.Func`2<ServerSync.CustomSyncedValueBase,ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync/<>c::<>9__49_4
IL_00ab: dup
IL_00ac: brtrue IL_00c8
IL_00b1: pop
IL_00b2: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_00b7: ldftn ServerSync.CustomSyncedValueBase ServerSync.ConfigSync/<>c::<ReadConfigsFromPackage>b__49_4(ServerSync.CustomSyncedValueBase)
IL_00bd: newobj System.Void System.Func`2<ServerSync.CustomSyncedValueBase,ServerSync.CustomSyncedValueBase>::.ctor(System.Object,System.IntPtr)
IL_00c2: dup
IL_00c3: stsfld System.Func`2<ServerSync.CustomSyncedValueBase,ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync/<>c::<>9__49_4
IL_00c8: call System.Collections.Generic.Dictionary`2<!!1,!!2> System.Linq.Enumerable::ToDictionary<ServerSync.CustomSyncedValueBase,System.String,ServerSync.CustomSyncedValueBase>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>,System.Func`2<!!0,!!2>)
IL_00cd: stloc.2
IL_00ce: ldarg.1
IL_00cf: callvirt System.Int32 ZPackage::ReadInt()
IL_00d4: stloc.3
IL_00d5: ldc.i4.0
IL_00d6: stloc.s V_4
IL_00d8: br IL_054d
IL_00dd: nop
IL_00de: ldarg.1
IL_00df: callvirt System.String ZPackage::ReadString()
IL_00e4: stloc.s V_5
IL_00e6: ldarg.1
IL_00e7: callvirt System.String ZPackage::ReadString()
IL_00ec: stloc.s V_6
IL_00ee: ldarg.1
IL_00ef: callvirt System.String ZPackage::ReadString()
IL_00f4: stloc.s V_7
IL_00f6: ldloc.s V_7
IL_00f8: call System.Type System.Type::GetType(System.String)
IL_00fd: stloc.s V_8
IL_00ff: ldloc.s V_7
IL_0101: ldstr ""
IL_0106: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_010b: brtrue IL_011d
IL_0110: ldloc.s V_8
IL_0112: ldnull
IL_0113: call System.Boolean System.Type::op_Inequality(System.Type,System.Type)
IL_0118: br IL_011e
IL_011d: ldc.i4.1
IL_011e: stloc.s V_9
IL_0120: ldloc.s V_9
IL_0122: brfalse IL_0522
IL_0127: nop
IL_0128: nop
IL_0129: ldloc.s V_7
IL_012b: ldstr ""
IL_0130: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0135: brtrue IL_0147
IL_013a: ldarg.1
IL_013b: ldloc.s V_8
IL_013d: call System.Object ServerSync.ConfigSync::ReadValueWithTypeFromZPackage(ZPackage,System.Type)
IL_0142: br IL_0148
IL_0147: ldnull
IL_0148: stloc.s V_10
IL_014a: nop
IL_014b: leave IL_01ea
IL_0150: stloc.s V_11
IL_0152: nop
IL_0153: ldc.i4.s 14
IL_0155: newarr System.String
IL_015a: dup
IL_015b: ldc.i4.0
IL_015c: ldstr "Got unexpected struct internal type "
IL_0161: stelem.ref
IL_0162: dup
IL_0163: ldc.i4.1
IL_0164: ldloc.s V_11
IL_0166: ldfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::received
IL_016b: stelem.ref
IL_016c: dup
IL_016d: ldc.i4.2
IL_016e: ldstr " for field "
IL_0173: stelem.ref
IL_0174: dup
IL_0175: ldc.i4.3
IL_0176: ldloc.s V_11
IL_0178: ldfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::field
IL_017d: stelem.ref
IL_017e: dup
IL_017f: ldc.i4.4
IL_0180: ldstr " struct "
IL_0185: stelem.ref
IL_0186: dup
IL_0187: ldc.i4.5
IL_0188: ldloc.s V_7
IL_018a: stelem.ref
IL_018b: dup
IL_018c: ldc.i4.6
IL_018d: ldstr " for "
IL_0192: stelem.ref
IL_0193: dup
IL_0194: ldc.i4.7
IL_0195: ldloc.s V_6
IL_0197: stelem.ref
IL_0198: dup
IL_0199: ldc.i4.8
IL_019a: ldstr " in section "
IL_019f: stelem.ref
IL_01a0: dup
IL_01a1: ldc.i4.s 9
IL_01a3: ldloc.s V_5
IL_01a5: stelem.ref
IL_01a6: dup
IL_01a7: ldc.i4.s 10
IL_01a9: ldstr " for mod "
IL_01ae: stelem.ref
IL_01af: dup
IL_01b0: ldc.i4.s 11
IL_01b2: ldarg.0
IL_01b3: ldfld System.String ServerSync.ConfigSync::DisplayName
IL_01b8: dup
IL_01b9: brtrue IL_01c5
IL_01be: pop
IL_01bf: ldarg.0
IL_01c0: ldfld System.String ServerSync.ConfigSync::Name
IL_01c5: stelem.ref
IL_01c6: dup
IL_01c7: ldc.i4.s 12
IL_01c9: ldstr ", expecting "
IL_01ce: stelem.ref
IL_01cf: dup
IL_01d0: ldc.i4.s 13
IL_01d2: ldloc.s V_11
IL_01d4: ldfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::expected
IL_01d9: stelem.ref
IL_01da: call System.String System.String::Concat(System.String[])
IL_01df: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_01e4: nop
IL_01e5: leave IL_0547
IL_01ea: ldloc.s V_5
IL_01ec: ldstr "Internal"
IL_01f1: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_01f6: stloc.s V_12
IL_01f8: ldloc.s V_12
IL_01fa: brfalse IL_03c6
IL_01ff: nop
IL_0200: ldloc.s V_6
IL_0202: ldstr "serverversion"
IL_0207: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_020c: stloc.s V_13
IL_020e: ldloc.s V_13
IL_0210: brfalse IL_028d
IL_0215: nop
IL_0216: ldloc.s V_10
IL_0218: brtrue IL_0223
IL_021d: ldnull
IL_021e: br IL_022a
IL_0223: ldloc.s V_10
IL_0225: callvirt System.String System.Object::ToString()
IL_022a: ldarg.0
IL_022b: ldfld System.String ServerSync.ConfigSync::CurrentVersion
IL_0230: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_0235: stloc.s V_14
IL_0237: ldloc.s V_14
IL_0239: brfalse IL_0287
IL_023e: nop
IL_023f: ldstr "Received server version is not equal: server version = "
IL_0244: ldloc.s V_10
IL_0246: brtrue IL_0251
IL_024b: ldnull
IL_024c: br IL_0258
IL_0251: ldloc.s V_10
IL_0253: callvirt System.String System.Object::ToString()
IL_0258: dup
IL_0259: brtrue IL_0264
IL_025e: pop
IL_025f: ldstr "null"
IL_0264: ldstr "; local version = "
IL_0269: ldarg.0
IL_026a: ldfld System.String ServerSync.ConfigSync::CurrentVersion
IL_026f: dup
IL_0270: brtrue IL_027b
IL_0275: pop
IL_0276: ldstr "unknown"
IL_027b: call System.String System.String::Concat(System.String,System.String,System.String,System.String)
IL_0280: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_0285: nop
IL_0286: nop
IL_0287: nop
IL_0288: br IL_03c0
IL_028d: ldloc.s V_6
IL_028f: ldstr "lockexempt"
IL_0294: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0299: stloc.s V_15
IL_029b: ldloc.s V_15
IL_029d: brfalse IL_02d7
IL_02a2: nop
IL_02a3: ldloc.s V_10
IL_02a5: isinst System.Boolean
IL_02aa: brfalse IL_02be
IL_02af: ldloc.s V_10
IL_02b1: unbox.any System.Boolean
IL_02b6: stloc.s V_16
IL_02b8: ldc.i4.1
IL_02b9: br IL_02bf
IL_02be: ldc.i4.0
IL_02bf: stloc.s V_17
IL_02c1: ldloc.s V_17
IL_02c3: brfalse IL_02d1
IL_02c8: nop
IL_02c9: ldloc.s V_16
IL_02cb: stsfld System.Boolean ServerSync.ConfigSync::lockExempt
IL_02d0: nop
IL_02d1: nop
IL_02d2: br IL_03c0
IL_02d7: ldloc.2
IL_02d8: ldloc.s V_6
IL_02da: ldloca.s V_18
IL_02dc: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,ServerSync.CustomSyncedValueBase>::TryGetValue(!0,!1&)
IL_02e1: stloc.s V_19
IL_02e3: ldloc.s V_19
IL_02e5: brfalse IL_03c0
IL_02ea: nop
IL_02eb: ldloc.s V_7
IL_02ed: ldstr ""
IL_02f2: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_02f7: brfalse IL_0324
IL_02fc: ldloc.s V_18
IL_02fe: ldfld System.Type ServerSync.CustomSyncedValueBase::Type
IL_0303: callvirt System.Boolean System.Type::get_IsValueType()
IL_0308: brfalse IL_033c
IL_030d: ldloc.s V_18
IL_030f: ldfld System.Type ServerSync.CustomSyncedValueBase::Type
IL_0314: call System.Type System.Nullable::GetUnderlyingType(System.Type)
IL_0319: ldnull
IL_031a: call System.Boolean System.Type::op_Inequality(System.Type,System.Type)
IL_031f: brtrue IL_033c
IL_0324: ldloc.s V_18
IL_0326: ldfld System.Type ServerSync.CustomSyncedValueBase::Type
IL_032b: call System.String ServerSync.ConfigSync::GetZPackageTypeString(System.Type)
IL_0330: ldloc.s V_7
IL_0332: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0337: br IL_033d
IL_033c: ldc.i4.1
IL_033d: stloc.s V_20
IL_033f: ldloc.s V_20
IL_0341: brfalse IL_035d
IL_0346: nop
IL_0347: ldloc.0
IL_0348: ldfld System.Collections.Generic.Dictionary`2<ServerSync.CustomSyncedValueBase,System.Object> ServerSync.ConfigSync/ParsedConfigs::customValues
IL_034d: ldloc.s V_18
IL_034f: ldloc.s V_10
IL_0351: callvirt System.Void System.Collections.Generic.Dictionary`2<ServerSync.CustomSyncedValueBase,System.Object>::set_Item(!0,!1)
IL_0356: nop
IL_0357: nop
IL_0358: br IL_03bf
IL_035d: nop
IL_035e: ldc.i4.8
IL_035f: newarr System.String
IL_0364: dup
IL_0365: ldc.i4.0
IL_0366: ldstr "Got unexpected type "
IL_036b: stelem.ref
IL_036c: dup
IL_036d: ldc.i4.1
IL_036e: ldloc.s V_7
IL_0370: stelem.ref
IL_0371: dup
IL_0372: ldc.i4.2
IL_0373: ldstr " for internal value "
IL_0378: stelem.ref
IL_0379: dup
IL_037a: ldc.i4.3
IL_037b: ldloc.s V_6
IL_037d: stelem.ref
IL_037e: dup
IL_037f: ldc.i4.4
IL_0380: ldstr " for mod "
IL_0385: stelem.ref
IL_0386: dup
IL_0387: ldc.i4.5
IL_0388: ldarg.0
IL_0389: ldfld System.String ServerSync.ConfigSync::DisplayName
IL_038e: dup
IL_038f: brtrue IL_039b
IL_0394: pop
IL_0395: ldarg.0
IL_0396: ldfld System.String ServerSync.ConfigSync::Name
IL_039b: stelem.ref
IL_039c: dup
IL_039d: ldc.i4.6
IL_039e: ldstr ", expecting "
IL_03a3: stelem.ref
IL_03a4: dup
IL_03a5: ldc.i4.7
IL_03a6: ldloc.s V_18
IL_03a8: ldfld System.Type ServerSync.CustomSyncedValueBase::Type
IL_03ad: callvirt System.String System.Type::get_AssemblyQualifiedName()
IL_03b2: stelem.ref
IL_03b3: call System.String System.String::Concat(System.String[])
IL_03b8: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_03bd: nop
IL_03be: nop
IL_03bf: nop
IL_03c0: nop
IL_03c1: br IL_051c
IL_03c6: ldloc.1
IL_03c7: ldloc.s V_5
IL_03c9: ldstr "_"
IL_03ce: ldloc.s V_6
IL_03d0: call System.String System.String::Concat(System.String,System.String,System.String)
IL_03d5: ldloca.s V_21
IL_03d7: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,ServerSync.OwnConfigEntryBase>::TryGetValue(!0,!1&)
IL_03dc: stloc.s V_22
IL_03de: ldloc.s V_22
IL_03e0: brfalse IL_04c9
IL_03e5: nop
IL_03e6: ldloc.s V_21
IL_03e8: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_03ed: call System.Type ServerSync.ConfigSync::configType(BepInEx.Configuration.ConfigEntryBase)
IL_03f2: stloc.s V_23
IL_03f4: ldloc.s V_7
IL_03f6: ldstr ""
IL_03fb: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0400: brfalse IL_0423
IL_0405: ldloc.s V_23
IL_0407: callvirt System.Boolean System.Type::get_IsValueType()
IL_040c: brfalse IL_0436
IL_0411: ldloc.s V_23
IL_0413: call System.Type System.Nullable::GetUnderlyingType(System.Type)
IL_0418: ldnull
IL_0419: call System.Boolean System.Type::op_Inequality(System.Type,System.Type)
IL_041e: brtrue IL_0436
IL_0423: ldloc.s V_23
IL_0425: call System.String ServerSync.ConfigSync::GetZPackageTypeString(System.Type)
IL_042a: ldloc.s V_7
IL_042c: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0431: br IL_0437
IL_0436: ldc.i4.1
IL_0437: stloc.s V_24
IL_0439: ldloc.s V_24
IL_043b: brfalse IL_0457
IL_0440: nop
IL_0441: ldloc.0
IL_0442: ldfld System.Collections.Generic.Dictionary`2<ServerSync.OwnConfigEntryBase,System.Object> ServerSync.ConfigSync/ParsedConfigs::configValues
IL_0447: ldloc.s V_21
IL_0449: ldloc.s V_10
IL_044b: callvirt System.Void System.Collections.Generic.Dictionary`2<ServerSync.OwnConfigEntryBase,System.Object>::set_Item(!0,!1)
IL_0450: nop
IL_0451: nop
IL_0452: br IL_04c3
IL_0457: nop
IL_0458: ldc.i4.s 10
IL_045a: newarr System.String
IL_045f: dup
IL_0460: ldc.i4.0
IL_0461: ldstr "Got unexpected type "
IL_0466: stelem.ref
IL_0467: dup
IL_0468: ldc.i4.1
IL_0469: ldloc.s V_7
IL_046b: stelem.ref
IL_046c: dup
IL_046d: ldc.i4.2
IL_046e: ldstr " for "
IL_0473: stelem.ref
IL_0474: dup
IL_0475: ldc.i4.3
IL_0476: ldloc.s V_6
IL_0478: stelem.ref
IL_0479: dup
IL_047a: ldc.i4.4
IL_047b: ldstr " in section "
IL_0480: stelem.ref
IL_0481: dup
IL_0482: ldc.i4.5
IL_0483: ldloc.s V_5
IL_0485: stelem.ref
IL_0486: dup
IL_0487: ldc.i4.6
IL_0488: ldstr " for mod "
IL_048d: stelem.ref
IL_048e: dup
IL_048f: ldc.i4.7
IL_0490: ldarg.0
IL_0491: ldfld System.String ServerSync.ConfigSync::DisplayName
IL_0496: dup
IL_0497: brtrue IL_04a3
IL_049c: pop
IL_049d: ldarg.0
IL_049e: ldfld System.String ServerSync.ConfigSync::Name
IL_04a3: stelem.ref
IL_04a4: dup
IL_04a5: ldc.i4.8
IL_04a6: ldstr ", expecting "
IL_04ab: stelem.ref
IL_04ac: dup
IL_04ad: ldc.i4.s 9
IL_04af: ldloc.s V_23
IL_04b1: callvirt System.String System.Type::get_AssemblyQualifiedName()
IL_04b6: stelem.ref
IL_04b7: call System.String System.String::Concat(System.String[])
IL_04bc: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_04c1: nop
IL_04c2: nop
IL_04c3: nop
IL_04c4: br IL_051c
IL_04c9: nop
IL_04ca: ldc.i4.7
IL_04cb: newarr System.String
IL_04d0: dup
IL_04d1: ldc.i4.0
IL_04d2: ldstr "Received unknown config entry "
IL_04d7: stelem.ref
IL_04d8: dup
IL_04d9: ldc.i4.1
IL_04da: ldloc.s V_6
IL_04dc: stelem.ref
IL_04dd: dup
IL_04de: ldc.i4.2
IL_04df: ldstr " in section "
IL_04e4: stelem.ref
IL_04e5: dup
IL_04e6: ldc.i4.3
IL_04e7: ldloc.s V_5
IL_04e9: stelem.ref
IL_04ea: dup
IL_04eb: ldc.i4.4
IL_04ec: ldstr " for mod "
IL_04f1: stelem.ref
IL_04f2: dup
IL_04f3: ldc.i4.5
IL_04f4: ldarg.0
IL_04f5: ldfld System.String ServerSync.ConfigSync::DisplayName
IL_04fa: dup
IL_04fb: brtrue IL_0507
IL_0500: pop
IL_0501: ldarg.0
IL_0502: ldfld System.String ServerSync.ConfigSync::Name
IL_0507: stelem.ref
IL_0508: dup
IL_0509: ldc.i4.6
IL_050a: ldstr ". This may happen if client and server versions of the mod do not match."
IL_050f: stelem.ref
IL_0510: call System.String System.String::Concat(System.String[])
IL_0515: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_051a: nop
IL_051b: nop
IL_051c: nop
IL_051d: br IL_0546
IL_0522: nop
IL_0523: ldstr "Got invalid type "
IL_0528: ldloc.s V_7
IL_052a: ldstr ", abort reading of received configs"
IL_052f: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0534: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_0539: nop
IL_053a: newobj System.Void ServerSync.ConfigSync/ParsedConfigs::.ctor()
IL_053f: stloc.s V_25
IL_0541: br IL_0563
IL_0546: nop
IL_0547: ldloc.s V_4
IL_0549: ldc.i4.1
IL_054a: add
IL_054b: stloc.s V_4
IL_054d: ldloc.s V_4
IL_054f: ldloc.3
IL_0550: clt
IL_0552: stloc.s V_26
IL_0554: ldloc.s V_26
IL_0556: brtrue IL_00dd
IL_055b: ldloc.0
IL_055c: stloc.s V_25
IL_055e: br IL_0563
IL_0563: ldloc.s V_25
IL_0565: ret
// EH Catch: 296 - 336 => 336 - 490

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
IL_002e: brfalse IL_003b
IL_0033: nop
IL_0034: ldc.i4.1
IL_0035: stloc.3
IL_0036: br IL_009f
IL_003b: ldloc.1
IL_003c: callvirt System.Boolean ServerSync.ConfigSync::get_IsSourceOfTruth()
IL_0041: brtrue IL_0098
IL_0046: ldloc.0
IL_0047: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync/<>c__DisplayClass51_0::config
IL_004c: ldfld System.Boolean ServerSync.OwnConfigEntryBase::SynchronizedConfig
IL_0051: brfalse IL_0098
IL_0056: ldloc.0
IL_0057: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync/<>c__DisplayClass51_0::config
IL_005c: ldfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_0061: brfalse IL_0098
IL_0066: ldloc.1
IL_0067: callvirt System.Boolean ServerSync.ConfigSync::get_IsLocked()
IL_006c: brtrue IL_0092
IL_0071: ldloc.0
IL_0072: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync/<>c__DisplayClass51_0::config
IL_0077: ldloc.1
IL_0078: ldfld ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::lockedConfig
IL_007d: bne.un IL_008c
IL_0082: ldsfld System.Boolean ServerSync.ConfigSync::lockExempt
IL_0087: br IL_008d
IL_008c: ldc.i4.1
IL_008d: br IL_0093
IL_0092: ldc.i4.0
IL_0093: br IL_0099
IL_0098: ldc.i4.1
IL_0099: stloc.3
IL_009a: br IL_009f
IL_009f: ldloc.3
IL_00a0: ret

// System.Void ServerSync.ConfigSync::serverLockedSettingChanged()
.locals System.Collections.Generic.HashSet`1/Enumerator<ServerSync.OwnConfigEntryBase>, ServerSync.OwnConfigEntryBase
IL_0000: nop
IL_0001: nop
IL_0002: ldarg.0
IL_0003: ldfld System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase> ServerSync.ConfigSync::allConfigs
IL_0008: callvirt System.Collections.Generic.HashSet`1/Enumerator<!0> System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase>::GetEnumerator()
IL_000d: stloc.0
IL_000e: br IL_003b
IL_0013: ldloca.s V_0
IL_0015: call !0 System.Collections.Generic.HashSet`1/Enumerator<ServerSync.OwnConfigEntryBase>::get_Current()
IL_001a: stloc.1
IL_001b: nop
IL_001c: ldloc.1
IL_001d: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_0022: call T ServerSync.ConfigSync::configAttribute<ServerSync.ConfigurationManagerAttributes>(BepInEx.Configuration.ConfigEntryBase)
IL_0027: ldloc.1
IL_0028: call System.Boolean ServerSync.ConfigSync::isWritableConfig(ServerSync.OwnConfigEntryBase)
IL_002d: ldc.i4.0
IL_002e: ceq
IL_0030: newobj System.Void System.Nullable`1<System.Boolean>::.ctor(!0)
IL_0035: stfld System.Nullable`1<System.Boolean> ServerSync.ConfigurationManagerAttributes::ReadOnly
IL_003a: nop
IL_003b: ldloca.s V_0
IL_003d: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<ServerSync.OwnConfigEntryBase>::MoveNext()
IL_0042: brtrue.s IL_0013
IL_0044: leave IL_0058
IL_0049: ldloca.s V_0
IL_004b: constrained. System.Collections.Generic.HashSet`1/Enumerator<ServerSync.OwnConfigEntryBase>
IL_0051: callvirt System.Void System.IDisposable::Dispose()
IL_0056: nop
IL_0057: endfinally
IL_0058: ret
// EH Finally: 14 - 73 => 73 - 88

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
IL_0012: brtrue IL_002e
IL_0017: pop
IL_0018: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_001d: ldftn System.Boolean ServerSync.ConfigSync/<>c::<resetConfigsFromServer>b__53_0(ServerSync.OwnConfigEntryBase)
IL_0023: newobj System.Void System.Func`2<ServerSync.OwnConfigEntryBase,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0028: dup
IL_0029: stsfld System.Func`2<ServerSync.OwnConfigEntryBase,System.Boolean> ServerSync.ConfigSync/<>c::<>9__53_0
IL_002e: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ServerSync.OwnConfigEntryBase>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0033: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<ServerSync.OwnConfigEntryBase>::GetEnumerator()
IL_0038: stloc.2
IL_0039: br IL_008a
IL_003e: ldloc.2
IL_003f: callvirt !0 System.Collections.Generic.IEnumerator`1<ServerSync.OwnConfigEntryBase>::get_Current()
IL_0044: stloc.3
IL_0045: nop
IL_0046: ldloc.0
IL_0047: ldnull
IL_0048: ceq
IL_004a: stloc.s V_4
IL_004c: ldloc.s V_4
IL_004e: brfalse IL_0070
IL_0053: nop
IL_0054: ldloc.3
IL_0055: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_005a: callvirt BepInEx.Configuration.ConfigFile BepInEx.Configuration.ConfigEntryBase::get_ConfigFile()
IL_005f: stloc.0
IL_0060: ldloc.0
IL_0061: callvirt System.Boolean BepInEx.Configuration.ConfigFile::get_SaveOnConfigSet()
IL_0066: stloc.1
IL_0067: ldloc.0
IL_0068: ldc.i4.0
IL_0069: callvirt System.Void BepInEx.Configuration.ConfigFile::set_SaveOnConfigSet(System.Boolean)
IL_006e: nop
IL_006f: nop
IL_0070: ldloc.3
IL_0071: callvirt BepInEx.Configuration.ConfigEntryBase ServerSync.OwnConfigEntryBase::get_BaseConfig()
IL_0076: ldloc.3
IL_0077: ldfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_007c: callvirt System.Void BepInEx.Configuration.ConfigEntryBase::set_BoxedValue(System.Object)
IL_0081: nop
IL_0082: ldloc.3
IL_0083: ldnull
IL_0084: stfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_0089: nop
IL_008a: ldloc.2
IL_008b: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0090: brtrue.s IL_003e
IL_0092: leave IL_00a5
IL_0097: ldloc.2
IL_0098: brfalse IL_00a4
IL_009d: ldloc.2
IL_009e: callvirt System.Void System.IDisposable::Dispose()
IL_00a3: nop
IL_00a4: endfinally
IL_00a5: ldloc.0
IL_00a6: ldnull
IL_00a7: cgt.un
IL_00a9: stloc.s V_5
IL_00ab: ldloc.s V_5
IL_00ad: brfalse IL_00bc
IL_00b2: nop
IL_00b3: ldloc.0
IL_00b4: ldloc.1
IL_00b5: callvirt System.Void BepInEx.Configuration.ConfigFile::set_SaveOnConfigSet(System.Boolean)
IL_00ba: nop
IL_00bb: nop
IL_00bc: nop
IL_00bd: ldarg.0
IL_00be: ldfld System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync::allCustomValues
IL_00c3: ldsfld System.Func`2<ServerSync.CustomSyncedValueBase,System.Boolean> ServerSync.ConfigSync/<>c::<>9__53_1
IL_00c8: dup
IL_00c9: brtrue IL_00e5
IL_00ce: pop
IL_00cf: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_00d4: ldftn System.Boolean ServerSync.ConfigSync/<>c::<resetConfigsFromServer>b__53_1(ServerSync.CustomSyncedValueBase)
IL_00da: newobj System.Void System.Func`2<ServerSync.CustomSyncedValueBase,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_00df: dup
IL_00e0: stsfld System.Func`2<ServerSync.CustomSyncedValueBase,System.Boolean> ServerSync.ConfigSync/<>c::<>9__53_1
IL_00e5: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ServerSync.CustomSyncedValueBase>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_00ea: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<ServerSync.CustomSyncedValueBase>::GetEnumerator()
IL_00ef: stloc.s V_6
IL_00f1: br IL_0118
IL_00f6: ldloc.s V_6
IL_00f8: callvirt !0 System.Collections.Generic.IEnumerator`1<ServerSync.CustomSyncedValueBase>::get_Current()
IL_00fd: stloc.s V_7
IL_00ff: nop
IL_0100: ldloc.s V_7
IL_0102: ldloc.s V_7
IL_0104: ldfld System.Object ServerSync.CustomSyncedValueBase::LocalBaseValue
IL_0109: callvirt System.Void ServerSync.CustomSyncedValueBase::set_BoxedValue(System.Object)
IL_010e: nop
IL_010f: ldloc.s V_7
IL_0111: ldnull
IL_0112: stfld System.Object ServerSync.CustomSyncedValueBase::LocalBaseValue
IL_0117: nop
IL_0118: ldloc.s V_6
IL_011a: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_011f: brtrue.s IL_00f6
IL_0121: leave IL_0136
IL_0126: ldloc.s V_6
IL_0128: brfalse IL_0135
IL_012d: ldloc.s V_6
IL_012f: callvirt System.Void System.IDisposable::Dispose()
IL_0134: nop
IL_0135: endfinally
IL_0136: ldarg.0
IL_0137: ldarg.0
IL_0138: ldftn System.Void ServerSync.ConfigSync::serverLockedSettingChanged()
IL_013e: newobj System.Void System.Action::.ctor(System.Object,System.IntPtr)
IL_0143: call System.Void ServerSync.ConfigSync::remove_lockedConfigChanged(System.Action)
IL_0148: nop
IL_0149: ldarg.0
IL_014a: call System.Void ServerSync.ConfigSync::serverLockedSettingChanged()
IL_014f: nop
IL_0150: ret
// EH Finally: 57 - 151 => 151 - 165
// EH Finally: 241 - 294 => 294 - 310

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
.locals ServerSync.ConfigSync/<>c__DisplayClass56_0, System.Boolean, System.Collections.IEnumerator, System.Collections.Generic.List`1<ZNetPeer>, System.Boolean
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
IL_001b: stloc.1
IL_001c: ldloc.1
IL_001d: brfalse IL_0033
IL_0022: nop
IL_0023: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Empty<System.Object>()
IL_0028: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.Object>::GetEnumerator()
IL_002d: stloc.2
IL_002e: br IL_0092
IL_0033: ldtoken ZRoutedRpc
IL_0038: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_003d: ldstr "m_peers"
IL_0042: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_0047: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_004c: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_0051: castclass System.Collections.Generic.List`1<ZNetPeer>
IL_0056: stloc.3
IL_0057: ldloc.0
IL_0058: ldfld System.Int64 ServerSync.ConfigSync/<>c__DisplayClass56_0::target
IL_005d: ldc.i4.0
IL_005e: conv.i8
IL_005f: cgt.un
IL_0061: stloc.s V_4
IL_0063: ldloc.s V_4
IL_0065: brfalse IL_0084
IL_006a: nop
IL_006b: ldloc.3
IL_006c: ldloc.0
IL_006d: ldftn System.Boolean ServerSync.ConfigSync/<>c__DisplayClass56_0::<sendZPackage>b__0(ZNetPeer)
IL_0073: newobj System.Void System.Func`2<ZNetPeer,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0078: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ZNetPeer>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_007d: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<ZNetPeer>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0082: stloc.3
IL_0083: nop
IL_0084: ldarg.0
IL_0085: ldloc.3
IL_0086: ldarg.2
IL_0087: call System.Collections.IEnumerator ServerSync.ConfigSync::sendZPackage(System.Collections.Generic.List`1<ZNetPeer>,ZPackage)
IL_008c: stloc.2
IL_008d: br IL_0092
IL_0092: ldloc.2
IL_0093: ret

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
IL_0007: brfalse IL_0016
IL_000c: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_0011: br IL_0017
IL_0016: ldc.i4.1
IL_0017: stloc.0
IL_0018: ldloc.0
IL_0019: brfalse IL_0049
IL_001e: nop
IL_001f: ldarg.2
IL_0020: ldnull
IL_0021: ldnull
IL_0022: ldc.i4.1
IL_0023: call ZPackage ServerSync.ConfigSync::ConfigsToPackage(System.Collections.Generic.IEnumerable`1<BepInEx.Configuration.ConfigEntryBase>,System.Collections.Generic.IEnumerable`1<ServerSync.CustomSyncedValueBase>,System.Collections.Generic.IEnumerable`1<ServerSync.ConfigSync/PackageEntry>,System.Boolean)
IL_0028: stloc.1
IL_0029: call ZNet ZNet::get_instance()
IL_002e: dup
IL_002f: brtrue IL_003a
IL_0034: pop
IL_0035: br IL_0048
IL_003a: ldarg.0
IL_003b: ldarg.1
IL_003c: ldloc.1
IL_003d: call System.Collections.IEnumerator ServerSync.ConfigSync::sendZPackage(System.Int64,ZPackage)
IL_0042: call UnityEngine.Coroutine UnityEngine.MonoBehaviour::StartCoroutine(System.Collections.IEnumerator)
IL_0047: pop
IL_0048: nop
IL_0049: ret

// System.Void ServerSync.ConfigSync::Broadcast(System.Int64,ServerSync.CustomSyncedValueBase[])
.locals System.Boolean, ZPackage
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call System.Boolean ServerSync.ConfigSync::get_IsLocked()
IL_0007: brfalse IL_0016
IL_000c: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_0011: br IL_0017
IL_0016: ldc.i4.1
IL_0017: stloc.0
IL_0018: ldloc.0
IL_0019: brfalse IL_0049
IL_001e: nop
IL_001f: ldnull
IL_0020: ldarg.2
IL_0021: ldnull
IL_0022: ldc.i4.1
IL_0023: call ZPackage ServerSync.ConfigSync::ConfigsToPackage(System.Collections.Generic.IEnumerable`1<BepInEx.Configuration.ConfigEntryBase>,System.Collections.Generic.IEnumerable`1<ServerSync.CustomSyncedValueBase>,System.Collections.Generic.IEnumerable`1<ServerSync.ConfigSync/PackageEntry>,System.Boolean)
IL_0028: stloc.1
IL_0029: call ZNet ZNet::get_instance()
IL_002e: dup
IL_002f: brtrue IL_003a
IL_0034: pop
IL_0035: br IL_0048
IL_003a: ldarg.0
IL_003b: ldarg.1
IL_003c: ldloc.1
IL_003d: call System.Collections.IEnumerator ServerSync.ConfigSync::sendZPackage(System.Int64,ZPackage)
IL_0042: call UnityEngine.Coroutine UnityEngine.MonoBehaviour::StartCoroutine(System.Collections.IEnumerator)
IL_0047: pop
IL_0048: nop
IL_0049: ret

// ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::configData(BepInEx.Configuration.ConfigEntryBase)
.locals ServerSync.OwnConfigEntryBase
IL_0000: nop
IL_0001: ldarg.0
IL_0002: callvirt BepInEx.Configuration.ConfigDescription BepInEx.Configuration.ConfigEntryBase::get_Description()
IL_0007: callvirt System.Object[] BepInEx.Configuration.ConfigDescription::get_Tags()
IL_000c: dup
IL_000d: brtrue IL_0019
IL_0012: pop
IL_0013: ldnull
IL_0014: br IL_0023
IL_0019: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::OfType<ServerSync.OwnConfigEntryBase>(System.Collections.IEnumerable)
IL_001e: call !!0 System.Linq.Enumerable::SingleOrDefault<ServerSync.OwnConfigEntryBase>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0023: stloc.0
IL_0024: br IL_0029
IL_0029: ldloc.0
IL_002a: ret

// ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync::ConfigData(BepInEx.Configuration.ConfigEntry`1<T>)
.locals ServerSync.SyncedConfigEntry`1<T>
IL_0000: nop
IL_0001: ldarg.0
IL_0002: callvirt BepInEx.Configuration.ConfigDescription BepInEx.Configuration.ConfigEntryBase::get_Description()
IL_0007: callvirt System.Object[] BepInEx.Configuration.ConfigDescription::get_Tags()
IL_000c: dup
IL_000d: brtrue IL_0019
IL_0012: pop
IL_0013: ldnull
IL_0014: br IL_0023
IL_0019: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::OfType<ServerSync.SyncedConfigEntry`1<T>>(System.Collections.IEnumerable)
IL_001e: call !!0 System.Linq.Enumerable::SingleOrDefault<ServerSync.SyncedConfigEntry`1<T>>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0023: stloc.0
IL_0024: br IL_0029
IL_0029: ldloc.0
IL_002a: ret

// T ServerSync.ConfigSync::configAttribute(BepInEx.Configuration.ConfigEntryBase)
.locals T
IL_0000: nop
IL_0001: ldarg.0
IL_0002: callvirt BepInEx.Configuration.ConfigDescription BepInEx.Configuration.ConfigEntryBase::get_Description()
IL_0007: callvirt System.Object[] BepInEx.Configuration.ConfigDescription::get_Tags()
IL_000c: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::OfType<T>(System.Collections.IEnumerable)
IL_0011: call !!0 System.Linq.Enumerable::First<T>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0016: stloc.0
IL_0017: br IL_001c
IL_001c: ldloc.0
IL_001d: ret

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
IL_0006: brtrue IL_0011
IL_000b: ldarg.0
IL_000c: br IL_0017
IL_0011: ldarg.0
IL_0012: call System.Type System.Enum::GetUnderlyingType(System.Type)
IL_0017: ret

// ZPackage ServerSync.ConfigSync::ConfigsToPackage(System.Collections.Generic.IEnumerable`1<BepInEx.Configuration.ConfigEntryBase>,System.Collections.Generic.IEnumerable`1<ServerSync.CustomSyncedValueBase>,System.Collections.Generic.IEnumerable`1<ServerSync.ConfigSync/PackageEntry>,System.Boolean)
.locals System.Collections.Generic.List`1<BepInEx.Configuration.ConfigEntryBase>, System.Collections.Generic.List`1<ServerSync.CustomSyncedValueBase>, ZPackage, System.Collections.Generic.IEnumerator`1<ServerSync.ConfigSync/PackageEntry>, ServerSync.ConfigSync/PackageEntry, System.Collections.Generic.List`1/Enumerator<ServerSync.CustomSyncedValueBase>, ServerSync.CustomSyncedValueBase, System.Collections.Generic.List`1/Enumerator<BepInEx.Configuration.ConfigEntryBase>, BepInEx.Configuration.ConfigEntryBase, ZPackage
IL_0000: nop
IL_0001: ldarg.0
IL_0002: brtrue IL_000d
IL_0007: ldnull
IL_0008: br IL_003a
IL_000d: ldarg.0
IL_000e: ldsfld System.Func`2<BepInEx.Configuration.ConfigEntryBase,System.Boolean> ServerSync.ConfigSync/<>c::<>9__69_0
IL_0013: dup
IL_0014: brtrue IL_0030
IL_0019: pop
IL_001a: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_001f: ldftn System.Boolean ServerSync.ConfigSync/<>c::<ConfigsToPackage>b__69_0(BepInEx.Configuration.ConfigEntryBase)
IL_0025: newobj System.Void System.Func`2<BepInEx.Configuration.ConfigEntryBase,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_002a: dup
IL_002b: stsfld System.Func`2<BepInEx.Configuration.ConfigEntryBase,System.Boolean> ServerSync.ConfigSync/<>c::<>9__69_0
IL_0030: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<BepInEx.Configuration.ConfigEntryBase>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0035: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<BepInEx.Configuration.ConfigEntryBase>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_003a: dup
IL_003b: brtrue IL_0046
IL_0040: pop
IL_0041: newobj System.Void System.Collections.Generic.List`1<BepInEx.Configuration.ConfigEntryBase>::.ctor()
IL_0046: stloc.0
IL_0047: ldarg.1
IL_0048: brtrue IL_0053
IL_004d: ldnull
IL_004e: br IL_0059
IL_0053: ldarg.1
IL_0054: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<ServerSync.CustomSyncedValueBase>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0059: dup
IL_005a: brtrue IL_0065
IL_005f: pop
IL_0060: newobj System.Void System.Collections.Generic.List`1<ServerSync.CustomSyncedValueBase>::.ctor()
IL_0065: stloc.1
IL_0066: newobj System.Void ZPackage::.ctor()
IL_006b: stloc.2
IL_006c: ldloc.2
IL_006d: ldarg.3
IL_006e: brtrue IL_0079
IL_0073: ldc.i4.0
IL_0074: br IL_007a
IL_0079: ldc.i4.1
IL_007a: callvirt System.Void ZPackage::Write(System.Byte)
IL_007f: nop
IL_0080: ldloc.2
IL_0081: ldloc.0
IL_0082: callvirt System.Int32 System.Collections.Generic.List`1<BepInEx.Configuration.ConfigEntryBase>::get_Count()
IL_0087: ldloc.1
IL_0088: callvirt System.Int32 System.Collections.Generic.List`1<ServerSync.CustomSyncedValueBase>::get_Count()
IL_008d: add
IL_008e: ldarg.2
IL_008f: brtrue IL_009a
IL_0094: ldc.i4.0
IL_0095: br IL_00a0
IL_009a: ldarg.2
IL_009b: call System.Int32 System.Linq.Enumerable::Count<ServerSync.ConfigSync/PackageEntry>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_00a0: add
IL_00a1: callvirt System.Void ZPackage::Write(System.Int32)
IL_00a6: nop
IL_00a7: nop
IL_00a8: ldarg.2
IL_00a9: dup
IL_00aa: brtrue IL_00b5
IL_00af: pop
IL_00b0: call !!0[] System.Array::Empty<ServerSync.ConfigSync/PackageEntry>()
IL_00b5: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<ServerSync.ConfigSync/PackageEntry>::GetEnumerator()
IL_00ba: stloc.3
IL_00bb: br IL_00d3
IL_00c0: ldloc.3
IL_00c1: callvirt !0 System.Collections.Generic.IEnumerator`1<ServerSync.ConfigSync/PackageEntry>::get_Current()
IL_00c6: stloc.s V_4
IL_00c8: nop
IL_00c9: ldloc.2
IL_00ca: ldloc.s V_4
IL_00cc: call System.Void ServerSync.ConfigSync::AddEntryToPackage(ZPackage,ServerSync.ConfigSync/PackageEntry)
IL_00d1: nop
IL_00d2: nop
IL_00d3: ldloc.3
IL_00d4: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_00d9: brtrue.s IL_00c0
IL_00db: leave IL_00ee
IL_00e0: ldloc.3
IL_00e1: brfalse IL_00ed
IL_00e6: ldloc.3
IL_00e7: callvirt System.Void System.IDisposable::Dispose()
IL_00ec: nop
IL_00ed: endfinally
IL_00ee: nop
IL_00ef: ldloc.1
IL_00f0: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<ServerSync.CustomSyncedValueBase>::GetEnumerator()
IL_00f5: stloc.s V_5
IL_00f7: br IL_0145
IL_00fc: ldloca.s V_5
IL_00fe: call !0 System.Collections.Generic.List`1/Enumerator<ServerSync.CustomSyncedValueBase>::get_Current()
IL_0103: stloc.s V_6
IL_0105: nop
IL_0106: ldloc.2
IL_0107: newobj System.Void ServerSync.ConfigSync/PackageEntry::.ctor()
IL_010c: dup
IL_010d: ldstr "Internal"
IL_0112: stfld System.String ServerSync.ConfigSync/PackageEntry::section
IL_0117: dup
IL_0118: ldloc.s V_6
IL_011a: ldfld System.String ServerSync.CustomSyncedValueBase::Identifier
IL_011f: stfld System.String ServerSync.ConfigSync/PackageEntry::key
IL_0124: dup
IL_0125: ldloc.s V_6
IL_0127: ldfld System.Type ServerSync.CustomSyncedValueBase::Type
IL_012c: stfld System.Type ServerSync.ConfigSync/PackageEntry::type
IL_0131: dup
IL_0132: ldloc.s V_6
IL_0134: callvirt System.Object ServerSync.CustomSyncedValueBase::get_BoxedValue()
IL_0139: stfld System.Object ServerSync.ConfigSync/PackageEntry::value
IL_013e: call System.Void ServerSync.ConfigSync::AddEntryToPackage(ZPackage,ServerSync.ConfigSync/PackageEntry)
IL_0143: nop
IL_0144: nop
IL_0145: ldloca.s V_5
IL_0147: call System.Boolean System.Collections.Generic.List`1/Enumerator<ServerSync.CustomSyncedValueBase>::MoveNext()
IL_014c: brtrue.s IL_00fc
IL_014e: leave IL_0162
IL_0153: ldloca.s V_5
IL_0155: constrained. System.Collections.Generic.List`1/Enumerator<ServerSync.CustomSyncedValueBase>
IL_015b: callvirt System.Void System.IDisposable::Dispose()
IL_0160: nop
IL_0161: endfinally
IL_0162: nop
IL_0163: ldloc.0
IL_0164: callvirt System.Collections.Generic.List`1/Enumerator<!0> System.Collections.Generic.List`1<BepInEx.Configuration.ConfigEntryBase>::GetEnumerator()
IL_0169: stloc.s V_7
IL_016b: br IL_01c5
IL_0170: ldloca.s V_7
IL_0172: call !0 System.Collections.Generic.List`1/Enumerator<BepInEx.Configuration.ConfigEntryBase>::get_Current()
IL_0177: stloc.s V_8
IL_0179: nop
IL_017a: ldloc.2
IL_017b: newobj System.Void ServerSync.ConfigSync/PackageEntry::.ctor()
IL_0180: dup
IL_0181: ldloc.s V_8
IL_0183: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_0188: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Section()
IL_018d: stfld System.String ServerSync.ConfigSync/PackageEntry::section
IL_0192: dup
IL_0193: ldloc.s V_8
IL_0195: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_019a: callvirt System.String BepInEx.Configuration.ConfigDefinition::get_Key()
IL_019f: stfld System.String ServerSync.ConfigSync/PackageEntry::key
IL_01a4: dup
IL_01a5: ldloc.s V_8
IL_01a7: call System.Type ServerSync.ConfigSync::configType(BepInEx.Configuration.ConfigEntryBase)
IL_01ac: stfld System.Type ServerSync.ConfigSync/PackageEntry::type
IL_01b1: dup
IL_01b2: ldloc.s V_8
IL_01b4: callvirt System.Object BepInEx.Configuration.ConfigEntryBase::get_BoxedValue()
IL_01b9: stfld System.Object ServerSync.ConfigSync/PackageEntry::value
IL_01be: call System.Void ServerSync.ConfigSync::AddEntryToPackage(ZPackage,ServerSync.ConfigSync/PackageEntry)
IL_01c3: nop
IL_01c4: nop
IL_01c5: ldloca.s V_7
IL_01c7: call System.Boolean System.Collections.Generic.List`1/Enumerator<BepInEx.Configuration.ConfigEntryBase>::MoveNext()
IL_01cc: brtrue.s IL_0170
IL_01ce: leave IL_01e2
IL_01d3: ldloca.s V_7
IL_01d5: constrained. System.Collections.Generic.List`1/Enumerator<BepInEx.Configuration.ConfigEntryBase>
IL_01db: callvirt System.Void System.IDisposable::Dispose()
IL_01e0: nop
IL_01e1: endfinally
IL_01e2: ldloc.2
IL_01e3: stloc.s V_9
IL_01e5: br IL_01ea
IL_01ea: ldloc.s V_9
IL_01ec: ret
// EH Finally: 187 - 224 => 224 - 238
// EH Finally: 247 - 339 => 339 - 354
// EH Finally: 363 - 467 => 467 - 482

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
IL_0022: brfalse IL_0037
IL_0027: ldarg.1
IL_0028: ldfld System.Type ServerSync.ConfigSync/PackageEntry::type
IL_002d: call System.String ServerSync.ConfigSync::GetZPackageTypeString(System.Type)
IL_0032: br IL_003c
IL_0037: ldstr ""
IL_003c: callvirt System.Void ZPackage::Write(System.String)
IL_0041: nop
IL_0042: ldarg.0
IL_0043: ldarg.1
IL_0044: ldfld System.Object ServerSync.ConfigSync/PackageEntry::value
IL_0049: call System.Void ServerSync.ConfigSync::AddValueToZPackage(ZPackage,System.Object)
IL_004e: nop
IL_004f: ret

// System.String ServerSync.ConfigSync::GetZPackageTypeString(System.Type)
.locals 
IL_0000: ldarg.0
IL_0001: callvirt System.String System.Type::get_AssemblyQualifiedName()
IL_0006: ret

// System.Void ServerSync.ConfigSync::AddValueToZPackage(ZPackage,System.Object)
.locals System.Type, System.Boolean, System.Collections.ICollection, System.Boolean, System.Collections.IEnumerator, System.Object, System.IDisposable, System.Boolean, System.Reflection.FieldInfo[], System.Reflection.FieldInfo[], System.Int32, System.Reflection.FieldInfo
IL_0000: nop
IL_0001: ldarg.1
IL_0002: brtrue IL_000d
IL_0007: ldnull
IL_0008: br IL_0013
IL_000d: ldarg.1
IL_000e: call System.Type System.Object::GetType()
IL_0013: stloc.0
IL_0014: ldarg.1
IL_0015: isinst System.Enum
IL_001a: ldnull
IL_001b: cgt.un
IL_001d: stloc.1
IL_001e: ldloc.1
IL_001f: brfalse IL_0048
IL_0024: nop
IL_0025: ldarg.1
IL_0026: castclass System.IConvertible
IL_002b: ldarg.1
IL_002c: callvirt System.Type System.Object::GetType()
IL_0031: call System.Type System.Enum::GetUnderlyingType(System.Type)
IL_0036: call System.Globalization.CultureInfo System.Globalization.CultureInfo::get_InvariantCulture()
IL_003b: callvirt System.Object System.IConvertible::ToType(System.Type,System.IFormatProvider)
IL_0040: starg.s value
IL_0042: nop
IL_0043: br IL_0144
IL_0048: ldarg.1
IL_0049: isinst System.Collections.ICollection
IL_004e: stloc.2
IL_004f: ldloc.2
IL_0050: ldnull
IL_0051: cgt.un
IL_0053: stloc.3
IL_0054: ldloc.3
IL_0055: brfalse IL_00b6
IL_005a: nop
IL_005b: ldarg.0
IL_005c: ldloc.2
IL_005d: callvirt System.Int32 System.Collections.ICollection::get_Count()
IL_0062: callvirt System.Void ZPackage::Write(System.Int32)
IL_0067: nop
IL_0068: nop
IL_0069: ldloc.2
IL_006a: callvirt System.Collections.IEnumerator System.Collections.IEnumerable::GetEnumerator()
IL_006f: stloc.s V_4
IL_0071: br IL_008a
IL_0076: ldloc.s V_4
IL_0078: callvirt System.Object System.Collections.IEnumerator::get_Current()
IL_007d: stloc.s V_5
IL_007f: nop
IL_0080: ldarg.0
IL_0081: ldloc.s V_5
IL_0083: call System.Void ServerSync.ConfigSync::AddValueToZPackage(ZPackage,System.Object)
IL_0088: nop
IL_0089: nop
IL_008a: ldloc.s V_4
IL_008c: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0091: brtrue.s IL_0076
IL_0093: leave IL_00b1
IL_0098: ldloc.s V_4
IL_009a: isinst System.IDisposable
IL_009f: stloc.s V_6
IL_00a1: ldloc.s V_6
IL_00a3: brfalse IL_00b0
IL_00a8: ldloc.s V_6
IL_00aa: callvirt System.Void System.IDisposable::Dispose()
IL_00af: nop
IL_00b0: endfinally
IL_00b1: br IL_0156
IL_00b6: ldloc.0
IL_00b7: brfalse IL_00d5
IL_00bc: ldloc.0
IL_00bd: callvirt System.Boolean System.Type::get_IsValueType()
IL_00c2: brfalse IL_00d5
IL_00c7: ldloc.0
IL_00c8: callvirt System.Boolean System.Type::get_IsPrimitive()
IL_00cd: ldc.i4.0
IL_00ce: ceq
IL_00d0: br IL_00d6
IL_00d5: ldc.i4.0
IL_00d6: stloc.s V_7
IL_00d8: ldloc.s V_7
IL_00da: brfalse IL_0144
IL_00df: nop
IL_00e0: ldloc.0
IL_00e1: ldc.i4.s 52
IL_00e3: callvirt System.Reflection.FieldInfo[] System.Type::GetFields(System.Reflection.BindingFlags)
IL_00e8: stloc.s V_8
IL_00ea: ldarg.0
IL_00eb: ldloc.s V_8
IL_00ed: ldlen
IL_00ee: conv.i4
IL_00ef: callvirt System.Void ZPackage::Write(System.Int32)
IL_00f4: nop
IL_00f5: nop
IL_00f6: ldloc.s V_8
IL_00f8: stloc.s V_9
IL_00fa: ldc.i4.0
IL_00fb: stloc.s V_10
IL_00fd: br IL_0137
IL_0102: ldloc.s V_9
IL_0104: ldloc.s V_10
IL_0106: ldelem.any System.Reflection.FieldInfo
IL_010b: stloc.s V_11
IL_010d: nop
IL_010e: ldarg.0
IL_010f: ldloc.s V_11
IL_0111: callvirt System.Type System.Reflection.FieldInfo::get_FieldType()
IL_0116: call System.String ServerSync.ConfigSync::GetZPackageTypeString(System.Type)
IL_011b: callvirt System.Void ZPackage::Write(System.String)
IL_0120: nop
IL_0121: ldarg.0
IL_0122: ldloc.s V_11
IL_0124: ldarg.1
IL_0125: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_012a: call System.Void ServerSync.ConfigSync::AddValueToZPackage(ZPackage,System.Object)
IL_012f: nop
IL_0130: nop
IL_0131: ldloc.s V_10
IL_0133: ldc.i4.1
IL_0134: add
IL_0135: stloc.s V_10
IL_0137: ldloc.s V_10
IL_0139: ldloc.s V_9
IL_013b: ldlen
IL_013c: conv.i4
IL_013d: blt.s IL_0102
IL_013f: br IL_0156
IL_0144: ldc.i4.1
IL_0145: newarr System.Object
IL_014a: dup
IL_014b: ldc.i4.0
IL_014c: ldarg.1
IL_014d: stelem.ref
IL_014e: ldarga.s package
IL_0150: call System.Void ZRpc::Serialize(System.Object[],ZPackage&)
IL_0155: nop
IL_0156: ret
// EH Finally: 113 - 152 => 152 - 177

// System.Object ServerSync.ConfigSync::ReadValueWithTypeFromZPackage(ZPackage,System.Type)
.locals System.Boolean, System.Reflection.FieldInfo[], System.Int32, System.Boolean, System.Object, System.Reflection.FieldInfo[], System.Int32, System.Reflection.FieldInfo, System.String, System.Boolean, System.Object, System.Boolean, System.Int32, System.Collections.IDictionary, System.Type, System.Reflection.FieldInfo, System.Reflection.FieldInfo, System.Int32, System.Object, System.Boolean, System.Type, System.Boolean, System.Int32, System.Object, System.Reflection.MethodInfo, System.Int32, System.Boolean, System.Reflection.ParameterInfo, System.Collections.Generic.List`1<System.Object>
IL_0000: nop
IL_0001: ldarg.1
IL_0002: brfalse IL_002b
IL_0007: ldarg.1
IL_0008: callvirt System.Boolean System.Type::get_IsValueType()
IL_000d: brfalse IL_002b
IL_0012: ldarg.1
IL_0013: callvirt System.Boolean System.Type::get_IsPrimitive()
IL_0018: brtrue IL_002b
IL_001d: ldarg.1
IL_001e: callvirt System.Boolean System.Type::get_IsEnum()
IL_0023: ldc.i4.0
IL_0024: ceq
IL_0026: br IL_002c
IL_002b: ldc.i4.0
IL_002c: stloc.0
IL_002d: ldloc.0
IL_002e: brfalse IL_012d
IL_0033: nop
IL_0034: ldarg.1
IL_0035: ldc.i4.s 52
IL_0037: callvirt System.Reflection.FieldInfo[] System.Type::GetFields(System.Reflection.BindingFlags)
IL_003c: stloc.1
IL_003d: ldarg.0
IL_003e: callvirt System.Int32 ZPackage::ReadInt()
IL_0043: stloc.2
IL_0044: ldloc.2
IL_0045: ldloc.1
IL_0046: ldlen
IL_0047: conv.i4
IL_0048: ceq
IL_004a: ldc.i4.0
IL_004b: ceq
IL_004d: stloc.3
IL_004e: ldloc.3
IL_004f: brfalse IL_0089
IL_0054: nop
IL_0055: newobj System.Void ServerSync.ConfigSync/InvalidDeserializationTypeException::.ctor()
IL_005a: dup
IL_005b: ldstr "(field count: {0})"
IL_0060: ldloc.2
IL_0061: box System.Int32
IL_0066: call System.String System.String::Format(System.String,System.Object)
IL_006b: stfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::received
IL_0070: dup
IL_0071: ldstr "(field count: {0})"
IL_0076: ldloc.1
IL_0077: ldlen
IL_0078: conv.i4
IL_0079: box System.Int32
IL_007e: call System.String System.String::Format(System.String,System.Object)
IL_0083: stfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::expected
IL_0088: throw
IL_0089: ldarg.1
IL_008a: call System.Object System.Runtime.Serialization.FormatterServices::GetUninitializedObject(System.Type)
IL_008f: stloc.s V_4
IL_0091: nop
IL_0092: ldloc.1
IL_0093: stloc.s V_5
IL_0095: ldc.i4.0
IL_0096: stloc.s V_6
IL_0098: br IL_0119
IL_009d: ldloc.s V_5
IL_009f: ldloc.s V_6
IL_00a1: ldelem.any System.Reflection.FieldInfo
IL_00a6: stloc.s V_7
IL_00a8: nop
IL_00a9: ldarg.0
IL_00aa: callvirt System.String ZPackage::ReadString()
IL_00af: stloc.s V_8
IL_00b1: ldloc.s V_8
IL_00b3: ldloc.s V_7
IL_00b5: callvirt System.Type System.Reflection.FieldInfo::get_FieldType()
IL_00ba: call System.String ServerSync.ConfigSync::GetZPackageTypeString(System.Type)
IL_00bf: call System.Boolean System.String::op_Inequality(System.String,System.String)
IL_00c4: stloc.s V_9
IL_00c6: ldloc.s V_9
IL_00c8: brfalse IL_00fb
IL_00cd: nop
IL_00ce: newobj System.Void ServerSync.ConfigSync/InvalidDeserializationTypeException::.ctor()
IL_00d3: dup
IL_00d4: ldloc.s V_8
IL_00d6: stfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::received
IL_00db: dup
IL_00dc: ldloc.s V_7
IL_00de: callvirt System.Type System.Reflection.FieldInfo::get_FieldType()
IL_00e3: call System.String ServerSync.ConfigSync::GetZPackageTypeString(System.Type)
IL_00e8: stfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::expected
IL_00ed: dup
IL_00ee: ldloc.s V_7
IL_00f0: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_00f5: stfld System.String ServerSync.ConfigSync/InvalidDeserializationTypeException::field
IL_00fa: throw
IL_00fb: ldloc.s V_7
IL_00fd: ldloc.s V_4
IL_00ff: ldarg.0
IL_0100: ldloc.s V_7
IL_0102: callvirt System.Type System.Reflection.FieldInfo::get_FieldType()
IL_0107: call System.Object ServerSync.ConfigSync::ReadValueWithTypeFromZPackage(ZPackage,System.Type)
IL_010c: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_0111: nop
IL_0112: nop
IL_0113: ldloc.s V_6
IL_0115: ldc.i4.1
IL_0116: add
IL_0117: stloc.s V_6
IL_0119: ldloc.s V_6
IL_011b: ldloc.s V_5
IL_011d: ldlen
IL_011e: conv.i4
IL_011f: blt IL_009d
IL_0124: ldloc.s V_4
IL_0126: stloc.s V_10
IL_0128: br IL_031b
IL_012d: ldarg.1
IL_012e: callvirt System.Boolean System.Type::get_IsGenericType()
IL_0133: brfalse IL_0152
IL_0138: ldarg.1
IL_0139: callvirt System.Type System.Type::GetGenericTypeDefinition()
IL_013e: ldtoken System.Collections.Generic.Dictionary`2
IL_0143: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0148: call System.Boolean System.Type::op_Equality(System.Type,System.Type)
IL_014d: br IL_0153
IL_0152: ldc.i4.0
IL_0153: stloc.s V_11
IL_0155: ldloc.s V_11
IL_0157: brfalse IL_01f2
IL_015c: nop
IL_015d: ldarg.0
IL_015e: callvirt System.Int32 ZPackage::ReadInt()
IL_0163: stloc.s V_12
IL_0165: ldarg.1
IL_0166: call System.Object System.Activator::CreateInstance(System.Type)
IL_016b: castclass System.Collections.IDictionary
IL_0170: stloc.s V_13
IL_0172: ldtoken System.Collections.Generic.KeyValuePair`2
IL_0177: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_017c: ldarg.1
IL_017d: callvirt System.Type[] System.Type::get_GenericTypeArguments()
IL_0182: callvirt System.Type System.Type::MakeGenericType(System.Type[])
IL_0187: stloc.s V_14
IL_0189: ldloc.s V_14
IL_018b: ldstr "key"
IL_0190: ldc.i4.s 36
IL_0192: callvirt System.Reflection.FieldInfo System.Type::GetField(System.String,System.Reflection.BindingFlags)
IL_0197: stloc.s V_15
IL_0199: ldloc.s V_14
IL_019b: ldstr "value"
IL_01a0: ldc.i4.s 36
IL_01a2: callvirt System.Reflection.FieldInfo System.Type::GetField(System.String,System.Reflection.BindingFlags)
IL_01a7: stloc.s V_16
IL_01a9: ldc.i4.0
IL_01aa: stloc.s V_17
IL_01ac: br IL_01dd
IL_01b1: nop
IL_01b2: ldarg.0
IL_01b3: ldloc.s V_14
IL_01b5: call System.Object ServerSync.ConfigSync::ReadValueWithTypeFromZPackage(ZPackage,System.Type)
IL_01ba: stloc.s V_18
IL_01bc: ldloc.s V_13
IL_01be: ldloc.s V_15
IL_01c0: ldloc.s V_18
IL_01c2: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_01c7: ldloc.s V_16
IL_01c9: ldloc.s V_18
IL_01cb: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_01d0: callvirt System.Void System.Collections.IDictionary::Add(System.Object,System.Object)
IL_01d5: nop
IL_01d6: nop
IL_01d7: ldloc.s V_17
IL_01d9: ldc.i4.1
IL_01da: add
IL_01db: stloc.s V_17
IL_01dd: ldloc.s V_17
IL_01df: ldloc.s V_12
IL_01e1: clt
IL_01e3: stloc.s V_19
IL_01e5: ldloc.s V_19
IL_01e7: brtrue.s IL_01b1
IL_01e9: ldloc.s V_13
IL_01eb: stloc.s V_10
IL_01ed: br IL_031b
IL_01f2: ldarg.1
IL_01f3: ldtoken System.Collections.Generic.List`1<System.String>
IL_01f8: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_01fd: call System.Boolean System.Type::op_Inequality(System.Type,System.Type)
IL_0202: brfalse IL_024c
IL_0207: ldarg.1
IL_0208: callvirt System.Boolean System.Type::get_IsGenericType()
IL_020d: brfalse IL_024c
IL_0212: ldtoken System.Collections.Generic.ICollection`1
IL_0217: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_021c: ldc.i4.1
IL_021d: newarr System.Type
IL_0222: dup
IL_0223: ldc.i4.0
IL_0224: ldarg.1
IL_0225: callvirt System.Type[] System.Type::get_GenericTypeArguments()
IL_022a: ldc.i4.0
IL_022b: ldelem.any System.Type
IL_0230: stelem.ref
IL_0231: callvirt System.Type System.Type::MakeGenericType(System.Type[])
IL_0236: stloc.s V_20
IL_0238: ldloc.s V_20
IL_023a: brfalse IL_024c
IL_023f: ldloc.s V_20
IL_0241: ldarg.1
IL_0242: callvirt System.Boolean System.Type::IsAssignableFrom(System.Type)
IL_0247: br IL_024d
IL_024c: ldc.i4.0
IL_024d: stloc.s V_21
IL_024f: ldloc.s V_21
IL_0251: brfalse IL_02bf
IL_0256: nop
IL_0257: ldarg.0
IL_0258: callvirt System.Int32 ZPackage::ReadInt()
IL_025d: stloc.s V_22
IL_025f: ldarg.1
IL_0260: call System.Object System.Activator::CreateInstance(System.Type)
IL_0265: stloc.s V_23
IL_0267: ldloc.s V_20
IL_0269: ldstr "Add"
IL_026e: callvirt System.Reflection.MethodInfo System.Type::GetMethod(System.String)
IL_0273: stloc.s V_24
IL_0275: ldc.i4.0
IL_0276: stloc.s V_25
IL_0278: br IL_02aa
IL_027d: nop
IL_027e: ldloc.s V_24
IL_0280: ldloc.s V_23
IL_0282: ldc.i4.1
IL_0283: newarr System.Object
IL_0288: dup
IL_0289: ldc.i4.0
IL_028a: ldarg.0
IL_028b: ldarg.1
IL_028c: callvirt System.Type[] System.Type::get_GenericTypeArguments()
IL_0291: ldc.i4.0
IL_0292: ldelem.any System.Type
IL_0297: call System.Object ServerSync.ConfigSync::ReadValueWithTypeFromZPackage(ZPackage,System.Type)
IL_029c: stelem.ref
IL_029d: callvirt System.Object System.Reflection.MethodBase::Invoke(System.Object,System.Object[])
IL_02a2: pop
IL_02a3: nop
IL_02a4: ldloc.s V_25
IL_02a6: ldc.i4.1
IL_02a7: add
IL_02a8: stloc.s V_25
IL_02aa: ldloc.s V_25
IL_02ac: ldloc.s V_22
IL_02ae: clt
IL_02b0: stloc.s V_26
IL_02b2: ldloc.s V_26
IL_02b4: brtrue.s IL_027d
IL_02b6: ldloc.s V_23
IL_02b8: stloc.s V_10
IL_02ba: br IL_031b
IL_02bf: ldtoken System.Reflection.ParameterInfo
IL_02c4: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_02c9: call System.Object System.Runtime.Serialization.FormatterServices::GetUninitializedObject(System.Type)
IL_02ce: castclass System.Reflection.ParameterInfo
IL_02d3: stloc.s V_27
IL_02d5: ldtoken System.Reflection.ParameterInfo
IL_02da: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_02df: ldstr "ClassImpl"
IL_02e4: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_02e9: ldloc.s V_27
IL_02eb: ldarg.1
IL_02ec: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_02f1: nop
IL_02f2: newobj System.Void System.Collections.Generic.List`1<System.Object>::.ctor()
IL_02f7: stloc.s V_28
IL_02f9: ldc.i4.2
IL_02fa: newarr System.Reflection.ParameterInfo
IL_02ff: dup
IL_0300: ldc.i4.1
IL_0301: ldloc.s V_27
IL_0303: stelem.ref
IL_0304: ldarg.0
IL_0305: ldloca.s V_28
IL_0307: call System.Void ZRpc::Deserialize(System.Reflection.ParameterInfo[],ZPackage,System.Collections.Generic.List`1<System.Object>&)
IL_030c: nop
IL_030d: ldloc.s V_28
IL_030f: call !!0 System.Linq.Enumerable::First<System.Object>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0314: stloc.s V_10
IL_0316: br IL_031b
IL_031b: ldloc.s V_10
IL_031d: ret

// System.Void ServerSync.ConfigSync::<AddLockingConfigEntry>b__35_0(System.Object,System.EventArgs)
.locals 
IL_0000: ldarg.0
IL_0001: ldfld System.Action ServerSync.ConfigSync::lockedConfigChanged
IL_0006: dup
IL_0007: brtrue IL_0012
IL_000c: pop
IL_000d: br IL_0018
IL_0012: callvirt System.Void System.Action::Invoke()
IL_0017: nop
IL_0018: ret

// System.Boolean ServerSync.ConfigSync::<HandleConfigSyncRPC>b__47_0(System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>)
.locals System.DateTimeOffset, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarga.s kv
IL_0003: call !0 System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>::get_Key()
IL_0008: call System.DateTimeOffset System.DateTimeOffset::get_Now()
IL_000d: stloc.0
IL_000e: ldloca.s V_0
IL_0010: call System.Int64 System.DateTimeOffset::get_Ticks()
IL_0015: clt
IL_0017: stloc.1
IL_0018: ldloc.1
IL_0019: brfalse IL_0039
IL_001e: nop
IL_001f: ldarg.0
IL_0020: ldfld System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>> ServerSync.ConfigSync::configValueCache
IL_0025: ldarga.s kv
IL_0027: call !1 System.Collections.Generic.KeyValuePair`2<System.Int64,System.String>::get_Value()
IL_002c: callvirt System.Boolean System.Collections.Generic.Dictionary`2<System.String,System.Collections.Generic.SortedDictionary`2<System.Int32,System.Byte[]>>::Remove(!0)
IL_0031: pop
IL_0032: ldc.i4.1
IL_0033: stloc.2
IL_0034: br IL_0040
IL_0039: ldc.i4.0
IL_003a: stloc.2
IL_003b: br IL_0040
IL_0040: ldloc.2
IL_0041: ret

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
IL_0018: br IL_007f
IL_001d: ldloca.s V_0
IL_001f: call !0 System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>::get_Current()
IL_0024: stloc.1
IL_0025: nop
IL_0026: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_002b: ldloc.1
IL_002c: ldfld System.String ServerSync.ConfigSync::Name
IL_0031: ldstr " ConfigSync"
IL_0036: call System.String System.String::Concat(System.String,System.String)
IL_003b: ldloc.1
IL_003c: ldftn System.Void ServerSync.ConfigSync::RPC_FromOtherClientConfigSync(System.Int64,ZPackage)
IL_0042: newobj System.Void System.Action`2<System.Int64,ZPackage>::.ctor(System.Object,System.IntPtr)
IL_0047: callvirt System.Void ZRoutedRpc::Register<ZPackage>(System.String,System.Action`2<System.Int64,!!0>)
IL_004c: nop
IL_004d: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_0052: stloc.2
IL_0053: ldloc.2
IL_0054: brfalse IL_007e
IL_0059: nop
IL_005a: ldloc.1
IL_005b: ldc.i4.1
IL_005c: callvirt System.Void ServerSync.ConfigSync::set_InitialSyncDone(System.Boolean)
IL_0061: nop
IL_0062: ldstr "Registered '"
IL_0067: ldloc.1
IL_0068: ldfld System.String ServerSync.ConfigSync::Name
IL_006d: ldstr " ConfigSync' RPC - waiting for incoming connections"
IL_0072: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0077: call System.Void UnityEngine.Debug::Log(System.Object)
IL_007c: nop
IL_007d: nop
IL_007e: nop
IL_007f: ldloca.s V_0
IL_0081: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>::MoveNext()
IL_0086: brtrue.s IL_001d
IL_0088: leave IL_009c
IL_008d: ldloca.s V_0
IL_008f: constrained. System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>
IL_0095: callvirt System.Void System.IDisposable::Dispose()
IL_009a: nop
IL_009b: endfinally
IL_009c: nop
IL_009d: ldsfld System.Boolean ServerSync.ConfigSync::isServer
IL_00a2: stloc.3
IL_00a3: ldloc.3
IL_00a4: brfalse IL_00b7
IL_00a9: nop
IL_00aa: ldarg.0
IL_00ab: call System.Collections.IEnumerator ServerSync.ConfigSync/RegisterRPCPatch::<Postfix>g__WatchAdminListChanges|0_0()
IL_00b0: callvirt UnityEngine.Coroutine UnityEngine.MonoBehaviour::StartCoroutine(System.Collections.IEnumerator)
IL_00b5: pop
IL_00b6: nop
IL_00b7: ret
// EH Finally: 24 - 141 => 141 - 156

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
.locals ServerSync.ConfigSync/PackageEntry, ZPackage, ServerSync.ConfigSync, System.Boolean
IL_0000: nop
IL_0001: ldnull
IL_0002: ldnull
IL_0003: ldc.i4.1
IL_0004: newarr ServerSync.ConfigSync/PackageEntry
IL_0009: dup
IL_000a: ldc.i4.0
IL_000b: newobj System.Void ServerSync.ConfigSync/PackageEntry::.ctor()
IL_0010: stloc.0
IL_0011: ldloc.0
IL_0012: ldstr "Internal"
IL_0017: stfld System.String ServerSync.ConfigSync/PackageEntry::section
IL_001c: ldloc.0
IL_001d: ldstr "lockexempt"
IL_0022: stfld System.String ServerSync.ConfigSync/PackageEntry::key
IL_0027: ldloc.0
IL_0028: ldtoken System.Boolean
IL_002d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0032: stfld System.Type ServerSync.ConfigSync/PackageEntry::type
IL_0037: ldloc.0
IL_0038: ldarg.1
IL_0039: box System.Boolean
IL_003e: stfld System.Object ServerSync.ConfigSync/PackageEntry::value
IL_0043: ldloc.0
IL_0044: stelem.ref
IL_0045: ldc.i4.1
IL_0046: call ZPackage ServerSync.ConfigSync::ConfigsToPackage(System.Collections.Generic.IEnumerable`1<BepInEx.Configuration.ConfigEntryBase>,System.Collections.Generic.IEnumerable`1<ServerSync.CustomSyncedValueBase>,System.Collections.Generic.IEnumerable`1<ServerSync.ConfigSync/PackageEntry>,System.Boolean)
IL_004b: stloc.1
IL_004c: ldsfld System.Collections.Generic.HashSet`1<ServerSync.ConfigSync> ServerSync.ConfigSync::configSyncs
IL_0051: call !!0 System.Linq.Enumerable::First<ServerSync.ConfigSync>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0056: stloc.2
IL_0057: ldloc.2
IL_0058: ldnull
IL_0059: cgt.un
IL_005b: stloc.3
IL_005c: ldloc.3
IL_005d: brfalse IL_0077
IL_0062: nop
IL_0063: call ZNet ZNet::get_instance()
IL_0068: ldloc.2
IL_0069: ldarg.0
IL_006a: ldloc.1
IL_006b: callvirt System.Collections.IEnumerator ServerSync.ConfigSync::sendZPackage(System.Collections.Generic.List`1<ZNetPeer>,ZPackage)
IL_0070: callvirt UnityEngine.Coroutine UnityEngine.MonoBehaviour::StartCoroutine(System.Collections.IEnumerator)
IL_0075: pop
IL_0076: nop
IL_0077: ret

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
IL_0008: brfalse IL_001e
IL_000d: br IL_0012
IL_0012: ldloc.0
IL_0013: ldc.i4.1
IL_0014: beq IL_0023
IL_0019: br IL_0028
IL_001e: br IL_002a
IL_0023: br IL_00c6
IL_0028: ldc.i4.0
IL_0029: ret
IL_002a: ldarg.0
IL_002b: ldc.i4.m1
IL_002c: stfld System.Int32 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>1__state
IL_0031: ldarg.0
IL_0032: newobj System.Void ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::.ctor()
IL_0037: stfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_003c: nop
IL_003d: ldarg.0
IL_003e: ldfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_0043: ldtoken ZNet
IL_0048: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_004d: ldstr "ListContainsId"
IL_0052: ldnull
IL_0053: ldnull
IL_0054: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_0059: stfld System.Reflection.MethodInfo ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::listContainsId
IL_005e: ldarg.0
IL_005f: ldfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_0064: ldtoken ZNet
IL_0069: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_006e: ldstr "m_adminList"
IL_0073: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_0078: call ZNet ZNet::get_instance()
IL_007d: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_0082: castclass SyncedList
IL_0087: stfld SyncedList ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::adminList
IL_008c: ldarg.0
IL_008d: ldarg.0
IL_008e: ldfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_0093: ldfld SyncedList ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::adminList
IL_0098: callvirt System.Collections.Generic.List`1<System.String> SyncedList::GetList()
IL_009d: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor(System.Collections.Generic.IEnumerable`1<!0>)
IL_00a2: stfld System.Collections.Generic.List`1<System.String> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<CurrentList>5__2
IL_00a7: br IL_01a4
IL_00ac: nop
IL_00ad: ldarg.0
IL_00ae: ldc.r4 30
IL_00b3: newobj System.Void UnityEngine.WaitForSeconds::.ctor(System.Single)
IL_00b8: stfld System.Object ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>2__current
IL_00bd: ldarg.0
IL_00be: ldc.i4.1
IL_00bf: stfld System.Int32 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>1__state
IL_00c4: ldc.i4.1
IL_00c5: ret
IL_00c6: ldarg.0
IL_00c7: ldc.i4.m1
IL_00c8: stfld System.Int32 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>1__state
IL_00cd: ldarg.0
IL_00ce: ldfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_00d3: ldfld SyncedList ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::adminList
IL_00d8: callvirt System.Collections.Generic.List`1<System.String> SyncedList::GetList()
IL_00dd: ldarg.0
IL_00de: ldfld System.Collections.Generic.List`1<System.String> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<CurrentList>5__2
IL_00e3: call System.Boolean System.Linq.Enumerable::SequenceEqual<System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_00e8: ldc.i4.0
IL_00e9: ceq
IL_00eb: stloc.1
IL_00ec: ldloc.1
IL_00ed: brfalse IL_01a3
IL_00f2: nop
IL_00f3: ldarg.0
IL_00f4: ldarg.0
IL_00f5: ldfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_00fa: ldfld SyncedList ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::adminList
IL_00ff: callvirt System.Collections.Generic.List`1<System.String> SyncedList::GetList()
IL_0104: newobj System.Void System.Collections.Generic.List`1<System.String>::.ctor(System.Collections.Generic.IEnumerable`1<!0>)
IL_0109: stfld System.Collections.Generic.List`1<System.String> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<CurrentList>5__2
IL_010e: nop
IL_010f: ldarg.0
IL_0110: call ZNet ZNet::get_instance()
IL_0115: callvirt System.Collections.Generic.List`1<ZNetPeer> ZNet::GetPeers()
IL_011a: ldarg.0
IL_011b: ldfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_0120: ldfld System.Func`2<ZNetPeer,System.Boolean> ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::<>9__2
IL_0125: dup
IL_0126: brtrue IL_014b
IL_012b: pop
IL_012c: ldarg.0
IL_012d: ldfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_0132: ldarg.0
IL_0133: ldfld ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0 ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<>8__1
IL_0138: ldftn System.Boolean ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::<Postfix>b__2(ZNetPeer)
IL_013e: newobj System.Void System.Func`2<ZNetPeer,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0143: dup
IL_0144: stloc.2
IL_0145: stfld System.Func`2<ZNetPeer,System.Boolean> ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::<>9__2
IL_014a: ldloc.2
IL_014b: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ZNetPeer>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0150: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<ZNetPeer>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0155: stfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<adminPeer>5__3
IL_015a: ldarg.0
IL_015b: call ZNet ZNet::get_instance()
IL_0160: callvirt System.Collections.Generic.List`1<ZNetPeer> ZNet::GetPeers()
IL_0165: ldarg.0
IL_0166: ldfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<adminPeer>5__3
IL_016b: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Except<ZNetPeer>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_0170: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<ZNetPeer>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0175: stfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<nonAdminPeer>5__4
IL_017a: ldarg.0
IL_017b: ldfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<nonAdminPeer>5__4
IL_0180: ldc.i4.0
IL_0181: call System.Void ServerSync.ConfigSync/RegisterRPCPatch::<Postfix>g__SendAdmin|0_1(System.Collections.Generic.List`1<ZNetPeer>,System.Boolean)
IL_0186: nop
IL_0187: ldarg.0
IL_0188: ldfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<adminPeer>5__3
IL_018d: ldc.i4.1
IL_018e: call System.Void ServerSync.ConfigSync/RegisterRPCPatch::<Postfix>g__SendAdmin|0_1(System.Collections.Generic.List`1<ZNetPeer>,System.Boolean)
IL_0193: nop
IL_0194: nop
IL_0195: ldarg.0
IL_0196: ldnull
IL_0197: stfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<adminPeer>5__3
IL_019c: ldarg.0
IL_019d: ldnull
IL_019e: stfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/RegisterRPCPatch/<<Postfix>g__WatchAdminListChanges|0_0>d::<nonAdminPeer>5__4
IL_01a3: nop
IL_01a4: br IL_00ac

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
IL_0018: brfalse IL_004a
IL_001d: ldarg.0
IL_001e: ldfld System.Reflection.MethodInfo ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::listContainsId
IL_0023: call ZNet ZNet::get_instance()
IL_0028: ldc.i4.2
IL_0029: newarr System.Object
IL_002e: dup
IL_002f: ldc.i4.0
IL_0030: ldarg.0
IL_0031: ldfld SyncedList ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::adminList
IL_0036: stelem.ref
IL_0037: dup
IL_0038: ldc.i4.1
IL_0039: ldloc.0
IL_003a: stelem.ref
IL_003b: callvirt System.Object System.Reflection.MethodBase::Invoke(System.Object,System.Object[])
IL_0040: unbox.any System.Boolean
IL_0045: br IL_0056
IL_004a: ldarg.0
IL_004b: ldfld SyncedList ServerSync.ConfigSync/RegisterRPCPatch/<>c__DisplayClass0_0::adminList
IL_0050: ldloc.0
IL_0051: callvirt System.Boolean SyncedList::Contains(System.String)
IL_0056: stloc.1
IL_0057: br IL_005c
IL_005c: ldloc.1
IL_005d: ret

// System.Void ServerSync.ConfigSync/RegisterClientRPCPatch::Postfix(ZNet,ZNetPeer)
.locals System.Boolean, System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>, ServerSync.ConfigSync
IL_0000: nop
IL_0001: ldarg.0
IL_0002: callvirt System.Boolean ZNet::IsServer()
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: brfalse IL_0073
IL_0011: nop
IL_0012: nop
IL_0013: ldsfld System.Collections.Generic.HashSet`1<ServerSync.ConfigSync> ServerSync.ConfigSync::configSyncs
IL_0018: callvirt System.Collections.Generic.HashSet`1/Enumerator<!0> System.Collections.Generic.HashSet`1<ServerSync.ConfigSync>::GetEnumerator()
IL_001d: stloc.1
IL_001e: br IL_0055
IL_0023: ldloca.s V_1
IL_0025: call !0 System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>::get_Current()
IL_002a: stloc.2
IL_002b: nop
IL_002c: ldarg.1
IL_002d: ldfld ZRpc ZNetPeer::m_rpc
IL_0032: ldloc.2
IL_0033: ldfld System.String ServerSync.ConfigSync::Name
IL_0038: ldstr " ConfigSync"
IL_003d: call System.String System.String::Concat(System.String,System.String)
IL_0042: ldloc.2
IL_0043: ldftn System.Void ServerSync.ConfigSync::RPC_FromServerConfigSync(ZRpc,ZPackage)
IL_0049: newobj System.Void System.Action`2<ZRpc,ZPackage>::.ctor(System.Object,System.IntPtr)
IL_004e: callvirt System.Void ZRpc::Register<ZPackage>(System.String,System.Action`2<ZRpc,!!0>)
IL_0053: nop
IL_0054: nop
IL_0055: ldloca.s V_1
IL_0057: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>::MoveNext()
IL_005c: brtrue.s IL_0023
IL_005e: leave IL_0072
IL_0063: ldloca.s V_1
IL_0065: constrained. System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>
IL_006b: callvirt System.Void System.IDisposable::Dispose()
IL_0070: nop
IL_0071: endfinally
IL_0072: nop
IL_0073: ret
// EH Finally: 30 - 99 => 99 - 114

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
IL_0013: br IL_0039
IL_0018: ldloca.s V_0
IL_001a: call !0 System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>::get_Current()
IL_001f: stloc.1
IL_0020: nop
IL_0021: ldloc.1
IL_0022: callvirt System.Void ServerSync.ConfigSync::resetConfigsFromServer()
IL_0027: nop
IL_0028: ldloc.1
IL_0029: ldc.i4.1
IL_002a: callvirt System.Void ServerSync.ConfigSync::set_IsSourceOfTruth(System.Boolean)
IL_002f: nop
IL_0030: ldloc.1
IL_0031: ldc.i4.0
IL_0032: callvirt System.Void ServerSync.ConfigSync::set_InitialSyncDone(System.Boolean)
IL_0037: nop
IL_0038: nop
IL_0039: ldloca.s V_0
IL_003b: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>::MoveNext()
IL_0040: brtrue.s IL_0018
IL_0042: leave IL_0056
IL_0047: ldloca.s V_0
IL_0049: constrained. System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>
IL_004f: callvirt System.Void System.IDisposable::Dispose()
IL_0054: nop
IL_0055: endfinally
IL_0056: ldc.i4.0
IL_0057: stsfld System.Boolean ServerSync.ConfigSync::ProcessingServerUpdate
IL_005c: ret
// EH Finally: 19 - 71 => 71 - 86

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
IL_0009: brfalse IL_0110
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
IL_0076: brfalse IL_0088
IL_007b: ldsfld OnlineBackendType ZNet::m_onlineBackend
IL_0080: ldc.i4.0
IL_0081: cgt.un
IL_0083: br IL_0089
IL_0088: ldc.i4.0
IL_0089: stloc.3
IL_008a: ldloc.3
IL_008b: brfalse IL_00f3
IL_0090: nop
IL_0091: ldtoken ZNetPeer
IL_0096: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_009b: ldstr "m_socket"
IL_00a0: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_00a5: stloc.s V_4
IL_00a7: ldloc.s V_4
IL_00a9: ldloc.2
IL_00aa: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_00af: isinst ZPlayFabSocket
IL_00b4: stloc.s V_5
IL_00b6: ldloc.s V_5
IL_00b8: ldnull
IL_00b9: cgt.un
IL_00bb: stloc.s V_6
IL_00bd: ldloc.s V_6
IL_00bf: brfalse IL_00e8
IL_00c4: nop
IL_00c5: ldtoken ZPlayFabSocket
IL_00ca: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00cf: ldstr "m_remotePlayerId"
IL_00d4: call System.Reflection.FieldInfo System.Type::GetField(System.String)
IL_00d9: ldloc.1
IL_00da: ldloc.s V_5
IL_00dc: ldfld System.String ZPlayFabSocket::m_remotePlayerId
IL_00e1: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_00e6: nop
IL_00e7: nop
IL_00e8: ldloc.s V_4
IL_00ea: ldloc.2
IL_00eb: ldloc.1
IL_00ec: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_00f1: nop
IL_00f2: nop
IL_00f3: ldarg.0
IL_00f4: ldind.ref
IL_00f5: brtrue IL_0101
IL_00fa: ldarg.0
IL_00fb: newobj System.Void System.Collections.Generic.Dictionary`2<System.Reflection.Assembly,ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket>::.ctor()
IL_0100: stind.ref
IL_0101: ldarg.0
IL_0102: ldind.ref
IL_0103: call System.Reflection.Assembly System.Reflection.Assembly::GetExecutingAssembly()
IL_0108: ldloc.1
IL_0109: callvirt System.Void System.Collections.Generic.Dictionary`2<System.Reflection.Assembly,ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket>::set_Item(!0,!1)
IL_010e: nop
IL_010f: nop
IL_0110: ret

// System.Void ServerSync.ConfigSync/SendConfigsAfterLogin::Postfix(System.Collections.Generic.Dictionary`2<System.Reflection.Assembly,ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket>,ZNet,ZRpc)
.locals ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0, System.Boolean, System.Object, System.Boolean
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
IL_002c: brfalse IL_0037
IL_0031: nop
IL_0032: br IL_00ba
IL_0037: nop
IL_0038: ldtoken ZNet
IL_003d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0042: ldstr "GetPeer"
IL_0047: ldc.i4.1
IL_0048: newarr System.Type
IL_004d: dup
IL_004e: ldc.i4.0
IL_004f: ldtoken ZRpc
IL_0054: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0059: stelem.ref
IL_005a: ldnull
IL_005b: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_0060: ldloc.0
IL_0061: ldfld ZNet ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::__instance
IL_0066: ldc.i4.1
IL_0067: newarr System.Object
IL_006c: dup
IL_006d: ldc.i4.0
IL_006e: ldloc.0
IL_006f: ldfld ZRpc ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::rpc
IL_0074: stelem.ref
IL_0075: callvirt System.Object System.Reflection.MethodBase::Invoke(System.Object,System.Object[])
IL_007a: stloc.2
IL_007b: ldloc.0
IL_007c: ldloc.2
IL_007d: isinst ZNetPeer
IL_0082: stfld ZNetPeer ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::peer
IL_0087: ldloc.0
IL_0088: ldfld ZNetPeer ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::peer
IL_008d: ldnull
IL_008e: cgt.un
IL_0090: ldc.i4.0
IL_0091: ceq
IL_0093: stloc.3
IL_0094: ldloc.3
IL_0095: brfalse IL_00a7
IL_009a: nop
IL_009b: ldloc.0
IL_009c: callvirt System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::<Postfix>g__SendBufferedData|0()
IL_00a1: nop
IL_00a2: br IL_00ba
IL_00a7: nop
IL_00a8: ldloc.0
IL_00a9: ldfld ZNet ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::__instance
IL_00ae: ldloc.0
IL_00af: callvirt System.Collections.IEnumerator ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::<Postfix>g__sendAsync|1()
IL_00b4: callvirt UnityEngine.Coroutine UnityEngine.MonoBehaviour::StartCoroutine(System.Collections.IEnumerator)
IL_00b9: pop
IL_00ba: ret

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
IL_000b: brfalse IL_0023
IL_0010: nop
IL_0011: ldarg.0
IL_0012: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0017: callvirt System.Void ISocket::VersionMatch()
IL_001c: nop
IL_001d: nop
IL_001e: br IL_0038
IL_0023: nop
IL_0024: ldarg.0
IL_0025: ldarg.0
IL_0026: ldfld System.Collections.Generic.List`1<ZPackage> ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Package
IL_002b: callvirt System.Int32 System.Collections.Generic.List`1<ZPackage>::get_Count()
IL_0030: volatile.
IL_0032: stfld System.Int32 modreq(System.Runtime.CompilerServices.IsVolatile) ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::versionMatchQueued
IL_0037: nop
IL_0038: ret

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
IL_0022: beq IL_0047
IL_0027: ldloc.1
IL_0028: ldstr "RoutedRPC"
IL_002d: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0032: beq IL_0047
IL_0037: ldloc.1
IL_0038: ldstr "ZDOData"
IL_003d: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0042: bne.un IL_0057
IL_0047: ldarg.0
IL_0048: volatile.
IL_004a: ldfld System.Boolean modreq(System.Runtime.CompilerServices.IsVolatile) ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::finished
IL_004f: ldc.i4.0
IL_0050: ceq
IL_0052: br IL_0058
IL_0057: ldc.i4.0
IL_0058: stloc.2
IL_0059: ldloc.2
IL_005a: brfalse IL_0087
IL_005f: nop
IL_0060: ldarg.1
IL_0061: callvirt System.Byte[] ZPackage::GetArray()
IL_0066: newobj System.Void ZPackage::.ctor(System.Byte[])
IL_006b: stloc.3
IL_006c: ldloc.3
IL_006d: ldloc.0
IL_006e: callvirt System.Void ZPackage::SetPos(System.Int32)
IL_0073: nop
IL_0074: ldarg.0
IL_0075: ldfld System.Collections.Generic.List`1<ZPackage> ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Package
IL_007a: ldloc.3
IL_007b: callvirt System.Void System.Collections.Generic.List`1<ZPackage>::Add(!0)
IL_0080: nop
IL_0081: nop
IL_0082: br IL_009e
IL_0087: nop
IL_0088: ldarg.1
IL_0089: ldloc.0
IL_008a: callvirt System.Void ZPackage::SetPos(System.Int32)
IL_008f: nop
IL_0090: ldarg.0
IL_0091: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0096: ldarg.1
IL_0097: callvirt System.Void ISocket::Send(ZPackage)
IL_009c: nop
IL_009d: nop
IL_009e: ret

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
IL_0018: brfalse IL_00bb
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
IL_0092: brfalse IL_00ba
IL_0097: nop
IL_0098: ldtoken ZNetPeer
IL_009d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00a2: ldstr "m_socket"
IL_00a7: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_00ac: ldloc.2
IL_00ad: ldloc.0
IL_00ae: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_00b3: callvirt System.Void System.Reflection.FieldInfo::SetValue(System.Object,System.Object)
IL_00b8: nop
IL_00b9: nop
IL_00ba: nop
IL_00bb: ldarg.0
IL_00bc: ldfld System.Collections.Generic.Dictionary`2<System.Reflection.Assembly,ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::__state
IL_00c1: call System.Reflection.Assembly System.Reflection.Assembly::GetExecutingAssembly()
IL_00c6: callvirt !1 System.Collections.Generic.Dictionary`2<System.Reflection.Assembly,ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket>::get_Item(!0)
IL_00cb: stloc.0
IL_00cc: ldloc.0
IL_00cd: ldc.i4.1
IL_00ce: volatile.
IL_00d0: stfld System.Boolean modreq(System.Runtime.CompilerServices.IsVolatile) ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::finished
IL_00d5: ldc.i4.0
IL_00d6: stloc.s V_4
IL_00d8: br IL_0121
IL_00dd: nop
IL_00de: ldloc.s V_4
IL_00e0: ldloc.0
IL_00e1: volatile.
IL_00e3: ldfld System.Int32 modreq(System.Runtime.CompilerServices.IsVolatile) ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::versionMatchQueued
IL_00e8: ceq
IL_00ea: stloc.s V_5
IL_00ec: ldloc.s V_5
IL_00ee: brfalse IL_0101
IL_00f3: nop
IL_00f4: ldloc.0
IL_00f5: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_00fa: callvirt System.Void ISocket::VersionMatch()
IL_00ff: nop
IL_0100: nop
IL_0101: ldloc.0
IL_0102: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_0107: ldloc.0
IL_0108: ldfld System.Collections.Generic.List`1<ZPackage> ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Package
IL_010d: ldloc.s V_4
IL_010f: callvirt !0 System.Collections.Generic.List`1<ZPackage>::get_Item(System.Int32)
IL_0114: callvirt System.Void ISocket::Send(ZPackage)
IL_0119: nop
IL_011a: nop
IL_011b: ldloc.s V_4
IL_011d: ldc.i4.1
IL_011e: add
IL_011f: stloc.s V_4
IL_0121: ldloc.s V_4
IL_0123: ldloc.0
IL_0124: ldfld System.Collections.Generic.List`1<ZPackage> ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Package
IL_0129: callvirt System.Int32 System.Collections.Generic.List`1<ZPackage>::get_Count()
IL_012e: clt
IL_0130: stloc.s V_6
IL_0132: ldloc.s V_6
IL_0134: brtrue.s IL_00dd
IL_0136: ldloc.0
IL_0137: ldfld System.Collections.Generic.List`1<ZPackage> ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Package
IL_013c: callvirt System.Int32 System.Collections.Generic.List`1<ZPackage>::get_Count()
IL_0141: ldloc.0
IL_0142: volatile.
IL_0144: ldfld System.Int32 modreq(System.Runtime.CompilerServices.IsVolatile) ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::versionMatchQueued
IL_0149: ceq
IL_014b: stloc.s V_7
IL_014d: ldloc.s V_7
IL_014f: brfalse IL_0162
IL_0154: nop
IL_0155: ldloc.0
IL_0156: ldfld ISocket ServerSync.ConfigSync/SendConfigsAfterLogin/BufferingSocket::Original
IL_015b: callvirt System.Void ISocket::VersionMatch()
IL_0160: nop
IL_0161: nop
IL_0162: ret

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
IL_000a: beq IL_0020
IL_000f: br IL_0014
IL_0014: ldloc.0
IL_0015: ldc.i4.1
IL_0016: beq IL_0020
IL_001b: br IL_0032
IL_0020: nop
IL_0021: leave IL_002d
IL_0026: ldarg.0
IL_0027: call System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>m__Finally1()
IL_002c: endfinally
IL_002d: br IL_0032
IL_0032: ldarg.0
IL_0033: ldflda System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>s__1
IL_0038: initobj System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>
IL_003e: ldarg.0
IL_003f: ldnull
IL_0040: stfld ServerSync.ConfigSync ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<configSync>5__2
IL_0045: ldarg.0
IL_0046: ldnull
IL_0047: stfld System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<entries>5__3
IL_004c: ldarg.0
IL_004d: ldnull
IL_004e: stfld System.Reflection.MethodInfo ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<listContainsId>5__4
IL_0053: ldarg.0
IL_0054: ldnull
IL_0055: stfld SyncedList ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<adminList>5__5
IL_005a: ldarg.0
IL_005b: ldnull
IL_005c: stfld ZPackage ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<package>5__6
IL_0061: ldarg.0
IL_0062: ldc.i4.s -2
IL_0064: stfld System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>1__state
IL_0069: ret
// EH Finally: 33 - 38 => 38 - 45

// System.Boolean ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::MoveNext()
.locals System.Int32, System.Boolean, System.Boolean, ServerSync.ConfigSync/PackageEntry
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>1__state
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: brfalse IL_001e
IL_000d: br IL_0012
IL_0012: ldloc.0
IL_0013: ldc.i4.1
IL_0014: beq IL_0023
IL_0019: br IL_0028
IL_001e: br IL_002f
IL_0023: br IL_025e
IL_0028: ldc.i4.0
IL_0029: stloc.1
IL_002a: leave IL_02c8
IL_002f: ldarg.0
IL_0030: ldc.i4.m1
IL_0031: stfld System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>1__state
IL_0036: nop
IL_0037: nop
IL_0038: ldarg.0
IL_0039: ldsfld System.Collections.Generic.HashSet`1<ServerSync.ConfigSync> ServerSync.ConfigSync::configSyncs
IL_003e: callvirt System.Collections.Generic.HashSet`1/Enumerator<!0> System.Collections.Generic.HashSet`1<ServerSync.ConfigSync>::GetEnumerator()
IL_0043: stfld System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>s__1
IL_0048: ldarg.0
IL_0049: ldc.i4.s -3
IL_004b: stfld System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>1__state
IL_0050: br IL_028a
IL_0055: ldarg.0
IL_0056: ldarg.0
IL_0057: ldflda System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>s__1
IL_005c: call !0 System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>::get_Current()
IL_0061: stfld ServerSync.ConfigSync ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<configSync>5__2
IL_0066: nop
IL_0067: ldarg.0
IL_0068: newobj System.Void System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry>::.ctor()
IL_006d: stfld System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<entries>5__3
IL_0072: ldarg.0
IL_0073: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<configSync>5__2
IL_0078: ldfld System.String ServerSync.ConfigSync::CurrentVersion
IL_007d: ldnull
IL_007e: cgt.un
IL_0080: stloc.2
IL_0081: ldloc.2
IL_0082: brfalse IL_00d3
IL_0087: nop
IL_0088: ldarg.0
IL_0089: ldfld System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<entries>5__3
IL_008e: newobj System.Void ServerSync.ConfigSync/PackageEntry::.ctor()
IL_0093: stloc.3
IL_0094: ldloc.3
IL_0095: ldstr "Internal"
IL_009a: stfld System.String ServerSync.ConfigSync/PackageEntry::section
IL_009f: ldloc.3
IL_00a0: ldstr "serverversion"
IL_00a5: stfld System.String ServerSync.ConfigSync/PackageEntry::key
IL_00aa: ldloc.3
IL_00ab: ldtoken System.String
IL_00b0: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00b5: stfld System.Type ServerSync.ConfigSync/PackageEntry::type
IL_00ba: ldloc.3
IL_00bb: ldarg.0
IL_00bc: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<configSync>5__2
IL_00c1: ldfld System.String ServerSync.ConfigSync::CurrentVersion
IL_00c6: stfld System.Object ServerSync.ConfigSync/PackageEntry::value
IL_00cb: ldloc.3
IL_00cc: callvirt System.Void System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry>::Add(!0)
IL_00d1: nop
IL_00d2: nop
IL_00d3: ldarg.0
IL_00d4: ldtoken ZNet
IL_00d9: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00de: ldstr "ListContainsId"
IL_00e3: ldnull
IL_00e4: ldnull
IL_00e5: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_00ea: stfld System.Reflection.MethodInfo ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<listContainsId>5__4
IL_00ef: ldarg.0
IL_00f0: ldtoken ZNet
IL_00f5: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00fa: ldstr "m_adminList"
IL_00ff: call System.Reflection.FieldInfo HarmonyLib.AccessTools::DeclaredField(System.Type,System.String)
IL_0104: call ZNet ZNet::get_instance()
IL_0109: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_010e: castclass SyncedList
IL_0113: stfld SyncedList ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<adminList>5__5
IL_0118: ldarg.0
IL_0119: ldfld System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<entries>5__3
IL_011e: newobj System.Void ServerSync.ConfigSync/PackageEntry::.ctor()
IL_0123: stloc.3
IL_0124: ldloc.3
IL_0125: ldstr "Internal"
IL_012a: stfld System.String ServerSync.ConfigSync/PackageEntry::section
IL_012f: ldloc.3
IL_0130: ldstr "lockexempt"
IL_0135: stfld System.String ServerSync.ConfigSync/PackageEntry::key
IL_013a: ldloc.3
IL_013b: ldtoken System.Boolean
IL_0140: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0145: stfld System.Type ServerSync.ConfigSync/PackageEntry::type
IL_014a: ldloc.3
IL_014b: ldarg.0
IL_014c: ldfld System.Reflection.MethodInfo ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<listContainsId>5__4
IL_0151: brfalse IL_0192
IL_0156: ldarg.0
IL_0157: ldfld System.Reflection.MethodInfo ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<listContainsId>5__4
IL_015c: call ZNet ZNet::get_instance()
IL_0161: ldc.i4.2
IL_0162: newarr System.Object
IL_0167: dup
IL_0168: ldc.i4.0
IL_0169: ldarg.0
IL_016a: ldfld SyncedList ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<adminList>5__5
IL_016f: stelem.ref
IL_0170: dup
IL_0171: ldc.i4.1
IL_0172: ldarg.0
IL_0173: ldfld ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>4__this
IL_0178: ldfld ZRpc ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::rpc
IL_017d: callvirt ISocket ZRpc::GetSocket()
IL_0182: callvirt System.String ISocket::GetHostName()
IL_0187: stelem.ref
IL_0188: callvirt System.Object System.Reflection.MethodBase::Invoke(System.Object,System.Object[])
IL_018d: br IL_01b7
IL_0192: ldarg.0
IL_0193: ldfld SyncedList ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<adminList>5__5
IL_0198: ldarg.0
IL_0199: ldfld ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>4__this
IL_019e: ldfld ZRpc ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::rpc
IL_01a3: callvirt ISocket ZRpc::GetSocket()
IL_01a8: callvirt System.String ISocket::GetHostName()
IL_01ad: callvirt System.Boolean SyncedList::Contains(System.String)
IL_01b2: box System.Boolean
IL_01b7: stfld System.Object ServerSync.ConfigSync/PackageEntry::value
IL_01bc: ldloc.3
IL_01bd: callvirt System.Void System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry>::Add(!0)
IL_01c2: nop
IL_01c3: ldarg.0
IL_01c4: ldarg.0
IL_01c5: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<configSync>5__2
IL_01ca: ldfld System.Collections.Generic.HashSet`1<ServerSync.OwnConfigEntryBase> ServerSync.ConfigSync::allConfigs
IL_01cf: ldsfld System.Func`2<ServerSync.OwnConfigEntryBase,BepInEx.Configuration.ConfigEntryBase> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c::<>9__2_2
IL_01d4: dup
IL_01d5: brtrue IL_01f1
IL_01da: pop
IL_01db: ldsfld ServerSync.ConfigSync/SendConfigsAfterLogin/<>c ServerSync.ConfigSync/SendConfigsAfterLogin/<>c::<>9
IL_01e0: ldftn BepInEx.Configuration.ConfigEntryBase ServerSync.ConfigSync/SendConfigsAfterLogin/<>c::<Postfix>b__2_2(ServerSync.OwnConfigEntryBase)
IL_01e6: newobj System.Void System.Func`2<ServerSync.OwnConfigEntryBase,BepInEx.Configuration.ConfigEntryBase>::.ctor(System.Object,System.IntPtr)
IL_01eb: dup
IL_01ec: stsfld System.Func`2<ServerSync.OwnConfigEntryBase,BepInEx.Configuration.ConfigEntryBase> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c::<>9__2_2
IL_01f1: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::Select<ServerSync.OwnConfigEntryBase,BepInEx.Configuration.ConfigEntryBase>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_01f6: ldarg.0
IL_01f7: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<configSync>5__2
IL_01fc: ldfld System.Collections.Generic.HashSet`1<ServerSync.CustomSyncedValueBase> ServerSync.ConfigSync::allCustomValues
IL_0201: ldarg.0
IL_0202: ldfld System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<entries>5__3
IL_0207: ldc.i4.0
IL_0208: call ZPackage ServerSync.ConfigSync::ConfigsToPackage(System.Collections.Generic.IEnumerable`1<BepInEx.Configuration.ConfigEntryBase>,System.Collections.Generic.IEnumerable`1<ServerSync.CustomSyncedValueBase>,System.Collections.Generic.IEnumerable`1<ServerSync.ConfigSync/PackageEntry>,System.Boolean)
IL_020d: stfld ZPackage ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<package>5__6
IL_0212: ldarg.0
IL_0213: ldarg.0
IL_0214: ldfld ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>4__this
IL_0219: ldfld ZNet ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::__instance
IL_021e: ldarg.0
IL_021f: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<configSync>5__2
IL_0224: newobj System.Void System.Collections.Generic.List`1<ZNetPeer>::.ctor()
IL_0229: dup
IL_022a: ldarg.0
IL_022b: ldfld ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>4__this
IL_0230: ldfld ZNetPeer ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::peer
IL_0235: callvirt System.Void System.Collections.Generic.List`1<ZNetPeer>::Add(!0)
IL_023a: nop
IL_023b: ldarg.0
IL_023c: ldfld ZPackage ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<package>5__6
IL_0241: callvirt System.Collections.IEnumerator ServerSync.ConfigSync::sendZPackage(System.Collections.Generic.List`1<ZNetPeer>,ZPackage)
IL_0246: callvirt UnityEngine.Coroutine UnityEngine.MonoBehaviour::StartCoroutine(System.Collections.IEnumerator)
IL_024b: stfld System.Object ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>2__current
IL_0250: ldarg.0
IL_0251: ldc.i4.1
IL_0252: stfld System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>1__state
IL_0257: ldc.i4.1
IL_0258: stloc.1
IL_0259: leave IL_02c8
IL_025e: ldarg.0
IL_025f: ldc.i4.s -3
IL_0261: stfld System.Int32 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>1__state
IL_0266: nop
IL_0267: ldarg.0
IL_0268: ldnull
IL_0269: stfld System.Collections.Generic.List`1<ServerSync.ConfigSync/PackageEntry> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<entries>5__3
IL_026e: ldarg.0
IL_026f: ldnull
IL_0270: stfld System.Reflection.MethodInfo ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<listContainsId>5__4
IL_0275: ldarg.0
IL_0276: ldnull
IL_0277: stfld SyncedList ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<adminList>5__5
IL_027c: ldarg.0
IL_027d: ldnull
IL_027e: stfld ZPackage ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<package>5__6
IL_0283: ldarg.0
IL_0284: ldnull
IL_0285: stfld ServerSync.ConfigSync ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<configSync>5__2
IL_028a: ldarg.0
IL_028b: ldflda System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>s__1
IL_0290: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>::MoveNext()
IL_0295: brtrue IL_0055
IL_029a: ldarg.0
IL_029b: call System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>m__Finally1()
IL_02a0: nop
IL_02a1: ldarg.0
IL_02a2: ldflda System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync> ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>s__1
IL_02a7: initobj System.Collections.Generic.HashSet`1/Enumerator<ServerSync.ConfigSync>
IL_02ad: ldarg.0
IL_02ae: ldfld ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0 ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::<>4__this
IL_02b3: call System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0::<Postfix>g__SendBufferedData|0()
IL_02b8: nop
IL_02b9: ldc.i4.0
IL_02ba: stloc.1
IL_02bb: leave IL_02c8
IL_02c0: ldarg.0
IL_02c1: call System.Void ServerSync.ConfigSync/SendConfigsAfterLogin/<>c__DisplayClass2_0/<<Postfix>g__sendAsync|1>d::System.IDisposable.Dispose()
IL_02c6: nop
IL_02c7: endfinally
IL_02c8: ldloc.1
IL_02c9: ret
// EH Fault: 0 - 704 => 704 - 712

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
IL_0009: brfalse IL_0019
IL_000e: ldloc.0
IL_000f: call System.Boolean ServerSync.ConfigSync::isWritableConfig(ServerSync.OwnConfigEntryBase)
IL_0014: br IL_001a
IL_0019: ldc.i4.1
IL_001a: stloc.1
IL_001b: ldloc.1
IL_001c: brfalse IL_0029
IL_0021: nop
IL_0022: ldc.i4.1
IL_0023: stloc.2
IL_0024: br IL_0043
IL_0029: ldarg.1
IL_002a: ldloc.0
IL_002b: ldfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_0030: ldarg.0
IL_0031: callvirt System.Type BepInEx.Configuration.ConfigEntryBase::get_SettingType()
IL_0036: call System.String BepInEx.Configuration.TomlTypeConverter::ConvertToString(System.Object,System.Type)
IL_003b: stind.ref
IL_003c: ldc.i4.0
IL_003d: stloc.2
IL_003e: br IL_0043
IL_0043: ldloc.2
IL_0044: ret

// System.Boolean ServerSync.ConfigSync/PreventConfigRereadChangingValues::Prefix(BepInEx.Configuration.ConfigEntryBase,System.String)
.locals ServerSync.OwnConfigEntryBase, System.Boolean, System.Boolean, System.Exception
IL_0000: nop
IL_0001: ldarg.0
IL_0002: call ServerSync.OwnConfigEntryBase ServerSync.ConfigSync::configData(BepInEx.Configuration.ConfigEntryBase)
IL_0007: stloc.0
IL_0008: ldloc.0
IL_0009: brfalse IL_001c
IL_000e: ldloc.0
IL_000f: ldfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_0014: ldnull
IL_0015: ceq
IL_0017: br IL_001d
IL_001c: ldc.i4.1
IL_001d: stloc.1
IL_001e: ldloc.1
IL_001f: brfalse IL_002c
IL_0024: nop
IL_0025: ldc.i4.1
IL_0026: stloc.2
IL_0027: br IL_0072
IL_002c: nop
IL_002d: nop
IL_002e: ldloc.0
IL_002f: ldarg.1
IL_0030: ldarg.0
IL_0031: callvirt System.Type BepInEx.Configuration.ConfigEntryBase::get_SettingType()
IL_0036: call System.Object BepInEx.Configuration.TomlTypeConverter::ConvertToValue(System.String,System.Type)
IL_003b: stfld System.Object ServerSync.OwnConfigEntryBase::LocalBaseValue
IL_0040: nop
IL_0041: leave IL_006b
IL_0046: stloc.3
IL_0047: nop
IL_0048: ldstr "Config value of setting "{0}" could not be parsed and will be ignored. Reason: {1}; Value: {2}"
IL_004d: ldarg.0
IL_004e: callvirt BepInEx.Configuration.ConfigDefinition BepInEx.Configuration.ConfigEntryBase::get_Definition()
IL_0053: ldloc.3
IL_0054: callvirt System.String System.Exception::get_Message()
IL_0059: ldarg.1
IL_005a: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_005f: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_0064: nop
IL_0065: nop
IL_0066: leave IL_006b
IL_006b: ldc.i4.0
IL_006c: stloc.2
IL_006d: br IL_0072
IL_0072: ldloc.2
IL_0073: ret
// EH Catch: 45 - 70 => 70 - 107

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
IL_0006: brtrue IL_001b
IL_000b: ldarg.0
IL_000c: ldfld ServerSync.SyncedConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::syncedEntry
IL_0011: ldfld System.Boolean ServerSync.OwnConfigEntryBase::SynchronizedConfig
IL_0016: br IL_001c
IL_001b: ldc.i4.0
IL_001c: stloc.0
IL_001d: ldloc.0
IL_001e: brfalse IL_0042
IL_0023: nop
IL_0024: ldarg.0
IL_0025: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::<>4__this
IL_002a: ldc.i4.0
IL_002b: conv.i8
IL_002c: ldc.i4.1
IL_002d: newarr BepInEx.Configuration.ConfigEntryBase
IL_0032: dup
IL_0033: ldc.i4.0
IL_0034: ldarg.0
IL_0035: ldfld BepInEx.Configuration.ConfigEntry`1<T> ServerSync.ConfigSync/<>c__DisplayClass34_0`1<T>::configEntry
IL_003a: stelem.ref
IL_003b: call System.Void ServerSync.ConfigSync::Broadcast(System.Int64,BepInEx.Configuration.ConfigEntryBase[])
IL_0040: nop
IL_0041: nop
IL_0042: ret

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
IL_000b: brfalse IL_002f
IL_0010: nop
IL_0011: ldarg.0
IL_0012: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/<>c__DisplayClass36_0::<>4__this
IL_0017: ldc.i4.0
IL_0018: conv.i8
IL_0019: ldc.i4.1
IL_001a: newarr ServerSync.CustomSyncedValueBase
IL_001f: dup
IL_0020: ldc.i4.0
IL_0021: ldarg.0
IL_0022: ldfld ServerSync.CustomSyncedValueBase ServerSync.ConfigSync/<>c__DisplayClass36_0::customValue
IL_0027: stelem.ref
IL_0028: call System.Void ServerSync.ConfigSync::Broadcast(System.Int64,ServerSync.CustomSyncedValueBase[])
IL_002d: nop
IL_002e: nop
IL_002f: ret

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
IL_001e: brfalse IL_0046
IL_0023: nop
IL_0024: ldarg.0
IL_0025: ldfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_002a: ldfld ZRpc ZNetPeer::m_rpc
IL_002f: ldloc.0
IL_0030: ldc.i4.1
IL_0031: newarr System.Object
IL_0036: dup
IL_0037: ldc.i4.0
IL_0038: ldarg.1
IL_0039: stelem.ref
IL_003a: callvirt System.Void ZRpc::Invoke(System.String,System.Object[])
IL_003f: nop
IL_0040: nop
IL_0041: br IL_0081
IL_0046: nop
IL_0047: ldarg.0
IL_0048: ldfld ZRoutedRpc ServerSync.ConfigSync/<>c__DisplayClass55_0::rpc
IL_004d: ldarg.0
IL_004e: ldfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_0053: ldfld System.Boolean ZNetPeer::m_server
IL_0058: brtrue IL_006d
IL_005d: ldarg.0
IL_005e: ldfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_0063: ldfld System.Int64 ZNetPeer::m_uid
IL_0068: br IL_006f
IL_006d: ldc.i4.0
IL_006e: conv.i8
IL_006f: ldloc.0
IL_0070: ldc.i4.1
IL_0071: newarr System.Object
IL_0076: dup
IL_0077: ldc.i4.0
IL_0078: ldarg.1
IL_0079: stelem.ref
IL_007a: callvirt System.Void ZRoutedRpc::InvokeRoutedRPC(System.Int64,System.String,System.Object[])
IL_007f: nop
IL_0080: nop
IL_0081: ret

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
IL_0008: brfalse IL_001e
IL_000d: br IL_0012
IL_0012: ldloc.0
IL_0013: ldc.i4.1
IL_0014: beq IL_0023
IL_0019: br IL_0028
IL_001e: br IL_002a
IL_0023: br IL_00d5
IL_0028: ldc.i4.0
IL_0029: ret
IL_002a: ldarg.0
IL_002b: ldc.i4.m1
IL_002c: stfld System.Int32 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>1__state
IL_0031: nop
IL_0032: ldarg.0
IL_0033: call System.Single UnityEngine.Time::get_time()
IL_0038: ldc.r4 30
IL_003d: add
IL_003e: stfld System.Single ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<timeout>5__1
IL_0043: br IL_00dd
IL_0048: nop
IL_0049: call System.Single UnityEngine.Time::get_time()
IL_004e: ldarg.0
IL_004f: ldfld System.Single ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<timeout>5__1
IL_0054: cgt
IL_0056: stloc.1
IL_0057: ldloc.1
IL_0058: brfalse IL_00c5
IL_005d: nop
IL_005e: ldstr "Disconnecting {0} after 30 seconds config sending timeout"
IL_0063: ldarg.0
IL_0064: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>4__this
IL_0069: ldfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_006e: ldfld System.Int64 ZNetPeer::m_uid
IL_0073: box System.Int64
IL_0078: call System.String System.String::Format(System.String,System.Object)
IL_007d: call System.Void UnityEngine.Debug::Log(System.Object)
IL_0082: nop
IL_0083: ldarg.0
IL_0084: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>4__this
IL_0089: ldfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_008e: ldfld ZRpc ZNetPeer::m_rpc
IL_0093: ldstr "Error"
IL_0098: ldc.i4.1
IL_0099: newarr System.Object
IL_009e: dup
IL_009f: ldc.i4.0
IL_00a0: ldc.i4.5
IL_00a1: box ZNet/ConnectionStatus
IL_00a6: stelem.ref
IL_00a7: callvirt System.Void ZRpc::Invoke(System.String,System.Object[])
IL_00ac: nop
IL_00ad: call ZNet ZNet::get_instance()
IL_00b2: ldarg.0
IL_00b3: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>4__this
IL_00b8: ldfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_00bd: callvirt System.Void ZNet::Disconnect(ZNetPeer)
IL_00c2: nop
IL_00c3: ldc.i4.0
IL_00c4: ret
IL_00c5: ldarg.0
IL_00c6: ldc.i4.0
IL_00c7: stfld System.Boolean ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>2__current
IL_00cc: ldarg.0
IL_00cd: ldc.i4.1
IL_00ce: stfld System.Int32 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>1__state
IL_00d3: ldc.i4.1
IL_00d4: ret
IL_00d5: ldarg.0
IL_00d6: ldc.i4.m1
IL_00d7: stfld System.Int32 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>1__state
IL_00dc: nop
IL_00dd: ldarg.0
IL_00de: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>4__this
IL_00e3: ldfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_00e8: ldfld ISocket ZNetPeer::m_socket
IL_00ed: callvirt System.Int32 ISocket::GetSendQueueSize()
IL_00f2: ldc.i4 20000
IL_00f7: cgt
IL_00f9: stloc.2
IL_00fa: ldloc.2
IL_00fb: brtrue IL_0048
IL_0100: ldc.i4.0
IL_0101: ret

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
IL_0008: bne.un IL_002b
IL_000d: ldarg.0
IL_000e: ldfld System.Int32 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>l__initialThreadId
IL_0013: call System.Int32 System.Environment::get_CurrentManagedThreadId()
IL_0018: bne.un IL_002b
IL_001d: ldarg.0
IL_001e: ldc.i4.0
IL_001f: stfld System.Int32 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>1__state
IL_0024: ldarg.0
IL_0025: stloc.0
IL_0026: br IL_003e
IL_002b: ldc.i4.0
IL_002c: newobj System.Void ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::.ctor(System.Int32)
IL_0031: stloc.0
IL_0032: ldloc.0
IL_0033: ldarg.0
IL_0034: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>4__this
IL_0039: stfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<>c__DisplayClass55_0/<<distributeConfigToPeers>g__waitForQueue|0>d::<>4__this
IL_003e: ldloc.0
IL_003f: ret

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
IL_000a: bgt IL_0029
IL_000f: ldloc.0
IL_0010: ldc.i4.s -4
IL_0012: beq IL_0053
IL_0017: br IL_001c
IL_001c: ldloc.0
IL_001d: ldc.i4.s -3
IL_001f: beq IL_0041
IL_0024: br IL_0065
IL_0029: ldloc.0
IL_002a: ldc.i4.1
IL_002b: beq IL_0041
IL_0030: br IL_0035
IL_0035: ldloc.0
IL_0036: ldc.i4.3
IL_0037: beq IL_0053
IL_003c: br IL_0065
IL_0041: nop
IL_0042: leave IL_004e
IL_0047: ldarg.0
IL_0048: call System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>m__Finally1()
IL_004d: endfinally
IL_004e: br IL_0065
IL_0053: nop
IL_0054: leave IL_0060
IL_0059: ldarg.0
IL_005a: call System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>m__Finally2()
IL_005f: endfinally
IL_0060: br IL_0065
IL_0065: ldarg.0
IL_0066: ldnull
IL_0067: stfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_006c: ldarg.0
IL_006d: ldnull
IL_006e: stfld System.Byte[] ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<data>5__2
IL_0073: ldarg.0
IL_0074: ldnull
IL_0075: stfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_007a: ldarg.0
IL_007b: ldnull
IL_007c: stfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__7
IL_0081: ldarg.0
IL_0082: ldnull
IL_0083: stfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__9
IL_0088: ldarg.0
IL_0089: ldc.i4.s -2
IL_008b: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0090: ret
// EH Finally: 66 - 71 => 71 - 78
// EH Finally: 84 - 89 => 89 - 96

// System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::MoveNext()
.locals System.Int32, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Boolean, System.Int32, System.Boolean
IL_0000: ldarg.0
IL_0001: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0006: stloc.0
IL_0007: ldloc.0
IL_0008: switch IL_0022,IL_0027,IL_002c,IL_0031
IL_001d: br IL_0036
IL_0022: br IL_003d
IL_0027: br IL_016b
IL_002c: br IL_027c
IL_0031: br IL_030c
IL_0036: ldc.i4.0
IL_0037: stloc.1
IL_0038: leave IL_0352
IL_003d: ldarg.0
IL_003e: ldc.i4.m1
IL_003f: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0044: ldarg.0
IL_0045: newobj System.Void ServerSync.ConfigSync/<>c__DisplayClass55_0::.ctor()
IL_004a: stfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_004f: ldarg.0
IL_0050: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_0055: ldarg.0
IL_0056: ldfld ZNetPeer ServerSync.ConfigSync/<distributeConfigToPeers>d__55::peer
IL_005b: stfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_0060: ldarg.0
IL_0061: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_0066: ldarg.0
IL_0067: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>4__this
IL_006c: stfld ServerSync.ConfigSync ServerSync.ConfigSync/<>c__DisplayClass55_0::<>4__this
IL_0071: nop
IL_0072: ldarg.0
IL_0073: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_0078: call ZRoutedRpc ZRoutedRpc::get_instance()
IL_007d: stfld ZRoutedRpc ServerSync.ConfigSync/<>c__DisplayClass55_0::rpc
IL_0082: ldarg.0
IL_0083: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_0088: ldfld ZRoutedRpc ServerSync.ConfigSync/<>c__DisplayClass55_0::rpc
IL_008d: ldnull
IL_008e: cgt.un
IL_0090: ldc.i4.0
IL_0091: ceq
IL_0093: stloc.2
IL_0094: ldloc.2
IL_0095: brfalse IL_00a2
IL_009a: nop
IL_009b: ldc.i4.0
IL_009c: stloc.1
IL_009d: leave IL_0352
IL_00a2: nop
IL_00a3: nop
IL_00a4: ldarg.0
IL_00a5: ldarg.0
IL_00a6: ldfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::package
IL_00ab: callvirt System.Byte[] ZPackage::GetArray()
IL_00b0: stfld System.Byte[] ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<data>5__2
IL_00b5: ldarg.0
IL_00b6: ldfld System.Byte[] ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<data>5__2
IL_00bb: brfalse IL_00d5
IL_00c0: ldarg.0
IL_00c1: ldfld System.Byte[] ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<data>5__2
IL_00c6: ldlen
IL_00c7: conv.i8
IL_00c8: ldc.i4 250000
IL_00cd: conv.i8
IL_00ce: cgt
IL_00d0: br IL_00d6
IL_00d5: ldc.i4.0
IL_00d6: stloc.3
IL_00d7: ldloc.3
IL_00d8: brfalse IL_02bb
IL_00dd: nop
IL_00de: ldarg.0
IL_00df: ldc.i4.1
IL_00e0: conv.i8
IL_00e1: ldarg.0
IL_00e2: ldfld System.Byte[] ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<data>5__2
IL_00e7: ldlen
IL_00e8: conv.i8
IL_00e9: ldc.i4.1
IL_00ea: conv.i8
IL_00eb: sub
IL_00ec: ldc.i4 250000
IL_00f1: conv.i8
IL_00f2: div
IL_00f3: add
IL_00f4: conv.i4
IL_00f5: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragments>5__3
IL_00fa: ldarg.0
IL_00fb: ldsfld System.Int64 ServerSync.ConfigSync::packageCounter
IL_0100: ldc.i4.1
IL_0101: conv.i8
IL_0102: add
IL_0103: dup
IL_0104: stsfld System.Int64 ServerSync.ConfigSync::packageCounter
IL_0109: stfld System.Int64 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<packageIdentifier>5__4
IL_010e: ldarg.0
IL_010f: ldc.i4.0
IL_0110: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragment>5__5
IL_0115: br IL_029e
IL_011a: nop
IL_011b: nop
IL_011c: ldarg.0
IL_011d: ldarg.0
IL_011e: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_0123: callvirt System.Collections.Generic.IEnumerable`1<System.Boolean> ServerSync.ConfigSync/<>c__DisplayClass55_0::<distributeConfigToPeers>g__waitForQueue|0()
IL_0128: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.Boolean>::GetEnumerator()
IL_012d: stfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__7
IL_0132: ldarg.0
IL_0133: ldc.i4.s -3
IL_0135: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_013a: br IL_0174
IL_013f: ldarg.0
IL_0140: ldarg.0
IL_0141: ldfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__7
IL_0146: callvirt !0 System.Collections.Generic.IEnumerator`1<System.Boolean>::get_Current()
IL_014b: stfld System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<wait>5__8
IL_0150: nop
IL_0151: ldarg.0
IL_0152: ldarg.0
IL_0153: ldfld System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<wait>5__8
IL_0158: stfld System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>2__current
IL_015d: ldarg.0
IL_015e: ldc.i4.1
IL_015f: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0164: ldc.i4.1
IL_0165: stloc.1
IL_0166: leave IL_0352
IL_016b: ldarg.0
IL_016c: ldc.i4.s -3
IL_016e: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0173: nop
IL_0174: ldarg.0
IL_0175: ldfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__7
IL_017a: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_017f: brtrue.s IL_013f
IL_0181: ldarg.0
IL_0182: call System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>m__Finally1()
IL_0187: nop
IL_0188: ldarg.0
IL_0189: ldnull
IL_018a: stfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__7
IL_018f: ldarg.0
IL_0190: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_0195: ldfld ZNetPeer ServerSync.ConfigSync/<>c__DisplayClass55_0::peer
IL_019a: ldfld ISocket ZNetPeer::m_socket
IL_019f: callvirt System.Boolean ISocket::IsConnected()
IL_01a4: ldc.i4.0
IL_01a5: ceq
IL_01a7: stloc.s V_4
IL_01a9: ldloc.s V_4
IL_01ab: brfalse IL_01b8
IL_01b0: nop
IL_01b1: ldc.i4.0
IL_01b2: stloc.1
IL_01b3: leave IL_0352
IL_01b8: ldarg.0
IL_01b9: newobj System.Void ZPackage::.ctor()
IL_01be: stfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_01c3: ldarg.0
IL_01c4: ldfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_01c9: ldc.i4.2
IL_01ca: callvirt System.Void ZPackage::Write(System.Byte)
IL_01cf: nop
IL_01d0: ldarg.0
IL_01d1: ldfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_01d6: ldarg.0
IL_01d7: ldfld System.Int64 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<packageIdentifier>5__4
IL_01dc: callvirt System.Void ZPackage::Write(System.Int64)
IL_01e1: nop
IL_01e2: ldarg.0
IL_01e3: ldfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_01e8: ldarg.0
IL_01e9: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragment>5__5
IL_01ee: callvirt System.Void ZPackage::Write(System.Int32)
IL_01f3: nop
IL_01f4: ldarg.0
IL_01f5: ldfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_01fa: ldarg.0
IL_01fb: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragments>5__3
IL_0200: callvirt System.Void ZPackage::Write(System.Int32)
IL_0205: nop
IL_0206: ldarg.0
IL_0207: ldfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_020c: ldarg.0
IL_020d: ldfld System.Byte[] ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<data>5__2
IL_0212: ldc.i4 250000
IL_0217: ldarg.0
IL_0218: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragment>5__5
IL_021d: mul
IL_021e: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Skip<System.Byte>(System.Collections.Generic.IEnumerable`1<!!0>,System.Int32)
IL_0223: ldc.i4 250000
IL_0228: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Take<System.Byte>(System.Collections.Generic.IEnumerable`1<!!0>,System.Int32)
IL_022d: call !!0[] System.Linq.Enumerable::ToArray<System.Byte>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0232: callvirt System.Void ZPackage::Write(System.Byte[])
IL_0237: nop
IL_0238: ldarg.0
IL_0239: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_023e: ldarg.0
IL_023f: ldfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_0244: callvirt System.Void ServerSync.ConfigSync/<>c__DisplayClass55_0::<distributeConfigToPeers>g__SendPackage|1(ZPackage)
IL_0249: nop
IL_024a: ldarg.0
IL_024b: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragment>5__5
IL_0250: ldarg.0
IL_0251: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragments>5__3
IL_0256: ldc.i4.1
IL_0257: sub
IL_0258: ceq
IL_025a: ldc.i4.0
IL_025b: ceq
IL_025d: stloc.s V_5
IL_025f: ldloc.s V_5
IL_0261: brfalse IL_0284
IL_0266: nop
IL_0267: ldarg.0
IL_0268: ldc.i4.1
IL_0269: stfld System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>2__current
IL_026e: ldarg.0
IL_026f: ldc.i4.2
IL_0270: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0275: ldc.i4.1
IL_0276: stloc.1
IL_0277: leave IL_0352
IL_027c: ldarg.0
IL_027d: ldc.i4.m1
IL_027e: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0283: nop
IL_0284: nop
IL_0285: ldarg.0
IL_0286: ldnull
IL_0287: stfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragmentedPackage>5__6
IL_028c: ldarg.0
IL_028d: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragment>5__5
IL_0292: ldc.i4.1
IL_0293: add
IL_0294: stloc.s V_6
IL_0296: ldarg.0
IL_0297: ldloc.s V_6
IL_0299: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragment>5__5
IL_029e: ldarg.0
IL_029f: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragment>5__5
IL_02a4: ldarg.0
IL_02a5: ldfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<fragments>5__3
IL_02aa: clt
IL_02ac: stloc.s V_7
IL_02ae: ldloc.s V_7
IL_02b0: brtrue IL_011a
IL_02b5: nop
IL_02b6: br IL_0343
IL_02bb: nop
IL_02bc: nop
IL_02bd: ldarg.0
IL_02be: ldarg.0
IL_02bf: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_02c4: callvirt System.Collections.Generic.IEnumerable`1<System.Boolean> ServerSync.ConfigSync/<>c__DisplayClass55_0::<distributeConfigToPeers>g__waitForQueue|0()
IL_02c9: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.Boolean>::GetEnumerator()
IL_02ce: stfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__9
IL_02d3: ldarg.0
IL_02d4: ldc.i4.s -4
IL_02d6: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_02db: br IL_0315
IL_02e0: ldarg.0
IL_02e1: ldarg.0
IL_02e2: ldfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__9
IL_02e7: callvirt !0 System.Collections.Generic.IEnumerator`1<System.Boolean>::get_Current()
IL_02ec: stfld System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<wait>5__10
IL_02f1: nop
IL_02f2: ldarg.0
IL_02f3: ldarg.0
IL_02f4: ldfld System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<wait>5__10
IL_02f9: stfld System.Boolean ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>2__current
IL_02fe: ldarg.0
IL_02ff: ldc.i4.3
IL_0300: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0305: ldc.i4.1
IL_0306: stloc.1
IL_0307: leave IL_0352
IL_030c: ldarg.0
IL_030d: ldc.i4.s -4
IL_030f: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0314: nop
IL_0315: ldarg.0
IL_0316: ldfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__9
IL_031b: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_0320: brtrue.s IL_02e0
IL_0322: ldarg.0
IL_0323: call System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>m__Finally2()
IL_0328: nop
IL_0329: ldarg.0
IL_032a: ldnull
IL_032b: stfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__9
IL_0330: ldarg.0
IL_0331: ldfld ServerSync.ConfigSync/<>c__DisplayClass55_0 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>8__1
IL_0336: ldarg.0
IL_0337: ldfld ZPackage ServerSync.ConfigSync/<distributeConfigToPeers>d__55::package
IL_033c: callvirt System.Void ServerSync.ConfigSync/<>c__DisplayClass55_0::<distributeConfigToPeers>g__SendPackage|1(ZPackage)
IL_0341: nop
IL_0342: nop
IL_0343: ldc.i4.0
IL_0344: stloc.1
IL_0345: leave IL_0352
IL_034a: ldarg.0
IL_034b: call System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::System.IDisposable.Dispose()
IL_0350: nop
IL_0351: endfinally
IL_0352: ldloc.1
IL_0353: ret
// EH Fault: 0 - 842 => 842 - 850

// System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>m__Finally1()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.m1
IL_0002: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0007: ldarg.0
IL_0008: ldfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__7
IL_000d: brfalse IL_001e
IL_0012: ldarg.0
IL_0013: ldfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__7
IL_0018: callvirt System.Void System.IDisposable::Dispose()
IL_001d: nop
IL_001e: ret

// System.Void ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>m__Finally2()
.locals 
IL_0000: ldarg.0
IL_0001: ldc.i4.m1
IL_0002: stfld System.Int32 ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>1__state
IL_0007: ldarg.0
IL_0008: ldfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__9
IL_000d: brfalse IL_001e
IL_0012: ldarg.0
IL_0013: ldfld System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<distributeConfigToPeers>d__55::<>s__9
IL_0018: callvirt System.Void System.IDisposable::Dispose()
IL_001d: nop
IL_001e: ret

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
IL_0008: brfalse IL_001e
IL_000d: br IL_0012
IL_0012: ldloc.0
IL_0013: ldc.i4.1
IL_0014: beq IL_0023
IL_0019: br IL_0028
IL_001e: br IL_002a
IL_0023: br IL_01f4
IL_0028: ldc.i4.0
IL_0029: ret
IL_002a: ldarg.0
IL_002b: ldc.i4.m1
IL_002c: stfld System.Int32 ServerSync.ConfigSync/<sendZPackage>d__57::<>1__state
IL_0031: ldarg.0
IL_0032: newobj System.Void ServerSync.ConfigSync/<>c__DisplayClass57_0::.ctor()
IL_0037: stfld ServerSync.ConfigSync/<>c__DisplayClass57_0 ServerSync.ConfigSync/<sendZPackage>d__57::<>8__1
IL_003c: ldarg.0
IL_003d: ldfld ServerSync.ConfigSync/<>c__DisplayClass57_0 ServerSync.ConfigSync/<sendZPackage>d__57::<>8__1
IL_0042: ldarg.0
IL_0043: ldfld ServerSync.ConfigSync ServerSync.ConfigSync/<sendZPackage>d__57::<>4__this
IL_0048: stfld ServerSync.ConfigSync ServerSync.ConfigSync/<>c__DisplayClass57_0::<>4__this
IL_004d: ldarg.0
IL_004e: ldfld ServerSync.ConfigSync/<>c__DisplayClass57_0 ServerSync.ConfigSync/<sendZPackage>d__57::<>8__1
IL_0053: ldarg.0
IL_0054: ldfld ZPackage ServerSync.ConfigSync/<sendZPackage>d__57::package
IL_0059: stfld ZPackage ServerSync.ConfigSync/<>c__DisplayClass57_0::package
IL_005e: nop
IL_005f: call ZNet ZNet::get_instance()
IL_0064: call System.Boolean UnityEngine.Object::op_Implicit(UnityEngine.Object)
IL_0069: ldc.i4.0
IL_006a: ceq
IL_006c: stloc.1
IL_006d: ldloc.1
IL_006e: brfalse IL_0076
IL_0073: nop
IL_0074: ldc.i4.0
IL_0075: ret
IL_0076: ldarg.0
IL_0077: ldarg.0
IL_0078: ldfld ServerSync.ConfigSync/<>c__DisplayClass57_0 ServerSync.ConfigSync/<sendZPackage>d__57::<>8__1
IL_007d: ldfld ZPackage ServerSync.ConfigSync/<>c__DisplayClass57_0::package
IL_0082: callvirt System.Byte[] ZPackage::GetArray()
IL_0087: stfld System.Byte[] ServerSync.ConfigSync/<sendZPackage>d__57::<rawData>5__2
IL_008c: ldarg.0
IL_008d: ldfld System.Byte[] ServerSync.ConfigSync/<sendZPackage>d__57::<rawData>5__2
IL_0092: brfalse IL_00ac
IL_0097: ldarg.0
IL_0098: ldfld System.Byte[] ServerSync.ConfigSync/<sendZPackage>d__57::<rawData>5__2
IL_009d: ldlen
IL_009e: conv.i8
IL_009f: ldc.i4 10000
IL_00a4: conv.i8
IL_00a5: cgt
IL_00a7: br IL_00ad
IL_00ac: ldc.i4.0
IL_00ad: stloc.2
IL_00ae: ldloc.2
IL_00af: brfalse IL_0162
IL_00b4: nop
IL_00b5: ldarg.0
IL_00b6: newobj System.Void ZPackage::.ctor()
IL_00bb: stfld ZPackage ServerSync.ConfigSync/<sendZPackage>d__57::<compressedPackage>5__4
IL_00c0: ldarg.0
IL_00c1: ldfld ZPackage ServerSync.ConfigSync/<sendZPackage>d__57::<compressedPackage>5__4
IL_00c6: ldc.i4.4
IL_00c7: callvirt System.Void ZPackage::Write(System.Byte)
IL_00cc: nop
IL_00cd: ldarg.0
IL_00ce: newobj System.Void System.IO.MemoryStream::.ctor()
IL_00d3: stfld System.IO.MemoryStream ServerSync.ConfigSync/<sendZPackage>d__57::<output>5__5
IL_00d8: ldarg.0
IL_00d9: ldarg.0
IL_00da: ldfld System.IO.MemoryStream ServerSync.ConfigSync/<sendZPackage>d__57::<output>5__5
IL_00df: ldc.i4.0
IL_00e0: newobj System.Void System.IO.Compression.DeflateStream::.ctor(System.IO.Stream,System.IO.Compression.CompressionLevel)
IL_00e5: stfld System.IO.Compression.DeflateStream ServerSync.ConfigSync/<sendZPackage>d__57::<deflateStream>5__6
IL_00ea: nop
IL_00eb: ldarg.0
IL_00ec: ldfld System.IO.Compression.DeflateStream ServerSync.ConfigSync/<sendZPackage>d__57::<deflateStream>5__6
IL_00f1: ldarg.0
IL_00f2: ldfld System.Byte[] ServerSync.ConfigSync/<sendZPackage>d__57::<rawData>5__2
IL_00f7: ldc.i4.0
IL_00f8: ldarg.0
IL_00f9: ldfld System.Byte[] ServerSync.ConfigSync/<sendZPackage>d__57::<rawData>5__2
IL_00fe: ldlen
IL_00ff: conv.i4
IL_0100: callvirt System.Void System.IO.Stream::Write(System.Byte[],System.Int32,System.Int32)
IL_0105: nop
IL_0106: nop
IL_0107: leave IL_0124
IL_010c: ldarg.0
IL_010d: ldfld System.IO.Compression.DeflateStream ServerSync.ConfigSync/<sendZPackage>d__57::<deflateStream>5__6
IL_0112: brfalse IL_0123
IL_0117: ldarg.0
IL_0118: ldfld System.IO.Compression.DeflateStream ServerSync.ConfigSync/<sendZPackage>d__57::<deflateStream>5__6
IL_011d: callvirt System.Void System.IDisposable::Dispose()
IL_0122: nop
IL_0123: endfinally
IL_0124: ldarg.0
IL_0125: ldnull
IL_0126: stfld System.IO.Compression.DeflateStream ServerSync.ConfigSync/<sendZPackage>d__57::<deflateStream>5__6
IL_012b: ldarg.0
IL_012c: ldfld ZPackage ServerSync.ConfigSync/<sendZPackage>d__57::<compressedPackage>5__4
IL_0131: ldarg.0
IL_0132: ldfld System.IO.MemoryStream ServerSync.ConfigSync/<sendZPackage>d__57::<output>5__5
IL_0137: callvirt System.Byte[] System.IO.MemoryStream::ToArray()
IL_013c: callvirt System.Void ZPackage::Write(System.Byte[])
IL_0141: nop
IL_0142: ldarg.0
IL_0143: ldfld ServerSync.ConfigSync/<>c__DisplayClass57_0 ServerSync.ConfigSync/<sendZPackage>d__57::<>8__1
IL_0148: ldarg.0
IL_0149: ldfld ZPackage ServerSync.ConfigSync/<sendZPackage>d__57::<compressedPackage>5__4
IL_014e: stfld ZPackage ServerSync.ConfigSync/<>c__DisplayClass57_0::package
IL_0153: nop
IL_0154: ldarg.0
IL_0155: ldnull
IL_0156: stfld ZPackage ServerSync.ConfigSync/<sendZPackage>d__57::<compressedPackage>5__4
IL_015b: ldarg.0
IL_015c: ldnull
IL_015d: stfld System.IO.MemoryStream ServerSync.ConfigSync/<sendZPackage>d__57::<output>5__5
IL_0162: ldarg.0
IL_0163: ldarg.0
IL_0164: ldfld System.Collections.Generic.List`1<ZNetPeer> ServerSync.ConfigSync/<sendZPackage>d__57::peers
IL_0169: ldsfld System.Func`2<ZNetPeer,System.Boolean> ServerSync.ConfigSync/<>c::<>9__57_0
IL_016e: dup
IL_016f: brtrue IL_018b
IL_0174: pop
IL_0175: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_017a: ldftn System.Boolean ServerSync.ConfigSync/<>c::<sendZPackage>b__57_0(ZNetPeer)
IL_0180: newobj System.Void System.Func`2<ZNetPeer,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0185: dup
IL_0186: stsfld System.Func`2<ZNetPeer,System.Boolean> ServerSync.ConfigSync/<>c::<>9__57_0
IL_018b: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ZNetPeer>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0190: ldarg.0
IL_0191: ldfld ServerSync.ConfigSync/<>c__DisplayClass57_0 ServerSync.ConfigSync/<sendZPackage>d__57::<>8__1
IL_0196: ldftn System.Collections.Generic.IEnumerator`1<System.Boolean> ServerSync.ConfigSync/<>c__DisplayClass57_0::<sendZPackage>b__1(ZNetPeer)
IL_019c: newobj System.Void System.Func`2<ZNetPeer,System.Collections.Generic.IEnumerator`1<System.Boolean>>::.ctor(System.Object,System.IntPtr)
IL_01a1: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::Select<ZNetPeer,System.Collections.Generic.IEnumerator`1<System.Boolean>>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_01a6: call System.Collections.Generic.List`1<!!0> System.Linq.Enumerable::ToList<System.Collections.Generic.IEnumerator`1<System.Boolean>>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_01ab: stfld System.Collections.Generic.List`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<sendZPackage>d__57::<writers>5__3
IL_01b0: ldarg.0
IL_01b1: ldfld System.Collections.Generic.List`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<sendZPackage>d__57::<writers>5__3
IL_01b6: ldsfld System.Predicate`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<>c::<>9__57_2
IL_01bb: dup
IL_01bc: brtrue IL_01d8
IL_01c1: pop
IL_01c2: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_01c7: ldftn System.Boolean ServerSync.ConfigSync/<>c::<sendZPackage>b__57_2(System.Collections.Generic.IEnumerator`1<System.Boolean>)
IL_01cd: newobj System.Void System.Predicate`1<System.Collections.Generic.IEnumerator`1<System.Boolean>>::.ctor(System.Object,System.IntPtr)
IL_01d2: dup
IL_01d3: stsfld System.Predicate`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<>c::<>9__57_2
IL_01d8: callvirt System.Int32 System.Collections.Generic.List`1<System.Collections.Generic.IEnumerator`1<System.Boolean>>::RemoveAll(System.Predicate`1<!0>)
IL_01dd: pop
IL_01de: br IL_022a
IL_01e3: nop
IL_01e4: ldarg.0
IL_01e5: ldnull
IL_01e6: stfld System.Object ServerSync.ConfigSync/<sendZPackage>d__57::<>2__current
IL_01eb: ldarg.0
IL_01ec: ldc.i4.1
IL_01ed: stfld System.Int32 ServerSync.ConfigSync/<sendZPackage>d__57::<>1__state
IL_01f2: ldc.i4.1
IL_01f3: ret
IL_01f4: ldarg.0
IL_01f5: ldc.i4.m1
IL_01f6: stfld System.Int32 ServerSync.ConfigSync/<sendZPackage>d__57::<>1__state
IL_01fb: ldarg.0
IL_01fc: ldfld System.Collections.Generic.List`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<sendZPackage>d__57::<writers>5__3
IL_0201: ldsfld System.Predicate`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<>c::<>9__57_3
IL_0206: dup
IL_0207: brtrue IL_0223
IL_020c: pop
IL_020d: ldsfld ServerSync.ConfigSync/<>c ServerSync.ConfigSync/<>c::<>9
IL_0212: ldftn System.Boolean ServerSync.ConfigSync/<>c::<sendZPackage>b__57_3(System.Collections.Generic.IEnumerator`1<System.Boolean>)
IL_0218: newobj System.Void System.Predicate`1<System.Collections.Generic.IEnumerator`1<System.Boolean>>::.ctor(System.Object,System.IntPtr)
IL_021d: dup
IL_021e: stsfld System.Predicate`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<>c::<>9__57_3
IL_0223: callvirt System.Int32 System.Collections.Generic.List`1<System.Collections.Generic.IEnumerator`1<System.Boolean>>::RemoveAll(System.Predicate`1<!0>)
IL_0228: pop
IL_0229: nop
IL_022a: ldarg.0
IL_022b: ldfld System.Collections.Generic.List`1<System.Collections.Generic.IEnumerator`1<System.Boolean>> ServerSync.ConfigSync/<sendZPackage>d__57::<writers>5__3
IL_0230: callvirt System.Int32 System.Collections.Generic.List`1<System.Collections.Generic.IEnumerator`1<System.Boolean>>::get_Count()
IL_0235: ldc.i4.0
IL_0236: cgt
IL_0238: stloc.3
IL_0239: ldloc.3
IL_023a: brtrue.s IL_01e3
IL_023c: ldc.i4.0
IL_023d: ret
// EH Finally: 234 - 268 => 268 - 292

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
IL_0007: brtrue IL_0013
IL_000c: pop
IL_000d: ldarg.0
IL_000e: ldfld System.String ServerSync.VersionCheck::Name
IL_0013: ret

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
IL_0007: brtrue IL_0012
IL_000c: pop
IL_000d: ldstr "0.0.0"
IL_0012: ret

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
IL_0007: brtrue IL_0028
IL_000c: pop
IL_000d: ldarg.0
IL_000e: ldfld System.Boolean ServerSync.VersionCheck::ModRequired
IL_0013: brtrue IL_0022
IL_0018: ldstr "0.0.0"
IL_001d: br IL_0028
IL_0022: ldarg.0
IL_0023: call System.String ServerSync.VersionCheck::get_CurrentVersion()
IL_0028: ret

// System.Void ServerSync.VersionCheck::set_MinimumRequiredVersion(System.String)
.locals 
IL_0000: ldarg.0
IL_0001: ldarg.1
IL_0002: stfld System.String ServerSync.VersionCheck::minimumRequiredVersion
IL_0007: ret

// System.Void ServerSync.VersionCheck::PatchServerSync()
.locals System.Boolean, HarmonyLib.Harmony, System.Collections.Generic.IEnumerator`1<System.Type>, System.Type
IL_0000: nop
IL_0001: ldtoken ZNet
IL_0006: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_000b: ldstr "Awake"
IL_0010: ldnull
IL_0011: ldnull
IL_0012: call System.Reflection.MethodInfo HarmonyLib.AccessTools::DeclaredMethod(System.Type,System.String,System.Type[],System.Type[])
IL_0017: call HarmonyLib.Patches HarmonyLib.PatchProcessor::GetPatchInfo(System.Reflection.MethodBase)
IL_001c: dup
IL_001d: brtrue IL_0029
IL_0022: pop
IL_0023: ldc.i4.0
IL_0024: br IL_0058
IL_0029: ldfld System.Collections.ObjectModel.ReadOnlyCollection`1<HarmonyLib.Patch> HarmonyLib.Patches::Postfixes
IL_002e: ldsfld System.Func`2<HarmonyLib.Patch,System.Boolean> ServerSync.VersionCheck/<>c::<>9__20_0
IL_0033: dup
IL_0034: brtrue IL_0050
IL_0039: pop
IL_003a: ldsfld ServerSync.VersionCheck/<>c ServerSync.VersionCheck/<>c::<>9
IL_003f: ldftn System.Boolean ServerSync.VersionCheck/<>c::<PatchServerSync>b__20_0(HarmonyLib.Patch)
IL_0045: newobj System.Void System.Func`2<HarmonyLib.Patch,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_004a: dup
IL_004b: stsfld System.Func`2<HarmonyLib.Patch,System.Boolean> ServerSync.VersionCheck/<>c::<>9__20_0
IL_0050: call System.Int32 System.Linq.Enumerable::Count<HarmonyLib.Patch>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_0055: ldc.i4.0
IL_0056: cgt
IL_0058: stloc.0
IL_0059: ldloc.0
IL_005a: brfalse IL_0065
IL_005f: nop
IL_0060: br IL_00f8
IL_0065: ldstr "org.bepinex.helpers.ServerSync"
IL_006a: newobj System.Void HarmonyLib.Harmony::.ctor(System.String)
IL_006f: stloc.1
IL_0070: nop
IL_0071: ldtoken ServerSync.ConfigSync
IL_0076: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_007b: ldc.i4.s 32
IL_007d: callvirt System.Type[] System.Type::GetNestedTypes(System.Reflection.BindingFlags)
IL_0082: ldc.i4.1
IL_0083: newarr System.Type
IL_0088: dup
IL_0089: ldc.i4.0
IL_008a: ldtoken ServerSync.VersionCheck
IL_008f: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0094: stelem.ref
IL_0095: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Concat<System.Type>(System.Collections.Generic.IEnumerable`1<!!0>,System.Collections.Generic.IEnumerable`1<!!0>)
IL_009a: ldsfld System.Func`2<System.Type,System.Boolean> ServerSync.VersionCheck/<>c::<>9__20_1
IL_009f: dup
IL_00a0: brtrue IL_00bc
IL_00a5: pop
IL_00a6: ldsfld ServerSync.VersionCheck/<>c ServerSync.VersionCheck/<>c::<>9
IL_00ab: ldftn System.Boolean ServerSync.VersionCheck/<>c::<PatchServerSync>b__20_1(System.Type)
IL_00b1: newobj System.Void System.Func`2<System.Type,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_00b6: dup
IL_00b7: stsfld System.Func`2<System.Type,System.Boolean> ServerSync.VersionCheck/<>c::<>9__20_1
IL_00bc: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<System.Type>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_00c1: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.Type>::GetEnumerator()
IL_00c6: stloc.2
IL_00c7: br IL_00dd
IL_00cc: ldloc.2
IL_00cd: callvirt !0 System.Collections.Generic.IEnumerator`1<System.Type>::get_Current()
IL_00d2: stloc.3
IL_00d3: nop
IL_00d4: ldloc.1
IL_00d5: ldloc.3
IL_00d6: callvirt System.Void HarmonyLib.Harmony::PatchAll(System.Type)
IL_00db: nop
IL_00dc: nop
IL_00dd: ldloc.2
IL_00de: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_00e3: brtrue.s IL_00cc
IL_00e5: leave IL_00f8
IL_00ea: ldloc.2
IL_00eb: brfalse IL_00f7
IL_00f0: ldloc.2
IL_00f1: callvirt System.Void System.IDisposable::Dispose()
IL_00f6: nop
IL_00f7: endfinally
IL_00f8: ret
// EH Finally: 199 - 234 => 234 - 248

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
IL_001a: brfalse IL_0025
IL_001f: nop
IL_0020: br IL_007d
IL_0025: ldarg.0
IL_0026: ldarg.0
IL_0027: ldfld ServerSync.ConfigSync ServerSync.VersionCheck::ConfigSync
IL_002c: ldfld System.String ServerSync.ConfigSync::Name
IL_0031: stfld System.String ServerSync.VersionCheck::Name
IL_0036: ldarg.0
IL_0037: ldarg.0
IL_0038: ldfld ServerSync.ConfigSync ServerSync.VersionCheck::ConfigSync
IL_003d: ldfld System.String ServerSync.ConfigSync::DisplayName
IL_0042: call System.Void ServerSync.VersionCheck::set_DisplayName(System.String)
IL_0047: nop
IL_0048: ldarg.0
IL_0049: ldarg.0
IL_004a: ldfld ServerSync.ConfigSync ServerSync.VersionCheck::ConfigSync
IL_004f: ldfld System.String ServerSync.ConfigSync::CurrentVersion
IL_0054: call System.Void ServerSync.VersionCheck::set_CurrentVersion(System.String)
IL_0059: nop
IL_005a: ldarg.0
IL_005b: ldarg.0
IL_005c: ldfld ServerSync.ConfigSync ServerSync.VersionCheck::ConfigSync
IL_0061: ldfld System.String ServerSync.ConfigSync::MinimumRequiredVersion
IL_0066: call System.Void ServerSync.VersionCheck::set_MinimumRequiredVersion(System.String)
IL_006b: nop
IL_006c: ldarg.0
IL_006d: ldarg.0
IL_006e: ldfld ServerSync.ConfigSync ServerSync.VersionCheck::ConfigSync
IL_0073: ldfld System.Boolean ServerSync.ConfigSync::ModRequired
IL_0078: stfld System.Boolean ServerSync.VersionCheck::ModRequired
IL_007d: ret

// System.Boolean ServerSync.VersionCheck::IsVersionOk()
.locals System.Boolean, System.Boolean, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.String ServerSync.VersionCheck::ReceivedMinimumRequiredVersion
IL_0007: brfalse IL_001a
IL_000c: ldarg.0
IL_000d: ldfld System.String ServerSync.VersionCheck::ReceivedCurrentVersion
IL_0012: ldnull
IL_0013: ceq
IL_0015: br IL_001b
IL_001a: ldc.i4.1
IL_001b: stloc.0
IL_001c: ldloc.0
IL_001d: brfalse IL_0032
IL_0022: nop
IL_0023: ldarg.0
IL_0024: ldfld System.Boolean ServerSync.VersionCheck::ModRequired
IL_0029: ldc.i4.0
IL_002a: ceq
IL_002c: stloc.1
IL_002d: br IL_0073
IL_0032: ldarg.0
IL_0033: call System.String ServerSync.VersionCheck::get_CurrentVersion()
IL_0038: newobj System.Void System.Version::.ctor(System.String)
IL_003d: ldarg.0
IL_003e: ldfld System.String ServerSync.VersionCheck::ReceivedMinimumRequiredVersion
IL_0043: newobj System.Void System.Version::.ctor(System.String)
IL_0048: call System.Boolean System.Version::op_GreaterThanOrEqual(System.Version,System.Version)
IL_004d: stloc.2
IL_004e: ldarg.0
IL_004f: ldfld System.String ServerSync.VersionCheck::ReceivedCurrentVersion
IL_0054: newobj System.Void System.Version::.ctor(System.String)
IL_0059: ldarg.0
IL_005a: call System.String ServerSync.VersionCheck::get_MinimumRequiredVersion()
IL_005f: newobj System.Void System.Version::.ctor(System.String)
IL_0064: call System.Boolean System.Version::op_GreaterThanOrEqual(System.Version,System.Version)
IL_0069: stloc.3
IL_006a: ldloc.2
IL_006b: ldloc.3
IL_006c: and
IL_006d: stloc.1
IL_006e: br IL_0073
IL_0073: ldloc.1
IL_0074: ret

// System.String ServerSync.VersionCheck::ErrorClient()
.locals System.Boolean, System.String, System.Boolean
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld System.String ServerSync.VersionCheck::ReceivedMinimumRequiredVersion
IL_0007: ldnull
IL_0008: ceq
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: brfalse IL_0028
IL_0011: nop
IL_0012: ldarg.0
IL_0013: call System.String ServerSync.VersionCheck::get_DisplayName()
IL_0018: ldstr " is not installed on the server."
IL_001d: call System.String System.String::Concat(System.String,System.String)
IL_0022: stloc.1
IL_0023: br IL_00d1
IL_0028: ldarg.0
IL_0029: call System.String ServerSync.VersionCheck::get_CurrentVersion()
IL_002e: newobj System.Void System.Version::.ctor(System.String)
IL_0033: ldarg.0
IL_0034: ldfld System.String ServerSync.VersionCheck::ReceivedMinimumRequiredVersion
IL_0039: newobj System.Void System.Version::.ctor(System.String)
IL_003e: call System.Boolean System.Version::op_GreaterThanOrEqual(System.Version,System.Version)
IL_0043: stloc.2
IL_0044: ldloc.2
IL_0045: brtrue IL_008d
IL_004a: ldc.i4.6
IL_004b: newarr System.String
IL_0050: dup
IL_0051: ldc.i4.0
IL_0052: ldarg.0
IL_0053: call System.String ServerSync.VersionCheck::get_DisplayName()
IL_0058: stelem.ref
IL_0059: dup
IL_005a: ldc.i4.1
IL_005b: ldstr " needs to be at least version "
IL_0060: stelem.ref
IL_0061: dup
IL_0062: ldc.i4.2
IL_0063: ldarg.0
IL_0064: ldfld System.String ServerSync.VersionCheck::ReceivedMinimumRequiredVersion
IL_0069: stelem.ref
IL_006a: dup
IL_006b: ldc.i4.3
IL_006c: ldstr ". You have version "
IL_0071: stelem.ref
IL_0072: dup
IL_0073: ldc.i4.4
IL_0074: ldarg.0
IL_0075: call System.String ServerSync.VersionCheck::get_CurrentVersion()
IL_007a: stelem.ref
IL_007b: dup
IL_007c: ldc.i4.5
IL_007d: ldstr "."
IL_0082: stelem.ref
IL_0083: call System.String System.String::Concat(System.String[])
IL_0088: br IL_00cb
IL_008d: ldc.i4.6
IL_008e: newarr System.String
IL_0093: dup
IL_0094: ldc.i4.0
IL_0095: ldarg.0
IL_0096: call System.String ServerSync.VersionCheck::get_DisplayName()
IL_009b: stelem.ref
IL_009c: dup
IL_009d: ldc.i4.1
IL_009e: ldstr " may not be higher than version "
IL_00a3: stelem.ref
IL_00a4: dup
IL_00a5: ldc.i4.2
IL_00a6: ldarg.0
IL_00a7: ldfld System.String ServerSync.VersionCheck::ReceivedCurrentVersion
IL_00ac: stelem.ref
IL_00ad: dup
IL_00ae: ldc.i4.3
IL_00af: ldstr ". You have version "
IL_00b4: stelem.ref
IL_00b5: dup
IL_00b6: ldc.i4.4
IL_00b7: ldarg.0
IL_00b8: call System.String ServerSync.VersionCheck::get_CurrentVersion()
IL_00bd: stelem.ref
IL_00be: dup
IL_00bf: ldc.i4.5
IL_00c0: ldstr "."
IL_00c5: stelem.ref
IL_00c6: call System.String System.String::Concat(System.String[])
IL_00cb: stloc.1
IL_00cc: br IL_00d1
IL_00d1: ldloc.1
IL_00d2: ret

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
IL_0045: br IL_004a
IL_004a: ldloc.0
IL_004b: ret

// System.String ServerSync.VersionCheck::Error(ZRpc)
.locals System.String
IL_0000: nop
IL_0001: ldarg.1
IL_0002: brfalse IL_0013
IL_0007: ldarg.0
IL_0008: ldarg.1
IL_0009: call System.String ServerSync.VersionCheck::ErrorServer(ZRpc)
IL_000e: br IL_0019
IL_0013: ldarg.0
IL_0014: call System.String ServerSync.VersionCheck::ErrorClient()
IL_0019: stloc.0
IL_001a: br IL_001f
IL_001f: ldloc.0
IL_0020: ret

// ServerSync.VersionCheck[] ServerSync.VersionCheck::GetFailedClient()
.locals ServerSync.VersionCheck[]
IL_0000: nop
IL_0001: ldsfld System.Collections.Generic.HashSet`1<ServerSync.VersionCheck> ServerSync.VersionCheck::versionChecks
IL_0006: ldsfld System.Func`2<ServerSync.VersionCheck,System.Boolean> ServerSync.VersionCheck/<>c::<>9__29_0
IL_000b: dup
IL_000c: brtrue IL_0028
IL_0011: pop
IL_0012: ldsfld ServerSync.VersionCheck/<>c ServerSync.VersionCheck/<>c::<>9
IL_0017: ldftn System.Boolean ServerSync.VersionCheck/<>c::<GetFailedClient>b__29_0(ServerSync.VersionCheck)
IL_001d: newobj System.Void System.Func`2<ServerSync.VersionCheck,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_0022: dup
IL_0023: stsfld System.Func`2<ServerSync.VersionCheck,System.Boolean> ServerSync.VersionCheck/<>c::<>9__29_0
IL_0028: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<ServerSync.VersionCheck>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_002d: call !!0[] System.Linq.Enumerable::ToArray<ServerSync.VersionCheck>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_0032: stloc.0
IL_0033: br IL_0038
IL_0038: ldloc.0
IL_0039: ret

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
IL_002a: br IL_002f
IL_002f: ldloc.1
IL_0030: ret

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
IL_0025: br IL_0105
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
IL_0045: brfalse IL_0050
IL_004a: nop
IL_004b: br IL_0105
IL_0050: ldc.i4.s 9
IL_0052: newarr System.String
IL_0057: dup
IL_0058: ldc.i4.0
IL_0059: ldstr "Received "
IL_005e: stelem.ref
IL_005f: dup
IL_0060: ldc.i4.1
IL_0061: ldloc.s V_5
IL_0063: callvirt System.String ServerSync.VersionCheck::get_DisplayName()
IL_0068: stelem.ref
IL_0069: dup
IL_006a: ldc.i4.2
IL_006b: ldstr " version "
IL_0070: stelem.ref
IL_0071: dup
IL_0072: ldc.i4.3
IL_0073: ldloc.2
IL_0074: stelem.ref
IL_0075: dup
IL_0076: ldc.i4.4
IL_0077: ldstr " and minimum version "
IL_007c: stelem.ref
IL_007d: dup
IL_007e: ldc.i4.5
IL_007f: ldloc.1
IL_0080: stelem.ref
IL_0081: dup
IL_0082: ldc.i4.6
IL_0083: ldstr " from the "
IL_0088: stelem.ref
IL_0089: dup
IL_008a: ldc.i4.7
IL_008b: call ZNet ZNet::get_instance()
IL_0090: callvirt System.Boolean ZNet::IsServer()
IL_0095: brtrue IL_00a4
IL_009a: ldstr "server"
IL_009f: br IL_00a9
IL_00a4: ldstr "client"
IL_00a9: stelem.ref
IL_00aa: dup
IL_00ab: ldc.i4.8
IL_00ac: ldstr "."
IL_00b1: stelem.ref
IL_00b2: call System.String System.String::Concat(System.String[])
IL_00b7: call System.Void UnityEngine.Debug::Log(System.Object)
IL_00bc: nop
IL_00bd: ldloc.s V_5
IL_00bf: ldloc.1
IL_00c0: stfld System.String ServerSync.VersionCheck::ReceivedMinimumRequiredVersion
IL_00c5: ldloc.s V_5
IL_00c7: ldloc.2
IL_00c8: stfld System.String ServerSync.VersionCheck::ReceivedCurrentVersion
IL_00cd: call ZNet ZNet::get_instance()
IL_00d2: callvirt System.Boolean ZNet::IsServer()
IL_00d7: brfalse IL_00e8
IL_00dc: ldloc.s V_5
IL_00de: callvirt System.Boolean ServerSync.VersionCheck::IsVersionOk()
IL_00e3: br IL_00e9
IL_00e8: ldc.i4.0
IL_00e9: stloc.s V_7
IL_00eb: ldloc.s V_7
IL_00ed: brfalse IL_0102
IL_00f2: nop
IL_00f3: ldloc.s V_5
IL_00f5: ldfld System.Collections.Generic.List`1<ZRpc> ServerSync.VersionCheck::ValidatedClients
IL_00fa: ldarg.0
IL_00fb: callvirt System.Void System.Collections.Generic.List`1<ZRpc>::Add(!0)
IL_0100: nop
IL_0101: nop
IL_0102: ldc.i4.1
IL_0103: stloc.3
IL_0104: nop
IL_0105: ldloca.s V_4
IL_0107: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>::MoveNext()
IL_010c: brtrue IL_002a
IL_0111: leave IL_0125
IL_0116: ldloca.s V_4
IL_0118: constrained. System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>
IL_011e: callvirt System.Void System.IDisposable::Dispose()
IL_0123: nop
IL_0124: endfinally
IL_0125: ldloc.3
IL_0126: ldc.i4.0
IL_0127: ceq
IL_0129: stloc.s V_8
IL_012b: ldloc.s V_8
IL_012d: brfalse IL_0175
IL_0132: nop
IL_0133: ldarg.1
IL_0134: ldc.i4.0
IL_0135: callvirt System.Void ZPackage::SetPos(System.Int32)
IL_013a: nop
IL_013b: ldarg.2
IL_013c: ldnull
IL_013d: cgt.un
IL_013f: stloc.s V_9
IL_0141: ldloc.s V_9
IL_0143: brfalse IL_0174
IL_0148: nop
IL_0149: ldarg.2
IL_014a: ldarg.0
IL_014b: ldarg.1
IL_014c: callvirt System.Void System.Action`2<ZRpc,ZPackage>::Invoke(!0,!1)
IL_0151: nop
IL_0152: ldarg.1
IL_0153: callvirt System.Int32 ZPackage::GetPos()
IL_0158: ldc.i4.0
IL_0159: ceq
IL_015b: stloc.s V_10
IL_015d: ldloc.s V_10
IL_015f: brfalse IL_0173
IL_0164: nop
IL_0165: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> ServerSync.VersionCheck::notProcessedNames
IL_016a: ldloc.0
IL_016b: ldloc.2
IL_016c: callvirt System.Void System.Collections.Generic.Dictionary`2<System.String,System.String>::Add(!0,!1)
IL_0171: nop
IL_0172: nop
IL_0173: nop
IL_0174: nop
IL_0175: ret
// EH Finally: 37 - 278 => 278 - 293

// System.Boolean ServerSync.VersionCheck::RPC_PeerInfo(ZRpc,ZNet)
.locals ServerSync.VersionCheck[], System.Boolean, System.Boolean, ServerSync.VersionCheck[], System.Int32, ServerSync.VersionCheck, System.Boolean
IL_0000: nop
IL_0001: ldarg.1
IL_0002: callvirt System.Boolean ZNet::IsServer()
IL_0007: brtrue IL_0016
IL_000c: call ServerSync.VersionCheck[] ServerSync.VersionCheck::GetFailedClient()
IL_0011: br IL_001c
IL_0016: ldarg.0
IL_0017: call ServerSync.VersionCheck[] ServerSync.VersionCheck::GetFailedServer(ZRpc)
IL_001c: stloc.0
IL_001d: ldloc.0
IL_001e: ldlen
IL_001f: ldc.i4.0
IL_0020: ceq
IL_0022: stloc.1
IL_0023: ldloc.1
IL_0024: brfalse IL_0031
IL_0029: nop
IL_002a: ldc.i4.1
IL_002b: stloc.2
IL_002c: br IL_008f
IL_0031: nop
IL_0032: ldloc.0
IL_0033: stloc.3
IL_0034: ldc.i4.0
IL_0035: stloc.s V_4
IL_0037: br IL_005c
IL_003c: ldloc.3
IL_003d: ldloc.s V_4
IL_003f: ldelem.any ServerSync.VersionCheck
IL_0044: stloc.s V_5
IL_0046: nop
IL_0047: ldloc.s V_5
IL_0049: ldarg.0
IL_004a: callvirt System.String ServerSync.VersionCheck::Error(ZRpc)
IL_004f: call System.Void UnityEngine.Debug::LogWarning(System.Object)
IL_0054: nop
IL_0055: nop
IL_0056: ldloc.s V_4
IL_0058: ldc.i4.1
IL_0059: add
IL_005a: stloc.s V_4
IL_005c: ldloc.s V_4
IL_005e: ldloc.3
IL_005f: ldlen
IL_0060: conv.i4
IL_0061: blt.s IL_003c
IL_0063: ldarg.1
IL_0064: callvirt System.Boolean ZNet::IsServer()
IL_0069: stloc.s V_6
IL_006b: ldloc.s V_6
IL_006d: brfalse IL_0080
IL_0072: nop
IL_0073: ldarg.0
IL_0074: call System.Void ServerSync.VersionCheck::DisconnectClient(ZRpc)
IL_0079: nop
IL_007a: nop
IL_007b: br IL_0088
IL_0080: nop
IL_0081: call System.Void ServerSync.VersionCheck::Logout()
IL_0086: nop
IL_0087: nop
IL_0088: ldc.i4.0
IL_0089: stloc.2
IL_008a: br IL_008f
IL_008f: ldloc.2
IL_0090: ret

// System.Void ServerSync.VersionCheck::RegisterAndCheckVersion(ZNetPeer,ZNet)
.locals System.Collections.IDictionary, System.Boolean, ServerSync.VersionCheck/<>c__DisplayClass36_0, System.Object, System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>, ServerSync.VersionCheck, System.Boolean, ZPackage
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
IL_004a: brfalse IL_00b2
IL_004f: newobj System.Void ServerSync.VersionCheck/<>c__DisplayClass36_0::.ctor()
IL_0054: stloc.2
IL_0055: nop
IL_0056: ldloc.0
IL_0057: ldstr "ServerSync VersionCheck"
IL_005c: call System.Int32 StringExtensionMethods::GetStableHashCode(System.String)
IL_0061: box System.Int32
IL_0066: callvirt System.Object System.Collections.IDictionary::get_Item(System.Object)
IL_006b: stloc.3
IL_006c: ldloc.2
IL_006d: ldloc.3
IL_006e: callvirt System.Type System.Object::GetType()
IL_0073: ldstr "m_action"
IL_0078: ldc.i4.s 36
IL_007a: callvirt System.Reflection.FieldInfo System.Type::GetField(System.String,System.Reflection.BindingFlags)
IL_007f: ldloc.3
IL_0080: callvirt System.Object System.Reflection.FieldInfo::GetValue(System.Object)
IL_0085: castclass System.Action`2<ZRpc,ZPackage>
IL_008a: stfld System.Action`2<ZRpc,ZPackage> ServerSync.VersionCheck/<>c__DisplayClass36_0::action
IL_008f: ldarg.0
IL_0090: ldfld ZRpc ZNetPeer::m_rpc
IL_0095: ldstr "ServerSync VersionCheck"
IL_009a: ldloc.2
IL_009b: ldftn System.Void ServerSync.VersionCheck/<>c__DisplayClass36_0::<RegisterAndCheckVersion>b__0(ZRpc,ZPackage)
IL_00a1: newobj System.Void System.Action`2<ZRpc,ZPackage>::.ctor(System.Object,System.IntPtr)
IL_00a6: callvirt System.Void ZRpc::Register<ZPackage>(System.String,System.Action`2<ZRpc,!!0>)
IL_00ab: nop
IL_00ac: nop
IL_00ad: br IL_00e3
IL_00b2: nop
IL_00b3: ldarg.0
IL_00b4: ldfld ZRpc ZNetPeer::m_rpc
IL_00b9: ldstr "ServerSync VersionCheck"
IL_00be: ldsfld System.Action`2<ZRpc,ZPackage> ServerSync.VersionCheck/<>O::<0>__CheckVersion
IL_00c3: dup
IL_00c4: brtrue IL_00dc
IL_00c9: pop
IL_00ca: ldnull
IL_00cb: ldftn System.Void ServerSync.VersionCheck::CheckVersion(ZRpc,ZPackage)
IL_00d1: newobj System.Void System.Action`2<ZRpc,ZPackage>::.ctor(System.Object,System.IntPtr)
IL_00d6: dup
IL_00d7: stsfld System.Action`2<ZRpc,ZPackage> ServerSync.VersionCheck/<>O::<0>__CheckVersion
IL_00dc: callvirt System.Void ZRpc::Register<ZPackage>(System.String,System.Action`2<ZRpc,!!0>)
IL_00e1: nop
IL_00e2: nop
IL_00e3: nop
IL_00e4: ldsfld System.Collections.Generic.HashSet`1<ServerSync.VersionCheck> ServerSync.VersionCheck::versionChecks
IL_00e9: callvirt System.Collections.Generic.HashSet`1/Enumerator<!0> System.Collections.Generic.HashSet`1<ServerSync.VersionCheck>::GetEnumerator()
IL_00ee: stloc.s V_4
IL_00f0: br IL_01f7
IL_00f5: ldloca.s V_4
IL_00f7: call !0 System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>::get_Current()
IL_00fc: stloc.s V_5
IL_00fe: nop
IL_00ff: ldloc.s V_5
IL_0101: callvirt System.Void ServerSync.VersionCheck::Initialize()
IL_0106: nop
IL_0107: ldloc.s V_5
IL_0109: ldfld System.Boolean ServerSync.VersionCheck::ModRequired
IL_010e: brtrue IL_0121
IL_0113: ldarg.1
IL_0114: callvirt System.Boolean ZNet::IsServer()
IL_0119: ldc.i4.0
IL_011a: ceq
IL_011c: br IL_0122
IL_0121: ldc.i4.0
IL_0122: stloc.s V_6
IL_0124: ldloc.s V_6
IL_0126: brfalse IL_0131
IL_012b: nop
IL_012c: br IL_01f7
IL_0131: ldc.i4.s 9
IL_0133: newarr System.String
IL_0138: dup
IL_0139: ldc.i4.0
IL_013a: ldstr "Sending "
IL_013f: stelem.ref
IL_0140: dup
IL_0141: ldc.i4.1
IL_0142: ldloc.s V_5
IL_0144: callvirt System.String ServerSync.VersionCheck::get_DisplayName()
IL_0149: stelem.ref
IL_014a: dup
IL_014b: ldc.i4.2
IL_014c: ldstr " version "
IL_0151: stelem.ref
IL_0152: dup
IL_0153: ldc.i4.3
IL_0154: ldloc.s V_5
IL_0156: callvirt System.String ServerSync.VersionCheck::get_CurrentVersion()
IL_015b: stelem.ref
IL_015c: dup
IL_015d: ldc.i4.4
IL_015e: ldstr " and minimum version "
IL_0163: stelem.ref
IL_0164: dup
IL_0165: ldc.i4.5
IL_0166: ldloc.s V_5
IL_0168: callvirt System.String ServerSync.VersionCheck::get_MinimumRequiredVersion()
IL_016d: stelem.ref
IL_016e: dup
IL_016f: ldc.i4.6
IL_0170: ldstr " to the "
IL_0175: stelem.ref
IL_0176: dup
IL_0177: ldc.i4.7
IL_0178: ldarg.1
IL_0179: callvirt System.Boolean ZNet::IsServer()
IL_017e: brtrue IL_018d
IL_0183: ldstr "server"
IL_0188: br IL_0192
IL_018d: ldstr "client"
IL_0192: stelem.ref
IL_0193: dup
IL_0194: ldc.i4.8
IL_0195: ldstr "."
IL_019a: stelem.ref
IL_019b: call System.String System.String::Concat(System.String[])
IL_01a0: call System.Void UnityEngine.Debug::Log(System.Object)
IL_01a5: nop
IL_01a6: newobj System.Void ZPackage::.ctor()
IL_01ab: stloc.s V_7
IL_01ad: ldloc.s V_7
IL_01af: ldloc.s V_5
IL_01b1: ldfld System.String ServerSync.VersionCheck::Name
IL_01b6: callvirt System.Void ZPackage::Write(System.String)
IL_01bb: nop
IL_01bc: ldloc.s V_7
IL_01be: ldloc.s V_5
IL_01c0: callvirt System.String ServerSync.VersionCheck::get_MinimumRequiredVersion()
IL_01c5: callvirt System.Void ZPackage::Write(System.String)
IL_01ca: nop
IL_01cb: ldloc.s V_7
IL_01cd: ldloc.s V_5
IL_01cf: callvirt System.String ServerSync.VersionCheck::get_CurrentVersion()
IL_01d4: callvirt System.Void ZPackage::Write(System.String)
IL_01d9: nop
IL_01da: ldarg.0
IL_01db: ldfld ZRpc ZNetPeer::m_rpc
IL_01e0: ldstr "ServerSync VersionCheck"
IL_01e5: ldc.i4.1
IL_01e6: newarr System.Object
IL_01eb: dup
IL_01ec: ldc.i4.0
IL_01ed: ldloc.s V_7
IL_01ef: stelem.ref
IL_01f0: callvirt System.Void ZRpc::Invoke(System.String,System.Object[])
IL_01f5: nop
IL_01f6: nop
IL_01f7: ldloca.s V_4
IL_01f9: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>::MoveNext()
IL_01fe: brtrue IL_00f5
IL_0203: leave IL_0217
IL_0208: ldloca.s V_4
IL_020a: constrained. System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>
IL_0210: callvirt System.Void System.IDisposable::Dispose()
IL_0215: nop
IL_0216: endfinally
IL_0217: ret
// EH Finally: 240 - 520 => 520 - 535

// System.Void ServerSync.VersionCheck::RemoveDisconnected(ZNetPeer,ZNet)
.locals System.Boolean, System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>, ServerSync.VersionCheck
IL_0000: nop
IL_0001: ldarg.1
IL_0002: callvirt System.Boolean ZNet::IsServer()
IL_0007: ldc.i4.0
IL_0008: ceq
IL_000a: stloc.0
IL_000b: ldloc.0
IL_000c: brfalse IL_0017
IL_0011: nop
IL_0012: br IL_0061
IL_0017: nop
IL_0018: ldsfld System.Collections.Generic.HashSet`1<ServerSync.VersionCheck> ServerSync.VersionCheck::versionChecks
IL_001d: callvirt System.Collections.Generic.HashSet`1/Enumerator<!0> System.Collections.Generic.HashSet`1<ServerSync.VersionCheck>::GetEnumerator()
IL_0022: stloc.1
IL_0023: br IL_0044
IL_0028: ldloca.s V_1
IL_002a: call !0 System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>::get_Current()
IL_002f: stloc.2
IL_0030: nop
IL_0031: ldloc.2
IL_0032: ldfld System.Collections.Generic.List`1<ZRpc> ServerSync.VersionCheck::ValidatedClients
IL_0037: ldarg.0
IL_0038: ldfld ZRpc ZNetPeer::m_rpc
IL_003d: callvirt System.Boolean System.Collections.Generic.List`1<ZRpc>::Remove(!0)
IL_0042: pop
IL_0043: nop
IL_0044: ldloca.s V_1
IL_0046: call System.Boolean System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>::MoveNext()
IL_004b: brtrue.s IL_0028
IL_004d: leave IL_0061
IL_0052: ldloca.s V_1
IL_0054: constrained. System.Collections.Generic.HashSet`1/Enumerator<ServerSync.VersionCheck>
IL_005a: callvirt System.Void System.IDisposable::Dispose()
IL_005f: nop
IL_0060: endfinally
IL_0061: ret
// EH Finally: 35 - 82 => 82 - 97

// System.Void ServerSync.VersionCheck::ShowConnectionError(FejdStartup)
.locals System.Boolean, System.Boolean, ServerSync.VersionCheck[], System.Boolean, System.String, System.Collections.Generic.IEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.String,System.String>>, System.Collections.Generic.KeyValuePair`2<System.String,System.String>, System.Boolean, TMPro.TMP_Text, System.Boolean, UnityEngine.RectTransform, UnityEngine.Vector2, System.Single, UnityEngine.RectTransform
IL_0000: nop
IL_0001: ldarg.0
IL_0002: ldfld UnityEngine.GameObject FejdStartup::m_connectionFailedPanel
IL_0007: callvirt System.Boolean UnityEngine.GameObject::get_activeSelf()
IL_000c: brfalse IL_0021
IL_0011: call ZNet/ConnectionStatus ZNet::GetConnectionStatus()
IL_0016: ldc.i4.3
IL_0017: ceq
IL_0019: ldc.i4.0
IL_001a: ceq
IL_001c: br IL_0022
IL_0021: ldc.i4.1
IL_0022: stloc.0
IL_0023: ldloc.0
IL_0024: brfalse IL_002f
IL_0029: nop
IL_002a: br IL_024d
IL_002f: ldc.i4.0
IL_0030: stloc.1
IL_0031: call ServerSync.VersionCheck[] ServerSync.VersionCheck::GetFailedClient()
IL_0036: stloc.2
IL_0037: ldloc.2
IL_0038: ldlen
IL_0039: ldc.i4.0
IL_003a: cgt.un
IL_003c: stloc.3
IL_003d: ldloc.3
IL_003e: brfalse IL_0099
IL_0043: nop
IL_0044: ldstr "
"
IL_0049: ldloc.2
IL_004a: ldsfld System.Func`2<ServerSync.VersionCheck,System.String> ServerSync.VersionCheck/<>c::<>9__38_0
IL_004f: dup
IL_0050: brtrue IL_006c
IL_0055: pop
IL_0056: ldsfld ServerSync.VersionCheck/<>c ServerSync.VersionCheck/<>c::<>9
IL_005b: ldftn System.String ServerSync.VersionCheck/<>c::<ShowConnectionError>b__38_0(ServerSync.VersionCheck)
IL_0061: newobj System.Void System.Func`2<ServerSync.VersionCheck,System.String>::.ctor(System.Object,System.IntPtr)
IL_0066: dup
IL_0067: stsfld System.Func`2<ServerSync.VersionCheck,System.String> ServerSync.VersionCheck/<>c::<>9__38_0
IL_006c: call System.Collections.Generic.IEnumerable`1<!!1> System.Linq.Enumerable::Select<ServerSync.VersionCheck,System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_0071: call System.String System.String::Join(System.String,System.Collections.Generic.IEnumerable`1<System.String>)
IL_0076: stloc.s V_4
IL_0078: ldarg.0
IL_0079: ldfld TMPro.TMP_Text FejdStartup::m_connectionFailedError
IL_007e: dup
IL_007f: callvirt System.String TMPro.TMP_Text::get_text()
IL_0084: ldstr "
"
IL_0089: ldloc.s V_4
IL_008b: call System.String System.String::Concat(System.String,System.String,System.String)
IL_0090: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_0095: nop
IL_0096: ldc.i4.1
IL_0097: stloc.1
IL_0098: nop
IL_0099: nop
IL_009a: ldsfld System.Collections.Generic.Dictionary`2<System.String,System.String> ServerSync.VersionCheck::notProcessedNames
IL_009f: ldsfld System.Func`2<System.Collections.Generic.KeyValuePair`2<System.String,System.String>,System.String> ServerSync.VersionCheck/<>c::<>9__38_1
IL_00a4: dup
IL_00a5: brtrue IL_00c1
IL_00aa: pop
IL_00ab: ldsfld ServerSync.VersionCheck/<>c ServerSync.VersionCheck/<>c::<>9
IL_00b0: ldftn System.String ServerSync.VersionCheck/<>c::<ShowConnectionError>b__38_1(System.Collections.Generic.KeyValuePair`2<System.String,System.String>)
IL_00b6: newobj System.Void System.Func`2<System.Collections.Generic.KeyValuePair`2<System.String,System.String>,System.String>::.ctor(System.Object,System.IntPtr)
IL_00bb: dup
IL_00bc: stsfld System.Func`2<System.Collections.Generic.KeyValuePair`2<System.String,System.String>,System.String> ServerSync.VersionCheck/<>c::<>9__38_1
IL_00c1: call System.Linq.IOrderedEnumerable`1<!!0> System.Linq.Enumerable::OrderBy<System.Collections.Generic.KeyValuePair`2<System.String,System.String>,System.String>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,!!1>)
IL_00c6: callvirt System.Collections.Generic.IEnumerator`1<!0> System.Collections.Generic.IEnumerable`1<System.Collections.Generic.KeyValuePair`2<System.String,System.String>>::GetEnumerator()
IL_00cb: stloc.s V_5
IL_00cd: br IL_0155
IL_00d2: ldloc.s V_5
IL_00d4: callvirt !0 System.Collections.Generic.IEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.String,System.String>>::get_Current()
IL_00d9: stloc.s V_6
IL_00db: nop
IL_00dc: ldarg.0
IL_00dd: ldfld TMPro.TMP_Text FejdStartup::m_connectionFailedError
IL_00e2: callvirt System.String TMPro.TMP_Text::get_text()
IL_00e7: ldloca.s V_6
IL_00e9: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_00ee: callvirt System.Boolean System.String::Contains(System.String)
IL_00f3: ldc.i4.0
IL_00f4: ceq
IL_00f6: stloc.s V_7
IL_00f8: ldloc.s V_7
IL_00fa: brfalse IL_0154
IL_00ff: nop
IL_0100: ldarg.0
IL_0101: ldfld TMPro.TMP_Text FejdStartup::m_connectionFailedError
IL_0106: stloc.s V_8
IL_0108: ldloc.s V_8
IL_010a: ldc.i4.6
IL_010b: newarr System.String
IL_0110: dup
IL_0111: ldc.i4.0
IL_0112: ldloc.s V_8
IL_0114: callvirt System.String TMPro.TMP_Text::get_text()
IL_0119: stelem.ref
IL_011a: dup
IL_011b: ldc.i4.1
IL_011c: ldstr "
Server expects you to have "
IL_0121: stelem.ref
IL_0122: dup
IL_0123: ldc.i4.2
IL_0124: ldloca.s V_6
IL_0126: call !0 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Key()
IL_012b: stelem.ref
IL_012c: dup
IL_012d: ldc.i4.3
IL_012e: ldstr " (Version: "
IL_0133: stelem.ref
IL_0134: dup
IL_0135: ldc.i4.4
IL_0136: ldloca.s V_6
IL_0138: call !1 System.Collections.Generic.KeyValuePair`2<System.String,System.String>::get_Value()
IL_013d: stelem.ref
IL_013e: dup
IL_013f: ldc.i4.5
IL_0140: ldstr ") installed."
IL_0145: stelem.ref
IL_0146: call System.String System.String::Concat(System.String[])
IL_014b: callvirt System.Void TMPro.TMP_Text::set_text(System.String)
IL_0150: nop
IL_0151: ldc.i4.1
IL_0152: stloc.1
IL_0153: nop
IL_0154: nop
IL_0155: ldloc.s V_5
IL_0157: callvirt System.Boolean System.Collections.IEnumerator::MoveNext()
IL_015c: brtrue IL_00d2
IL_0161: leave IL_0176
IL_0166: ldloc.s V_5
IL_0168: brfalse IL_0175
IL_016d: ldloc.s V_5
IL_016f: callvirt System.Void System.IDisposable::Dispose()
IL_0174: nop
IL_0175: endfinally
IL_0176: ldloc.1
IL_0177: stloc.s V_9
IL_0179: ldloc.s V_9
IL_017b: brfalse IL_024d
IL_0180: nop
IL_0181: ldarg.0
IL_0182: ldfld UnityEngine.GameObject FejdStartup::m_connectionFailedPanel
IL_0187: callvirt UnityEngine.Transform UnityEngine.GameObject::get_transform()
IL_018c: ldstr "Image"
IL_0191: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_0196: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.RectTransform>()
IL_019b: stloc.s V_10
IL_019d: ldloc.s V_10
IL_019f: ldloc.s V_10
IL_01a1: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_sizeDelta()
IL_01a6: stloc.s V_11
IL_01a8: ldloca.s V_11
IL_01aa: ldc.r4 675
IL_01af: stfld System.Single UnityEngine.Vector2::x
IL_01b4: ldloc.s V_11
IL_01b6: callvirt System.Void UnityEngine.RectTransform::set_sizeDelta(UnityEngine.Vector2)
IL_01bb: nop
IL_01bc: ldarg.0
IL_01bd: ldfld TMPro.TMP_Text FejdStartup::m_connectionFailedError
IL_01c2: ldc.i4.0
IL_01c3: ldc.i4.0
IL_01c4: callvirt System.Void TMPro.TMP_Text::ForceMeshUpdate(System.Boolean,System.Boolean)
IL_01c9: nop
IL_01ca: ldarg.0
IL_01cb: ldfld TMPro.TMP_Text FejdStartup::m_connectionFailedError
IL_01d0: callvirt System.Single TMPro.TMP_Text::get_renderedHeight()
IL_01d5: ldc.r4 105
IL_01da: add
IL_01db: stloc.s V_12
IL_01dd: ldloc.s V_10
IL_01df: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_01e4: ldstr "ButtonOk"
IL_01e9: callvirt UnityEngine.Transform UnityEngine.Transform::Find(System.String)
IL_01ee: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.RectTransform>()
IL_01f3: stloc.s V_13
IL_01f5: ldloc.s V_13
IL_01f7: ldloc.s V_13
IL_01f9: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_anchoredPosition()
IL_01fe: ldfld System.Single UnityEngine.Vector2::x
IL_0203: ldloc.s V_13
IL_0205: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_anchoredPosition()
IL_020a: ldfld System.Single UnityEngine.Vector2::y
IL_020f: ldloc.s V_12
IL_0211: ldloc.s V_10
IL_0213: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_sizeDelta()
IL_0218: ldfld System.Single UnityEngine.Vector2::y
IL_021d: sub
IL_021e: ldc.r4 2
IL_0223: div
IL_0224: sub
IL_0225: newobj System.Void UnityEngine.Vector2::.ctor(System.Single,System.Single)
IL_022a: callvirt System.Void UnityEngine.RectTransform::set_anchoredPosition(UnityEngine.Vector2)
IL_022f: nop
IL_0230: ldloc.s V_10
IL_0232: ldloc.s V_10
IL_0234: callvirt UnityEngine.Vector2 UnityEngine.RectTransform::get_sizeDelta()
IL_0239: stloc.s V_11
IL_023b: ldloca.s V_11
IL_023d: ldloc.s V_12
IL_023f: stfld System.Single UnityEngine.Vector2::y
IL_0244: ldloc.s V_11
IL_0246: callvirt System.Void UnityEngine.RectTransform::set_sizeDelta(UnityEngine.Vector2)
IL_024b: nop
IL_024c: nop
IL_024d: ret
// EH Finally: 205 - 358 => 358 - 374

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
IL_0006: brfalse IL_0024
IL_000b: ldarg.1
IL_000c: ldfld System.Collections.Generic.List`1<ZRpc> ServerSync.VersionCheck::ValidatedClients
IL_0011: ldarg.0
IL_0012: ldfld ZRpc ServerSync.VersionCheck/<>c__DisplayClass30_0::rpc
IL_0017: callvirt System.Boolean System.Collections.Generic.List`1<ZRpc>::Contains(!0)
IL_001c: ldc.i4.0
IL_001d: ceq
IL_001f: br IL_0025
IL_0024: ldc.i4.0
IL_0025: ret

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
