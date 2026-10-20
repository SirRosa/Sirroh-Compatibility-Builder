using BepInEx;
using BepInEx.Configuration;

namespace Slayer;

internal static class SlayerConfig
{
	public static ConfigEntry<float> DamageAmount;

	public static ConfigEntry<bool> DamageEnabled;

	public static ConfigEntry<float> PushbackResistanceAmount;

	public static ConfigEntry<bool> PushbackResistanceEnabled;

	public static ConfigEntry<float> StaggerDamageAmount;

	public static ConfigEntry<bool> StaggerDamageEnabled;

	public static void Initialize(BaseUnityPlugin plugin)
	{
		DamageAmount = plugin.Config.Bind<float>("Damage", "Value", 25f, "The percentage by which two-handed weapon damage is increased at level 100");
		DamageEnabled = plugin.Config.Bind<bool>("Damage Increase Enabled", "Value", true, "Enable or disable the damage increase");
		PushbackResistanceAmount = plugin.Config.Bind<float>("Pushback Resistance Amount", "Value", 2f, "Percentage of pushback resistance gained with each level of the skill");
		PushbackResistanceEnabled = plugin.Config.Bind<bool>("Pushback Resistance Enabled", "Value", true, "Enable or disable the pushback resistance");
		StaggerDamageEnabled = plugin.Config.Bind<bool>("Stagger Damage", "Enabled", true, "Enable Slayer's bonus stagger damage.");
		StaggerDamageAmount = plugin.Config.Bind<float>("Stagger Damage", "Bonus", 50f, "Maximum stagger damage bonus at Slayer skill level 100.");
	}
}
