using HarmonyLib;

namespace QuickStackStore;

[HarmonyPatch(typeof(FejdStartup))]
internal class FejdStartupPatch
{
	[HarmonyPatch("Awake")]
	[HarmonyPostfix]
	private static void FejdStartupAwakePatch()
	{
		LocalizationLoader.SetupTranslations();
		QSSConfig.ConfigTemplate_SettingChanged(null, null);
	}
}
