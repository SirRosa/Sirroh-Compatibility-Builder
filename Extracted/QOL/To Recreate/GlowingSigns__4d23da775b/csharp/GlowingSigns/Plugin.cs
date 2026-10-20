using System.Reflection;
using BepInEx;
using BepInEx.Logging;
using HarmonyLib;

namespace GlowingSigns;

[BepInPlugin("com.robert.glowingsigns", "Glowing Signs", "1.0.0")]
[BepInProcess("valheim.exe")]
public sealed class Plugin : BaseUnityPlugin
{
	public const string PluginGuid = "com.robert.glowingsigns";

	public const string PluginName = "Glowing Signs";

	public const string PluginVersion = "1.0.0";

	private Harmony? _harmony;

	internal static ManualLogSource Log { get; private set; }

	private void Awake()
	{
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Expected Obj, but got Unknown
		Log = ((BaseUnityPlugin)this).Logger;
		_harmony = new Harmony("com.robert.glowingsigns");
		_harmony.PatchAll(Assembly.GetExecutingAssembly());
		((BaseUnityPlugin)this).Logger.LogInfo((object)"Glowing Signs 1.0.0 loaded. Restoring legacy color-matched sign glow.");
	}

	private void OnDestroy()
	{
		Harmony? harmony = _harmony;
		if (harmony != null)
		{
			harmony.UnpatchSelf();
		}
		LegacySignGlow.DisposeMaterials();
	}
}
