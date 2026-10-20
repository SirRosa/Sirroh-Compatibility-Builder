
// System.Void FoodFreezer.Plugin::Awake()
.locals System.Reflection.MethodInfo[], System.Reflection.MethodInfo[], System.Int32, System.Reflection.MethodInfo
IL_0000: ldarg.0
IL_0001: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0006: ldstr "General"
IL_000b: ldstr "Enabled"
IL_0010: ldc.i4.1
IL_0011: ldstr "Master toggle for FoodFreezer."
IL_0016: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_001b: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> FoodFreezer.Plugin::Enabled
IL_0020: ldarg.0
IL_0021: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0026: ldstr "General"
IL_002b: ldstr "HearthCheckRadius"
IL_0030: ldc.r4 30
IL_0035: ldstr "Radius (meters) around the player to search for a hearth."
IL_003a: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Single>(System.String,System.String,!!0,System.String)
IL_003f: stsfld BepInEx.Configuration.ConfigEntry`1<System.Single> FoodFreezer.Plugin::HearthCheckRadius
IL_0044: ldarg.0
IL_0045: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_004a: ldstr "General"
IL_004f: ldstr "RequireLitFire"
IL_0054: ldc.i4.1
IL_0055: ldstr "Only freeze food while the hearth is burning."
IL_005a: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_005f: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> FoodFreezer.Plugin::RequireLitFire
IL_0064: ldarg.0
IL_0065: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_006a: ldstr "General"
IL_006f: ldstr "FallbackToRestingBuff"
IL_0074: ldc.i4.0
IL_0075: ldstr "Also freeze food while the Rested/Resting status effect is active."
IL_007a: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_007f: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> FoodFreezer.Plugin::FallbackToRestingBuff
IL_0084: ldarg.0
IL_0085: ldstr "com.foodfreezer.foodfreezer"
IL_008a: newobj System.Void HarmonyLib.Harmony::.ctor(System.String)
IL_008f: stfld HarmonyLib.Harmony FoodFreezer.Plugin::harmony
IL_0094: ldtoken Player
IL_0099: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_009e: ldc.i4.s 52
IL_00a0: callvirt System.Reflection.MethodInfo[] System.Type::GetMethods(System.Reflection.BindingFlags)
IL_00a5: ldsfld System.Func`2<System.Reflection.MethodInfo,System.Boolean> FoodFreezer.Plugin/<>c::<>9__6_0
IL_00aa: dup
IL_00ab: brtrue.s IL_00c4
IL_00ad: pop
IL_00ae: ldsfld FoodFreezer.Plugin/<>c FoodFreezer.Plugin/<>c::<>9
IL_00b3: ldftn System.Boolean FoodFreezer.Plugin/<>c::<Awake>b__6_0(System.Reflection.MethodInfo)
IL_00b9: newobj System.Void System.Func`2<System.Reflection.MethodInfo,System.Boolean>::.ctor(System.Object,System.IntPtr)
IL_00be: dup
IL_00bf: stsfld System.Func`2<System.Reflection.MethodInfo,System.Boolean> FoodFreezer.Plugin/<>c::<>9__6_0
IL_00c4: call System.Collections.Generic.IEnumerable`1<!!0> System.Linq.Enumerable::Where<System.Reflection.MethodInfo>(System.Collections.Generic.IEnumerable`1<!!0>,System.Func`2<!!0,System.Boolean>)
IL_00c9: call !!0[] System.Linq.Enumerable::ToArray<System.Reflection.MethodInfo>(System.Collections.Generic.IEnumerable`1<!!0>)
IL_00ce: stloc.0
IL_00cf: ldloc.0
IL_00d0: stloc.1
IL_00d1: ldc.i4.0
IL_00d2: stloc.2
IL_00d3: br.s IL_011e
IL_00d5: ldloc.1
IL_00d6: ldloc.2
IL_00d7: ldelem.ref
IL_00d8: stloc.3
IL_00d9: ldarg.0
IL_00da: ldfld HarmonyLib.Harmony FoodFreezer.Plugin::harmony
IL_00df: ldloc.3
IL_00e0: ldtoken FoodFreezer.Plugin
IL_00e5: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_00ea: ldstr "UpdateFoodPrefix"
IL_00ef: ldnull
IL_00f0: newobj System.Void HarmonyLib.HarmonyMethod::.ctor(System.Type,System.String,System.Type[])
IL_00f5: ldnull
IL_00f6: ldnull
IL_00f7: ldnull
IL_00f8: ldnull
IL_00f9: callvirt System.Reflection.MethodInfo HarmonyLib.Harmony::Patch(System.Reflection.MethodBase,HarmonyLib.HarmonyMethod,HarmonyLib.HarmonyMethod,HarmonyLib.HarmonyMethod,HarmonyLib.HarmonyMethod,HarmonyLib.HarmonyMethod)
IL_00fe: pop
IL_00ff: ldarg.0
IL_0100: call BepInEx.Logging.ManualLogSource BepInEx.BaseUnityPlugin::get_Logger()
IL_0105: ldstr "Patched "
IL_010a: ldloc.3
IL_010b: call System.String HarmonyLib.GeneralExtensions::FullDescription(System.Reflection.MethodBase)
IL_0110: call System.String System.String::Concat(System.String,System.String)
IL_0115: callvirt System.Void BepInEx.Logging.ManualLogSource::LogInfo(System.Object)
IL_011a: ldloc.2
IL_011b: ldc.i4.1
IL_011c: add
IL_011d: stloc.2
IL_011e: ldloc.2
IL_011f: ldloc.1
IL_0120: ldlen
IL_0121: conv.i4
IL_0122: blt.s IL_00d5
IL_0124: ldarg.0
IL_0125: call BepInEx.Logging.ManualLogSource BepInEx.BaseUnityPlugin::get_Logger()
IL_012a: ldstr "{0} {1} loaded ({2} UpdateFood overload(s) patched)."
IL_012f: ldstr "FoodFreezer"
IL_0134: ldstr "1.0.0"
IL_0139: ldloc.0
IL_013a: ldlen
IL_013b: conv.i4
IL_013c: box System.Int32
IL_0141: call System.String System.String::Format(System.String,System.Object,System.Object,System.Object)
IL_0146: callvirt System.Void BepInEx.Logging.ManualLogSource::LogInfo(System.Object)
IL_014b: ret

