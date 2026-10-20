using System;
using BepInEx;
using BepInEx.Configuration;
using BepInEx.Logging;
using BetterTames.Scripts.CatchUp;
using BetterTames.Scripts.Commands;
using BetterTames.Scripts.Protection;
using BetterTames.Scripts.Tuning;
using HarmonyLib;
using ServerSync;
using UnityEngine;

namespace BetterTames;

[BepInPlugin("xtav1m.BetterTames", "BetterTames", "0.9.0")]
public class Plugin : BaseUnityPlugin
{
	public static ConfigEntry<bool> showTamingTimer;

	public static ConfigEntry<bool> showBreedingTimer;

	public static ConfigEntry<bool> showGrowthTimer;

	public static ConfigEntry<int> tamingTime;

	public static ConfigEntry<int> lovePoints;

	public static ConfigEntry<int> growthTime;

	public static ConfigEntry<int> maxCreaturesNearby;

	public static ConfigEntry<float> maxCreaturesRange;

	public static ConfigEntry<int> offspringStarChance;

	public static ConfigEntry<bool> commandAllTames;

	public static ConfigEntry<KeyboardShortcut> massFollowKey;

	public static ConfigEntry<KeyboardShortcut> massStayKey;

	public static ConfigEntry<float> massCommandRange;

	public static ConfigEntry<bool> tamesFightOwnKind;

	public static ConfigEntry<bool> catchUpTeleport;

	public static ConfigEntry<float> catchUpDistance;

	public static ConfigEntry<KeyboardShortcut> teleportFollowersKey;

	public static ConfigEntry<bool> bigTamesEnterDungeons;

	public static ConfigEntry<bool> portalTeleport;

	public static ConfigEntry<bool> starUpOnKill;

	public static ConfigEntry<int> starUpBaseChance;

	public static ConfigEntry<int> starUpBonusPerStar;

	public static ConfigEntry<bool> healOnStarUp;

	public static ConfigEntry<int> regenTime;

	public static ConfigEntry<bool> protectAllTames;

	public static ConfigEntry<int> recoveryTime;

	public static ConfigEntry<KeyboardShortcut> toggleProtectionKey;

	public static ConfigEntry<bool> showDownedTames;

	public static ConfigEntry<bool> wildEatFromChests;

	public static ConfigEntry<bool> tamesEatFromChests;

	public static ConfigEntry<float> chestRange;

	public static ConfigEntry<bool> chestRequireOnlyFood;

	public static ConfigEntry<bool> debugMode;

	public static readonly ManualLogSource Logger = Logger.CreateLogSource("BetterTames");

	private static readonly ConfigSync configSync = new ConfigSync("xtav1m.BetterTames")
	{
		DisplayName = "BetterTames",
		CurrentVersion = "0.9.0",
		MinimumRequiredVersion = "0.9.0"
	};

