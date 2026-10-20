
// System.Void NoSlopeSlide.NoSlopeSlide::Awake()
.locals 
IL_0000: ldarg.0
IL_0001: call BepInEx.Configuration.ConfigFile BepInEx.BaseUnityPlugin::get_Config()
IL_0006: ldstr "General"
IL_000b: ldstr "Enabled"
IL_0010: ldc.i4.1
IL_0011: ldstr "Enable this mod."
IL_0016: callvirt BepInEx.Configuration.ConfigEntry`1<!!0> BepInEx.Configuration.ConfigFile::Bind<System.Boolean>(System.String,System.String,!!0,System.String)
IL_001b: stsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> NoSlopeSlide.NoSlopeSlide::Enabled
IL_0020: ldarg.0
IL_0021: ldstr "orax.NoSlopeSlide"
IL_0026: newobj System.Void HarmonyLib.Harmony::.ctor(System.String)
IL_002b: stfld HarmonyLib.Harmony NoSlopeSlide.NoSlopeSlide::_harmony
IL_0030: ldarg.0
IL_0031: ldfld HarmonyLib.Harmony NoSlopeSlide.NoSlopeSlide::_harmony
IL_0036: callvirt System.Void HarmonyLib.Harmony::PatchAll()
IL_003b: ldarg.0
IL_003c: call BepInEx.Logging.ManualLogSource BepInEx.BaseUnityPlugin::get_Logger()
IL_0041: ldstr "NoSlopeSlide v0.1.0 loaded."
IL_0046: callvirt System.Void BepInEx.Logging.ManualLogSource::LogInfo(System.Object)
IL_004b: ret

// System.Void NoSlopeSlide.NoSlopeSlide::OnDestroy()
.locals 
IL_0000: ldarg.0
IL_0001: ldfld HarmonyLib.Harmony NoSlopeSlide.NoSlopeSlide::_harmony
IL_0006: dup
IL_0007: brtrue.s IL_000b
IL_0009: pop
IL_000a: ret
IL_000b: call System.Void HarmonyLib.Harmony::UnpatchSelf()
IL_0010: ret

// System.Void NoSlopeSlide.NoSlopeSlide::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void BepInEx.BaseUnityPlugin::.ctor()
IL_0006: ret

// System.Void NoSlopeSlide.Patch::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Boolean NoSlopeSlide.Patch/Character_ApplySlide_Patch::Prefix(Character)
.locals 
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> NoSlopeSlide.NoSlopeSlide::Enabled
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000e
IL_000c: ldc.i4.1
IL_000d: ret
IL_000e: ldarg.0
IL_000f: ldnull
IL_0010: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0015: brtrue.s IL_0021
IL_0017: ldarg.0
IL_0018: callvirt System.Boolean Character::IsPlayer()
IL_001d: ldc.i4.0
IL_001e: ceq
IL_0020: ret
IL_0021: ldc.i4.1
IL_0022: ret

// System.Void NoSlopeSlide.Patch/Character_ApplySlide_Patch::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret

// System.Void NoSlopeSlide.Patch/Character_UpdateMotion_Patch::Prefix(Character)
.locals UnityEngine.Rigidbody, UnityEngine.Vector3, UnityEngine.Vector3
IL_0000: ldsfld BepInEx.Configuration.ConfigEntry`1<System.Boolean> NoSlopeSlide.NoSlopeSlide::Enabled
IL_0005: callvirt !0 BepInEx.Configuration.ConfigEntry`1<System.Boolean>::get_Value()
IL_000a: brtrue.s IL_000d
IL_000c: ret
IL_000d: ldarg.0
IL_000e: ldnull
IL_000f: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0014: brtrue.s IL_0023
IL_0016: ldarg.0
IL_0017: ldsfld Player Player::m_localPlayer
IL_001c: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_0021: brfalse.s IL_0024
IL_0023: ret
IL_0024: ldarg.0
IL_0025: callvirt UnityEngine.Vector3 Character::GetMoveDir()
IL_002a: call UnityEngine.Vector3 UnityEngine.Vector3::get_zero()
IL_002f: call System.Boolean UnityEngine.Vector3::op_Inequality(UnityEngine.Vector3,UnityEngine.Vector3)
IL_0034: brtrue.s IL_006c
IL_0036: ldarg.0
IL_0037: callvirt System.Boolean Character::IsOnGround()
IL_003c: brfalse.s IL_006c
IL_003e: ldarg.0
IL_003f: callvirt System.Boolean Character::IsSwimming()
IL_0044: brtrue.s IL_006c
IL_0046: ldarg.0
IL_0047: callvirt System.Boolean Character::IsAttached()
IL_004c: brtrue.s IL_006c
IL_004e: ldarg.0
IL_004f: callvirt System.Boolean Character::IsRiding()
IL_0054: brtrue.s IL_006c
IL_0056: ldarg.0
IL_0057: callvirt System.Boolean Character::IsDead()
IL_005c: brtrue.s IL_006c
IL_005e: ldarg.0
IL_005f: callvirt Ship Character::GetStandingOnShip()
IL_0064: ldnull
IL_0065: call System.Boolean UnityEngine.Object::op_Inequality(UnityEngine.Object,UnityEngine.Object)
IL_006a: brfalse.s IL_006d
IL_006c: ret
IL_006d: ldarg.0
IL_006e: callvirt !!0 UnityEngine.Component::GetComponent<UnityEngine.Rigidbody>()
IL_0073: stloc.0
IL_0074: ldarg.0
IL_0075: ldfld UnityEngine.Vector3 Character::m_lastGroundNormal
IL_007a: stloc.1
IL_007b: ldloc.0
IL_007c: ldnull
IL_007d: call System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL_0082: brfalse.s IL_0085
IL_0084: ret
IL_0085: ldloca.s V_1
IL_0087: call System.Single UnityEngine.Vector3::get_sqrMagnitude()
IL_008c: ldc.r4 0.5
IL_0091: bge.un.s IL_0094
IL_0093: ret
IL_0094: ldloca.s V_1
IL_0096: call System.Void UnityEngine.Vector3::Normalize()
IL_009b: call UnityEngine.Vector3 UnityEngine.Physics::get_gravity()
IL_00a0: ldloc.1
IL_00a1: call UnityEngine.Vector3 UnityEngine.Vector3::ProjectOnPlane(UnityEngine.Vector3,UnityEngine.Vector3)
IL_00a6: stloc.2
IL_00a7: ldloc.0
IL_00a8: ldloc.2
IL_00a9: call UnityEngine.Vector3 UnityEngine.Vector3::op_UnaryNegation(UnityEngine.Vector3)
IL_00ae: ldc.i4.5
IL_00af: callvirt System.Void UnityEngine.Rigidbody::AddForce(UnityEngine.Vector3,UnityEngine.ForceMode)
IL_00b4: ret

// System.Void NoSlopeSlide.Patch/Character_UpdateMotion_Patch::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: call System.Void System.Object::.ctor()
IL_0006: ret
