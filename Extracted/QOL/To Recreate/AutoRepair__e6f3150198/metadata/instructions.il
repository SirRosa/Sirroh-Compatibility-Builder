
// System.Void AutoRepair.Main::Awake()
.locals System.Reflection.Assembly
IL_0000: nop
IL_0001: call System.Reflection.Assembly System.Reflection.Assembly::GetExecutingAssembly()
IL_0006: stloc.0
IL_0007: ldarg.0
IL_0008: ldfld HarmonyLib.Harmony AutoRepair.Main::HarmonyInstance
IL_000d: ldloc.0
IL_000e: callvirt System.Void HarmonyLib.Harmony::PatchAll(System.Reflection.Assembly)
IL_0013: nop
IL_0014: ret

// System.Void AutoRepair.Main::.ctor()
.locals 
IL_0000: ldarg.0
IL_0001: ldstr "mtsukn.AutoRepair"
IL_0006: newobj System.Void HarmonyLib.Harmony::.ctor(System.String)
IL_000b: stfld HarmonyLib.Harmony AutoRepair.Main::HarmonyInstance
IL_0010: ldarg.0
IL_0011: call System.Void BepInEx.BaseUnityPlugin::.ctor()
IL_0016: nop
IL_0017: ret

// System.Void AutoRepair.Main::.cctor()
.locals 
IL_0000: ldstr "AutoRepair"
IL_0005: call BepInEx.Logging.ManualLogSource BepInEx.Logging.Logger::CreateLogSource(System.String)
IL_000a: stsfld BepInEx.Logging.ManualLogSource AutoRepair.Main::logger
IL_000f: ret

// System.Void AutoRepair.Main/CraftingPatch::Postfix(CraftingStation,Humanoid,System.Boolean,System.Boolean)
.locals System.Int32, InventoryGui, System.Reflection.MethodInfo, System.Boolean, System.Boolean
IL_0000: nop
IL_0001: ldc.i4.0
IL_0002: stloc.0
IL_0003: call InventoryGui InventoryGui::get_instance()
IL_0008: stloc.1
IL_0009: ldtoken InventoryGui
IL_000e: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0013: ldstr "HaveRepairableItems"
IL_0018: ldnull
IL_0019: ldnull
IL_001a: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_001f: stloc.2
IL_0020: br.s IL_0046
IL_0022: nop
IL_0023: ldloc.0
IL_0024: ldc.i4.1
IL_0025: add
IL_0026: stloc.0
IL_0027: ldtoken InventoryGui
IL_002c: call System.Type System.Type::GetTypeFromHandle(System.RuntimeTypeHandle)
IL_0031: ldstr "RepairOneItem"
IL_0036: ldnull
IL_0037: ldnull
IL_0038: call System.Reflection.MethodInfo HarmonyLib.AccessTools::Method(System.Type,System.String,System.Type[],System.Type[])
IL_003d: ldloc.1
IL_003e: ldnull
IL_003f: callvirt System.Object System.Reflection.MethodBase::Invoke(System.Object,System.Object[])
IL_0044: pop
IL_0045: nop
IL_0046: ldloc.2
IL_0047: ldloc.1
IL_0048: ldnull
IL_0049: callvirt System.Object System.Reflection.MethodBase::Invoke(System.Object,System.Object[])
IL_004e: unbox.any System.Boolean
IL_0053: stloc.3
IL_0054: ldloc.3
IL_0055: brtrue.s IL_0022
IL_0057: ldloc.0
IL_0058: ldc.i4.0
IL_0059: cgt
IL_005b: stloc.s V_4
IL_005d: ldloc.s V_4
IL_005f: brfalse.s IL_0092
IL_0061: nop
IL_0062: ldsfld Player Player::m_localPlayer
IL_0067: ldc.i4.2
IL_0068: ldstr " "
IL_006d: ldc.i4.0
IL_006e: ldnull
IL_006f: ldc.i4.0
IL_0070: callvirt System.Void Character::Message(MessageHud/MessageType,System.String,System.Int32,UnityEngine.Sprite,System.Boolean)
IL_0075: nop
IL_0076: ldsfld BepInEx.Logging.ManualLogSource AutoRepair.Main::logger
IL_007b: ldstr "[AutoRepair] Repaired {0} objects!
"
IL_0080: ldloc.0
IL_0081: box System.Int32
IL_0086: call System.String System.String::Format(System.String,System.Object)
IL_008b: callvirt System.Void BepInEx.Logging.ManualLogSource::LogInfo(System.Object)
IL_0090: nop
IL_0091: nop
IL_0092: ret
