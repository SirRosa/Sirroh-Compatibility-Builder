using System.Runtime.CompilerServices;
using BepInEx.Logging;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Helper;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public static class Log
{
	private static ManualLogSource logSource;

	internal static void Init(ManualLogSource manualLogSource)
	{
		logSource = manualLogSource;
	}

	public static void LogCodeInstruction(object data)
	{
	}

	public static void LogDebug(string data)
	{
	}

	public static void LogError(string data)
	{
		if (logSource != null)
		{
			logSource.LogError((object)data);
		}
		else
		{
			Debug.LogError((object)data);
		}
	}

	public static void LogFatal(string data)
	{
		if (logSource != null)
		{
			logSource.LogFatal((object)data);
		}
		else
		{
			Debug.LogError((object)data);
		}
	}

	public static void LogInfo(string data)
	{
		if (logSource != null)
		{
			logSource.LogInfo((object)data);
		}
		else
		{
			Debug.Log((object)data);
		}
	}

	public static void LogWarning(string data)
	{
		if (logSource != null)
		{
			logSource.LogWarning((object)data);
		}
		else
		{
			Debug.LogWarning((object)data);
		}
	}
}
