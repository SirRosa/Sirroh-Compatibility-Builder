using System;
using BepInEx;
using BepInEx.Configuration;
using UnityEngine;
using neobotics.ModSdk;

namespace neobotics.ValheimMods;

internal class Cfg
{
	public static DelegatedConfigEntry<Logging.LogLevels> debugLevel = null;

	public static DelegatedConfigEntry<int> trophyCap = null;

	public static DelegatedConfigEntry<int> damageCap = null;

	public static DelegatedConfigEntry<int> trophyDistance = null;

	public static DelegatedConfigEntry<bool> damagePhysical = null;

	public static DelegatedConfigEntry<bool> damageElemental = null;

	public static DelegatedConfigEntry<bool> damageOther = null;

	public static DelegatedConfigEntry<SlayerSkills.Points> assignPoints = null;

	public static DelegatedConfigEntry<bool> lowerSkillsOnDeath = null;

	public static DelegatedConfigEntry<bool> allowCheats = null;

	public static DelegatedConfigEntry<bool> useCreatureLevel = null;

	public static DelegatedConfigEntry<int> bossPoints = null;

	public static DelegatedConfigEntry<bool> tamesSlay = null;

	public static DelegatedConfigEntry<bool> tamesBuff = null;

	public static DelegatedConfigEntry<Color> skillColor = null;

	private static KeyCode[] keyModifiers = new KeyCode[2]
	{
		(KeyCode)308,
		(KeyCode)304
	};

	public static KeyboardShortcut keyConfigItemDefault = new KeyboardShortcut((KeyCode)115, keyModifiers);

