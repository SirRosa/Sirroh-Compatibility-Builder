using HarmonyLib;

namespace RunicBuildCamera.Integration;

[HarmonyPatch(typeof(Player), "SetLocalPlayer")]
internal static class RemoteEffectsLocalPlayerCleanupPatch
{
	private static void Prefix()
	{
		RemotePickupRuntime.Reset();
		DemisterRuntime.OnCameraExit();
	}
}
