using HarmonyLib;

namespace QuickStackStore;

[HarmonyPatch(typeof(Localization))]
internal class LocalizationPatch
{
	[HarmonyPatch("SetupLanguage")]
	[HarmonyPostfix]
	private static void SetupLanguagePatch(Localization __instance, string language)
	{
		LocalizationConfig.FixTakeAllDefaultText(__instance, language);
	}
}
