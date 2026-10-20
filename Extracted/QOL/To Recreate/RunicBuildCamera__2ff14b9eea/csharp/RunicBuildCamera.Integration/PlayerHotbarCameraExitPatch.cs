using System;
using HarmonyLib;

namespace RunicBuildCamera.Integration;

[HarmonyPatch(typeof(Player), "UseHotbarItem", new Type[] { typeof(int) })]
internal static class PlayerHotbarCameraExitPatch
{
	private static void Prefix(Player __instance)
	{
		if (BuildCameraRuntime.ShouldFreezePlayer(__instance))
		{
			BuildCameraRuntime.ForceStop();
		}
	}
}