// System.Boolean FoodFreezer.Plugin::UpdateFoodPrefix(Player)
.locals 
IL_0000: ldarg.0
IL_0001: ldnull
IL_0002: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0007: brtrue.s IL_0016
IL_0009: ldarg.0
IL_000a: ldsfld Player Player::m_localPlayer
IL_000f: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0014: brfalse.s IL_0018
IL_0016: ldc.i4.1
IL_0017: ret
IL_0018: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> FoodFreezer.Plugin::Enabled
IL_001d: brfalse.s IL_002b
IL_001f: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> FoodFreezer.Plugin::Enabled
IL_0024: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0029: brtrue.s IL_002d
IL_002b: ldc.i4.1
IL_002c: ret
IL_002d: ldarg.0
IL_002e: call System.Boolean FoodFreezer.Plugin::ShouldFreeze(Player)
IL_0033: ldc.i4.0
IL_0034: ceq
IL_0036: ret

// System.Boolean FoodFreezer.Plugin::ShouldFreeze(Player)
.locals SEMan
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> FoodFreezer.Plugin::FallbackToRestingBuff
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brfalse.s IL_002f
IL_000c: ldarg.0
IL_000d: callvirt SEMan Character::GetSEMan()
IL_0012: stloc.0
IL_0013: ldloc.0
IL_0014: ldsfld System.Int32 SEMan::s_statusEffectRested
IL_0019: callvirt System.Boolean SEMan::HaveStatusEffect(System.Int32)
IL_001e: brtrue.s IL_002d
IL_0020: ldloc.0
IL_0021: ldsfld System.Int32 SEMan::s_statusEffectResting
IL_0026: callvirt System.Boolean SEMan::HaveStatusEffect(System.Int32)
IL_002b: brfalse.s IL_002f
IL_002d: ldc.i4.1
IL_002e: ret
IL_002f: ldarg.0
IL_0030: call System.Boolean FoodFreezer.Plugin::IsNearBurningFire(Player)
IL_0035: ret

