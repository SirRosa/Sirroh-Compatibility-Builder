using System;
using BepInEx.Configuration;

namespace Husbandry.Config;

internal static class HusbandryConfig
{
	internal static ConfigEntry<bool> Enabled;

	internal static ConfigEntry<bool> ThrottleIdle;

	internal static ConfigEntry<float> NearRange;

	internal static ConfigEntry<float> FarRange;

	internal static ConfigEntry<int> MidSkip;

	internal static ConfigEntry<int> FarSkip;

	internal static ConfigEntry<bool> CheapCensus;

	internal static ConfigEntry<float> CensusInterval;

	internal static ConfigEntry<int> SoftCap;

	internal static ConfigEntry<bool> Shoving;

	internal static ConfigEntry<bool> OfflineUpkeep;

	internal static ConfigEntry<bool> OfflineHealing;

	internal static ConfigEntry<float> HealPerSecond;

	internal static ConfigEntry<bool> OfflineBreeding;

	internal static ConfigEntry<float> CourtingInterval;

	internal static ConfigEntry<bool> OfflineHunger;

	internal static ConfigEntry<float> ForgetAfter;

	internal static ConfigEntry<bool> Verbose;

	internal static void Bind(ConfigFile cfg)
	{
		//IL_005f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0069: Expected Obj, but got Unknown
		//IL_0097: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a1: Expected Obj, but got Unknown
		//IL_00c4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ce: Expected Obj, but got Unknown
		//IL_00f2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fc: Expected Obj, but got Unknown
		//IL_0145: Unknown result type (might be due to invalid IL or missing references)
		//IL_014f: Expected Obj, but got Unknown
		//IL_0175: Unknown result type (might be due to invalid IL or missing references)
		//IL_017f: Expected Obj, but got Unknown
		//IL_01fe: Unknown result type (might be due to invalid IL or missing references)
		//IL_0208: Expected Obj, but got Unknown
		//IL_0251: Unknown result type (might be due to invalid IL or missing references)
		//IL_025b: Expected Obj, but got Unknown
		//IL_02a4: Unknown result type (might be due to invalid IL or missing references)
		//IL_02ae: Expected Obj, but got Unknown
		Enabled = cfg.Bind<bool>("General", "Enabled", true, "Master switch. Off means this mod does nothing at all.");
		ThrottleIdle = cfg.Bind<bool>("Throttle", "ThrottleIdle", true, "Let a tame that is standing around doing nothing think less often. It only ever applies to a TAMED creature that is not alerted, has nothing targeted and is following nobody - so it never touches anything hostile, anything in a fight, or anything at your heel. The time a skipped tick would have had is handed to the next one, so every timer inside the AI still lands where it would have.");
		NearRange = cfg.Bind<float>("Throttle", "NearRange", 24f, new ConfigDescription("Inside this many metres nothing is throttled at all, so the animals you are actually looking at behave exactly as they always did.", (AcceptableValueBase)(object)new AcceptableValueRange<float>(5f, 128f), Array.Empty<object>()));
		FarRange = cfg.Bind<float>("Throttle", "FarRange", 48f, new ConfigDescription("Past this, the far band applies. Between the two, the mid band does.", (AcceptableValueBase)(object)new AcceptableValueRange<float>(10f, 256f), Array.Empty<object>()));
		MidSkip = cfg.Bind<int>("Throttle", "MidSkip", 4, new ConfigDescription("An idle tame in the middle band thinks one physics tick in this many. At 4 that is about twelve times a second instead of fifty.", (AcceptableValueBase)(object)new AcceptableValueRange<int>(1, 25), Array.Empty<object>()));
		FarSkip = cfg.Bind<int>("Throttle", "FarSkip", 10, new ConfigDescription("The same, for idle tames past FarRange. This is the number that does the work in a big pen. Worst case it costs an animal a fifth of a second noticing something, and only ever an animal that was standing still, unalerted, with nothing targeted, a long way off.", (AcceptableValueBase)(object)new AcceptableValueRange<int>(1, 50), Array.Empty<object>()));
		CheapCensus = cfg.Bind<bool>("Breeding", "CheapCensus", true, "Replace the breeding system's population count with one shared count. Vanilla's runs per animal, walks EVERY ai in the world, compares object names as strings and does a GetComponent per match - four times per breeding round, per animal. That is the one cost that grows with the SQUARE of the herd. This changes no behaviour; it only stops asking the same question sixty times.");
		CensusInterval = cfg.Bind<float>("Breeding", "CensusInterval", 3f, new ConfigDescription("Seconds between shared population counts. Breeding runs on a ten-second invoke and pregnancies take minutes, so a count a few seconds old cannot change any decision that depends on it.", (AcceptableValueBase)(object)new AcceptableValueRange<float>(0.5f, 60f), Array.Empty<object>()));
		SoftCap = cfg.Bind<int>("Breeding", "SoftCap", 0, new ConfigDescription("Stop breeding once this many of a species are within the prefab's own check range. 0 uses the game's own cap unchanged. This can only ever make breeding stop SOONER than vanilla, never later - and it never removes an animal, only births.", (AcceptableValueBase)(object)new AcceptableValueRange<int>(0, 200), Array.Empty<object>()));
		Shoving = cfg.Bind<bool>("Herd", "Shoving", false, "Whether your own tamed animals can push you around. Off by default, which is the point: one wolf is a companion and forty are a moving wall that puts you in the water. Hostile creatures are never affected - walking through something that wants to eat you is a cheat rather than a convenience. Hold E on any tame to make that one solid again; the choice is stored on the animal and survives a relog.");
		OfflineUpkeep = cfg.Bind<bool>("Offline", "OfflineUpkeep", true, "Look after tames in zones nobody has loaded. Runs only where the whole ZDO table lives - a dedicated server, a host, or single-player - and only on animals no connected machine is simulating.");
		OfflineHealing = cfg.Bind<bool>("Offline", "OfflineHealing", true, "Let an unattended tame slowly heal. It never raises one that is dying or dead, and never takes one above its own maximum.");
		HealPerSecond = cfg.Bind<float>("Offline", "HealPerSecond", 0.25f, new ConfigDescription("Health per real second for an unattended tame. A wolf left in a corner of the map comes back whole in a few minutes rather than never.", (AcceptableValueBase)(object)new AcceptableValueRange<float>(0f, 20f), Array.Empty<object>()));
		OfflineBreeding = cfg.Bind<bool>("Offline", "OfflineBreeding", true, "Let unattended pairs get on with it, slowly. This does NOT create an animal: it sets the same pregnancy stamp the game sets, and the game itself gives birth - with the right level, the right tamed flag and its own cap check - on the first frame somebody loads the zone.");
		CourtingInterval = cfg.Bind<float>("Offline", "CourtingInterval", 180f, new ConfigDescription("Seconds between one step of courting and the next, for an unattended animal. Loaded, the game grants these every few seconds; this is the setting that makes away-from-home breeding a trickle rather than a population you come home to.", (AcceptableValueBase)(object)new AcceptableValueRange<float>(5f, 3600f), Array.Empty<object>()));
		OfflineHunger = cfg.Bind<bool>("Offline", "OfflineHunger", true, "Honour hunger when deciding whether an unattended pair may breed. Worth knowing: unloaded tames ALREADY get hungry, in vanilla, because the feeding timer is a world-time stamp rather than a loaded timer. Turning this off does not feed them; it only stops hunger holding up offline breeding.");
		ForgetAfter = cfg.Bind<float>("Advanced", "ForgetAfter", 600f, new ConfigDescription("Seconds before this mod stops remembering an animal it has not seen. Only affects in-memory clocks; nothing is stored in your save.", (AcceptableValueBase)(object)new AcceptableValueRange<float>(60f, 7200f), Array.Empty<object>()));
		Verbose = cfg.Bind<bool>("Advanced", "Verbose", false, "Log every decision. Useful for a bug report, noisy otherwise.");
	}
}
