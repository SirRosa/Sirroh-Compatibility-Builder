using HarmonyLib;

namespace GlowingSigns;

[HarmonyPatch(typeof(Sign))]
internal static class SignPatches
{
	[HarmonyPatch("Awake")]
	[HarmonyPostfix]
	private static void AwakePostfix(Sign __instance)
	{
		LegacySignGlow.Apply(__instance);
	}

	[HarmonyPatch("OnCheckPermissionCompleted")]
	[HarmonyPostfix]
	private static void PermissionCompletedPostfix(Sign __instance)
	{
		LegacySignGlow.Apply(__instance);
	}
}
