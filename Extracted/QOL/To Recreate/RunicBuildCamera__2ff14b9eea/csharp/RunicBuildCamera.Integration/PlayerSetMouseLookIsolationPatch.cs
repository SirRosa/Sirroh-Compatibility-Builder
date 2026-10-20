using System;
using HarmonyLib;
using UnityEngine;

namespace RunicBuildCamera.Integration;

[HarmonyPatch(typeof(Player), "SetMouseLook", new Type[] { typeof(Vector2) })]
internal static class PlayerSetMouseLookIsolationPatch
{
	private static void Prefix(Player __instance, ref Vector2 mouseLook)
	{
		//IL_0009: Unknown result type (might be due to invalid IL or missing references)
		//IL_000e: Unknown result type (might be due to invalid IL or missing references)
		if (BuildCameraRuntime.ShouldFreezePlayer(__instance))
		{
			mouseLook = Vector2.zero;
		}
	}
}