	private void Awake()
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		InitializeConfig();
		new Harmony("xtav1m.BetterTames").PatchAll();
		Logger.LogInfo((object)"BetterTames 0.9.0 loaded");
	}

	private void Update()
	{
		Commands.Tick();
		CatchUp.Tick();
		Protection.Tick();
	}

	private ConfigEntry<T> ConfigSync<T>(string group, string name, T value, ConfigDescription description, bool synchronizedSetting = true)
	{
		//IL_0030: Unknown result type (might be due to invalid IL or missing references)
		//IL_0036: Expected Obj, but got Unknown
		ConfigDescription val = new ConfigDescription(description.Description + (synchronizedSetting ? " [Synced with Server]" : " [Not Synced with Server]"), description.AcceptableValues, description.Tags);
		ConfigEntry<T> val2 = ((BaseUnityPlugin)this).Config.Bind<T>(group, name, value, val);
		configSync.AddConfigEntry<T>(val2).SynchronizedConfig = synchronizedSetting;
		return val2;
	}

	private void InitializeConfig()
	{
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Expected Obj, but got Unknown
		//IL_0052: Unknown result type (might be due to invalid IL or missing references)
		//IL_005d: Expected Obj, but got Unknown
		//IL_0079: Unknown result type (might be due to invalid IL or missing references)
		//IL_0084: Expected Obj, but got Unknown
		//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ab: Expected Obj, but got Unknown
		//IL_00d2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00dd: Expected Obj, but got Unknown
		//IL_0100: Unknown result type (might be due to invalid IL or missing references)
		//IL_010b: Expected Obj, but got Unknown
		//IL_0132: Unknown result type (might be due to invalid IL or missing references)
		//IL_013d: Expected Obj, but got Unknown
		//IL_0160: Unknown result type (might be due to invalid IL or missing references)
		//IL_016b: Expected Obj, but got Unknown
		//IL_0199: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a4: Expected Obj, but got Unknown
		//IL_01c8: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d3: Expected Obj, but got Unknown
		//IL_02cb: Unknown result type (might be due to invalid IL or missing references)
		//IL_02d6: Expected Obj, but got Unknown
		//IL_02f6: Unknown result type (might be due to invalid IL or missing references)
		//IL_0306: Unknown result type (might be due to invalid IL or missing references)
		//IL_0311: Expected Obj, but got Unknown
		//IL_0331: Unknown result type (might be due to invalid IL or missing references)
		//IL_0341: Unknown result type (might be due to invalid IL or missing references)
		//IL_034c: Expected Obj, but got Unknown
		//IL_037a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0385: Expected Obj, but got Unknown
		//IL_03a1: Unknown result type (might be due to invalid IL or missing references)
		//IL_03ac: Expected Obj, but got Unknown
		//IL_03f4: Unknown result type (might be due to invalid IL or missing references)
		//IL_03ff: Expected Obj, but got Unknown
		//IL_042d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0438: Expected Obj, but got Unknown
		//IL_0458: Unknown result type (might be due to invalid IL or missing references)
		//IL_0468: Unknown result type (might be due to invalid IL or missing references)
		//IL_0473: Expected Obj, but got Unknown
		//IL_048f: Unknown result type (might be due to invalid IL or missing references)
		//IL_049a: Expected Obj, but got Unknown
		//IL_04b6: Unknown result type (might be due to invalid IL or missing references)
		//IL_04c1: Expected Obj, but got Unknown
		//IL_04dd: Unknown result type (might be due to invalid IL or missing references)
		//IL_04e8: Expected Obj, but got Unknown
		//IL_050c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0517: Expected Obj, but got Unknown
		//IL_053a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0545: Expected Obj, but got Unknown
		//IL_0561: Unknown result type (might be due to invalid IL or missing references)
		//IL_056c: Expected Obj, but got Unknown
		//IL_0597: Unknown result type (might be due to invalid IL or missing references)
		//IL_05a2: Expected Obj, but got Unknown
		//IL_05ea: Unknown result type (might be due to invalid IL or missing references)
		//IL_05f5: Expected Obj, but got Unknown
		//IL_061d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0628: Expected Obj, but got Unknown
		//IL_0648: Unknown result type (might be due to invalid IL or missing references)
		//IL_0658: Unknown result type (might be due to invalid IL or missing references)
		//IL_0663: Expected Obj, but got Unknown
		//IL_067f: Unknown result type (might be due to invalid IL or missing references)
		//IL_068a: Expected Obj, but got Unknown
		//IL_06a6: Unknown result type (might be due to invalid IL or missing references)
		//IL_06b1: Expected Obj, but got Unknown
		//IL_06cd: Unknown result type (might be due to invalid IL or missing references)
		//IL_06d8: Expected Obj, but got Unknown
		//IL_0706: Unknown result type (might be due to invalid IL or missing references)
		//IL_0711: Expected Obj, but got Unknown
		//IL_072d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0738: Expected Obj, but got Unknown
		//IL_0754: Unknown result type (might be due to invalid IL or missing references)
		//IL_075f: Expected Obj, but got Unknown
		((BaseUnityPlugin)this).Config.SaveOnConfigSet = false;
		ConfigEntry<bool> lockingConfig = ConfigSync("1 - General", "Lock Configuration", value: true, new ConfigDescription("If enabled, the configuration is locked and can be changed by server admins only.", (AcceptableValueBase)null, Array.Empty<object>()));
		configSync.AddLockingConfigEntry<bool>(lockingConfig);
		showTamingTimer = ConfigSync("2 - Timers", "Show Taming Timer", value: true, new ConfigDescription("Show how long a creature you are taming has left, counting any taming boost from players nearby. The timer is marked paused while the creature is hungry or frightened, since taming stops then.", (AcceptableValueBase)null, Array.Empty<object>()), synchronizedSetting: false);
		showBreedingTimer = ConfigSync("2 - Timers", "Show Breeding Timer", value: true, new ConfigDescription("Show how long a pregnant tame has left before giving birth. A tame that is not pregnant shows its love points instead: it gains one now and then while fed, calm and next to a partner, and gets pregnant when they are full.", (AcceptableValueBase)null, Array.Empty<object>()), synchronizedSetting: false);
		showGrowthTimer = ConfigSync("2 - Timers", "Show Growth Timer", value: true, new ConfigDescription("Show how long offspring have left before growing up.", (AcceptableValueBase)null, Array.Empty<object>()), synchronizedSetting: false);
		tamingTime = ConfigSync("3 - Taming", "Taming Time", 30, new ConfigDescription("Minutes of feeding it takes to tame any creature.", (AcceptableValueBase)(object)new AcceptableValueRange<int>(1, 180), Array.Empty<object>()));
		lovePoints = ConfigSync("4 - Breeding", "Love Points Needed", 3, new ConfigDescription("Love points a tame needs before it gets pregnant. It gains one now and then while fed, calm and next to a partner.", (AcceptableValueBase)(object)new AcceptableValueRange<int>(1, 20), Array.Empty<object>()));
		growthTime = ConfigSync("4 - Breeding", "Growth Time", 30, new ConfigDescription("Minutes offspring take to grow up.", (AcceptableValueBase)(object)new AcceptableValueRange<int>(1, 180), Array.Empty<object>()));
		maxCreaturesNearby = ConfigSync("4 - Breeding", "Crowd Limit", 6, new ConfigDescription("How many creatures of the same kind can be nearby before breeding stops.", (AcceptableValueBase)(object)new AcceptableValueRange<int>(1, 20), Array.Empty<object>()));
		maxCreaturesRange = ConfigSync("4 - Breeding", "Crowd Range", 10f, new ConfigDescription("How far, in meters, Crowd Limit counts around a breeding pair.", (AcceptableValueBase)(object)new AcceptableValueRange<float>(1f, 200f), Array.Empty<object>()));
		offspringStarChance = ConfigSync("4 - Breeding", "Offspring Star Chance", 25, new ConfigDescription("Percent chance a newborn is one star above the tame giving birth, up to 2 stars. Eggs are not affected.", (AcceptableValueBase)(object)new AcceptableValueRange<int>(0, 100), Array.Empty<object>()));
		tamingTime.SettingChanged += (object _, EventArgs _) =>
		{
			Tuning.ApplyAll();
		};
		lovePoints.SettingChanged += (object _, EventArgs _) =>
		{
			Tuning.ApplyAll();
		};
		growthTime.SettingChanged += (object _, EventArgs _) =>
		{
			Tuning.ApplyAll();
		};
		maxCreaturesNearby.SettingChanged += (object _, EventArgs _) =>
		{
			Tuning.ApplyAll();
		};
		maxCreaturesRange.SettingChanged += (object _, EventArgs _) =>
		{
			Tuning.ApplyAll();
		};
		commandAllTames = ConfigSync("5 - Commands", "Command Any Tame", value: true, new ConfigDescription("Press E on any tame to make it follow you or stay, not only on wolves, lox and the others the game allows. Off leaves each creature as the game or its mod made it.", (AcceptableValueBase)null, Array.Empty<object>()));
		massFollowKey = ConfigSync<KeyboardShortcut>("5 - Commands", "Follow All Key", new KeyboardShortcut((KeyCode)102, new KeyCode[1] { (KeyCode)308 }), new ConfigDescription("Every tame in range that is not following anyone starts following you.", (AcceptableValueBase)null, Array.Empty<object>()), synchronizedSetting: false);
		massStayKey = ConfigSync<KeyboardShortcut>("5 - Commands", "Stay All Key", new KeyboardShortcut((KeyCode)103, new KeyCode[1] { (KeyCode)308 }), new ConfigDescription("Every tame in range that is following you stays where it is.", (AcceptableValueBase)null, Array.Empty<object>()), synchronizedSetting: false);
		massCommandRange = ConfigSync("5 - Commands", "Follow/Stay All Range", 30f, new ConfigDescription("How far, in meters, the Follow All and Stay All keys reach.", (AcceptableValueBase)(object)new AcceptableValueRange<float>(5f, 100f), Array.Empty<object>()));
		tamesFightOwnKind = ConfigSync("1 - General", "Tames Fight Their Own Kind", value: true, new ConfigDescription("A tame fights wild creatures of its own kind that are in a fight, like a tamed wolf defending you from wild wolves. Calm ones, and ones you are partway through taming, are left alone. The game normally keeps them on the same side.", (AcceptableValueBase)null, Array.Empty<object>()));
		commandAllTames.SettingChanged += (object _, EventArgs _) =>
		{
			Commands.ApplyAll();
		};
		catchUpTeleport = ConfigSync("6 - Teleport", "Teleport Lost Tames", value: true, new ConfigDescription("A tame that is following you teleports to you if it falls too far behind, and after you die and respawn. Vanilla following has no distance limit, so a tame stuck on terrain or left behind at your death is otherwise stuck or lost for good.", (AcceptableValueBase)null, Array.Empty<object>()));
		catchUpDistance = ConfigSync("6 - Teleport", "Teleport Distance", 30f, new ConfigDescription("How far, in meters, a following tame can fall behind before it teleports to you.", (AcceptableValueBase)(object)new AcceptableValueRange<float>(20f, 50f), Array.Empty<object>()));
		teleportFollowersKey = ConfigSync<KeyboardShortcut>("6 - Teleport", "Teleport Tames Key", new KeyboardShortcut((KeyCode)104, new KeyCode[1] { (KeyCode)308 }), new ConfigDescription("Every tame following you teleports to you right away.", (AcceptableValueBase)null, Array.Empty<object>()), synchronizedSetting: false);
		bigTamesEnterDungeons = ConfigSync("6 - Teleport", "Big Tames Enter Dungeons", value: false, new ConfigDescription("Following tames come with you into dungeons and back out. Turn off to leave big tames, like lox, outside, since they get stuck in narrow corridors.", (AcceptableValueBase)null, Array.Empty<object>()));
		portalTeleport = ConfigSync("6 - Teleport", "Tames Follow Through Portals", value: true, new ConfigDescription("Tames following you near a portal come through it with you. The game normally leaves them behind.", (AcceptableValueBase)null, Array.Empty<object>()));
		starUpOnKill = ConfigSync("7 - Leveling", "Gain Stars From Kills", value: true, new ConfigDescription("A tame has a chance to gain a star whenever it kills an enemy, up to 2 stars. The chance is higher the more stars the enemy has over the tame; killing something the same star or lower gives no bonus.", (AcceptableValueBase)null, Array.Empty<object>()));
		starUpBaseChance = ConfigSync("7 - Leveling", "Star Chance", 10, new ConfigDescription("Base percent chance to gain a star on a kill.", (AcceptableValueBase)(object)new AcceptableValueRange<int>(0, 100), Array.Empty<object>()));
		starUpBonusPerStar = ConfigSync("7 - Leveling", "Bonus Chance Per Star", 5, new ConfigDescription("Percent added per star the killed enemy has over the tame.", (AcceptableValueBase)(object)new AcceptableValueRange<int>(0, 100), Array.Empty<object>()));
		healOnStarUp = ConfigSync("7 - Leveling", "Heal On New Star", value: true, new ConfigDescription("A tame that gains a star from a kill is healed to full.", (AcceptableValueBase)null, Array.Empty<object>()));
		regenTime = ConfigSync("8 - Health", "Full Heal Time", 3600, new ConfigDescription("Seconds a tame takes to heal from empty to full. Lower is faster. Regeneration pauses while a tame is hungry, the same as the game's own creatures.", (AcceptableValueBase)(object)new AcceptableValueRange<int>(60, 7200), Array.Empty<object>()));
		regenTime.SettingChanged += (object _, EventArgs _) =>
		{
			Tuning.ApplyAll();
		};
		protectAllTames = ConfigSync("8 - Health", "Protect All Tames", value: true, new ConfigDescription("A tame that would die lies down to recover instead. Enemies leave it alone while it is down. A butcher knife still kills it. Individual tames can be switched with the Protection Key.", (AcceptableValueBase)null, Array.Empty<object>()));
		recoveryTime = ConfigSync("8 - Health", "Recovery Time", 60, new ConfigDescription("Seconds a recovering tame rests, healing back to full, before it gets up.", (AcceptableValueBase)(object)new AcceptableValueRange<int>(10, 600), Array.Empty<object>()));
		toggleProtectionKey = ConfigSync<KeyboardShortcut>("8 - Health", "Protection Key", new KeyboardShortcut((KeyCode)101, new KeyCode[1] { (KeyCode)308 }), new ConfigDescription("Switch protection on or off for the tame you are looking at, overriding Protect All Tames for that tame.", (AcceptableValueBase)null, Array.Empty<object>()), synchronizedSetting: false);
		showDownedTames = ConfigSync("8 - Health", "Show Recovering Tames", value: true, new ConfigDescription("Show the name and health bar of a recovering tame when you look at it. The game hides sleeping creatures from the crosshair, so with this off a recovering tame shows no name or health bar and the Protection Key can't reach it.", (AcceptableValueBase)null, Array.Empty<object>()), synchronizedSetting: false);
		wildEatFromChests = ConfigSync("9 - Feeding", "Wild Creatures Eat From Chests", value: true, new ConfigDescription("A hungry creature you are taming eats from a nearby chest when there is no food on the ground, so taming keeps going without dropping food by hand.", (AcceptableValueBase)null, Array.Empty<object>()));
		tamesEatFromChests = ConfigSync("9 - Feeding", "Tames Eat From Chests", value: true, new ConfigDescription("A hungry tame eats from a nearby chest when there is no food on the ground, which keeps it healing and breeding.", (AcceptableValueBase)null, Array.Empty<object>()));
		chestRange = ConfigSync("9 - Feeding", "Chest Range", 10f, new ConfigDescription("How far, in meters, a creature reaches for a chest. It eats in place and never walks to it. Only chests a player built count, not dungeon or other world loot.", (AcceptableValueBase)(object)new AcceptableValueRange<float>(2f, 30f), Array.Empty<object>()));
		chestRequireOnlyFood = ConfigSync("9 - Feeding", "Only Food Chests", value: false, new ConfigDescription("Only eat from a chest that holds nothing but food this creature eats, so a feeding chest can sit next to your storage without being raided.", (AcceptableValueBase)null, Array.Empty<object>()));
		debugMode = ConfigSync("Debug", "Debug Mode", value: false, new ConfigDescription("Log what the mod is doing to tamed creatures.", (AcceptableValueBase)null, Array.Empty<object>()), synchronizedSetting: false);
		((BaseUnityPlugin)this).Config.SaveOnConfigSet = true;
		((BaseUnityPlugin)this).Config.Save();
	}
}
