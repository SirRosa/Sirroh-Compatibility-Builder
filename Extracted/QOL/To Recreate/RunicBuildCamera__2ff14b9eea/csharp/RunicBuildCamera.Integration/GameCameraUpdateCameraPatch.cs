using System;
using System.Reflection;
using HarmonyLib;
using Runic.Localization;

namespace RunicBuildCamera.Integration;

[HarmonyPatch]
internal static class GameCameraUpdateCameraPatch
{
	private static MethodBase TargetMethod()
	{
		return ValheimAdapter.UpdateCameraMethod;
	}

	private static bool Prefix(GameCamera __instance, float dt)
	{
		try
		{
			return !BuildCameraRuntime.TryUpdateCamera(__instance, dt);
		}
		catch (Exception exception)
		{
			BuildCameraRuntime.ForceStop();
			Diagnostics.Error(exception, RunicText.Get("text_1d7135258182"));
			return true;
		}
	}
}
