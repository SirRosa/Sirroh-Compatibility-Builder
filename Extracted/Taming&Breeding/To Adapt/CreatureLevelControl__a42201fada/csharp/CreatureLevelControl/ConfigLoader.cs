using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;
using BepInEx;
using HarmonyLib;
using JetBrains.Annotations;
using UnityEngine;
using YamlDotNet.Core;
using YamlDotNet.Serialization;

namespace CreatureLevelControl;

public static class ConfigLoader
{
	[HarmonyPatch(typeof(Game), "RequestRespawn")]
	private class PatchConfigReading
	{
		[HarmonyPriority(100)]
		[UsedImplicitly]
		private static void Postfix(bool ___m_firstSpawn)
		{
			ConfigFile.Loader[] loaders = ConfigFile.loaders;
			foreach (ConfigFile.Loader loader in loaders)
			{
				if (___m_firstSpawn && loader.ConfigFile != null)
				{
					loader.ProcessConfig();
				}
			}
		}
	}

	[HarmonyPatch(typeof(FejdStartup), "Start")]
	private class DelayedConfigLoading
	{
		[UsedImplicitly]
		private static void Postfix()
		{
			loadConfigFile();
		}
	}

	[HarmonyPatch(typeof(ZNet), "Awake")]
	private static class RegisterRPCPatch
	{
		[UsedImplicitly]
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Postfix(ZNet __instance)
		{
			if (__instance.IsDedicated() && __instance.IsServer())
			{
				loadConfigFile();
			}
		}
	}

	public static bool SkipSavingOfValueChange;

	private static bool initialized;

