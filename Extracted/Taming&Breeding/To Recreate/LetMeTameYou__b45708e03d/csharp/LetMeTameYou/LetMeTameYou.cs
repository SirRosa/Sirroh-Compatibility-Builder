using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using BepInEx;
using BepInEx.Bootstrap;
using BepInEx.Configuration;
using BepInEx.Logging;
using HarmonyLib;
using LetMeTameYou.RPC;
using Patches;
using ServerSync;
using TMPro;
using UnityEngine;

namespace LetMeTameYou;

[BepInDependency(/*Could not decode attribute arguments.*/)]
[BepInPlugin("meldurson.LetMeTameYou", "LetMeTameYou", "0.1.0")]
public class LetMeTameYou : BaseUnityPlugin
{
	[Serializable]
	public class TameConfig : ICloneable
	{
		public string PrefabName { get; set; } = "";

		public bool commandable { get; set; } = true;

		public float tamingTime { get; set; } = 1800f;

		public float fedDuration { get; set; } = 600f;

		public float consumeRange { get; set; } = 2f;

		public float consumeSearchInterval { get; set; } = 10f;

		public float consumeSearchRange { get; set; } = 10f;

		public string consumeItems { get; set; } = "RawMeat";

		public bool hostileToSelf { get; set; } = false;

		public bool procreation { get; set; } = true;

		public bool offspringOverwrite { get; set; } = false;

		public int maxCreatures { get; set; } = 5;

		public float pregnancyChance { get; set; } = 0.33f;

		public float pregnancyDuration { get; set; } = 60f;

		public float growTime { get; set; } = 3000f;

		public float size { get; set; } = 1f;

		public float followDistMulti { get; set; } = 1f;

		public string specialGroup { get; set; } = "";

		public string egg { get; set; } = "";

		public string offspringName { get; set; } = "";

		public string offspringPrefab { get; set; } = "";

		public string requiredWorldKeys { get; set; } = "";

		public string trade { get; set; } = "";

		public bool removeTameable { get; set; } = false;

		public object Clone()
		{
			return MemberwiseClone();
		}
	}

	[Serializable]
	public class specificMates : ICloneable
	{
		public string prefabName { get; set; } = "";

		public List<chanceOffspring> possibleOffspring { get; set; } = new List<chanceOffspring>();

		public object Clone()
		{
			return MemberwiseClone();
		}
	}

	[Serializable]
	public class chanceOffspring : ICloneable
	{
		public GameObject offspring { get; set; } = null;

		public float chance { get; set; } = 100f;

		public object Clone()
		{
			return MemberwiseClone();
		}
	}

	[HarmonyPatch(typeof(BaseAI), "Follow")]
	public static class InterceptFollow
	{
		private static float FollowDist(BaseAI baseAI)
		{
			if (customTamesList.TryGetValue(((Object)baseAI).name.Replace("(Clone)", ""), out var value))
			{
				return value.size * 2.2f * followDistMulti.Value * value.followDistMulti;
			}
			return 3f * followDistMulti.Value;
		}

		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
		{
			MethodInfo followDistHook = AccessTools.DeclaredMethod(typeof(InterceptFollow), "FollowDist", (Type[])null, (Type[])null);
			bool addHook = false;
			bool hasAddedHook = false;
			foreach (CodeInstruction instruction in instructions)
			{
				if (!addHook)
				{
					if (instruction.opcode == OpCodes.Stloc_0 && !hasAddedHook)
					{
						addHook = true;
					}
					yield return instruction;
				}
				else
				{
					yield return new CodeInstruction(OpCodes.Ldarg_0, (object)null);
					yield return new CodeInstruction(OpCodes.Call, (object)followDistHook);
					addHook = false;
					hasAddedHook = true;
				}
			}
		}
	}

	public const string versionNumber = "0.1.0";

	public const string versionMinimum = "0.1.0";

	public const string modName = "LetMeTameYou";

	public const string GUID = "meldurson.LetMeTameYou";

	public static ManualLogSource logger;

	public static string tamingtoolPrefabName = "LMTY_TamingTool";

	public static Dictionary<string, TameConfig> customTamesList = new Dictionary<string, TameConfig>();

	public static GameObject Root;

	public static TameManager tameManager;

	public static PrefabManager prefabManager;

	public static CfgPackage CfgPackage;

	public static bool ServerConfigReceived = false;

	public static bool localizeLoaded = false;

	public static bool useMonMod = false;

	public static Harmony harmony = new Harmony("meldurson.LetMeTameYou");

	public static ConfigEntry<bool> debugout;

	public static ConfigEntry<int> increasedInteractDistance;

	public static ConfigEntry<bool> hatchlingEgg;

	public static ConfigEntry<float> hatchingTime;

	public static ConfigEntry<int> maxTamingLevel;

	public static ConfigEntry<bool> useTamingTool;

	public static ConfigEntry<string> TamingTool_Recipe;

	public static ConfigEntry<string> TamingTool_Station;

	public static ConfigEntry<float> followDistMulti;

	public static ConfigEntry<bool> increaseHoverWidth;

	public static ConfigEntry<float> TamedFedMultiplier;

	public static ConfigEntry<float> IncreasedLevelTamingTime;

	public static ConfigSync configSync = new ConfigSync("meldurson.LetMeTameYou")
	{
		DisplayName = "LetMeTameYou",
		CurrentVersion = "0.1.0",
		MinimumRequiredVersion = "0.1.0"
	};

