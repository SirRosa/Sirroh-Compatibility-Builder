using System;
using System.Reflection;
using HarmonyLib;

namespace RunicBuildCamera.Integration;

[HarmonyPatch]
internal static class PlayerUpdatePlacementRangePatch
{
	private static MethodBase TargetMethod()
	{
		return ValheimAdapter.UpdatePlacementMethod;
	}

	[HarmonyPriority(800)]
	[HarmonyBefore(new string[] { "chazman.RunicPrecisionBuildTool" })]
	private static void Prefix(Player __instance, ref bool takeInput, ref ValheimAdapter.RangeLease __state)
	{
		try
		{
			takeInput = PlayerUpdateInputIsolation.PlacementInput(__instance, takeInput);
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
