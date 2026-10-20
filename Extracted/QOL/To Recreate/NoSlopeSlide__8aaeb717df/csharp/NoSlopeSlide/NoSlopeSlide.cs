using BepInEx;
using BepInEx.Configuration;
using HarmonyLib;

namespace NoSlopeSlide;

[BepInPlugin("orax.NoSlopeSlide", "NoSlopeSlide", "0.1.0")]
public class NoSlopeSlide : BaseUnityPlugin
{
	public const string PluginGUID = "orax.NoSlopeSlide";

	public const string PluginName = "NoSlopeSlide";

	public const string PluginVersion = "0.1.0";

	public static ConfigEntry<bool> Enabled;

	private Harmony _harmony;

	private void Awake()
	{
		//IL_0026: Unknown result type (might be due to invalid IL or missing references)
		//IL_0030: Expected Obj, but got Unknown
		Enabled = ((BaseUnityPlugin)this).Config.Bind<bool>("General", "Enabled", true, "Enable this mod.");
		_harmony = new Harmony("orax.NoSlopeSlide");
		_harmony.PatchAll();
		((BaseUnityPlugin)this).Logger.LogInfo((object)"NoSlopeSlide v0.1.0 loaded.");
	}

	private void OnDestroy()
	{
		Harmony harmony = _harmony;
		if (harmony != null)
		{
			harmony.UnpatchSelf();
		}
	}
}
