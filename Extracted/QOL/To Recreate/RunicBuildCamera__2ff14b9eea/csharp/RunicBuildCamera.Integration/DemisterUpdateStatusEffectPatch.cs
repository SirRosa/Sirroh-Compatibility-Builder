using HarmonyLib;

namespace RunicBuildCamera.Integration;

[HarmonyPatch(typeof(SE_Demister), "UpdateStatusEffect")]
internal static class DemisterUpdateStatusEffectPatch
{
	private static void Postfix(SE_Demister __instance)
	{
		try
		{
			DemisterRuntime.AfterStatusEffectUpdate(__instance);
		}
		catch
		{
			DemisterRuntime.OnCameraExit();
		}
	}
}
