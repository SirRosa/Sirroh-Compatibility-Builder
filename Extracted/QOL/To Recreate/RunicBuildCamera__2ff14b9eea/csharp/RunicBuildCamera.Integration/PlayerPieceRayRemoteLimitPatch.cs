using HarmonyLib;
using UnityEngine;

namespace RunicBuildCamera.Integration;

[HarmonyPatch(typeof(Player), "PieceRayTest")]
internal static class PlayerPieceRayRemoteLimitPatch
{
	private static void Postfix(Player __instance, [HarmonyArgument("point")] ref Vector3 point, ref bool __result)
	{
		//IL_000e: Unknown result type (might be due to invalid IL or missing references)
		if (__result && BuildCameraRuntime.ShouldFreezePlayer(__instance) && !BuildCameraRuntime.IsWithinRemoteActionLimit(__instance, point))
		{
			__result = false;
		}
	}
}
