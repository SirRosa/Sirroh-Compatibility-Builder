using System;
using System.Globalization;
using System.Runtime.CompilerServices;
using System.Text;
using BepInEx.Configuration;
using BepInEx.Logging;
using UnityEngine;
using Zen.Lib;

namespace Zen;

public class Logging<TPlugin> : LoggingBase where TPlugin : ZenMod<TPlugin>
{
	[InterpolatedStringHandler]
	public readonly ref struct InterpolatedString
	{
		private readonly StringBuilder? _builder;

		public InterpolatedString(int literalLength, int formattedCount, out bool shouldAppend)
		{
			shouldAppend = Logging<TPlugin>.IsEnabled;
			_builder = (shouldAppend ? new StringBuilder(literalLength + formattedCount * 11) : null);
		}

		public void AppendLiteral(string value)
		{
			_builder?.Append(value);
		}

		public void AppendFormatted<T>(T value)
		{
			_builder?.Append(value);
		}

		public void AppendFormatted<T>(T value, string? format)
		{
			if (_builder != null)
			{
				if (value is IFormattable formattable)
				{
					_builder.Append(formattable.ToString(format, CultureInfo.InvariantCulture));
				}
				else
				{
					_builder.Append(value);
				}
			}
		}

		public void AppendFormatted<T>(T value, int alignment)
		{
			if (_builder != null)
			{
				string text = value?.ToString();
				if (text == null)
				{
					text = string.Empty;
				}
				AppendAligned(text, alignment);
			}
		}

		public void AppendFormatted<T>(T value, int alignment, string? format)
		{
			if (_builder == null)
			{
				return;
			}
			string value2;
			if (value is IFormattable formattable)
			{
				value2 = formattable.ToString(format, CultureInfo.InvariantCulture);
			}
			else
			{
				string text = value?.ToString();
				if (text == null)
				{
					text = string.Empty;
				}
				value2 = text;
			}
			AppendAligned(value2, alignment);
		}

		public void AppendFormatted(string? value)
		{
			_builder?.Append(value);
		}

		public void AppendFormatted(string? value, int alignment)
		{
			if (_builder != null)
			{
				AppendAligned(value ?? string.Empty, alignment);
			}
		}

		private void AppendAligned(string value, int alignment)
		{
			if (_builder != null)
			{
				if (alignment == 0)
				{
					_builder.Append(value);
				}
				else if (alignment > 0)
				{
					_builder.Append(value.PadLeft(alignment));
				}
				else
				{
					_builder.Append(value.PadRight(-alignment));
				}
			}
		}

		public string GetFormattedText()
		{
			return _builder?.ToString() ?? string.Empty;
		}

		public override string ToString()
		{
			return GetFormattedText();
		}
	}

	private readonly ConfigEntry<bool> _enabled;

	public static bool IsEnabled
	{
		get
		{
			if (!Object.op_Implicit((Object)(object)ZNet.instance) || ZNet.instance.IsServer() || ModLib.Configs.AllowDebugLogs.Value)
			{
				if (!ZenMod<TPlugin>.Instance.Logging._enabled.Value)
				{
					return ModLib.Configs.DebugAll.Value;
				}
				return true;
			}
			return false;
		}
	}

	private static ManualLogSource Logger => ZenMod<TPlugin>.Instance.GetLogger();

	internal Logging(ConfigEntry<bool> configEnabled)
	{
		_enabled = configEnabled;
	}

	private static bool IsLogLevel(LogLevel level)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		return (LogLevel)(LoggingBase.LogLevels & level) == level;
	}

	public static void Debug(InterpolatedString msg, int stackDepth = 0)
	{
		if (IsLogLevel((LogLevel)32) && IsEnabled)
		{
			Debug(msg.GetFormattedText(), stackDepth + 1);
		}
	}

	public static void Debug(string msg, int stackDepth = 0)
	{
		Debug((object)msg, stackDepth + 1);
	}

	public static void Debug(object data, int stackDepth = 0)
	{
		if (IsLogLevel((LogLevel)32) && IsEnabled)
		{
			Logger.LogDebug((object)LoggingBase.Format(data, stackDepth));
		}
	}

	public static void Info(InterpolatedString msg, int stackDepth = 0)
	{
		if (IsLogLevel((LogLevel)16) && IsEnabled)
		{
			Info(msg.GetFormattedText(), stackDepth + 1);
		}
	}

	public static void Info(string msg, int stackDepth = 0)
	{
		Info((object)msg, stackDepth + 1);
	}

	public static void Info(object data, int stackDepth = 0)
	{
		if (IsLogLevel((LogLevel)16) && IsEnabled)
		{
			Logger.LogInfo((object)LoggingBase.Format(data, stackDepth));
		}
	}

	public static void Message(object data, int stackDepth = 0)
	{
		if (IsLogLevel((LogLevel)8))
		{
			Logger.LogMessage(data);
		}
	}

	public static void Warning(object data, int stackDepth = 0)
	{
		if (IsLogLevel((LogLevel)4))
		{
			Logger.LogWarning((object)LoggingBase.Format(data, stackDepth));
		}
	}

	public static void Error(object data, ushort stackDepth = 0)
	{
		Logger.LogError((object)LoggingBase.Format(data, stackDepth));
	}

	public static void Fatal(object data, ushort stackDepth = 0)
	{
		Logger.LogFatal((object)LoggingBase.Format(data, stackDepth));
	}
}
