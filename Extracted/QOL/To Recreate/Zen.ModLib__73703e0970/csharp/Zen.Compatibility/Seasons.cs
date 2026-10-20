using System;
using System.Reflection;
using BepInEx.Bootstrap;
using HarmonyLib;

namespace Zen.Compatibility;

internal static class Seasons
{
	private static bool _isInitialized;

	private static Func<Fireplace, double>? _getSecToBurnFire;

	private static void Init()
	{
		_isInitialized = true;
		if (!ModLib.Configs.UseModSeasonsFuelBurnRate.Value || !Chainloader.PluginInfos.TryGetValue("shudnal.Seasons", out var value))
		{
			return;
		}
		FieldInfo fieldInfo = AccessTools.Field(Assembly.GetAssembly(((object)value.Instance).GetType()).GetType("Seasons.Seasons"), "seasonState");
		if (fieldInfo == null)
		{
			Logging<ModLib>.Error("Seasons.seasonState not found, returning to default calculations.", 0);
			return;
		}
		MethodInfo methodInfo = AccessTools.Method(fieldInfo.FieldType, "GetSecondsToBurnFire", new Type[1] { typeof(Fireplace) }, (Type[])null);
		if (methodInfo == null)
		{
			Logging<ModLib>.Error("Seasons.seasonState.GetSecondsToBurnFire not found, returning to default calculations.", 0);
			return;
		}
		try
		{
			_getSecToBurnFire = (Func<Fireplace, double>)methodInfo.CreateDelegate(typeof(Func<Fireplace, double>), fieldInfo.GetValue(null));
		}
		catch (Exception ex)
		{
			Logging<ModLib>.Error("Failed to create delegate for GetSecondsToBurnFire: " + ex.Message, 0);
			return;
		}
		Logging<ModLib>.Message("Using Seasons calculations for fireplace burn time");
	}

	public static double GetTimeRemaining(Fireplace fireplace)
	{
		if (!_isInitialized)
		{
			Init();
		}
		return _getSecToBurnFire?.Invoke(fireplace) ?? (-1.0);
	}
}
