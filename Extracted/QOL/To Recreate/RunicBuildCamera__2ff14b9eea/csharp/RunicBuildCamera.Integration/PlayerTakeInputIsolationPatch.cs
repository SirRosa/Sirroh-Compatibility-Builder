using HarmonyLib;
using RunicBuildCamera.Core;

namespace RunicBuildCamera.Integration;

[HarmonyPatch(typeof(Player), "TakeInput")]
internal static class PlayerTakeInputIsolationPatch
{
	private static void Postfix(Player __instance, ref bool __result)
	{
		if (PlayerUpdateInputIsolation.ShouldSuppress(__instance))
		{
			PlayerUpdateInputIsolation.CaptureTakeInput(__instance, __result);
			if (!CameraExitInput.ReleaseIfRequested(__result, BuildCameraRuntime.ExitInputRequested, BuildCameraRuntime.ForceStop))
			{
				__result = false;
			}
		}
	}
}
