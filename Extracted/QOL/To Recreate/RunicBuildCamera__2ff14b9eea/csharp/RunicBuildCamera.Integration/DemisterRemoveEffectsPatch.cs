using HarmonyLib;

namespace RunicBuildCamera.Integration;

[HarmonyPatch(typeof(SE_Demister), "RemoveEffects")]
internal static class DemisterRemoveEffectsPatch
{
	private static void Prefix(SE_Demister __instance)
	{
		try
		{
			DemisterRuntime.BeforeRemoveEffects(__instance);
		}
		catch
		{
			DemisterRuntime.OnCameraExit();
		}
	}
}
