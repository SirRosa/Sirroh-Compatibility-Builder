using System;
using System.Reflection;
using HarmonyLib;

namespace RunicBuildCamera.Integration;

[HarmonyPatch]
internal static class GameCameraRemoteEffectsPatch
{
	private static MethodBase TargetMethod()
	{
		return ValheimAdapter.UpdateCameraMethod;
	}

	private static void Postfix()
	{
		try
		{
			RemotePickupRuntime.Tick();
			DemisterRuntime.RefreshActiveState();
		}
		catch (Exception exception)
		{
			RemotePickupRuntime.ReportFailure(exception);
			RemotePickupRuntime.Reset();
			DemisterRuntime.OnCameraExit();
		}
	}
}
