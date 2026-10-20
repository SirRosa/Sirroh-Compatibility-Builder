using System;
using BepInEx.Configuration;
using UnityEngine;

namespace neobotics.ModSdk;

public class Logging
{
	internal enum LogLevels
	{
		Critical,
		Error,
		Warning,
		Info,
		Debug,
		Trace
	}

	private static Logging _instance;

	public static Logging Instance
	{
		get
		{
			if (_instance == null)
			{
				throw new InvalidOperationException("Logging.Instance was accessed before initialization. Call Logging.Initialize() in your mod's startup code first.");
			}
			return _instance;
		}
		private set
		{
			_instance = value;
		}
	}

	internal LogLevels LogLevel { get; set; }

	internal string ModName { get; private set; }

	private Logging(LogLevels level, string name)
	{
		LogLevel = level;
		ModName = name;
	}

	internal static Logging Initialize(LogLevels level, string name)
	{
		if (_instance != null)
		{
			Instance.Warning("Logger is already initialized. Using existing logger");
			return _instance;
		}
		Instance = new Logging(level, name);
		return _instance;
	}

	internal static Logging GetLogger(LogLevels level, string name)
	{
		if (_instance == null)
		{
			Initialize(level, name);
		}
		return Instance;
	}

	internal static Logging GetLogger()
	{
		return Instance;
	}

	internal void Trace(string msg)
	{
		if (LogLevel >= LogLevels.Trace)
		{
			Debug.Log((object)Message(msg));
		}
	}

	internal void Debug(string msg)
	{
		if (LogLevel >= LogLevels.Debug)
		{
			Debug.Log((object)Message(msg));
		}
	}

	internal void Info(string msg)
	{
		if (LogLevel >= LogLevels.Info)
		{
			Debug.Log((object)Message(msg));
		}
	}

	internal void Warning(string msg)
	{
		if (LogLevel >= LogLevels.Warning)
		{
			Debug.LogWarning((object)Message(msg));
		}
	}

	internal void Error(string msg)
	{
		if (LogLevel >= LogLevels.Error)
		{
			Debug.LogWarning((object)Message(msg));
		}
	}

	internal void Error(Exception e)
	{
		Error(e, stackTrace: false);
	}

	internal void Error(Exception e, bool stackTrace)
	{
		if (LogLevel >= LogLevels.Error)
		{
			Warning(Message(e.Message));
			if (stackTrace)
			{
				Warning(e.StackTrace);
			}
		}
	}

	internal void Critical(Exception e)
	{
		if (LogLevel >= LogLevels.Critical)
		{
			Debug(Message(e.Message));
			Error(e.StackTrace);
		}
	}

	private string Message(string msg)
	{
		return ModName + ": " + msg;
	}

	internal bool Testing()
	{
		return Instance.LogLevel >= LogLevels.Debug;
	}

	internal static void ChangeLogging(object s, EventArgs e)
	{
		ConfigEntry<LogLevels> val = s as ConfigEntry<LogLevels>;
		if (_instance != null)
		{
			Instance.LogLevel = val.Value;
			Instance.Info($"Change {((ConfigEntryBase)val).Definition.Key} to {val.Value}");
		}
	}
}
