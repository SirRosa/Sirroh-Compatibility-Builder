using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using BepInEx;
using UnityEngine;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Serialization;
using YamlDotNet.Serialization.NamingConventions;

namespace LetMeTameYou;

public class YAMLReadWrite
{
	public class TameConfigYML
	{
		public List<string> writeValue = new List<string>();

		public string PrefabName { get; set; } = null;

		public string groups { get; set; } = null;

		public string commandable { get; set; } = null;

		public float tamingTime { get; set; } = -1f;

		public float fedDuration { get; set; } = -1f;

		public float consumeRange { get; set; } = -1f;

		public float size { get; set; } = -1f;

		public float consumeSearchInterval { get; set; } = -1f;

		public float consumeHeal { get; set; } = -1f;

		public float consumeSearchRange { get; set; } = -1f;

		public string consumeItems { get; set; } = null;

		public string procreation { get; set; } = null;

		public string offspringOverwrite { get; set; } = null;

		public float maxCreatures { get; set; } = -1f;

		public float pregnancyChance { get; set; } = -1f;

		public float pregnancyDuration { get; set; } = -1f;

		public float growTime { get; set; } = -1f;

		public float followDistMulti { get; set; } = -1f;

		public string hostileToSelf { get; set; } = null;

		public string specialGroup { get; set; } = null;

		public string egg { get; set; } = null;

		public string offspringName { get; set; } = null;

		public string offspringPrefab { get; set; } = null;

		public string requiredWorldKeys { get; set; } = null;

		public string trade { get; set; } = null;

		public string removeTameable { get; set; } = null;
	}

	public static Dictionary<string, TameConfigYML> groupConfigs = new Dictionary<string, TameConfigYML>();

	public static LetMeTameYou.TameConfig baseConfig = new LetMeTameYou.TameConfig();

	public static List<LetMeTameYou.TameConfig> UseFileOpenReadTextWithSystemTextYaml()
	{
		string[] files = Directory.GetFiles(Path.GetDirectoryName(Paths.BepInExConfigPath), "LetMeTameYou_*.yml");
		List<LetMeTameYou.TameConfig> list = new List<LetMeTameYou.TameConfig>();
		if (files.Count() > 0)
		{
			string[] array = files;
			foreach (string path in array)
			{
				string ymlContents = File.ReadAllText(path);
				List<LetMeTameYou.TameConfig> list2 = ParseTames(ymlContents);
				if (list2[0].PrefabName == "PrefabName")
				{
					list2.RemoveAt(0);
				}
				string text = "Tames added: ";
				foreach (LetMeTameYou.TameConfig tame in list2)
				{
					text = text + tame.PrefabName + ", ";
					if (!list.Exists((LetMeTameYou.TameConfig x) => x.PrefabName == tame.PrefabName) && !((tame.PrefabName ?? "") == ""))
					{
						list.Add(tame);
						if (!LetMeTameYou.customTamesList.ContainsKey(tame.PrefabName))
						{
							LetMeTameYou.customTamesList.Add(tame.PrefabName, tame);
						}
					}
				}
				DBG.blogDebug(text.Remove(text.Length - 2));
			}
		}
		else
		{
			DBG.blogWarning("no config files");
			string text2 = Path.Combine(Path.GetDirectoryName(Paths.BepInExConfigPath), Path.GetFileName("LetMeTameYou_DefaultTameList.yml"));
			DBG.blogDebug("createfile_path=" + text2);
			DBG.blogDebug("Did not find Setting in config, creating from default");
			using StreamWriter streamWriter = File.CreateText(text2);
			streamWriter.Write(loadDefaultConfig());
		}
		return list;
	}

	private static string loadDefaultConfig()
	{
		Assembly executingAssembly = Assembly.GetExecutingAssembly();
		string name = executingAssembly.GetManifestResourceNames().Single((string str) => str.EndsWith("DefaultTameList.yml"));
		string text = "";
		using (Stream stream = executingAssembly.GetManifestResourceStream(name))
		{
			using StreamReader streamReader = new StreamReader(stream);
			text = streamReader.ReadToEnd();
		}
		DBG.blogDebug("result=" + text);
		return text;
	}

