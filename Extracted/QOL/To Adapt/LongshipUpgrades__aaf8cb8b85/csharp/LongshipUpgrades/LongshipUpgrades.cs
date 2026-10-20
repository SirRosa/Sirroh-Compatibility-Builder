using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading;
using BepInEx;
using BepInEx.Configuration;
using ConditionalConfigSync;
using HarmonyLib;
using LocalizationManager;
using UnityEngine;

namespace LongshipUpgrades;

[BepInPlugin("shudnal.LongshipUpgrades", "Longship Upgrades", "1.0.23")]
[BepInDependency("_shudnal.ConditionalConfigSync", "1.0.5")]
public class LongshipUpgrades : BaseUnityPlugin
{
	[HarmonyPatch(typeof(ZoneSystem), "Start")]
	public static class ZoneSystem_Start_FixCustomizableParts
	{
		[HarmonyPriority(0)]
		private static void Postfix()
		{
			ItemNameTokens.UpdateRegisters();
			RegisterShipMapRpcs();
			LongshipCustomizableParts.OnGlobalStart();
		}
	}

	[HarmonyPatch(typeof(ZoneSystem), "OnDestroy")]
	public static class ZoneSystem_OnDestroy_ClearValues
	{
		[HarmonyPriority(0)]
		private static void Postfix()
		{
			ClearShipMapRuntime();
			LongshipCustomizableParts.OnGlobalDestroy();
		}
	}

	[HarmonyPatch(typeof(Ship))]
	public static class Ship_OnTrigger_IgnoreFireWarmthCollider
	{
		private static readonly Dictionary<Ship, Dictionary<Collider, int>> triggerCounter = new Dictionary<Ship, Dictionary<Collider, int>>();

		private static bool IsHeatActive(Ship ship)
		{
			LongshipCustomizableParts parts;
			return LongshipCustomizableParts.TryGetShipComponent(ship, out parts) && parts.IsHeatActive();
		}

		[HarmonyPostfix]
		[HarmonyPatch("OnEnable")]
		public static void OnEnablePostfix(Ship __instance)
		{
			triggerCounter.Add(__instance, new Dictionary<Collider, int>());
		}

		[HarmonyPostfix]
		[HarmonyPatch("OnDisable")]
		public static void OnDisablePostfix(Ship __instance)
		{
			triggerCounter.Remove(__instance);
		}

		[HarmonyPrefix]
		[HarmonyPatch("OnTriggerEnter")]
		public static bool OnTriggerEnterPrefix(Ship __instance, Collider collider)
		{
			if (!Object.op_Implicit((Object)(object)((Component)collider).GetComponent<Character>()))
			{
				return true;
			}
			if (!triggerCounter.TryGetValue(__instance, out var value))
			{
				return true;
			}
			if (!value.ContainsKey(collider))
			{
				value[collider] = 1;
				return true;
			}
			value[collider]++;
			return false;
		}

		[HarmonyPrefix]
		[HarmonyPatch("OnTriggerExit")]
		public static bool OnTriggerExitPrefix(Ship __instance, Collider collider)
		{
			if (!Object.op_Implicit((Object)(object)((Component)collider).GetComponent<Character>()))
			{
				return true;
			}
			if (!triggerCounter.TryGetValue(__instance, out var value))
			{
				return true;
			}
			if (!value.TryGetValue(collider, out var value2))
			{
				return true;
			}
			if (value2 == 1)
			{
				value.Remove(collider);
				return true;
			}
			value[collider]--;
			return false;
		}
	}

	public class ShipMapDataEntry
	{
		public int Revision;

		public byte[] Data;

		public int Hash;

		public float LastAccessTime;
	}

	[HarmonyPatch]
	public static class ZDOMan_Load_TrackShipMapZdos
	{
		private static IEnumerable<MethodBase> TargetMethods()
		{
			yield return AccessTools.Method(typeof(ZDOMan), "Load", (Type[])null, (Type[])null);
			yield return AccessTools.Method(typeof(ZDOMan), "LoadChunks", (Type[])null, (Type[])null);
		}

		public static void Postfix(ZDOMan __instance)
		{
			RebuildTrackedShipZdos(__instance.m_objectsByID.Values);
		}
	}

	[HarmonyPatch(typeof(ZDOMan), "CreateNewZDO", new Type[]
	{
		typeof(Vector3),
		typeof(int)
	})]
	public static class ZDOMan_CreateNewZDO_TrackShipMapZdos
	{
		public static void Postfix(ZDO __result)
		{
			TrackShipZdo(__result);
		}
	}

	[HarmonyPatch(typeof(ZDOMan), "CreateNewZDO", new Type[]
	{
		typeof(ZDOID),
		typeof(Vector3),
		typeof(int)
	})]
	public static class ZDOMan_CreateNewZDO_WithUid_TrackShipMapZdos
	{
		public static void Postfix(ZDO __result)
		{
			TrackShipZdo(__result);
		}
	}