	private void Awake()
	{
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Expected Obj, but got Unknown
		//IL_0177: Unknown result type (might be due to invalid IL or missing references)
		//IL_0181: Expected Obj, but got Unknown
		logger = ((BaseUnityPlugin)this).Logger;
		debugout = config("1:General", "Debug Output", value: false, new ConfigDescription("Determines if debug is output to bepinex log", (AcceptableValueBase)null, Array.Empty<object>()), synchronizedSetting: false);
		hatchlingEgg = config("1:General", "Hatchling Egg", value: true, "Determines if you want Dragon Eggs to hatch and become hatchlings");
		hatchingTime = config("1:General", "Hatching Time", 1800f, "Determines time it takes for Dragon Egg to hatch");
		useTamingTool = config("1:General", "useTamingTool", value: true, "Use a taming tool to have an overlay when hovering over a creature");
		maxTamingLevel = config("1:General", "maxTamingLevel", -1, "Determines what the maximum wild creature level you can tame is (-1 is no limit)");
		increasedInteractDistance = config("1:General", "Increased Interact Distance", 20, "When using the taming stick, how far away can you interact with creatures");
		increaseHoverWidth = config("1:General", "Increased Hover Width", value: true, "Increase the width of the hover text box to have less word wrap");
		followDistMulti = config("1:General", "Follow Distance Multiplier", 1f, "Multiplies the distance that creatures will follow at");
		TamedFedMultiplier = config("1:General", "TamedFedMultiplier", 4f, "Determines if after being tamed how much longer the creature will stay fed");
		TamingTool_Recipe = config("2: Recipes", "TamingTool Recipe", "RawMeat:1,Carrot:1,Mushroom:1,Resin:5", "What is the recipe for crafting the Taming Tool, separate initial amount and upgrade amounts with : and different items with ,");
		TamingTool_Station = config("2: Recipes", "TamingTool Station", "piece_workbench:1", "What is the required Crafting Station and Level, separated by a : such as piece_workbench:3 would be lvl 3 Workbench (vanilla stations are: piece_workbench, forge, piece_cauldron, piece_stonecutter, piece_artisanstation, blackforge, piece_magetable, piece_MeadCauldron, piece_preptable");
		((BaseUnityPlugin)this).Config.Save();
		YAMLReadWrite.UseFileOpenReadTextWithSystemTextYaml();
		Root = new GameObject("TameManager Root");
		prefabManager = Root.AddComponent<PrefabManager>();
		tameManager = Root.AddComponent<TameManager>();
		Object.DontDestroyOnLoad((Object)(object)Root);
		useMonMod = Chainloader.PluginInfos.ContainsKey("KorCaptain.MonsterModifiers");
		PerformPatches();
	}

	public void PerformPatches()
	{
		harmony.PatchAll(typeof(LetMeTameYou));
		harmony.PatchAll(typeof(InterceptFollow));
		harmony.PatchAll(typeof(TameManager));
		harmony.PatchAll(typeof(SpawnedHostilePatches));
		harmony.PatchAll(typeof(BetterTameHover));
		harmony.PatchAll(typeof(CfgPackage));
		harmony.PatchAll(typeof(CfgPackage.GameStartPatch));
		if (useMonMod)
		{
			harmony.PatchAll(typeof(MonMod_LMTY.Intercept_SplitSpawn));
		}
		IEnumerable<MethodBase> patchedMethods = harmony.GetPatchedMethods();
		DBG.blogDebug("Patched Methods=");
		foreach (MethodBase item in patchedMethods)
		{
			DBG.blogDebug(item.ReflectedType?.ToString() + ":" + item.Name + " is patched");
		}
	}

	private ConfigEntry<T> config<T>(string group, string name, T value, ConfigDescription description, bool synchronizedSetting = true)
	{
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Expected Obj, but got Unknown
		ConfigDescription val = new ConfigDescription(description.Description + (synchronizedSetting ? " [Synced with Server]" : " [Not Synced with Server]"), description.AcceptableValues, description.Tags);
		ConfigEntry<T> val2 = ((BaseUnityPlugin)this).Config.Bind<T>(group, name, value, val);
		SyncedConfigEntry<T> syncedConfigEntry = configSync.AddConfigEntry<T>(val2);
		syncedConfigEntry.SynchronizedConfig = synchronizedSetting;
		return val2;
	}

	private ConfigEntry<T> config<T>(string group, string name, T value, string description, bool synchronizedSetting = true)
	{
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Expected Obj, but got Unknown
		return config(group, name, value, new ConfigDescription(description, (AcceptableValueBase)null, Array.Empty<object>()), synchronizedSetting);
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(ZNetScene), "Shutdown")]
	private static void Postfix()
	{
		DBG.blogInfo("Reseting TameLists");
		customTamesList.Clear();
		TameManager.resetTameManager();
		YAMLReadWrite.baseConfig = new TameConfig();
		YAMLReadWrite.groupConfigs = new Dictionary<string, YAMLReadWrite.TameConfigYML>();
		YAMLReadWrite.UseFileOpenReadTextWithSystemTextYaml();
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(TMP_Text), "GetPreferredValues", new Type[]
	{
		typeof(float),
		typeof(float)
	})]
	private static void TMPro_TMP_Text_GetValues(TMP_Text __instance, ref Vector2 __result)
	{
		if (increaseHoverWidth.Value && ((Object)__instance).name == "HoverName")
		{
			__result.x *= 1.6f;
			DBG.blogDebug("Increasing hover with to " + __result.x);
		}
	}

	static LetMeTameYou()
	{
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Expected Obj, but got Unknown
	}
}