	public static List<LetMeTameYou.TameConfig> ParseTames(string ymlContents)
	{
		_003Cdd442f31_002Dab93_002D475f_002Da633_002D58df98d94172_003EIDeserializer obj = new _003C5c3292ef_002Dc3cf_002D4d7f_002Db19a_002D9963be43175e_003EDeserializerBuilder().WithNamingConvention(_003C93d5d14d_002Ddfa9_002D4d43_002D85b1_002D4c5f04ac0e97_003ECamelCaseNamingConvention.Instance).IgnoreUnmatchedProperties().Build();
		if (ymlContents.Contains("\t"))
		{
			DBG.blogWarning("Config contains TAB indentation. Converting tabs to spaces automatically.");
			ymlContents = ymlContents.Replace("\t", "  ");
		}
		Dictionary<string, TameConfigYML> dictionary;
		try
		{
			dictionary = obj.Deserialize<Dictionary<string, TameConfigYML>>(ymlContents);
		}
		catch (Exception ex)
		{
			DBG.blogWarning("YAML file failed to load entirely: " + ex);
			return new List<LetMeTameYou.TameConfig>();
		}
		List<LetMeTameYou.TameConfig> list = new List<LetMeTameYou.TameConfig>();
		foreach (KeyValuePair<string, TameConfigYML> item in dictionary)
		{
			string key = item.Key;
			TameConfigYML value = item.Value;
			try
			{
				if (value == null)
				{
					DBG.blogWarning("Config '" + key + "' is null. Skipping.");
					continue;
				}
				if (string.IsNullOrWhiteSpace(value.PrefabName))
				{
					value.PrefabName = key;
				}
				TameConfigYML tameConfigYML = StripConfig(value);
				writeGroups(tameConfigYML);
				if (key.StartsWith("group_"))
				{
					DBG.blogDebug("Found group " + key);
					groupConfigs.Add(key.Substring(6), tameConfigYML);
					if (key == "group_Default")
					{
						DBG.blogWarning(" " + key + " is default, updating base config.");
						baseConfig = writeTame(tameConfigYML);
					}
					continue;
				}
				value = tameConfigYML;
				LetMeTameYou.TameConfig tameConfig = writeTame(value);
				string[] array = key.Split(new char[1] { ',' });
				tameConfig.PrefabName = array[0];
				list.Add(tameConfig);
				DBG.blogDebug("added Tame with name=" + tameConfig.PrefabName);
				for (int i = 1; i < array.Length; i++)
				{
					LetMeTameYou.TameConfig tameConfig2 = (LetMeTameYou.TameConfig)tameConfig.Clone();
					tameConfig2.PrefabName = array[i];
					list.Add(tameConfig2);
					DBG.blogDebug("added Tame with name=" + tameConfig2.PrefabName);
				}
			}
			catch (Exception ex2)
			{
				DBG.blogWarning("Failed to process config '" + key + "'. Error: " + ex2.Message);
			}
		}
		return list;
	}

	public static List<LetMeTameYou.TameConfig> ParseTames_old(string ymlContents)
	{
		_003Cfa4ba9b2_002D285f_002D4c5d_002Daf0b_002Dfe78ab17fd25_003EParser obj = new _003Cfa4ba9b2_002D285f_002D4c5d_002Daf0b_002Dfe78ab17fd25_003EParser(new StringReader(ymlContents));
		_003Cdd442f31_002Dab93_002D475f_002Da633_002D58df98d94172_003EIDeserializer obj2 = new _003C5c3292ef_002Dc3cf_002D4d7f_002Db19a_002D9963be43175e_003EDeserializerBuilder().WithNamingConvention(_003C93d5d14d_002Ddfa9_002D4d43_002D85b1_002D4c5f04ac0e97_003ECamelCaseNamingConvention.Instance).Build();
		obj.Consume<_003Cd41714f7_002D4f61_002D432e_002D8a83_002Ded593f31e526_003EStreamStart>();
		if (!obj.TryConsume<_003C11d343a3_002Dad11_002D4df1_002D9f55_002Da2bc7ef77934_003EDocumentStart>(out var _))
		{
			return new List<LetMeTameYou.TameConfig>();
		}
		obj.Consume<_003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart>();
		List<LetMeTameYou.TameConfig> list = new List<LetMeTameYou.TameConfig>();
		_003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar event2;
		while (obj.TryConsume<_003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar>(out event2))
		{
			try
			{
				TameConfigYML tameConfigYML;
				if (obj.Current.GetType() != typeof(_003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart))
				{
					if (!string.IsNullOrEmpty(event2.Value))
					{
						tameConfigYML = new TameConfigYML();
						goto IL_0111;
					}
					continue;
				}
				TameConfigYML tameConfigYML2 = StripConfig(obj2.Deserialize<TameConfigYML>(obj));
				writeGroups(tameConfigYML2);
				if (event2.Value.StartsWith("group_"))
				{
					DBG.blogDebug("Found group " + event2.Value);
					groupConfigs.Add(event2.Value.Substring(6), tameConfigYML2);
					continue;
				}
				tameConfigYML = tameConfigYML2;
				goto IL_0111;
				IL_0111:
				if (string.IsNullOrEmpty(tameConfigYML.PrefabName))
				{
					tameConfigYML.PrefabName = event2.Value;
				}
				LetMeTameYou.TameConfig tameConfig = writeTame(tameConfigYML);
				string[] array = event2.Value.Split(new char[1] { ',' });
				tameConfig.PrefabName = array[0];
				DBG.blogDebug("added Tame with name=" + tameConfig.PrefabName);
				list.Add(tameConfig);
				for (int i = 1; i < array.Length; i++)
				{
					LetMeTameYou.TameConfig tameConfig2 = (LetMeTameYou.TameConfig)tameConfig.Clone();
					tameConfig2.PrefabName = array[i];
					DBG.blogDebug("added Tame with name=" + tameConfig2.PrefabName);
					list.Add(tameConfig2);
				}
			}
			catch (Exception ex)
			{
				DBG.blogWarning("Failed to parse '" + event2?.Value + "' from yaml. Error: " + ex.Message);
				SkipCurrentNode(obj);
			}
		}
		return list;
	}