// System.Boolean FoodFreezer.Plugin::IsNearBurningFire(Player)
.locals UnityEngine.Collider[], System.Int32, Fireplace
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> FoodFreezer.Plugin::HearthCheckRadius
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_000a: ldc.r4 0
IL_000f: bgt.un.s IL_0013
IL_0011: ldc.i4.0
IL_0012: ret
IL_0013: ldarg.0
IL_0014: callvirt UnityEngine.Transform UnityEngine.Component::get_transform()
IL_0019: callvirt UnityEngine.Vector3 UnityEngine.Transform::get_position()
IL_001e: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Single> FoodFreezer.Plugin::HearthCheckRadius
IL_0023: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Single>::get_Value()
IL_0028: ldsfld System.Int32 FoodFreezer.Plugin::HearthLayerMask
IL_002d: call UnityEngine.Collider[] UnityEngine.Physics::OverlapSphere(UnityEngine.Vector3,System.Single,System.Int32)
IL_0032: stloc.0
IL_0033: ldc.i4.0
IL_0034: stloc.1
IL_0035: br.s IL_0063
IL_0037: ldloc.0
IL_0038: ldloc.1
IL_0039: ldelem.ref
IL_003a: callvirt !!0 UnityEngine.Component::GetComponentInParent<Fireplace>()
IL_003f: stloc.2
IL_0040: ldloc.2
IL_0041: ldnull
IL_0042: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0047: brtrue.s IL_005f
IL_0049: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> FoodFreezer.Plugin::RequireLitFire
IL_004e: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_0053: brfalse.s IL_005d
IL_0055: ldloc.2
IL_0056: callvirt System.Boolean Fireplace::IsBurning()
IL_005b: brfalse.s IL_005f
IL_005d: ldc.i4.1
IL_005e: ret
IL_005f: ldloc.1
IL_0060: ldc.i4.1
IL_0061: add
IL_0062: stloc.1
IL_0063: ldloc.1
IL_0064: ldloc.0
IL_0065: ldlen
IL_0066: conv.i4
IL_0067: blt.s IL_0037
IL_0069: ldc.i4.0
IL_006a: ret

// System.Void FoodFreezer.Plugin::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BepInEx.BaseUnityPlugin::.ctor()
IL_0006: ret

// System.Void FoodFreezer.Plugin::.cctor()
.locals 
IL_0000: ldc.i4.2
IL_0001: newarr System.String
IL_0006: dup
IL_0007: ldc.i4.0
IL_0008: ldstr "piece"
IL_000d: stelem.ref
IL_000e: dup
IL_000f: ldc.i4.1
IL_0010: ldstr "piece_nonsolid"
IL_0015: stelem.ref
IL_0016: call System.Int32 UnityEngine.LayerMask::GetMask(System.String[])
IL_001b: stsfld System.Int32 FoodFreezer.Plugin::HearthLayerMask
IL_0020: ret

// System.Void FoodFreezer.Plugin/<>c::.cctor()
.locals 
IL_0000: newobj System.Void FoodFreezer.Plugin/<>c::.ctor()
IL_0005: stsfld FoodFreezer.Plugin/<>c FoodFreezer.Plugin/<>c::<>9
IL_000a: ret

// System.Void FoodFreezer.Plugin/<>c::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean FoodFreezer.Plugin/<>c::<Awake>b__6_0(System.Reflection.MethodInfo)
.locals 
IL_0000: ldarg.1
IL_0001: callvirt System.String System.Reflection.MemberInfo::get_Name()
IL_0006: ldstr "UpdateFood"
IL_000b: call System.Boolean System.String::op_Equality(System.String,System.String)
IL_0010: brfalse.s IL_003f
IL_0012: ldarg.1
IL_0013: callvirt System.Type System.Reflection.MemberInfo::get_DeclaringType()
IL_0018: ldtoken Player
IL_001d: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0022: call System.Boolean System.Type::op_Equality(System.Type,System.Type)
IL_0027: brfalse.s IL_003f
IL_0029: ldarg.1
IL_002a: callvirt System.Type System.Reflection.MethodInfo::get_ReturnType()
IL_002f: ldtoken System.Void
IL_0034: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0039: call System.Boolean System.Type::op_Equality(System.Type,System.Type)
IL_003e: ret
IL_003f: ldc.i4.0
IL_0040: ret