	public static void BepInExConfig(BaseUnityPlugin _instance)
	{
		//IL_007c: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c7: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d1: Expected Obj, but got Unknown
		//IL_010a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0114: Expected Obj, but got Unknown
		//IL_01ad: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b7: Expected Obj, but got Unknown
		//IL_02df: Unknown result type (might be due to invalid IL or missing references)
		//IL_02e9: Expected Obj, but got Unknown
		debugLevel = new DelegatedConfigEntry<Logging.LogLevels>(ChangeLogging);
		debugLevel.ConfigEntry = _instance.Config.Bind<Logging.LogLevels>("Utility", "LogLevel", Logging.LogLevels.Info, "Controls the level of information contained in the log");
		SlayerSkills.Log.LogLevel = debugLevel.Value;
		skillColor = new DelegatedConfigEntry<Color>(SlayerSkills.ChangeColor);
		skillColor.ConfigEntry = _instance.Config.Bind<Color>("Utility", "SkillTextColor", Color.cyan, "Sets the color for the Slayer Skill text in the Trophy panel.");
		trophyCap = new DelegatedConfigEntry<int>(useServerDelegate: true);
		trophyCap.ConfigEntry = _instance.Config.Bind<int>("Slayer Skills", "SkillCap", 100, new ConfigDescription("Sets the maximum Slayer level attainable. Every slayer point earned increases the percentage of the damage buff against a specific creature type. @", (AcceptableValueBase)(object)new AcceptableValueRange<int>(1, 200), Array.Empty<object>()));
		trophyDistance = new DelegatedConfigEntry<int>(useServerDelegate: true);
		trophyDistance.ConfigEntry = _instance.Config.Bind<int>("Slayer Skills", "TrophyDistance", 30, new ConfigDescription("Sets the maximum distance, in meters, that a player (in multiplayer) can be from the trophy drop to qualify for the trophy point. @", (AcceptableValueBase)(object)new AcceptableValueRange<int>(5, 50), Array.Empty<object>()));
		lowerSkillsOnDeath = new DelegatedConfigEntry<bool>(useServerDelegate: true);
		lowerSkillsOnDeath.ConfigEntry = _instance.Config.Bind<bool>("Slayer Skills", "LowerSkillsOnDeath", true, "If enabled, will lower slayer skills upon death (same % as standard skills) @");
		allowCheats = new DelegatedConfigEntry<bool>(useServerDelegate: true);
		allowCheats.ConfigEntry = _instance.Config.Bind<bool>("Slayer Skills", "AllowCheats", false, "If enabled, allows raising and resetting Slayer skills using 'raiseskill' and 'resetskill' commands from the console by using the trophy name for the creature. Use an underscore (_) instead of a space on the command line, e.g. 'raiseskill Deer_Trophy 3'. Note the trophy name is case sensitive! @");
		damageCap = new DelegatedConfigEntry<int>(useServerDelegate: true);
		damageCap.ConfigEntry = _instance.Config.Bind<int>("Slayer Damage", "DamagePercent", 100, new ConfigDescription("Sets the maximum damage buff percent of your normal damage. The applied buff percentage is determined by your current Slayer level. @", (AcceptableValueBase)(object)new AcceptableValueRange<int>(0, 100), Array.Empty<object>()));
		damagePhysical = new DelegatedConfigEntry<bool>(useServerDelegate: true);
		damagePhysical.ConfigEntry = _instance.Config.Bind<bool>("Slayer Damage", "BuffPhysical", true, "If enabled, applies slayer bonus to physical damage (slash, blunt, pierce). @");
		damageElemental = new DelegatedConfigEntry<bool>(useServerDelegate: true);
		damageElemental.ConfigEntry = _instance.Config.Bind<bool>("Slayer Damage", "BuffElemental", false, "If enabled, applies slayer bonus to elemental damage (lightning, fire, frost). @");
		damageOther = new DelegatedConfigEntry<bool>(useServerDelegate: true);
		damageOther.ConfigEntry = _instance.Config.Bind<bool>("Slayer Damage", "BuffOther", false, "If enabled, applies slayer bonus to other damage (poison, spirit). @");
		assignPoints = new DelegatedConfigEntry<SlayerSkills.Points>(useServerDelegate: true);
		assignPoints.ConfigEntry = _instance.Config.Bind<SlayerSkills.Points>("Slayer Points", "MultiplayerPoints", SlayerSkills.Points.Random, "Controls how slayer skills are awarded in multiplayer. Random grants skill points to one player in group. All grants a skill point to every player in group. Distribute grants a fraction of a skill point evenly to every player in group. @");
		useCreatureLevel = new DelegatedConfigEntry<bool>(useServerDelegate: true);
		useCreatureLevel.ConfigEntry = _instance.Config.Bind<bool>("Slayer Points", "UseCreatureLevel", false, "If enabled, adjusts the Slayer points awarded on trophy drop based on the level (number of 'Stars') of the creature slain. @");
		bossPoints = new DelegatedConfigEntry<int>(useServerDelegate: true);
		bossPoints.ConfigEntry = _instance.Config.Bind<int>("Slayer Points", "BossAdjustment", 3, new ConfigDescription("Adjusts Slayer points awarded to account for bosses. Equivalent to treating a boss as an 'X-Star' creature. Applies even if UseCreatureLevel is false (and adds if true). @", (AcceptableValueBase)(object)new AcceptableValueRange<int>(0, 10), Array.Empty<object>()));
		tamesSlay = new DelegatedConfigEntry<bool>(useServerDelegate: true);
		tamesSlay.ConfigEntry = _instance.Config.Bind<bool>("Tamed Creatures", "TamesCanSlay", true, "If enabled, trophy drops from creatures slain by your tamed creatires count toward your Slayer skill. @");
		tamesBuff = new DelegatedConfigEntry<bool>(useServerDelegate: true);
		tamesBuff.ConfigEntry = _instance.Config.Bind<bool>("Tamed Creatures", "TamesGetBuff", false, "If enabled, your tamed creatures also recieve your Slayer buff. @");
	}

	public static void ChangeLogging(object s, EventArgs e)
	{
		SettingChangedEventArgs e2 = (SettingChangedEventArgs)(object)((e is SettingChangedEventArgs) ? e : null);
		SlayerSkills.Log.Debug($"ChangeLog {e2.ChangedSetting.Definition.Key} to {e2.ChangedSetting.BoxedValue}");
		SlayerSkills.Log.LogLevel = debugLevel.Value;
	}

	static Cfg()
	{
		//IL_007c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0081: Unknown result type (might be due to invalid IL or missing references)
	}
}
