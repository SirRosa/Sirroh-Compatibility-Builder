using HarmonyLib;

namespace RunicBuildCamera.Integration;

[HarmonyPatch(typeof(Player), "SetLocalPlayer")]
internal static class PlayerSetLocalPlayerCameraCleanupPatch
{
	private static void Postfix(Player __instance)
	{
		try
		{
			BuildCameraRuntime.OnLocalPlayerAssigned(__instance);
		}
		catch
		{
			BuildCameraRuntime.ForceStop();
		}
	}
}