	private static void SkipCurrentNode(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser)
	{
		int num = 0;
		do
		{
			if (parser.Current is _003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart || parser.Current is _003C9f7de5d2_002Dfe16_002D493d_002D8158_002D378a5bfd51bb_003ESequenceStart)
			{
				num++;
			}
			if (parser.Current is _003C446b682a_002D36b6_002D46ea_002Db1c3_002D0616b60e5c52_003EMappingEnd || parser.Current is _003Caa8581b2_002D1caa_002D46f6_002Db8ec_002D0b62fd9dce90_003ESequenceEnd)
			{
				num--;
			}
		}
		while (num > 0 && parser.MoveNext());
	}

	public static TameConfigYML StripConfig(TameConfigYML groupConfig)
	{
		DBG.blogDebug("Prefab=" + groupConfig.PrefabName);
		PropertyInfo[] properties = typeof(TameConfigYML).GetProperties();
		foreach (PropertyInfo propertyInfo in properties)
		{
			try
			{
				if (propertyInfo.GetValue(groupConfig) == null)
				{
					continue;
				}
				if (propertyInfo.PropertyType == typeof(string))
				{
					DBG.blogDebug("Write Value=" + propertyInfo.Name);
					groupConfig.writeValue.Add(propertyInfo.Name);
					continue;
				}
				float num = (float)propertyInfo.GetValue(groupConfig);
				if (num > 0f)
				{
					DBG.blogDebug("Float Name=" + propertyInfo.Name);
					groupConfig.writeValue.Add(propertyInfo.Name);
				}
			}
			catch
			{
				DBG.blogDebug("Failed to access property " + propertyInfo.Name);
			}
		}
		DBG.blogDebug("Stripped Config");
		return groupConfig;
	}

	private static LetMeTameYou.TameConfig writeTame(TameConfigYML tameYML)
	{
		LetMeTameYou.TameConfig tameConfig = (LetMeTameYou.TameConfig)baseConfig.Clone();
		foreach (string item in tameYML.writeValue)
		{
			if (!(item == "groups"))
			{
				PropertyInfo property = typeof(LetMeTameYou.TameConfig).GetProperty(item);
				PropertyInfo property2 = typeof(TameConfigYML).GetProperty(item);
				if (property == null)
				{
					DBG.blogWarning("could not find property name: " + item);
				}
				else if (property.PropertyType == typeof(bool))
				{
					property.SetValue(tameConfig, (string)property2.GetValue(tameYML) == "true");
				}
				else if (property.PropertyType == typeof(int))
				{
					property.SetValue(tameConfig, Mathf.RoundToInt((float)property2.GetValue(tameYML)));
				}
				else
				{
					property.SetValue(tameConfig, property2.GetValue(tameYML));
				}
			}
		}
		return tameConfig;
	}

	private static void writeGroups(TameConfigYML tame)
	{
		if ((tame.groups ?? "") == "")
		{
			return;
		}
		List<TameConfigYML> list = new List<TameConfigYML>();
		List<string> list2 = tame.groups.Replace(" ", "").Split(new char[1] { ',' }).ToList();
		list2.Reverse();
		foreach (string item in list2)
		{
			if (!groupConfigs.TryGetValue(item, out var value))
			{
				DBG.blogWarning(tame.PrefabName + ":Could not find specialGroup named: " + item + " make sure you have formatted the specialGroup as \"group_GROUPNAME\"");
			}
			else
			{
				list.Add(value);
			}
		}
		foreach (TameConfigYML item2 in list)
		{
			List<string> list3 = item2.writeValue.Where((string p) => tame.writeValue.All((string text) => text != p)).ToList();
			foreach (string item3 in list3)
			{
				PropertyInfo property = typeof(TameConfigYML).GetProperty(item3);
				if (property == null)
				{
					DBG.blogWarning("could not find property name: " + item3);
					continue;
				}
				property.SetValue(tame, property.GetValue(item2));
				DBG.blogDebug("Group Property:" + property.Name + ", post value=" + property.GetValue(tame));
				tame.writeValue.Add(item3);
			}
		}
	}
}
