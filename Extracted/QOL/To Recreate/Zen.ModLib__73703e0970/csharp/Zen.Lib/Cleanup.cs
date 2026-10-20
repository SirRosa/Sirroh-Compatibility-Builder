using System;
using System.Collections.Generic;
using BepInEx;
using BepInEx.Configuration;
using HarmonyLib;
using Jotunn.Managers;
using Zen.Lib.Config;

namespace Zen.Lib;

internal static class Cleanup
{
	public static void External(BaseUnityPlugin plugin)
	{
		if (plugin is ModLib)
		{
			ConfigTomlTypeConverterEntries();
		}
		JotunnConfigs(plugin.Config);
	}

	private static void JotunnConfigs(ConfigFile configFile)
	{
		Logging<ModLib>.Debug("Remove config entries from Jotunn cache", 1);
		Dictionary<ConfigEntryBase, object> dictionary = (Dictionary<ConfigEntryBase, object>)AccessTools.Field(typeof(SynchronizationManager), "localValues").GetValue(SynchronizationManager.Instance);
		foreach (ConfigDefinition key2 in configFile.Keys)
		{
			ConfigEntryBase key = configFile[key2];
			dictionary.Remove(key);
		}
	}

	private static void ConfigTomlTypeConverterEntries()
	{
		Logging<ModLib>.Debug("Removing TomlTypeConverter Entry: StringList", 1);
		((Dictionary<Type, TypeConverter>)AccessTools.Property(typeof(TomlTypeConverter), "TypeConverters").GetValue(null)).Remove(typeof(StringList));
	}
}
