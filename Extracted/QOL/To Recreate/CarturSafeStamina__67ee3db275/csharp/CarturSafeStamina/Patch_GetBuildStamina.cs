using HarmonyLib;

namespace CarturSafeStamina;

[HarmonyPatch(typeof(Player), "GetBuildStamina")]
public static class Patch_GetBuildStamina
{
	private static void Postfix(Player __instance, ref float __result)
	{
		if (Plugin.AffectBuild.Value && Plugin.IsSafe(__instance))
		{
			__result = 0f;
		}
	}
}
