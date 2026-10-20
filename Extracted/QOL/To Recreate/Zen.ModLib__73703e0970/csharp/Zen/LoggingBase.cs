using System;
using System.Diagnostics;
using System.Reflection;
using System.Runtime.CompilerServices;
using BepInEx.Configuration;
using BepInEx.Logging;
using HarmonyLib;
using UnityEngine;

namespace Zen;

public abstract class LoggingBase
{
	private static readonly Action? UnregisterBepInExEvents;

	protected static LogLevel LogLevels
	{
		[CompilerGenerated]
		get
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			return field;
		}
		[CompilerGenerated]
		private set
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			field = value;
		}
	}

	static LoggingBase()
	{
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		try
		{
			ConfigFile val = (ConfigFile)AccessTools.Property(typeof(ConfigFile), "CoreConfig").GetValue(null);
			ConfigEntry<LogLevel> disk = default;
			if (!val.TryGetEntry<LogLevel>("Logging.Disk", "LogLevels", ref disk))
			{
				throw new Exception("Logging.Disk LogLevels config info missing");
			}
			ConfigEntry<LogLevel> console = default;
			if (!val.TryGetEntry<LogLevel>("Logging.Console", "LogLevels", ref console))
			{
				throw new Exception("Logging.Console LogLevels config info missing");
			}
			disk.SettingChanged += SetLogLevels;
			console.SettingChanged += SetLogLevels;
			SetLogLevels(null, null);
			UnregisterBepInExEvents = () =>
			{
				disk.SettingChanged -= SetLogLevels;
				console.SettingChanged -= SetLogLevels;
			};
			void SetLogLevels(object? sender, EventArgs? args)
			{
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0016: Unknown result type (might be due to invalid IL or missing references)
				LogLevels = (LogLevel)(disk.Value | console.Value);
			}
		}
		catch (Exception ex)
		{
			Debug.LogError((object)ex.Message);
			Debug.LogWarning((object)"Falling back to default log levels");
			LogLevels = (LogLevel)23;
		}
	}

	protected static string Format(object data, int stackDepth)
	{
		MethodBase? methodBase = new StackTrace(stackDepth + 2).GetFrame(0)?.GetMethod();
		string arg = methodBase?.DeclaringType?.Name ?? $"StackDepth:{stackDepth}_UnknownType";
		string arg2 = methodBase?.Name ?? "UnknownMethod";
		return $"{arg}.{arg2}: {data}";
	}

	internal static void Shutdown()
	{
		try
		{
			UnregisterBepInExEvents?.Invoke();
		}
		catch
		{
		}
	}
}
