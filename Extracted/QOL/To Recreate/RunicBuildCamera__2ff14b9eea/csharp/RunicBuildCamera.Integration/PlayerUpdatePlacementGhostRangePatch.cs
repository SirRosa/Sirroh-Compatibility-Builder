using System;
using System.Reflection;
using HarmonyLib;

namespace RunicBuildCamera.Integration;

[HarmonyPatch]
internal static class PlayerUpdatePlacementGhostRangePatch
{
	private static MethodBase TargetMethod()
	{
		return ValheimAdapter.UpdatePlacementGhostMethod;
	}

	private static void Prefix(Player __instance, ref ValheimAdapter.RangeLease __state)
	{
		try
		{
			__state = BuildCameraRuntime.EnterRemoteActionRange(__instance);
		}
		catch
		{
			__state = null;
			BuildCameraRuntime.ForceStop();
		}
	}

	private static Exception Finalizer(Exception __exception, ValheimAdapter.RangeLease __state)
	{
		try
		{
			__state?.Dispose();
		}
		catch
		{
			BuildCameraRuntime.ForceStop();
		}
		return __exception;
	}
}
