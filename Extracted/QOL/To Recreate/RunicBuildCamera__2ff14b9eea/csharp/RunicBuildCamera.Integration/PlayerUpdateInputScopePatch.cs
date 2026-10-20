using System;
using HarmonyLib;

namespace RunicBuildCamera.Integration;

[HarmonyPatch(typeof(Player), "Update")]
internal static class PlayerUpdateInputScopePatch
{
	private static void Prefix(Player __instance, ref bool __state)
	{
		try
		{
			__state = PlayerUpdateInputIsolation.Enter(__instance);
		}
		catch
		{
			__state = false;
			BuildCameraRuntime.ForceStop();
		}
	}

	private static Exception Finalizer(Exception __exception, bool __state)
	{
		if (__state)
		{
			PlayerUpdateInputIsolation.Exit();
		}
		return __exception;
	}
}