	private static void loadConfigFile()
	{
		if (!initialized)
		{
			initialized = true;
			ConfigFile.Loader[] loaders = ConfigFile.loaders;
			foreach (ConfigFile.Loader loader in loaders)
			{
				loadConfigFile(loader);
			}
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	private static void loadConfigFile(ConfigFile.Loader loader)
	{
		List<string> list = (from p in CreatureLevelControl.configFilePaths.SelectMany((string path) => Directory.GetFiles(path, loader.FilePattern))
			orderby Path.GetFileName(p) != loader.FilePattern.Replace("*", "")
			select p).ThenBy(Path.GetFileName).ToList();
		if (list.Count > 0)
		{
			Dictionary<string, string> dictionary = list.ToDictionary((string p) => p, File.ReadAllText);
			ConfigFile configFile = (loader.ConfigFile = loader.InstantiateConfig());
			ConfigFile configFile3 = configFile;
			foreach (KeyValuePair<string, string> item in dictionary)
			{
				try
				{
					object configObj = new DeserializerBuilder().Build().Deserialize<object>(item.Value);
					configFile3.Parse(configObj);
					configFile3.DumpWarnings("Found warnings in Creature Level & Loot Control config in file at " + item.Key + ".");
					if (configFile3.configErrors.Count > 0)
					{
						Debug.LogError((object)("Found Creature Level & Loot Control config errors in file at " + item.Key + ". Please review the syntax of your file:\n" + string.Join("\n", configFile3.configErrors)));
						Debug.LogWarning((object)"Ignoring some configurations of Creature Level & Loot Control config file and defaulting to the other configuration options instead.");
						configFile3.configErrors.Clear();
					}
				}
				catch (YamlException ex)
				{
					Debug.LogError((object)("Found a Creature Level & Loot Control config file at " + item.Key + ", but parsing failed with an error:\n" + ex.Message + ((ex.InnerException != null) ? (": " + ex.InnerException.Message) : "")));
					Debug.LogWarning((object)"Ignoring Creature Level & Loot Control config file and reverting to default config instead.");
				}
			}
			loader.FileData.Value = dictionary.SelectMany((KeyValuePair<string, string> kv) => new string[2] { kv.Key, kv.Value }).ToList();
		}
		else
		{
			if (loader.Enabled)
			{
				Debug.LogWarning((object)("Config file is set to active, but no " + loader.FilePattern + " file was found at " + string.Join(" or ", CreatureLevelControl.configFilePaths) + "."));
			}
			string text = loader.FilePattern.Replace("*", "");
			File.WriteAllBytes(CreatureLevelControl.configFilePaths[0] + "/" + text, Utils.ReadEmbeddedFileBytes(text));
		}
		loader.FileData.ValueChanged += () =>
		{
			Dictionary<string, string> dictionary2 = (from g in loader.FileData.Value.Select((string f, int index) => new { f, index })
				group g by g.index / 2).ToDictionary(g => g.First().f, g => g.Last().f);
			bool flag = false;
			ConfigFile configFile4 = loader.InstantiateConfig();
			foreach (KeyValuePair<string, string> item2 in dictionary2)
			{
				try
				{
					object configObj2 = new DeserializerBuilder().Build().Deserialize<object>(item2.Value);
					configFile4.Parse(configObj2);
					configFile4.DumpWarnings("Found warnings in received Creature Level & Loot Control yaml config data in file at " + item2.Key + ".");
					if (configFile4.configErrors.Count > 0)
					{
						Debug.LogError((object)("Received new Creature Level & Loot Control yaml config data, with errors in file at " + item2.Key + ". Please review the syntax of your file:\n" + string.Join("\n", configFile4.configErrors)));
						configFile4.configErrors.Clear();
						flag = true;
					}
				}
				catch (YamlException ex2)
				{
					Debug.LogError((object)("Received new Creature Level & Loot Control yaml config data, but parsing of " + item2.Key + " failed with an error:\n" + ex2.Message + ((ex2.InnerException != null) ? (": " + ex2.InnerException.Message) : "")));
					flag = true;
				}
			}
			if (flag)
			{
				Debug.LogWarning((object)"Ignoring the changed Creature Level & Loot Control config data, retaining the originally received data. Dumping the config contents for inspection.");
				{
					foreach (KeyValuePair<string, string> item3 in dictionary2)
					{
						Debug.LogWarning((object)("Contents of " + item3.Key + ":"));
						Debug.Log((object)item3.Value);
					}
					return;
				}
			}
			loader.ConfigFile = configFile4;
			ZNetScene instance = ZNetScene.instance;
			if ((Object)(object)((instance != null) ? instance.GetPrefab("_ZoneCtrl") : null) != (Object)null)
			{
				loader.ProcessConfig();
			}
			if (!SkipSavingOfValueChange && CreatureLevelControl.configSync.IsSourceOfTruth)
			{
				foreach (KeyValuePair<string, string> item4 in dictionary2)
				{
					try
					{
						string text2 = item4.Key + ".temp";
						File.WriteAllText(text2, item4.Value);
						File.Replace(text2, item4.Key, null);
					}
					catch (IOException ex3)
					{
						Debug.LogError((object)("Failed writing config back to " + item4.Key + ", got error message: " + ex3.Message));
					}
				}
			}
		};
		foreach (string configFilePath in CreatureLevelControl.configFilePaths)
		{
			FileSystemWatcher fileSystemWatcher = new FileSystemWatcher(configFilePath, loader.FilePattern);
			fileSystemWatcher.Changed += consumeConfigFileEvent;
			fileSystemWatcher.Created += consumeConfigFileEvent;
			fileSystemWatcher.Renamed += consumeConfigFileEvent;
			fileSystemWatcher.IncludeSubdirectories = true;
			fileSystemWatcher.SynchronizingObject = ThreadingHelper.SynchronizingObject;
			fileSystemWatcher.EnableRaisingEvents = true;
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
	private static void consumeConfigFileEvent(object sender, FileSystemEventArgs args)
	{
		ConfigFile.Loader[] loaders = ConfigFile.loaders;
		foreach (ConfigFile.Loader loader in loaders)
		{
			if (!Path.GetFileName(args.Name).StartsWith(Regex.Replace(loader.FilePattern, "\\*.*", "")))
			{
				continue;
			}
			List<string> list = CreatureLevelControl.configFilePaths.SelectMany((string path) => Directory.GetFiles(path, loader.FilePattern)).ToList();
			if (list.Count <= 0)
			{
				continue;
			}
			Dictionary<string, string> dictionary = list.ToDictionary((string p) => p, File.ReadAllText);
			bool flag = false;
			ConfigFile configFile = loader.InstantiateConfig();
			foreach (KeyValuePair<string, string> item in dictionary)
			{
				try
				{
					object configObj = new DeserializerBuilder().Build().Deserialize<object>(item.Value);
					configFile.Parse(configObj);
					configFile.DumpWarnings("Found warnings in Creature Level & Loot Control config in file at " + item.Key + ".");
					if (configFile.configErrors.Count > 0)
					{
						Debug.LogError((object)("Found Creature Level & Loot Control config errors in file at " + item.Key + ". Please review the syntax of your file:\n" + string.Join("\n", configFile.configErrors)));
						configFile.configErrors.Clear();
						flag = true;
					}
				}
				catch (YamlException ex)
				{
					Debug.LogError((object)("Found a Creature Level & Loot Control config file at " + item.Key + ", but parsing failed with an error:\n" + ex.Message + ((ex.InnerException != null) ? (": " + ex.InnerException.Message) : "")));
					flag = true;
				}
			}
			if (flag)
			{
				Debug.LogWarning((object)"Ignoring the changed config file, retaining the originally loaded file.");
				continue;
			}
			SkipSavingOfValueChange = true;
			loader.FileData.AssignLocalValue(dictionary.SelectMany((KeyValuePair<string, string> kv) => new string[2] { kv.Key, kv.Value }).ToList());
			SkipSavingOfValueChange = false;
			Debug.Log((object)("Successfully reloaded Creature Level & Loot Control " + loader.FilePattern + " yml config" + (CreatureLevelControl.configSync.IsSourceOfTruth ? "" : ", but skipped applying as remote configuration is active currently.")));
		}
	}
}
