using BepInEx.Logging;
using Husbandry.Config;

namespace Husbandry.Util;

internal static class Log
{
	internal static ManualLogSource Source;

	internal static void Info(string what)
	{
		ManualLogSource source = Source;
		if (source != null)
		{
			source.LogInfo((object)what);
		}
	}

	internal static void Warn(string what)
	{
		ManualLogSource source = Source;
		if (source != null)
		{
			source.LogWarning((object)what);
		}
	}

	internal static void Debug(string what)
	{
		if (HusbandryConfig.Verbose == null || HusbandryConfig.Verbose.Value)
		{
			ManualLogSource source = Source;
			if (source != null)
			{
				source.LogInfo((object)what);
			}
		}
	}
}
