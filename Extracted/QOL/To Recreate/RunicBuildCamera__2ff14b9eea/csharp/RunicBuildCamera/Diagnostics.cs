using System;
using BepInEx.Logging;

namespace RunicBuildCamera;

internal static class Diagnostics
{
	private static ManualLogSource _log;

	internal static bool IsInitialized => _log != null;

	internal static void Initialize(ManualLogSource log)
	{
		_log = log ?? throw new ArgumentNullException("log");
	}

	internal static void Verbose(string message)
	{
		if (BuildCameraConfig.VerboseLogging != null && BuildCameraConfig.VerboseLogging.Value)
		{
			ManualLogSource log = _log;
			if (log != null)
			{
				log.LogInfo((object)message);
			}
		}
	}

	internal static void Debug(string message)
	{
		if (BuildCameraConfig.VerboseLogging != null && BuildCameraConfig.VerboseLogging.Value)
		{
			ManualLogSource log = _log;
			if (log != null)
			{
				log.LogDebug((object)message);
			}
		}
	}

	internal static void Info(string message)
	{
		ManualLogSource log = _log;
		if (log != null)
		{
			log.LogInfo((object)message);
		}
	}

	internal static void Warn(string message)
	{
		ManualLogSource log = _log;
		if (log != null)
		{
			log.LogWarning((object)message);
		}
	}

	internal static void Error(string message)
	{
		ManualLogSource log = _log;
		if (log != null)
		{
			log.LogError((object)message);
		}
	}

	internal static void Error(Exception exception, string context)
	{
		if (exception == null)
		{
			Error(context);
			return;
		}
		ManualLogSource log = _log;
		if (log != null)
		{
			log.LogError((object)(context + Environment.NewLine + exception));
		}
	}
}