	[HarmonyPatch(typeof(ZDOMan), "HandleDestroyedZDO")]
	public static class ZDOMan_HandleDestroyedZDO_ClearShipMapStore
	{
		public static void Prefix(ZDOID uid)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			RemoveShipMapData(uid);
		}
	}

	[HarmonyPatch(typeof(ZDO), "Deserialize")]
	public static class ZDO_Deserialize_TrackShipMapData
	{
		public static void Postfix(ZDO __instance)
		{
			TrackShipZdo(__instance);
		}
	}

	[HarmonyPatch(typeof(ZDOMan), "PrepareSave")]
	public static class ZDOMan_PrepareSave_InjectShipMapData
	{
		[HarmonyPriority(800)]
		public static void Prefix(ref ShipMapSaveState __state)
		{
			if (!((Object)(object)ZNet.instance == (Object)null) && ZNet.instance.IsServer())
			{
				ApplyShipMapConfiguration(beforeSave: true);
				if (ShipMapsEnabled)
				{
					__state = new ShipMapSaveState();
					InjectShipMapDataForSave(__state);
				}
			}
		}

		public static Exception Finalizer(ShipMapSaveState __state, Exception __exception)
		{
			try
			{
				RemoveShipMapSaveInjection(__state);
			}
			catch (Exception ex)
			{
				LogWarning($"Ship map save cleanup failed: {ex}");
				return __exception ?? ex;
			}
			return __exception;
		}
	}

	[HarmonyPatch(typeof(ZDOMan), "Update")]
	public static class ZDOMan_Update_PruneClientShipMapStore
	{
		public static void Prefix()
		{
			ApplyShipMapConfiguration();
		}

		public static void Postfix()
		{
			PruneClientShipMapStore();
		}
	}

	[HarmonyPatch(typeof(Ship), "UpdateControlls")]
	public static class Ship_UpdateControlls_SpeedLimitWithoutMast
	{
		public static void Prefix(Ship __instance)
		{
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			if (IsControlledComponent((Component)(object)__instance) && Object.op_Implicit((Object)(object)__instance.m_nview) && __instance.m_nview.IsValid() && __instance.IsSailUp() && __instance.m_nview.GetZDO().GetBool(LongshipCustomizableParts.s_mastRemoved, false))
			{
				__instance.m_speed = (Speed)2;
			}
		}
	}

	[HarmonyPatch(typeof(Container), "Awake")]
	public static class Container_Awake_CargoUpgrades
	{
		private static bool CheckAccess(Container container)
		{
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			return (!container.m_checkGuardStone || PrivateArea.CheckAccess(((Component)container).transform.position, 0f, false, false)) && container.CheckAccess(Game.instance.GetPlayerProfile().GetPlayerID());
		}

		public static void Prefix(Container __instance)
		{
			if (!containerEnabled.Value || !IsControlledComponent((Component)(object)__instance))
			{
				return;
			}
			ZNetView val = (Object.op_Implicit((Object)(object)__instance.m_rootObjectOverride) ? ((Component)__instance.m_rootObjectOverride).GetComponent<ZNetView>() : ((Component)__instance).GetComponent<ZNetView>());
			if (!((Object)(object)val == (Object)null) && val.IsValid())
			{
				if (val.GetZDO().GetBool(LongshipCustomizableParts.s_containerUpgradedLvl1, false) && __instance.m_width < containerWidth.Value)
				{
					__instance.m_width = containerWidth.Value;
					string name = ((object)__instance).GetType().Name;
					val.GetZDO().Set("HasFields", true);
					val.GetZDO().Set(StringExtensionMethods.GetStableHashCode("HasFields" + name), true);
					val.GetZDO().Set(name + ".m_width", containerWidth.Value);
				}
				if (val.GetZDO().GetBool(LongshipCustomizableParts.s_containerUpgradedLvl2, false) && __instance.m_height < containerHeight.Value)
				{
					__instance.m_height = containerHeight.Value;
					string name2 = ((object)__instance).GetType().Name;
					val.GetZDO().Set("HasFields", true);
					val.GetZDO().Set(StringExtensionMethods.GetStableHashCode("HasFields" + name2), true);
					val.GetZDO().Set(name2 + ".m_height", containerHeight.Value);
				}
			}
		}
	}

	[HarmonyPatch(typeof(Ladder), "GetHoverText")]
	public static class Ladder_GetHoverText_BoxClimb
	{
		public static bool Prefix(Ladder __instance, ref string __result)
		{
			if (!IsBoxLadder(__instance))
			{
				return true;
			}
			if (__instance.InUseDistance((Humanoid)(object)Player.m_localPlayer) && !((Character)Player.m_localPlayer).IsAttached())
			{
				__result = Localization.instance.Localize(__instance.m_name + "\n[<color=yellow><b>$KEY_Use</b></color>] $lu_box_climb");
			}
			else
			{
				__result = "";
			}
			return false;
		}
	}

	[HarmonyPatch(typeof(Ladder), "Interact")]
	public static class Ladder_Interact_BoxClimb
	{
		public static bool Prefix(Ladder __instance, Humanoid character)
		{
			return !IsBoxLadder(__instance) || !((Character)character).IsAttached();
		}

		public static void Postfix(Ladder __instance, Humanoid character, bool hold)
		{
			//IL_0034: Unknown result type (might be due to invalid IL or missing references)
			if (IsBoxLadder(__instance) && !hold && __instance.InUseDistance(character) && !((Character)character).IsAttached())
			{
				((Character)character).SetMoveDir(__instance.m_targetPos.forward);
				((Character)character).UpdateWalking(Time.deltaTime);
			}
		}
	}

	[HarmonyPatch(typeof(MapTable), "OnRead", new Type[]
	{
		typeof(Switch),
		typeof(Humanoid),
		typeof(ItemData),
		typeof(bool)
	})]
	public static class MapTable_OnRead_TrackCompressionContext
	{
		public static bool Prefix(MapTable __instance, ref bool __state)
		{
			__state = false;
			if (!IsShipMapTable(__instance))
			{
				return true;
			}
			if (!ShipMapsEnabled)
			{
				return false;
			}
			if (IsValidMapTable(__instance))
			{
				InjectShipMapDataIntoZdo(__instance.m_nview.GetZDO());
			}
			s_mapTableDataCompressionFlags.Push(IsValidMapTable(__instance) && __instance.m_nview.GetZDO().GetBool(LongshipCustomizableParts.s_mapDataCompressed, false));
			__state = true;
			return true;
		}

		public static Exception Finalizer(MapTable __instance, bool __state, Exception __exception)
		{
			//IL_0026: Unknown result type (might be due to invalid IL or missing references)
			if (__state)
			{
				if (s_mapTableWriteDepth == 0 && IsValidMapTable(__instance))
				{
					RemoveShipMapDataFromRuntime(__instance.m_nview.GetZDO().m_uid);
				}
				if (s_mapTableDataCompressionFlags.Count > 0)
				{
					s_mapTableDataCompressionFlags.Pop();
				}
			}
			return __exception;
		}
	}

	[HarmonyPatch(typeof(MapTable), "OnWrite")]
	public static class MapTable_OnWrite_ScaleWriteEffects
	{
		public static bool inCall;

		public static bool Prefix(MapTable __instance, ref bool __state)
		{
			__state = false;
			inCall = IsShipMapTable(__instance) && ShipMapsEnabled;
			if (!IsShipMapTable(__instance))
			{
				return true;
			}
			if (!ShipMapsEnabled)
			{
				return false;
			}
			if (IsValidMapTable(__instance))
			{
				InjectShipMapDataIntoZdo(__instance.m_nview.GetZDO());
			}
			s_mapTableDataCompressionFlags.Push(IsValidMapTable(__instance) && __instance.m_nview.GetZDO().GetBool(LongshipCustomizableParts.s_mapDataCompressed, false));
			s_mapTableWriteDepth++;
			__state = true;
			return true;
		}

		public static Exception Finalizer(MapTable __instance, bool __state, Exception __exception)
		{
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			inCall = false;
			if (__state)
			{
				if (IsValidMapTable(__instance))
				{
					RemoveShipMapDataFromRuntime(__instance.m_nview.GetZDO().m_uid);
				}
				if (s_mapTableDataCompressionFlags.Count > 0)
				{
					s_mapTableDataCompressionFlags.Pop();
				}
				s_mapTableWriteDepth = Math.Max(0, s_mapTableWriteDepth - 1);
			}
			return __exception;
		}
	}

	[HarmonyPatch(typeof(MapTable), "RPC_MapData")]
	public static class MapTable_RPC_MapData_MarkCompressed
	{
		public static bool Prefix(MapTable __instance, ref byte[] __state)
		{
			//IL_0066: Unknown result type (might be due to invalid IL or missing references)
			//IL_0072: Unknown result type (might be due to invalid IL or missing references)
			__state = null;
			if (!IsShipMapTable(__instance))
			{
				return true;
			}
			if (!ShipMapsEnabled)
			{
				return false;
			}
			if (!IsValidMapTable(__instance) || !__instance.m_nview.IsOwner())
			{
				return true;
			}
			ZDO zDO = __instance.m_nview.GetZDO();
			InjectShipMapDataIntoZdo(zDO);
			DetachZdoFields(ZDOExtraData.s_byteArrays, zDO.m_uid);
			if (TryGetShipMapData(zDO.m_uid, out var entry) && entry.Data != null)
			{
				__state = (byte[])entry.Data.Clone();
			}
			return true;
		}

		public static void Postfix(MapTable __instance, byte[] __state)
		{
			//IL_0079: Unknown result type (might be due to invalid IL or missing references)
			//IL_0100: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ab: Unknown result type (might be due to invalid IL or missing references)
			if (!ShipMapsEnabled || !IsShipMapTable(__instance) || !IsValidMapTable(__instance) || !__instance.m_nview.IsOwner())
			{
				return;
			}
			ZDO zDO = __instance.m_nview.GetZDO();
			byte[] byteArray = zDO.GetByteArray(ZDOVars.s_data, (byte[])null);
			bool flag = ((__state == null) ? (byteArray != null) : (byteArray == null || !StructuralComparisons.StructuralEqualityComparer.Equals(__state, byteArray)));
			int num = Math.Max(zDO.GetInt(s_shipMapDataRevision, 0), GetShipMapRevision(zDO.m_uid));
			if (byteArray != null)
			{
				num = (flag ? Math.Max(1, num + 1) : Math.Max(1, num));
				SetShipMapData(zDO.m_uid, num, byteArray);
				SetShipMapInt(zDO, LongshipCustomizableParts.s_mapDataCompressed, 1);
				SyncShipMapRevision(zDO, num);
				if ((Object)(object)ZNet.instance != (Object)null && !ZNet.instance.IsServer())
				{
					SubmitShipMapDataToServer(zDO, num, byteArray);
				}
			}
			RemoveShipMapDataFromRuntime(zDO.m_uid);
		}
	}

	[HarmonyPatch(typeof(ZDO), "Serialize")]
	public static class ZDO_Serialize_SkipUnchangedShipMapData
	{
		public struct SerializeState
		{
			public bool Removed;

			public byte[] Data;
		}

		public static void Prefix(ZDO __instance, ref SerializeState __state)
		{
			//IL_0051: Unknown result type (might be due to invalid IL or missing references)
			//IL_0086: Unknown result type (might be due to invalid IL or missing references)
			__state = default;
			if (__instance.GetPrefab() == LongshipCustomizableParts.prefabInt)
			{
				BinarySearchDictionary<int, byte[]> value;
				byte[] array = default;
				if (!ShipMapsEnabled)
				{
					PurgeShipMapData(__instance);
				}
				else if (__instance.GetBool(LongshipCustomizableParts.s_mapDataCompressed, false) && ZDOExtraData.s_byteArrays.TryGetValue(__instance.m_uid, out value) && value.TryGetValue(ZDOVars.s_data, ref array) && array != null)
				{
					__state.Data = array;
					__state.Removed = RemoveShipMapDataFromRuntime(__instance.m_uid);
				}
			}
		}

		public static void Finalizer(ZDO __instance, SerializeState __state)
		{
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			if (__state.Removed && ShipMapsEnabled && IsShipZdo(__instance))
			{
				SetShipMapDataInRuntime(__instance.m_uid, __state.Data);
			}
		}
	}

	[HarmonyPatch(typeof(Minimap), "ReadExploredArray")]
	public static class Minimap_ReadExploredArray_CompressedShipMapData
	{
		public static bool Prefix(Minimap __instance, ZPackage pkg, ref List<bool> __result)
		{
			if (!IsCompressedMapDataContext())
			{
				return true;
			}
			int num = pkg.ReadInt();
			if (num != __instance.m_explored.Length)
			{
				ZLog.LogWarning((object)("Map exploration array size missmatch:" + num + " VS " + __instance.m_explored.Length));
				__result = null;
				return false;
			}
			byte[] array = pkg.ReadByteArray();
			BitArray bitArray = new BitArray(array);
			List<bool> list = new List<bool>(num);
			for (int i = 0; i < num; i++)
			{
				list.Add(i < bitArray.Count && bitArray[i]);
			}
			LogInfo($"Ship map data read: explored payload unpacked {array.Length} -> {num} bytes ({Math.Max(0, num - array.Length)} bytes added)");
			__result = list;
			return false;
		}
	}

	[HarmonyPatch(typeof(Minimap), "GetSharedMapData")]
	public static class Minimap_GetSharedMapData_CompressShipMapData
	{
		public static void Postfix(ref byte[] __result)
		{
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			//IL_001c: Expected Obj, but got Unknown
			//IL_00a8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00af: Expected Obj, but got Unknown
			//IL_0108: Unknown result type (might be due to invalid IL or missing references)
			//IL_010d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0148: Unknown result type (might be due to invalid IL or missing references)
			if (s_mapTableWriteDepth == 0)
			{
				return;
			}
			ZPackage val = new ZPackage(__result);
			int num = val.ReadInt();
			int num2 = val.ReadInt();
			bool[] array = new bool[num2];
			for (int i = 0; i < num2; i++)
			{
				array[i] = val.ReadBool();
			}
			BitArray bitArray = new BitArray(array);
			byte[] array2 = new byte[(bitArray.Length - 1) / 8 + 1];
			bitArray.CopyTo(array2, 0);
			LogInfo($"Ship map data write: explored payload compressed {num2} -> {array2.Length} bytes ({Math.Max(0, num2 - array2.Length)} bytes saved)");
			ZPackage val2 = new ZPackage();
			val2.Write(num);
			val2.Write(num2);
			val2.Write(array2);
			if (num >= 2)
			{
				int num3 = val.ReadInt();
				val2.Write(num3);
				for (int j = 0; j < num3; j++)
				{
					long num4 = val.ReadLong();
					string text = val.ReadString();
					Vector3 val3 = val.ReadVector3();
					int num5 = val.ReadInt();
					bool flag = val.ReadBool();
					string text2 = ((num >= 3) ? val.ReadString() : string.Empty);
					val2.Write(num4);
					val2.Write(text);
					val2.Write(val3);
					val2.Write(num5);
					val2.Write(flag);
					if (num >= 3)
					{
						val2.Write(text2);
					}
				}
			}
			__result = val2.GetArray();
		}
	}

	[HarmonyPatch(typeof(EffectList), "Create")]
	public static class EffectList_Create_ScaleWriteEffects
	{
		public static void Prefix(EffectList __instance, ref float scale, ref bool __state)
		{
			if (MapTable_OnWrite_ScaleWriteEffects.inCall)
			{
				scale = 0.1f;
				if (__instance.HasEffects() && !__instance.m_effectPrefabs[0].m_scale)
				{
					__state = true;
					__instance.m_effectPrefabs[0].m_scale = true;
				}
			}
		}

		public static void Finalizer(EffectList __instance, bool __state)
		{
			if (__state)
			{
				__instance.m_effectPrefabs[0].m_scale = false;
			}
		}
	}

	[HarmonyPatch(typeof(MapTable), "Start")]
	public static class MapTable_Start_PreventStartScript
	{
		[HarmonyPriority(800)]
		public static bool Prefix(MapTable __instance)
		{
			return ((Object)__instance).name != "maptable" || !IsControlledComponent((Component)(object)__instance);
		}
	}

	public sealed class ShipMapSaveState
	{
		internal readonly List<KeyValuePair<ZDOID, byte[]>> InjectedMaps = new List<KeyValuePair<ZDOID, byte[]>>();

		internal readonly Stopwatch Timer = Stopwatch.StartNew();

		internal bool CleanupCompleted;
	}

	public const string pluginID = "shudnal.LongshipUpgrades";

	public const string pluginName = "Longship Upgrades";

	public const string pluginVersion = "1.0.23";

	private readonly Harmony harmony = new Harmony("shudnal.LongshipUpgrades");

	internal static readonly ConfigSync configSync = new ConfigSync("shudnal.LongshipUpgrades")
	{
		DisplayName = "Longship Upgrades",
		CurrentVersion = "1.0.23",
		MinimumRequiredVersion = "1.0.23",
		ModRequired = true
	};

	internal static LongshipUpgrades instance;

	internal static ConfigEntry<bool> configLocked;

	internal static ConfigEntry<bool> loggingEnabled;

	internal static ConfigEntry<bool> onlyCreatorUpgrades;

	internal static ConfigEntry<bool> onlyCreatorStand;

	internal static ConfigEntry<Color> hintStationColor;

	internal static ConfigEntry<Color> hintColor;

	internal static ConfigEntry<Color> hintAmountColor;

	internal static ConfigEntry<Color> hintItemColor;

	internal static ConfigEntry<bool> containerEnabled;

	internal static ConfigEntry<int> containerHeight;

	internal static ConfigEntry<int> containerWidth;

	internal static ConfigEntry<string> containerLvl1Station;

	internal static ConfigEntry<int> containerLvl1StationLvl;

	internal static ConfigEntry<int> containerLvl1StationRange;

	internal static ConfigEntry<string> containerLvl1UpgradeRecipe;

	internal static ConfigEntry<string> containerLvl2Station;

	internal static ConfigEntry<int> containerLvl2StationLvl;

	internal static ConfigEntry<int> containerLvl2StationRange;

	internal static ConfigEntry<string> containerLvl2UpgradeRecipe;

	internal static ConfigEntry<bool> healthEnabled;

	internal static ConfigEntry<int> healthUpgradeLvl1;

	internal static ConfigEntry<int> healthUpgradeLvl2;

	internal static ConfigEntry<bool> ashlandsProtection;

	internal static ConfigEntry<string> healthLvl1Station;

	internal static ConfigEntry<int> healthLvl1StationLvl;

	internal static ConfigEntry<int> healthLvl1StationRange;

	internal static ConfigEntry<string> healthUpgradeRecipe;

	internal static ConfigEntry<string> healthLvl2Station;

	internal static ConfigEntry<int> healthLvl2StationLvl;

	internal static ConfigEntry<int> healthLvl2StationRange;

	internal static ConfigEntry<string> ashlandsUpgradeRecipe;

	internal static ConfigEntry<bool> lanternEnabled;

	internal static ConfigEntry<bool> lanternRemovable;

	internal static ConfigEntry<bool> lanternAutoSwtich;

	internal static ConfigEntry<bool> lanternSwitchable;

	internal static ConfigEntry<Color> lanternLightColor;

	internal static ConfigEntry<string> lanternStation;

	internal static ConfigEntry<int> lanternStationLvl;

	internal static ConfigEntry<int> lanternStationRange;

	internal static ConfigEntry<string> lanternUpgradeRecipe;

	internal static ConfigEntry<bool> turretsEnabled;

	internal static ConfigEntry<string> turretsStation;

	internal static ConfigEntry<int> turretsStationLvl;

	internal static ConfigEntry<int> turretsStationRange;

	internal static ConfigEntry<string> turretsUpgradeRecipe;

	internal static ConfigEntry<bool> itemStandEnabled;

	internal static ConfigEntry<bool> itemStandDisableSpeaking;

	internal static ConfigEntry<string> itemStandTrophyRescale;

	internal static ConfigEntry<bool> itemStandForsakenPower;

	internal static ConfigEntry<bool> mastEnabled;

	internal static ConfigEntry<bool> mastRemovable;

	internal static ConfigEntry<string> mastStation;

	internal static ConfigEntry<int> mastStationLvl;

	internal static ConfigEntry<int> mastStationRange;

	internal static ConfigEntry<string> mastUpgradeRecipe;

	internal static ConfigEntry<bool> tentEnabled;

	internal static ConfigEntry<bool> tentHeat;

	internal static ConfigEntry<bool> tentRemovable;

	internal static ConfigEntry<string> tentStation;

	internal static ConfigEntry<int> tentStationLvl;

	internal static ConfigEntry<int> tentStationRange;

	internal static ConfigEntry<string> tentUpgradeRecipe;

	internal static ConfigEntry<bool> wispEnabled;

	internal static ConfigEntry<string> wispStation;

	internal static ConfigEntry<int> wispStationLvl;

	internal static ConfigEntry<int> wispStationRange;

	internal static ConfigEntry<string> wispUpgradeRecipe;

	internal static ConfigEntry<bool> mapTableEnabled;

	internal static ConfigEntry<string> mapTableStation;

	internal static ConfigEntry<int> mapTableStationLvl;

	internal static ConfigEntry<int> mapTableStationRange;

	internal static ConfigEntry<string> mapTableUpgradeRecipe;

	internal static ConfigEntry<bool> changeHead;

	internal static ConfigEntry<bool> changeShields;

	internal static ConfigEntry<bool> changeTent;

	internal static ConfigEntry<bool> changeSail;

	internal static ConfigEntry<int> maxShields;

	internal static ConfigEntry<int> maxTents;

	internal static ConfigEntry<int> maxSails;

	public static string configDirectory;

	public const string tentsDirectory = "tents";

	public const string sailsDirectory = "sails";

	public const string shieldsDirectory = "shields";

	private const string shipMapRequestRpc = "LU_RequestShipMapData";

	private const string shipMapResponseRpc = "LU_ShipMapDataResponse";

	private const string shipMapSubmitRpc = "LU_SubmitShipMapData";

	private static readonly Dictionary<ZDOID, ShipMapDataEntry> s_shipMapStore = new Dictionary<ZDOID, ShipMapDataEntry>();

	private static readonly HashSet<ZDOID> s_trackedShipZdos = new HashSet<ZDOID>();

	private static bool s_shipMapRpcsRegistered = false;

	private static float s_nextClientShipMapPruneTime = 0f;

	private static readonly Stack<bool> s_mapTableDataCompressionFlags = new Stack<bool>();

	private static int s_mapTableWriteDepth = 0;

	private static readonly int s_shipMapDataRevision = StringExtensionMethods.GetStableHashCode("ShipMapDataRevision");

	private static int s_shipMapConfigurationUpdateRequested = 1;

	internal static bool ShipMapsEnabled => mapTableEnabled == null || mapTableEnabled.Value;

	private void Awake()
	{
		Localizer.Initialize();
		harmony.PatchAll();
		instance = this;
		ConfigInit();
		((ConditionalConfigSync)configSync).AddLockingConfigEntry<bool>(configLocked);
		Localizer.ApplyCurrentLocalization();
		configDirectory = Path.Combine(Paths.ConfigPath, "shudnal.LongshipUpgrades");
		Game.isModded = true;
		LoadTextures();
	}

	public void ConfigInit()
	{
		//IL_008d: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c1: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e1: Unknown result type (might be due to invalid IL or missing references)
		//IL_0115: Unknown result type (might be due to invalid IL or missing references)
		//IL_044e: Unknown result type (might be due to invalid IL or missing references)
		configLocked = serverConfig("General", "Lock Configuration", defaultValue: true, "Configuration is locked and can be changed by server admins only.");
		loggingEnabled = config("General", "Logging enabled", defaultValue: false, "Enable logging.", synchronizedSetting: false);
		onlyCreatorUpgrades = serverConfig("General", "Only creator can upgrade ship", defaultValue: true, "Only ship's creator can upgrade it.");
		onlyCreatorStand = serverConfig("General", "Only creator can change trophy", defaultValue: true, "Only ship's creator can put and get trophy from stand.");
		hintStationColor = config<Color>("Hint", "Station color", new Color(0.75f, 1f, 0.75f, 1f), "Color of hint in upgrade tooltip.", synchronizedSetting: false);
		hintColor = config<Color>("Hint", "Hint color", new Color(0.678f, 0.847f, 0.902f, 1f), "Color of hint in upgrade tooltip.", synchronizedSetting: false);
		hintAmountColor = config<Color>("Hint", "Entry amount color", Color.yellow, "Color for amount.", synchronizedSetting: false);
		hintItemColor = config<Color>("Hint", "Entry item name color", new Color(0.85f, 0.85f, 0.85f, 1f), "Color for item name.", synchronizedSetting: false);
		containerEnabled = serverConfig("Container", "Enable upgrades", defaultValue: true, "Container upgrades. Pls be aware items in upgraded slots will be unavailable after mod disabling. But it will drop on ship destruction.");
		containerWidth = serverConfig("Container", "Upgrade - Lvl 1 - Container Width", 7, "Width of ship container after first upgrade.");
		containerLvl1Station = serverConfig("Container", "Upgrade - Lvl 1 - Station name", "$piece_workbench", "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check.");
		containerLvl1StationLvl = serverConfig("Container", "Upgrade - Lvl 1 - Station level", 4, "Station level. At least one station in the range must meet the level requirement.");
		containerLvl1StationRange = serverConfig("Container", "Upgrade - Lvl 1 - Station range", 100, "Station range check. You don't have to park the ship inside your main house to be able to upgrade it.");
		containerLvl1UpgradeRecipe = serverConfig("Container", "Upgrade - Lvl 1 - Recipe", "ElderBark:20,Silver:5,Obsidian:10", "Container lvl 1 upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes.");
		containerHeight = serverConfig("Container", "Upgrade - Lvl 2 - Container Height", 4, "Height of ship container after second upgrade.");
		containerLvl2Station = serverConfig("Container", "Upgrade - Lvl 2 - Station name", "$piece_artisanstation", "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check.");
		containerLvl2StationLvl = serverConfig("Container", "Upgrade - Lvl 2 - Station level", 1, "Station level. At least one station in the range must meet the level requirement.");
		containerLvl2StationRange = serverConfig("Container", "Upgrade - Lvl 2 - Station range", 100, "Station range check. You don't have to park the ship inside your main house to be able to upgrade it.");
		containerLvl2UpgradeRecipe = serverConfig("Container", "Upgrade - Lvl 2 - Recipe", "BlackMetal:20,YggdrasilWood:20,FineWood:20", "Container lvl 2 upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes.");
		healthEnabled = serverConfig("Hull", "Enable upgrades", defaultValue: true, "Health upgrades.");
		healthUpgradeLvl1 = serverConfig("Hull", "Upgrade - Lvl 1 - Health", 1500, "Health of ship hull after first upgrade.");
		healthLvl1Station = serverConfig("Hull", "Upgrade - Lvl 1 - Station name", "$piece_forge", "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check.");
		healthLvl1StationLvl = serverConfig("Hull", "Upgrade - Lvl 1 - Station level", 7, "Station level. At least one station in the range must meet the level requirement.");
		healthLvl1StationRange = serverConfig("Hull", "Upgrade - Lvl 1 - Station range", 100, "Station range check. You don't have to park the ship inside your main house to be able to upgrade it.");
		healthUpgradeRecipe = serverConfig("Hull", "Upgrade - Lvl 1 - Recipe", "FineWood:20,BlackMetal:10,Raspberry:2,Blueberries:2,Coal:2", "Hull lvl 1 upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes.");
		healthUpgradeLvl2 = serverConfig("Hull", "Upgrade - Lvl 2 - Health", 2000, "Health of ship hull after second upgrade. Set to 0 to disable upgrade.");
		ashlandsProtection = serverConfig("Hull", "Upgrade - Lvl 2 - Ashlands protection", defaultValue: true, "Should ship be protected from ashlands ocean after second upgrade. If disabled - second upgrade will not be available.");
		healthLvl2Station = serverConfig("Hull", "Upgrade - Lvl 2 - Station name", "$piece_blackforge", "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check.");
		healthLvl2StationLvl = serverConfig("Hull", "Upgrade - Lvl 2 - Station level", 3, "Station level. At least one station in the range must meet the level requirement.");
		healthLvl2StationRange = serverConfig("Hull", "Upgrade - Lvl 2 - Station range", 100, "Station range check. You don't have to park the ship inside your main house to be able to upgrade it.");
		ashlandsUpgradeRecipe = serverConfig("Hull", "Upgrade - Lvl 2 - Recipe", "CeramicPlate:20,Tar:20,YggdrasilWood:20,IronNails:50", "Hull lvl 2 upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes.");
		lanternEnabled = serverConfig("Lantern", "Enable upgrades", defaultValue: true, "Lantern upgrades requires mast to be upgraded.");
		lanternRemovable = serverConfig("Lantern", "Make removable", defaultValue: true, "Make lantern removable. World restart or ship rebuild required to apply changes.");
		lanternAutoSwtich = serverConfig("Lantern", "Light auto enabled and disabled", defaultValue: true, "Light will be automatically enabled in night time or dark environments and automatically disabled in day light");
		lanternSwitchable = serverConfig("Lantern", "Light switch enabled", defaultValue: true, "Enable manual light switch. World restart or ship rebuild required to apply changes.");
		lanternLightColor = config<Color>("Lantern", "Light color", new Color(0.96f, 0.78f, 0.68f, 1f), "Color of lantern light. Switch light to apply changes.");
		lanternUpgradeRecipe = serverConfig("Lantern", "Recipe", "SurtlingCore:3,BronzeNails:10,FineWood:6,Chain:1", "Lantern upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes.");
		lanternStation = serverConfig("Lantern", "Station name", "$piece_forge", "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check.");
		lanternStationLvl = serverConfig("Lantern", "Station level", 4, "Station level. At least one station in the range must meet the level requirement.");
		lanternStationRange = serverConfig("Lantern", "Station range", 100, "Station range check. You don't have to park the ship inside your main house to be able to upgrade it.");
		mastEnabled = serverConfig("Mast", "Enable upgrades", defaultValue: true, "Mast upgrade also makes lantern, tent and wisp torch upgrades possible.");
		mastRemovable = serverConfig("Mast", "Make removable", defaultValue: true, "Enable mast removal. World restart or ship rebuild required to apply changes.");
		mastUpgradeRecipe = serverConfig("Mast", "Recipe", "RoundLog:2,IronNails:10,FineWood:4,Raspberry:2,Blueberries:2,Coal:2", "Mast upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes.");
		mastStation = serverConfig("Mast", "Station name", "$piece_workbench", "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check.");
		mastStationLvl = serverConfig("Mast", "Station level", 4, "Station level. At least one station in the range must meet the level requirement.");
		mastStationRange = serverConfig("Mast", "Station range", 100, "Station range check. You don't have to park the ship inside your main house to be able to upgrade it.");
		tentEnabled = serverConfig("Tent", "Enable upgrades", defaultValue: true, "Tent upgrades requires mast to be upgraded.");
		tentHeat = serverConfig("Tent", "Heat enabled", defaultValue: true, "Enable heat zone under the tent to get place to rest. Enabled lantern required.");
		tentRemovable = serverConfig("Tent", "Make removable", defaultValue: true, "Enable tent removal. World restart or ship rebuild required to apply changes.");
		tentUpgradeRecipe = serverConfig("Tent", "Recipe", "JuteRed:2,LoxPelt:2,LinenThread:6,RoundLog:2", "Tent upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes.");
		tentStation = serverConfig("Tent", "Station name", "$piece_workbench", "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check.");
		tentStationLvl = serverConfig("Tent", "Station level", 4, "Station level. At least one station in the range must meet the level requirement.");
		tentStationRange = serverConfig("Tent", "Station range", 100, "Station range check. You don't have to park the ship inside your main house to be able to upgrade it.");
		wispEnabled = serverConfig("Wisp torch", "Enable upgrades", defaultValue: true, "Wisp torch pushes away the surrounding magic mist.");
		wispUpgradeRecipe = serverConfig("Wisp torch", "Recipe", "YggdrasilWood:10,Wisp:5,Eitr:5", "Wisp Torch upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes.");
		wispStation = serverConfig("Wisp torch", "Station name", "$piece_magetable", "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check.");
		wispStationLvl = serverConfig("Wisp torch", "Station level", 1, "Station level. At least one station in the range must meet the level requirement.");
		wispStationRange = serverConfig("Wisp torch", "Station range", 100, "Station range check. You don't have to park the ship inside your main house to be able to upgrade it.");
		turretsEnabled = serverConfig("Turrets", "Enable upgrades", defaultValue: true, "Enable turrets upgrades.");
		turretsUpgradeRecipe = serverConfig("Turrets", "Recipe", "BlackMetal:15,YggdrasilWood:15,MechanicalSpring:5", "Turrets upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes.");
		turretsStation = serverConfig("Turrets", "Station name", "$piece_artisanstation", "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check.");
		turretsStationLvl = serverConfig("Turrets", "Station level", 1, "Station level. At least one station in the range must meet the level requirement.");
		turretsStationRange = serverConfig("Turrets", "Station range", 100, "Station range check. You don't have to park the ship inside your main house to be able to upgrade it.");
		itemStandEnabled = serverConfig("Item stand", "Enabled", defaultValue: true, "Enable item stand on bow for trophy.");
		itemStandDisableSpeaking = config("Item stand", "Trophy speaking disabled", defaultValue: false, "Trophis will not do random speak. World restart or ship rebuild required to apply changes.");
		itemStandTrophyRescale = config("Item stand", "Trophy rescale", "TrophyBonemass:0,7;TrophyBonemawSerpent:0,7;TrophySeekerQueen:0,7;TrophyGoblinKing:0,7", "Some trophies are ginormous. Set smaller scale for them. Trophy rehook required to apply changes.");
		itemStandForsakenPower = serverConfig("Item stand", "Forsaken power enabled", defaultValue: true, "Boss trophies brings an option to cast another Forsaken power while on ship.");
		mapTableEnabled = serverConfig("Map table", "Enable upgrades", defaultValue: true, "Cartography table allows to exchange map data between players. Disabling this permanently clears recorded map data from all longships, including unloaded ships. Ship upgrades, cargo, personal exploration and land-based map tables are not affected. The server checks for remaining map data before every world save while this setting is disabled. Before disabling or uninstalling Longship Upgrades, disable this setting, complete a successful world save, then stop the server or game and remove the mod.");
		mapTableEnabled.SettingChanged += (object sender, EventArgs args) =>
		{
			RequestShipMapConfigurationUpdate();
		};
		mapTableUpgradeRecipe = serverConfig("Map table", "Recipe", "FineWood:10,Bronze:2,LeatherScraps:5,Raspberry:4", "Map Table upgrade recipe. Item identifiers accept prefab names or localization tokens without case sensitivity. World restart or ship rebuild required to apply changes.");
		mapTableStation = serverConfig("Map table", "Station name", "$piece_forge", "Station localization token or prefab name. Matching is case-insensitive. The center of the ship is the starting point of the check.");
		mapTableStationLvl = serverConfig("Map table", "Station level", 3, "Station level. At least one station in the range must meet the level requirement.");
		mapTableStationRange = serverConfig("Map table", "Station range", 100, "Station range check. You don't have to park the ship inside your main house to be able to upgrade it.");
		changeHead = serverConfig("Style", "Change heads", defaultValue: true, "Change ship's head style.");
		changeShields = serverConfig("Style", "Change shields color", defaultValue: true, "Change shields colors. World restart or ship rebuild required to apply changes.");
		changeTent = serverConfig("Style", "Change tent color", defaultValue: true, "Change tent colors. World restart or ship rebuild required to apply changes.");
		changeSail = serverConfig("Style", "Change sail color", defaultValue: true, "Change sail colors. World restart or ship rebuild required to apply changes.");
		maxShields = serverConfig("Style", "Max shields amount", 0, "Maximum amount of shield variants. If 0 - amount is taken from custom textures count.\n By default every custom texture counts as 3 shields. World restart or ship rebuild required to apply changes.");
		maxTents = serverConfig("Style", "Max tents amount", 0, "Maximum amount of tent variants. If 0 - amount is taken from custom textures count. World restart or ship rebuild required to apply changes.");
		maxSails = serverConfig("Style", "Max sails amount", 0, "Maximum amount of sail variants. If 0 - amount is taken from custom textures count. ");
	}

	private void OnDestroy()
	{
		PrefabAudio.Clear();
		((BaseUnityPlugin)this).Config.Save();
		instance = null;
		Harmony val = harmony;
		if (val != null)
		{
			val.UnpatchSelf();
		}
	}

	public static void LogInfo(object data)
	{
		if (loggingEnabled.Value)
		{
			((BaseUnityPlugin)instance).Logger.LogInfo(data);
		}
	}

	public static void LogWarning(object data)
	{
		((BaseUnityPlugin)instance).Logger.LogWarning(data);
	}

	private ConfigEntry<T> config<T>(string group, string name, T defaultValue, ConfigDescription description, bool synchronizedSetting = true)
	{
		return ((ConditionalConfigSync)configSync).AddConfigEntry<T>(((BaseUnityPlugin)this).Config, group, name, defaultValue, description, (ConfigSyncMode)1, synchronizedSetting).SourceConfig;
	}

	private ConfigEntry<T> config<T>(string group, string name, T defaultValue, string description, bool synchronizedSetting = true)
	{
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Expected Obj, but got Unknown
		return config(group, name, defaultValue, new ConfigDescription(description, (AcceptableValueBase)null, Array.Empty<object>()), synchronizedSetting);
	}

	private ConfigEntry<T> serverConfig<T>(string group, string name, T defaultValue, ConfigDescription description)
	{
		return ((ConditionalConfigSync)configSync).AddConfigEntry<T>(((BaseUnityPlugin)this).Config, group, name, defaultValue, description, (ConfigSyncMode)0, true).SourceConfig;
	}

	private ConfigEntry<T> serverConfig<T>(string group, string name, T defaultValue, string description)
	{
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Expected Obj, but got Unknown
		return serverConfig(group, name, defaultValue, new ConfigDescription(description, (AcceptableValueBase)null, Array.Empty<object>()));
	}

	private void LoadTextures()
	{
		LoadTexture("ashlands_hull.png", ref LongshipCustomizableParts.s_ashlandsHull);
		LoadTexture("ashlands_hull_damaged.png", ref LongshipCustomizableParts.s_ashlandsHullDamaged);
		Directory.CreateDirectory(configDirectory);
		string path = Path.Combine(configDirectory, "sail_original.png");
		string path2 = Path.Combine(configDirectory, "tent_original.png");
		string path3 = Path.Combine(configDirectory, "shields_original.png");
		if (!File.Exists(path) || !File.Exists(path2) || !File.Exists(path3))
		{
			File.WriteAllBytes(path, GetEmbeddedFileData("sail_original.png"));
			File.WriteAllBytes(path2, GetEmbeddedFileData("tent_original.png"));
			File.WriteAllBytes(path3, GetEmbeddedFileData("shields_original.png"));
		}
		string text = Path.Combine(configDirectory, "tents");
		if (!Directory.Exists(text))
		{
			Directory.CreateDirectory(text);
			File.WriteAllBytes(Path.Combine(text, "tent_01.png"), GetEmbeddedFileData("tent_01.png"));
			File.WriteAllBytes(Path.Combine(text, "tent_02.png"), GetEmbeddedFileData("tent_02.png"));
			File.WriteAllBytes(Path.Combine(text, "tent_03.png"), GetEmbeddedFileData("tent_03.png"));
			File.WriteAllBytes(Path.Combine(text, "tent_04.png"), GetEmbeddedFileData("tent_04.png"));
			File.WriteAllBytes(Path.Combine(text, "tent_05.png"), GetEmbeddedFileData("tent_05.png"));
		}
		string text2 = Path.Combine(configDirectory, "sails");
		if (!Directory.Exists(text2))
		{
			Directory.CreateDirectory(text2);
			File.WriteAllBytes(Path.Combine(text2, "sail_01.png"), GetEmbeddedFileData("sail_01.png"));
			File.WriteAllBytes(Path.Combine(text2, "sail_02.png"), GetEmbeddedFileData("sail_02.png"));
			File.WriteAllBytes(Path.Combine(text2, "sail_03.png"), GetEmbeddedFileData("sail_03.png"));
			File.WriteAllBytes(Path.Combine(text2, "sail_04.png"), GetEmbeddedFileData("sail_04.png"));
			File.WriteAllBytes(Path.Combine(text2, "sail_05.png"), GetEmbeddedFileData("sail_05.png"));
		}
		string text3 = Path.Combine(configDirectory, "shields");
		if (!Directory.Exists(text3))
		{
			Directory.CreateDirectory(text3);
			File.WriteAllBytes(Path.Combine(text3, "shields_01.png"), GetEmbeddedFileData("shields_01.png"));
		}
		foreach (FileInfo item in from file in new DirectoryInfo(text).EnumerateFiles()
			orderby file.Name
			select file)
		{
			LongshipCustomizableParts.AddCustomTent(Path.Combine("tents", item.Name));
		}
		foreach (FileInfo item2 in from file in new DirectoryInfo(text2).EnumerateFiles()
			orderby file.Name
			select file)
		{
			LongshipCustomizableParts.AddCustomSail(Path.Combine("sails", item2.Name));
		}
		foreach (FileInfo item3 in from file in new DirectoryInfo(text3).EnumerateFiles()
			orderby file.Name
			select file)
		{
			LongshipCustomizableParts.AddCustomShields(Path.Combine("shields", item3.Name));
		}
	}

	internal static void LoadIcon(string filename, ref Sprite icon)
	{
		//IL_0003: Unknown result type (might be due to invalid IL or missing references)
		//IL_0009: Expected Obj, but got Unknown
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		Texture2D tex = new Texture2D(2, 2);
		if (LoadTexture(filename, ref tex))
		{
			icon = Sprite.Create(tex, new Rect(0f, 0f, (float)((Texture)tex).width, (float)((Texture)tex).height), Vector2.zero);
		}
	}

	internal static bool LoadTextureFromConfigDirectory(string filename, ref Texture2D tex)
	{
		string path = Path.Combine(configDirectory, filename);
		if (!File.Exists(path))
		{
			return false;
		}
		LogInfo("Loaded image from config folder: " + filename);
		return ImageConversion.LoadImage(tex, File.ReadAllBytes(path));
	}

	internal static bool LoadTexture(string filename, ref Texture2D tex)
	{
		if (LoadTextureFromConfigDirectory(filename, ref tex))
		{
			return true;
		}
		((Object)tex).name = Path.GetFileNameWithoutExtension(filename);
		return ImageConversion.LoadImage(tex, GetEmbeddedFileData(filename), true);
	}

	internal static byte[] GetEmbeddedFileData(string filename)
	{
		Assembly executingAssembly = Assembly.GetExecutingAssembly();
		string name = executingAssembly.GetManifestResourceNames().Single((string str) => str.EndsWith(filename));
		Stream manifestResourceStream = executingAssembly.GetManifestResourceStream(name);
		byte[] array = new byte[manifestResourceStream.Length];
		manifestResourceStream.Read(array, 0, array.Length);
		return array;
	}

	internal static Requirement[] ParseRequirements(string recipe)
	{
		//IL_00ad: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ba: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ce: Expected Obj, but got Unknown
		List<Requirement> list = new List<Requirement>();
		string[] array = recipe.Split(new char[1] { ',' }, StringSplitOptions.RemoveEmptyEntries);
		ItemDrop resItem = default;
		foreach (string text in array)
		{
			string[] array2 = text.Split(new char[1] { ':' }, StringSplitOptions.RemoveEmptyEntries);
			if (array2.Length == 2 && int.TryParse(array2[1].Trim(), out var result) && result > 0)
			{
				string text2 = array2[0].Trim();
				if (!ItemNameTokens.TryGetItemPrefab(text2, out var prefab) || !prefab.TryGetComponent<ItemDrop>(ref resItem))
				{
					LogWarning("Upgrade recipe item '" + text2 + "' was not found.");
					continue;
				}
				list.Add(new Requirement
				{
					m_amount = result,
					m_resItem = resItem,
					m_recover = true
				});
			}
		}
		return list.ToArray();
	}

	private static bool IsControlledComponent(Component component)
	{
		return Utils.GetPrefabName(((Component)component.transform.root).gameObject) == "VikingShip";
	}

	private static int GetShipMapHash(byte[] data)
	{
		if (data == null)
		{
			return 0;
		}
		int num = 17;
		for (int i = 0; i < data.Length; i++)
		{
			num = num * 31 + data[i];
		}
		return num;
	}

	private static bool IsShipZdo(ZDO zdo)
	{
		return zdo != null && zdo.GetPrefab() == LongshipCustomizableParts.prefabInt;
	}

	private static bool IsShipZdo(ZDOID id)
	{
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		return ZDOMan.instance != null && IsShipZdo(ZDOMan.instance.GetZDO(id));
	}

	public static bool IsValidMapTable(MapTable mapTable)
	{
		return Object.op_Implicit((Object)(object)mapTable.m_nview) && mapTable.m_nview.IsValid();
	}

	internal static void RegisterShipMapRpcs()
	{
		if (!s_shipMapRpcsRegistered && ZRoutedRpc.instance != null)
		{
			ZRoutedRpc.instance.Register<ZPackage>("LU_RequestShipMapData", (Action<long, ZPackage>)RPC_RequestShipMapData);
			ZRoutedRpc.instance.Register<ZPackage>("LU_ShipMapDataResponse", (Action<long, ZPackage>)RPC_ShipMapDataResponse);
			ZRoutedRpc.instance.Register<ZPackage>("LU_SubmitShipMapData", (Action<long, ZPackage>)RPC_SubmitShipMapData);
			s_shipMapRpcsRegistered = true;
		}
	}

	internal static bool TryGetShipMapData(ZDOID id, out ShipMapDataEntry entry)
	{
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		if (ShipMapsEnabled && s_shipMapStore.TryGetValue(id, out entry) && entry != null && entry.Data != null)
		{
			entry.LastAccessTime = Time.time;
			return true;
		}
		entry = null;
		return false;
	}

	internal static int GetShipMapRevision(ZDOID id)
	{
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		ShipMapDataEntry value;
		return (ShipMapsEnabled && s_shipMapStore.TryGetValue(id, out value)) ? value.Revision : 0;
	}

	internal static int SyncShipMapRevision(ZDO zdo, int? preferredRevision = null)
	{
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		//IL_0070: Unknown result type (might be due to invalid IL or missing references)
		if (!ShipMapsEnabled || !IsShipZdo(zdo))
		{
			return 0;
		}
		int num = preferredRevision ?? Math.Max(zdo.GetInt(s_shipMapDataRevision, 0), GetShipMapRevision(zdo.m_uid));
		if (num <= 0)
		{
			num = 1;
		}
		SetShipMapInt(zdo, s_shipMapDataRevision, num);
		if (s_shipMapStore.TryGetValue(zdo.m_uid, out var value))
		{
			value.Revision = Math.Max(value.Revision, num);
		}
		return num;
	}

	private static bool RemoveShipMapDataFromRuntime(ZDOID id)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		return RemoveDetachedZdoField(ZDOExtraData.s_byteArrays, id, ZDOVars.s_data);
	}

	internal static bool InjectShipMapDataIntoZdo(ZDO zdo)
	{
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		if (!ShipMapsEnabled || !IsShipZdo(zdo) || !TryGetShipMapData(zdo.m_uid, out var entry))
		{
			return false;
		}
		SetShipMapDataInRuntime(zdo.m_uid, entry.Data);
		return true;
	}

	internal static bool ExtractShipMapDataFromZdo(ZDO zdo, bool removeFromRuntime = true)
	{
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		//IL_006e: Unknown result type (might be due to invalid IL or missing references)
		if (!IsShipZdo(zdo))
		{
			return false;
		}
		if (!ShipMapsEnabled)
		{
			PurgeShipMapData(zdo);
			return false;
		}
		byte[] byteArray = zdo.GetByteArray(ZDOVars.s_data, (byte[])null);
		if (byteArray == null)
		{
			return false;
		}
		int revision = SyncShipMapRevision(zdo);
		SetShipMapData(zdo.m_uid, revision, byteArray);
		if (removeFromRuntime)
		{
			RemoveShipMapDataFromRuntime(zdo.m_uid);
		}
		return true;
	}

	internal static bool SetShipMapData(ZDOID id, int revision, byte[] data)
	{
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		//IL_0064: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f1: Unknown result type (might be due to invalid IL or missing references)
		if (!ShipMapsEnabled || data == null || revision <= 0)
		{
			return false;
		}
		if (s_shipMapStore.TryGetValue(id, out var value) && revision < value.Revision)
		{
			return false;
		}
		byte[] array = (byte[])data.Clone();
		int shipMapHash = GetShipMapHash(array);
		if (s_shipMapStore.TryGetValue(id, out var value2))
		{
			if (revision < value2.Revision)
			{
				return false;
			}
			if (revision == value2.Revision && value2.Hash == shipMapHash && StructuralComparisons.StructuralEqualityComparer.Equals(value2.Data, array))
			{
				value2.LastAccessTime = Time.time;
				return false;
			}
			value2.Revision = revision;
			value2.Data = array;
			value2.Hash = shipMapHash;
			value2.LastAccessTime = Time.time;
			return true;
		}
		s_shipMapStore[id] = new ShipMapDataEntry
		{
			Revision = revision,
			Data = array,
			Hash = shipMapHash,
			LastAccessTime = Time.time
		};
		return true;
	}

	internal static void RemoveShipMapData(ZDOID id)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		s_trackedShipZdos.Remove(id);
		s_shipMapStore.Remove(id);
		RemoveShipMapDataFromRuntime(id);
	}

	internal static void ClearShipMapRuntime()
	{
		s_shipMapStore.Clear();
		s_trackedShipZdos.Clear();
		RequestShipMapConfigurationUpdate();
		s_shipMapRpcsRegistered = false;
		s_nextClientShipMapPruneTime = 0f;
	}

	internal static void TrackShipZdo(ZDO zdo, bool extractFromRuntime = true)
	{
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		if (IsShipZdo(zdo))
		{
			s_trackedShipZdos.Add(zdo.m_uid);
			if (extractFromRuntime)
			{
				ExtractShipMapDataFromZdo(zdo);
			}
		}
	}

	internal static void RebuildTrackedShipZdos(IEnumerable<ZDO> zdos)
	{
		s_trackedShipZdos.Clear();
		foreach (ZDO zdo in zdos)
		{
			TrackShipZdo(zdo);
		}
		if (!ShipMapsEnabled)
		{
			s_shipMapStore.Clear();
		}
		RequestShipMapConfigurationUpdate();
	}

	internal static bool RequestShipMapDataFromServer(ZDO zdo, int currentRevision)
	{
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_004b: Expected Obj, but got Unknown
		//IL_004d: Unknown result type (might be due to invalid IL or missing references)
		if (!ShipMapsEnabled || !IsShipZdo(zdo) || !zdo.IsValid() || currentRevision <= 0 || ZRoutedRpc.instance == null || (Object)(object)ZNet.instance == (Object)null || ZNet.instance.IsServer())
		{
			return false;
		}
		ZPackage val = new ZPackage();
		val.Write(zdo.m_uid);
		val.Write(currentRevision);
		ZRoutedRpc.instance.InvokeRoutedRPC("LU_RequestShipMapData", new object[1] { val });
		LogInfo($"Ship map data requested for {zdo}");
		return true;
	}

	private static void SubmitShipMapDataToServer(ZDO zdo, int revision, byte[] data)
	{
		//IL_0041: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Expected Obj, but got Unknown
		//IL_0049: Unknown result type (might be due to invalid IL or missing references)
		if (ShipMapsEnabled && IsShipZdo(zdo) && revision > 0 && data != null && ZRoutedRpc.instance != null && (!((Object)(object)ZNet.instance != (Object)null) || !ZNet.instance.IsServer()))
		{
			ZPackage val = new ZPackage();
			val.Write(zdo.m_uid);
			val.Write(revision);
			val.Write(data);
			ZRoutedRpc.instance.InvokeRoutedRPC("LU_SubmitShipMapData", new object[1] { val });
			LogInfo($"Ship map data submitted to server for {zdo}");
		}
	}

	private static void PruneClientShipMapStore()
	{
		//IL_0067: Unknown result type (might be due to invalid IL or missing references)
		//IL_006c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0073: Unknown result type (might be due to invalid IL or missing references)
		//IL_0082: Unknown result type (might be due to invalid IL or missing references)
		if ((Object)(object)ZNet.instance == (Object)null || ZNet.instance.IsServer() || ZDOMan.instance == null || Time.time < s_nextClientShipMapPruneTime)
		{
			return;
		}
		s_nextClientShipMapPruneTime = Time.time + 10f;
		foreach (ZDOID item in s_shipMapStore.Keys.ToList())
		{
			if (ZDOMan.instance.GetZDO(item) == null)
			{
				RemoveShipMapData(item);
			}
		}
	}

	private static void RPC_RequestShipMapData(long sender, ZPackage pkg)
	{
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_0039: Unknown result type (might be due to invalid IL or missing references)
		//IL_0041: Unknown result type (might be due to invalid IL or missing references)
		//IL_004d: Unknown result type (might be due to invalid IL or missing references)
		//IL_006b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0071: Expected Obj, but got Unknown
		//IL_0072: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b3: Unknown result type (might be due to invalid IL or missing references)
		if (ShipMapsEnabled && !((Object)(object)ZNet.instance == (Object)null) && ZNet.instance.IsServer() && pkg != null)
		{
			ZDOID val = pkg.ReadZDOID();
			int num = pkg.ReadInt();
			if (IsShipZdo(val) && num > 0 && TryGetShipMapData(val, out var entry) && entry.Revision >= num)
			{
				ZPackage val2 = new ZPackage();
				val2.Write(val);
				val2.Write(entry.Revision);
				val2.Write(entry.Data);
				ZRoutedRpc.instance.InvokeRoutedRPC(sender, "LU_ShipMapDataResponse", new object[1] { val2 });
				LogInfo($"Ship map data for {val} sent to {sender}");
			}
		}
	}

	private static void RPC_ShipMapDataResponse(long sender, ZPackage pkg)
	{
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_0039: Unknown result type (might be due to invalid IL or missing references)
		//IL_004d: Unknown result type (might be due to invalid IL or missing references)
		//IL_006b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0094: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
		if (!ShipMapsEnabled || (Object)(object)ZNet.instance == (Object)null || ZNet.instance.IsServer() || pkg == null)
		{
			return;
		}
		ZDOID val = pkg.ReadZDOID();
		int num = pkg.ReadInt();
		ZDOMan val2 = ZDOMan.instance;
		ZDO val3 = ((val2 != null) ? val2.GetZDO(val) : null);
		if (IsShipZdo(val3) && val3.GetBool(LongshipCustomizableParts.s_mapDataCompressed, false) && num > GetShipMapRevision(val))
		{
			byte[] array = pkg.ReadByteArray();
			if (array != null)
			{
				SetShipMapData(val, num, array);
				LogInfo($"Ship map data response for {val} from {sender}");
			}
		}
	}

	private static void RPC_SubmitShipMapData(long sender, ZPackage pkg)
	{
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_0039: Unknown result type (might be due to invalid IL or missing references)
		//IL_004d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0064: Unknown result type (might be due to invalid IL or missing references)
		//IL_0081: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c8: Unknown result type (might be due to invalid IL or missing references)
		if (!ShipMapsEnabled || (Object)(object)ZNet.instance == (Object)null || !ZNet.instance.IsServer() || pkg == null)
		{
			return;
		}
		ZDOID val = pkg.ReadZDOID();
		int num = pkg.ReadInt();
		ZDOMan val2 = ZDOMan.instance;
		ZDO val3 = ((val2 != null) ? val2.GetZDO(val) : null);
		if ((val3 != null && !IsShipZdo(val3)) || num <= 0 || num < GetShipMapRevision(val))
		{
			return;
		}
		byte[] array = pkg.ReadByteArray();
		if (array != null && SetShipMapData(val, num, array))
		{
			if (val3 != null)
			{
				SetShipMapInt(val3, LongshipCustomizableParts.s_mapDataCompressed, 1);
				SyncShipMapRevision(val3, num);
				ZDOMan.instance.SetDirtySector(val3);
				RemoveShipMapDataFromRuntime(val);
			}
			LogInfo($"Ship map data for {val} submitted from {sender}");
		}
	}

	private static bool IsBoxLadder(Ladder ladder)
	{
		return ladder.m_name == "$lu_box_name";
	}

	private static bool IsShipMapTable(MapTable mapTable)
	{
		return ((Object)mapTable).name == "maptable" && IsControlledComponent((Component)(object)mapTable);
	}

	private static bool IsCompressedMapDataContext()
	{
		return s_mapTableDataCompressionFlags.Count > 0 && s_mapTableDataCompressionFlags.Peek();
	}

	public static void FixMeshRendererProperties(MeshRenderer renderer)
	{
		((Renderer)renderer).sharedMaterial = DeepCopyMaterial(((Renderer)renderer).sharedMaterial);
		MeshFilter component = ((Component)renderer).GetComponent<MeshFilter>();
		if (component != null)
		{
			FixSharedMesh(component);
		}
	}

	private static Texture2D CopyTexture(Texture2D source)
	{
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_002f: Expected Obj, but got Unknown
		//IL_006d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0085: Unknown result type (might be due to invalid IL or missing references)
		if ((Object)(object)source == (Object)null)
		{
			return null;
		}
		Texture2D val = new Texture2D(((Texture)source).width, ((Texture)source).height, (TextureFormat)4, ((Texture)source).mipmapCount > 1);
		RenderTexture temporary = RenderTexture.GetTemporary(((Texture)source).width, ((Texture)source).height, 0, (RenderTextureFormat)7, (RenderTextureReadWrite)0);
		try
		{
			Graphics.Blit((Texture)(object)source, temporary);
			RenderTexture.active = temporary;
			val.ReadPixels(new Rect(0f, 0f, (float)((Texture)source).width, (float)((Texture)source).height), 0, 0);
			val.Apply(true, true);
			((Texture)val).filterMode = ((Texture)source).filterMode;
		}
		finally
		{
			RenderTexture.active = null;
			RenderTexture.ReleaseTemporary(temporary);
		}
		return val;
	}

	private static Material DeepCopyMaterial(Material original)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_000d: Expected Obj, but got Unknown
		Material val = new Material(original.shader);
		val.CopyPropertiesFromMaterial(original);
		string[] texturePropertyNames = original.GetTexturePropertyNames();
		foreach (string propertyName in texturePropertyNames)
		{
			CopyTextureIfExists(original, val, propertyName);
		}
		return val;
	}

	private static void CopyTextureIfExists(Material original, Material copy, string propertyName)
	{
		if (original.HasProperty(propertyName))
		{
			Texture texture = original.GetTexture(propertyName);
			Texture2D val = (Texture2D)(object)((texture is Texture2D) ? texture : null);
			if (!((Object)(object)val == (Object)null))
			{
				copy.SetTexture(propertyName, (Texture)(object)CopyTexture(val));
			}
		}
	}

	private static void FixSharedMesh(MeshFilter meshFilter)
	{
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_003f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		//IL_0063: Unknown result type (might be due to invalid IL or missing references)
		//IL_0075: Unknown result type (might be due to invalid IL or missing references)
		//IL_0087: Unknown result type (might be due to invalid IL or missing references)
		//IL_0099: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ab: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d0: Expected Obj, but got Unknown
		if (!((Object)(object)meshFilter.sharedMesh == (Object)null))
		{
			Mesh val = new Mesh
			{
				vertices = meshFilter.sharedMesh.vertices,
				triangles = meshFilter.sharedMesh.triangles,
				normals = meshFilter.sharedMesh.normals,
				uv = meshFilter.sharedMesh.uv,
				uv2 = meshFilter.sharedMesh.uv2,
				tangents = meshFilter.sharedMesh.tangents,
				colors = meshFilter.sharedMesh.colors,
				bindposes = meshFilter.sharedMesh.bindposes,
				boneWeights = meshFilter.sharedMesh.boneWeights,
				subMeshCount = meshFilter.sharedMesh.subMeshCount
			};
			for (int i = 0; i < meshFilter.sharedMesh.subMeshCount; i++)
			{
				val.SetTriangles(meshFilter.sharedMesh.GetTriangles(i), i);
			}
			val.RecalculateBounds();
			meshFilter.mesh = val;
			meshFilter.sharedMesh = val;
		}
	}

	private static void RequestShipMapConfigurationUpdate()
	{
		Interlocked.Exchange(ref s_shipMapConfigurationUpdateRequested, 1);
	}

	private static void ApplyShipMapConfiguration(bool beforeSave = false)
	{
		if (mapTableEnabled == null || (Object)(object)ZNet.instance == (Object)null || ZDOMan.instance == null)
		{
			return;
		}
		bool flag = Interlocked.Exchange(ref s_shipMapConfigurationUpdateRequested, 0) != 0;
		if ((!beforeSave && !flag) || ShipMapsEnabled)
		{
			return;
		}
		int num = 0;
		try
		{
			foreach (ZDO item in ZDOMan.instance.m_objectsByID.Values.Where(IsShipZdo).ToList())
			{
				if (PurgeShipMapData(item))
				{
					num++;
				}
			}
			s_shipMapStore.Clear();
		}
		catch
		{
			RequestShipMapConfigurationUpdate();
			throw;
		}
		if (beforeSave)
		{
			LogInfo($"Ship map tables are disabled: pre-save cleanup removed recorded map data from {num} ship(s). No cached maps will be injected. Wait for this world save to finish successfully before disabling or uninstalling Longship Upgrades.");
		}
		else
		{
			LogInfo($"Ship map tables are disabled: cleared recorded map data from {num} ship(s). Changes will be persisted by the next world save started after cleanup.");
		}
	}

	private static bool PurgeShipMapData(ZDO zdo)
	{
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		if (!IsShipZdo(zdo) || zdo.SaveClone)
		{
			return false;
		}
		bool flag = s_shipMapStore.Remove(zdo.m_uid);
		flag |= RemoveShipMapDataFromRuntime(zdo.m_uid);
		flag |= RemoveDetachedZdoField(ZDOExtraData.s_ints, zdo.m_uid, LongshipCustomizableParts.s_mapDataCompressed);
		flag |= RemoveDetachedZdoField(ZDOExtraData.s_ints, zdo.m_uid, s_shipMapDataRevision);
		if (flag && (Object)(object)ZNet.instance != (Object)null && ZNet.instance.IsServer())
		{
			zdo.IncreaseDataRevision();
		}
		return flag;
	}

	private static BinarySearchDictionary<int, T> CopyZdoFields<T>(BinarySearchDictionary<int, T> source, int additionalCapacity = 0)
	{
		BinarySearchDictionary<int, T> val = new BinarySearchDictionary<int, T>();
		val.Reserve((source?.Count ?? 0) + additionalCapacity);
		if (source != null)
		{
			foreach (KeyValuePair<int, T> item in source)
			{
				val.Add(item.Key, item.Value);
			}
		}
		return val;
	}

	private static void DetachZdoFields<T>(Dictionary<ZDOID, BinarySearchDictionary<int, T>> container, ZDOID id)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		if (container.TryGetValue(id, out var value) && value != null)
		{
			container[id] = CopyZdoFields<T>(value);
		}
	}

	private static bool RemoveDetachedZdoField<T>(Dictionary<ZDOID, BinarySearchDictionary<int, T>> container, ZDOID id, int hash)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_00af: Unknown result type (might be due to invalid IL or missing references)
		if (!container.TryGetValue(id, out var value) || value == null || !value.ContainsKey(hash))
		{
			return false;
		}
		if (value.Count == 1)
		{
			container.Remove(id);
			return true;
		}
		BinarySearchDictionary<int, T> val = new BinarySearchDictionary<int, T>();
		val.Reserve(value.Count - 1);
		foreach (KeyValuePair<int, T> item in value)
		{
			if (item.Key != hash)
			{
				val.Add(item.Key, item.Value);
			}
		}
		container[id] = val;
		return true;
	}

	private static void SetShipMapDataInRuntime(ZDOID id, byte[] data)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		ZDOExtraData.s_byteArrays.TryGetValue(id, out var value);
		byte[] array = default;
		if (value == null || !value.TryGetValue(ZDOVars.s_data, ref array) || array != data)
		{
			BinarySearchDictionary<int, byte[]> val = CopyZdoFields<byte[]>(value, 1);
			val[ZDOVars.s_data] = data;
			ZDOExtraData.s_byteArrays[id] = val;
		}
	}

	private static void SetShipMapInt(ZDO zdo, int hash, int value)
	{
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		if (zdo.GetInt(hash, 0) != value)
		{
			DetachZdoFields(ZDOExtraData.s_ints, zdo.m_uid);
			zdo.Set(hash, value, false);
		}
	}

	private static void InjectShipMapDataForSave(ShipMapSaveState state)
	{
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_0053: Unknown result type (might be due to invalid IL or missing references)
		//IL_0067: Unknown result type (might be due to invalid IL or missing references)
		//IL_00aa: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
		LogInfo($"Ship map save preparation started: {s_shipMapStore.Count} cached map(s).");
		long num = 0L;
		foreach (ZDOID item in s_shipMapStore.Keys.ToList())
		{
			ZDOMan val = ZDOMan.instance;
			ZDO val2 = ((val != null) ? val.GetZDO(item) : null);
			if (IsShipZdo(val2) && s_shipMapStore.TryGetValue(item, out var value) && value?.Data != null && val2.GetByteArray(ZDOVars.s_data, (byte[])null) == null)
			{
				state.InjectedMaps.Add(new KeyValuePair<ZDOID, byte[]>(item, value.Data));
				SetShipMapDataInRuntime(item, value.Data);
				num += value.Data.LongLength;
			}
		}
		LogInfo($"Ship map save injection ready: {state.InjectedMaps.Count} map(s), {num} payload bytes, {state.Timer.Elapsed.TotalMilliseconds:F2} ms. Entering world snapshot preparation.");
	}

	private static void RemoveShipMapSaveInjection(ShipMapSaveState state)
	{
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0086: Unknown result type (might be due to invalid IL or missing references)
		//IL_0073: Unknown result type (might be due to invalid IL or missing references)
		if (state == null || state.CleanupCompleted)
		{
			return;
		}
		state.CleanupCompleted = true;
		byte[] array = default;
		foreach (KeyValuePair<ZDOID, byte[]> injectedMap in state.InjectedMaps)
		{
			if (ZDOExtraData.s_byteArrays.TryGetValue(injectedMap.Key, out var value) && value != null && value.TryGetValue(ZDOVars.s_data, ref array) && array == injectedMap.Value)
			{
				RemoveShipMapDataFromRuntime(injectedMap.Key);
			}
			DetachZdoFields(ZDOExtraData.s_ints, injectedMap.Key);
		}
		state.Timer.Stop();
		LogInfo($"Ship map save injection cleared: {state.InjectedMaps.Count} map(s); total PrepareSave scope {state.Timer.Elapsed.TotalMilliseconds:F2} ms (including game and other patches).");
	}

	public LongshipUpgrades()
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Expected Obj, but got Unknown
	}

	static LongshipUpgrades()
	{
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_000a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0015: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Expected Obj, but got Unknown
	}
}
