using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using JetBrains.Annotations;
using ServerSync;
using UnityEngine;

namespace CreatureLevelControl;

[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
public abstract class ConfigFile
{
	public interface Loader
	{
		[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
		ConfigFile ConfigFile
		{
			[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(2)]
			get;
			[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(2)]
			set;
		}

		string FilePattern { get; }

		string EditButtonName { get; }

		CustomSyncedValue<List<string>> FileData { get; }

		bool Enabled { get; }

		ConfigFile InstantiateConfig();

		void ProcessConfig();
	}

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	protected class Section : IDisposable
	{
		[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
		private readonly Section lastSection;

		[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })]
		private readonly Dictionary<string, object> dict;

		public readonly string dictKey;

		private readonly HashSet<string> knownKeys = new HashSet<string>(StringComparer.CurrentCultureIgnoreCase);

		private readonly ConfigFile configFile;

		public string Path => ((lastSection == null || lastSection.dictKey == "") ? "" : (lastSection.Path + ".")) + dictKey;

		public Section([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })] Dictionary<string, object> dict, string key, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] Section lastSection, ConfigFile file)
		{
			this.dict = dict;
			dictKey = key;
			this.lastSection = lastSection;
			configFile = file;
		}

		[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
		public object Get(string key)
		{
			knownKeys.Add(key);
			if (dict.TryGetValue(key, out var value) && value == null)
			{
				configFile.configErrors.Add(Path + "." + key + " cannot be empty");
			}
			return value;
		}

		public IEnumerable<string> KeysWithPrefix(string prefix)
		{
			return dict.Keys.Where([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (string k) => k.StartsWith(prefix));
		}

		public void Dispose()
		{
			IEnumerable<string> enumerable = dict.Keys.Where([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (string key) => !knownKeys.Contains(key)).ToArray();
			if (enumerable.Any())
			{
				configFile.configWarnings.Add(Path + " contains unknown keys " + string.Join(", ", enumerable));
			}
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	protected delegate bool ParserDelegate<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] ref T target, Section sect, string key);

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(2)]
	private struct ParseResult<T>
	{
		[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)]
		public T value;

		public string error;
	}

	public static readonly Loader[] loaders = new Loader[2]
	{
		new CreatureConfig.Loader(),
		new ItemConfig.Loader()
	};

	public readonly List<string> configErrors = new List<string>();

	public readonly List<string> configWarnings = new List<string>();

	protected readonly Dictionary<string, List<string>> groups = new Dictionary<string, List<string>>();

	public void DumpWarnings(string prefix)
	{
		if (configWarnings.Count > 0)
		{
			Debug.LogWarning((object)(prefix + ((configErrors.Count > 0) ? "" : " The config file was loaded, but may not yield expected results due to warnings:") + "\n" + string.Join("\n", configWarnings)));
			configWarnings.Clear();
		}
	}

	protected void AssignConfig<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] T>(ref T newConfig, T inConfig) where T : class
	{
		if (newConfig == null)
		{
			newConfig = inConfig;
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	protected void AssignConfig<T>(ref T? newConfig, T? inConfig) where T : struct
	{
		T? val = newConfig;
		if (!val.HasValue)
		{
			newConfig = inConfig;
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(2)]
	protected void AssignEnumConfig<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 1, 2 })] ref Dictionary<int, Dictionary<T, float[]>> newConfig, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 1, 2 })] Dictionary<int, Dictionary<T, float[]>> inConfig)
	{
		if (inConfig == null)
		{
			return;
		}
		if (newConfig == null)
		{
			newConfig = inConfig.ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<int, Dictionary<T, float[]>> kv) => kv.Key, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<int, Dictionary<T, float[]>> kv) => kv.Value.ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<T, float[]> k) => k.Key, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<T, float[]> k) => k.Value));
		}
		foreach (KeyValuePair<int, Dictionary<T, float[]>> item in inConfig)
		{
			if (!newConfig.ContainsKey(item.Key))
			{
				newConfig[item.Key] = item.Value;
				continue;
			}
			foreach (KeyValuePair<T, float[]> item2 in item.Value)
			{
				if (!newConfig[item.Key].ContainsKey(item2.Key))
				{
					newConfig[item.Key][item2.Key] = item2.Value;
				}
			}
		}
	}

	protected void resolveGroupsForName(List<string> groupNames, string name)
	{
		foreach (KeyValuePair<string, List<string>> group in groups)
		{
			if (!groupNames.Contains(group.Key) && group.Value.Contains(name))
			{
				groupNames.Add(group.Key);
				resolveGroupsForName(groupNames, group.Key);
			}
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(2)]
	protected void fillWorldLevels<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1 })] Dictionary<int, T> config)
	{
		if (config == null)
		{
			return;
		}
		T value = default;
		int num = -1;
		for (int i = 0; i <= CreatureLevelControl.defaultWorldLevelDays.Length; i++)
		{
			if (config.TryGetValue(i, out var value2))
			{
				value = value2;
				if (num == -1)
				{
					num = i;
				}
			}
			else if (num != -1)
			{
				config[i] = value;
			}
		}
		for (int j = 0; j < num; j++)
		{
			config[j] = config[num];
		}
	}

	[PublicAPI]
	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })]
	protected static Dictionary<string, object> castDictToStringDict([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })] Dictionary<object, object> dict)
	{
		return new Dictionary<string, object>(dict.ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<object, object> kv) => kv.Key.ToString(), [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (KeyValuePair<object, object> kv) => kv.Value), StringComparer.CurrentCultureIgnoreCase);
	}

	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	protected Section section(Section parent, string key)
	{
		object obj = parent.Get(key);
		if (obj is Dictionary<object, object> dict)
		{
			return new Section(castDictToStringDict(dict), key, parent, this);
		}
		if (obj != null)
		{
			configWarnings.Add($"Expected a section containing further configuration values, got {obj.GetType()} for {parent.Path}.{key}");
		}
		return null;
	}

	public void Parse(object configObj)
	{
		if (configObj is Dictionary<object, object> dict)
		{
			Dictionary<string, object> dictionary = castDictToStringDict(dict);
			foreach (KeyValuePair<string, object> item2 in dictionary)
			{
				if (item2.Key == "groups")
				{
					if (item2.Value is Dictionary<object, object> dictionary2)
					{
						foreach (KeyValuePair<object, object> item3 in dictionary2)
						{
							string text = item3.Key.ToString();
							List<string> source;
							if (item3.Value is string item)
							{
								source = new List<string> { item };
							}
							else
							{
								if (!(item3.Value is List<object> source2))
								{
									configErrors.Add("groups." + text + " contains an invalid value (" + (item3.Value?.GetType().Name ?? "null") + ")");
									continue;
								}
								source = source2.Where([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (object s) => s != null).Cast<string>().ToList();
							}
							groups[text.ToLower()] = source.Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (string s) => s.ToLower()).ToList();
						}
					}
					else
					{
						configErrors.Add("groups must contain a mapping from group to a list of group or creature names");
					}
				}
				else
				{
					Section section = this.section(new Section(dictionary, "", null, this), item2.Key);
					if (section != null)
					{
						ParsePrimarySection(section);
						section.Dispose();
						continue;
					}
					configErrors.Add("All top-level keys must be a mapping. Got unexpected " + (item2.Value?.GetType().ToString() ?? "null") + " for key '" + item2.Key + "'.");
				}
			}
		}
		Verify();
	}

	protected virtual void Verify()
	{
	}

	protected abstract void ParsePrimarySection(Section primarySection);

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private bool parseScalar<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] string input, out T output) where T : struct
	{
		if (typeof(int) == typeof(T))
		{
			if (int.TryParse(input, out var result))
			{
				output = (T)(object)result;
				return true;
			}
		}
		else if (typeof(float) == typeof(T))
		{
			if (float.TryParse(input, NumberStyles.Float, CultureInfo.InvariantCulture, out var result2))
			{
				output = (T)(object)result2;
				return true;
			}
		}
		else if (typeof(bool) == typeof(T) || typeof(T) == typeof(ItemConfig.Teleportable))
		{
			string[] source = new string[12]
			{
				"0", "false", "off", "no", "nope", "nah", "-", "hell no", "pls dont", "lol no",
				"certainly not", "absolutely not"
			};
			string[] source2 = new string[14]
			{
				"1", "true", "on", "yes", "yep", "yeah", "+", "hell yeah", "ok", "okay",
				"k", "yaaas", "certainly", "absolutely"
			};
			if (Enumerable.Contains(source, input.ToLower()))
			{
				output = ((typeof(ItemConfig.Teleportable) == typeof(T)) ? ((T)(object)default(ItemConfig.Teleportable)) : ((T)(object)false));
				return true;
			}
			if (Enumerable.Contains(source2, input.ToLower()))
			{
				output = ((typeof(ItemConfig.Teleportable) == typeof(T)) ? ((T)(object)new ItemConfig.Teleportable
				{
					amount = int.MaxValue
				}) : ((T)(object)true));
				return true;
			}
		}
		output = default;
		return false;
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	protected bool ParseScalarFromObject<T>(ref T target, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Section sect, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] string key) where T : struct
	{
		T? target2 = null;
		if (ParseScalarFromObject(ref target2, sect, key))
		{
			target = target2.Value;
			return true;
		}
		return false;
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	protected bool ParseScalarFromObject<T>(ref T? target, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] Section sect, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] string key) where T : struct
	{
		object obj = sect.Get(key);
		if (obj != null)
		{
			if (obj is string input && parseScalar<T>(input, out var output))
			{
				target = output;
				return true;
			}
			configErrors.Add(sect.Path + "." + key + " is not a " + typeof(T).Name + " describing a " + key + " multiplier");
		}
		return false;
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private bool parseStructFromDict<T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })] Dictionary<object, object> input, out T output, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] string path) where T : struct
	{
		output = default;
		if (!typeof(T).IsPrimitive && !typeof(T).IsEnum)
		{
			HashSet<string> hashSet = new HashSet<string>();
			FieldInfo[] fields = typeof(T).GetFields();
			foreach (FieldInfo fieldInfo in fields)
			{
				if (!input.TryGetValue(fieldInfo.Name, out var value))
				{
					continue;
				}
				hashSet.Add(fieldInfo.Name);
				object[] array;
				if (fieldInfo.FieldType.IsPrimitive || fieldInfo.FieldType.IsEnum)
				{
					array = new object[2] { value, null };
					if (!(bool)typeof(ConfigFile).GetMethod("parseScalar", BindingFlags.Instance | BindingFlags.NonPublic).MakeGenericMethod(fieldInfo.FieldType).Invoke(this, array))
					{
						configErrors.Add(path + "." + fieldInfo.Name + " is not " + fieldInfo.FieldType.Name);
						continue;
					}
				}
				else
				{
					array = new object[3]
					{
						value,
						null,
						path + "." + fieldInfo.FieldType.Name
					};
					typeof(ConfigFile).GetMethod("parseStructFromDict", BindingFlags.Instance | BindingFlags.NonPublic).MakeGenericMethod(fieldInfo.FieldType).Invoke(this, array);
				}
				fieldInfo.SetValue(output, array[1]);
			}
			foreach (object key in input.Keys)
			{
				if (!hashSet.Contains(key))
				{
					configErrors.Add(string.Format("{0} contains invalid key '{1}'. Allowed keys are {2}.", path, key, string.Join(", ", from f in typeof(T).GetFields()
						select f.Name)));
				}
			}
			return true;
		}
		return false;
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(2)]
	[PublicAPI]
	protected float[] ParseProbabilityMap([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] string path, object value)
	{
		if (value is List<object> list)
		{
			float[] array = new float[list.Count];
			for (int i = 0; i < list.Count; i++)
			{
				if (list[i] is string s && float.TryParse(s, NumberStyles.Float, CultureInfo.InvariantCulture, out var result))
				{
					array[i] = result;
				}
				else
				{
					configErrors.Add($"{path}[{i}] is not a float denoting a probability");
				}
			}
			return array;
		}
		return null;
	}

	protected bool ParseWorldlevelToSingleScalar<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)] T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 0 })] ref Dictionary<int, T?> target, Section sect, string key) where T : struct
	{
		string name = typeof(T).Name;
		object obj = sect.Get(key);
		if (obj != null)
		{
			T output;
			if (obj.ToString().ToLower() == "default")
			{
				target = Enumerable.Repeat<T?>(null, CreatureLevelControl.defaultWorldLevelDays.Length + 1).Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (T? v, int i) => new { v, i }).ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.i, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.v);
			}
			else if (obj is string input && parseScalar<T>(input, out output))
			{
				target = Enumerable.Repeat((T?)output, CreatureLevelControl.defaultWorldLevelDays.Length + 1).Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (T? v, int i) => new { v, i }).ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.i, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.v);
			}
			else if (obj is Dictionary<object, object> dictionary)
			{
				target = new Dictionary<int, T?>();
				bool flag = true;
				foreach (KeyValuePair<object, object> item in dictionary)
				{
					if (int.TryParse(item.Key.ToString(), out var result))
					{
						if (item.Value?.ToString().ToLower() == "default")
						{
							target[result] = null;
						}
						else if (item.Value is string input2 && parseScalar<T>(input2, out output))
						{
							target[result] = output;
						}
						else if (item.Value is Dictionary<object, object> input3 && parseStructFromDict<T>(input3, out output, $"{sect.Path}.{key}.{result}"))
						{
							target[result] = output;
						}
						else
						{
							configErrors.Add(string.Format("{0}.{1}.{2} is not 'default' nor {3}", new object[4] { sect.Path, key, result, name }));
						}
					}
					else
					{
						if (!flag && !typeof(T).IsPrimitive && !typeof(T).IsEnum && parseStructFromDict<T>(dictionary, out output, sect.Path + "." + key))
						{
							target = Enumerable.Repeat((T?)output, CreatureLevelControl.defaultWorldLevelDays.Length + 1).Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (T? v, int i) => new { v, i }).ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.i, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.v);
							break;
						}
						configErrors.Add($"{sect.Path}.{key} contains a non-integer key {item.Key}");
					}
					flag = false;
				}
			}
			else
			{
				configErrors.Add(sect.Path + "." + key + " is not 'default', " + name + " nor Map");
			}
		}
		return target != null;
	}

	protected bool ParseWorldlevelToFloatMap([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] ref Dictionary<int, float[]> target, Section sect, string key)
	{
		object obj = sect.Get(key);
		if (obj != null)
		{
			int result;
			float result2;
			if (obj.ToString().ToLower() == "default")
			{
				target = Enumerable.Repeat<float[]>(null, CreatureLevelControl.defaultWorldLevelDays.Length + 1).Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (float[] v, int i) => new { v, i }).ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.i, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.v);
			}
			else if (key == "stars" && obj is string s && int.TryParse(s, out result))
			{
				float[] element;
				if (sect.dictKey != "sector")
				{
					element = ((result <= 0) ? Array.Empty<float>() : Enumerable.Repeat(0f, result - 1).Concat(new float[1] { 100f }).ToArray());
				}
				else
				{
					element = ((result < 0) ? Array.Empty<float>() : new float[1] { -result });
				}
				target = Enumerable.Repeat(element, CreatureLevelControl.defaultWorldLevelDays.Length + 1).Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (float[] v, int i) => new { v, i }).ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.i, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.v);
			}
			else if (key != "stars" && obj is string s2 && float.TryParse(s2, NumberStyles.Float, CultureInfo.InvariantCulture, out result2))
			{
				target = Enumerable.Repeat(new float[1] { result2 }, CreatureLevelControl.defaultWorldLevelDays.Length + 1).Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (float[] v, int i) => new { v, i }).ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.i, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.v);
			}
			else
			{
				float[] array = ParseProbabilityMap(sect.Path + "." + key, obj);
				if (array != null)
				{
					target = Enumerable.Repeat(array, CreatureLevelControl.defaultWorldLevelDays.Length + 1).Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (float[] v, int i) => new { v, i }).ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.i, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.v);
				}
				else if (obj is Dictionary<object, object> dictionary)
				{
					target = new Dictionary<int, float[]>();
					foreach (KeyValuePair<object, object> item in dictionary)
					{
						if (int.TryParse(item.Key.ToString(), out var result3))
						{
							if (item.Value?.ToString().ToLower() == "default")
							{
								target[result3] = null;
								continue;
							}
							if (key == "stars" && item.Value is string s3 && int.TryParse(s3, out result))
							{
								if (sect.dictKey != "sector")
								{
									target[result3] = ((result <= 0) ? Array.Empty<float>() : Enumerable.Repeat(0f, result - 1).Concat(new float[1] { 100f }).ToArray());
								}
								else
								{
									target[result3] = ((result < 0) ? Array.Empty<float>() : new float[1] { -result });
								}
								continue;
							}
							if (key != "stars" && item.Value is string s4 && float.TryParse(s4, NumberStyles.Float, CultureInfo.InvariantCulture, out var result4))
							{
								target[result3] = new float[1] { result4 };
								continue;
							}
							float[] array2 = ParseProbabilityMap($"{sect.Path}.{key}.{result3}", item.Value);
							if (array2 != null)
							{
								target[result3] = array2;
								continue;
							}
							configErrors.Add(string.Format("{0}.{1}.{2} is not 'default', {3} nor List", new object[4]
							{
								sect.Path,
								key,
								result3,
								(key == "stars") ? "integer" : "float"
							}));
						}
						else
						{
							configErrors.Add($"{sect.Path}.{key} contains a non-integer key {item.Key}");
						}
					}
				}
				else
				{
					configErrors.Add(sect.Path + "." + key + " is not 'default', " + ((key == "stars") ? "integer" : "float") + " nor List nor Map");
				}
			}
		}
		return target != null;
	}

	protected bool ParseEnumConfig<[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)] T>([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 0, 2 })] ref Dictionary<int, Dictionary<T, float[]>> target, Section sect, string key) where T : struct, IConvertible
	{
		List<T> allEnumValues = ((T[])Enum.GetValues(typeof(T))).Where([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (T t) => t.ToInt32(CultureInfo.InvariantCulture) != 0).ToList();
		object obj = sect.Get(key);
		if (obj != null)
		{
			if (obj.ToString().ToLower() == "default")
			{
				target = Enumerable.Repeat(allEnumValues.ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (T k) => k, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (T _) => (float[])null), CreatureLevelControl.defaultWorldLevelDays.Length + 1).Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (Dictionary<T, float[]> v, int i) => new { v, i }).ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.i, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.v);
			}
			else if (obj is string text)
			{
				if (float.TryParse(text, NumberStyles.Float, CultureInfo.InvariantCulture, out var result))
				{
					target = Enumerable.Repeat(defaultEntryFromProbability(result), CreatureLevelControl.defaultWorldLevelDays.Length + 1).Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (Dictionary<T, float[]> v, int i) => new { v, i }).ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.i, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.v);
				}
				else if (typeof(T) != typeof(CreatureLevelControl.ModifyDamage))
				{
					ParseResult<T> parseResult = ParseEnum(text);
					if (parseResult.error == null)
					{
						target = Enumerable.Repeat(new Dictionary<T, float[]> { 
						{
							parseResult.value,
							new float[1] { 100f }
						} }, CreatureLevelControl.defaultWorldLevelDays.Length + 1).Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (Dictionary<T, float[]> v, int i) => new { v, i }).ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.i, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.v);
					}
					else
					{
						configErrors.Add(sect.Path + "." + key + " contains invalid value " + text + ", expecting default, float, " + parseResult.error + " or dictionary");
					}
				}
			}
			else
			{
				if (typeof(T) == typeof(CreatureLevelControl.ModifyDamage))
				{
					float[] array = ParseProbabilityMap(sect.Path + "." + key, obj);
					if (array != null)
					{
						target = Enumerable.Repeat(new Dictionary<T, float[]> { 
						{
							(T)(object)CreatureLevelControl.ModifyDamage.All,
							array
						} }, CreatureLevelControl.defaultWorldLevelDays.Length + 1).Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (Dictionary<T, float[]> v, int i) => new { v, i }).ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.i, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (k) => k.v);
						goto IL_06e0;
					}
				}
				if (obj is Dictionary<object, object> dictionary)
				{
					target = new Dictionary<int, Dictionary<T, float[]>>();
					if (dictionary.Count > 0)
					{
						if (int.TryParse(dictionary.Keys.First().ToString(), out var _))
						{
							foreach (KeyValuePair<object, object> item in dictionary)
							{
								if (int.TryParse(item.Key.ToString(), out var result3))
								{
									float result4;
									if (item.Value?.ToString().ToLower() == "default")
									{
										target[result3] = allEnumValues.ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (T k) => k, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (T _) => (float[])null);
									}
									else if (item.Value is string s && float.TryParse(s, NumberStyles.Float, CultureInfo.InvariantCulture, out result4))
									{
										target[result3] = defaultEntryFromProbability(result4);
									}
									else if (item.Value is Dictionary<object, object> affixes)
									{
										target[result3] = ParseAffixProbabilities($"{sect.Path}.{key}[{result3}]", affixes);
									}
									else
									{
										configErrors.Add($"{sect.Path}.{key}[{result3}] is not a mapping from affix names to probabilities");
									}
								}
								else
								{
									configErrors.Add(sect.Path + "." + key + " contains mixed world levels and affix names");
								}
							}
						}
						else
						{
							Dictionary<T, float[]> value = ParseAffixProbabilities(sect.Path + "." + key, dictionary);
							for (int num = 0; num <= CreatureLevelControl.defaultWorldLevelDays.Length; num++)
							{
								target[num] = value;
							}
						}
					}
				}
				else
				{
					configErrors.Add(sect.Path + "." + key + " is not integer" + ((typeof(T) == typeof(CreatureLevelControl.ModifyDamage)) ? ", List" : "") + ", 'default' nor Map");
				}
			}
		}
		goto IL_06e0;
		IL_06e0:
		return target != null;
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
		[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0, 2 })]
		Dictionary<T, float[]> ParseAffixProbabilities([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] string path, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })] Dictionary<object, object> dictionary2)
		{
			Dictionary<T, float[]> affixProbabilities = new Dictionary<T, float[]>();
			bool hasOther = false;
			float[] otherValue = null;
			foreach (KeyValuePair<object, object> item2 in dictionary2)
			{
				bool isOther = item2.Key.ToString().ToLower() == "other";
				ParseResult<T> result5 = ParseEnum(item2.Key.ToString());
				if (isOther || result5.error == null)
				{
					float result6;
					if (item2.Value?.ToString().ToLower() == "default")
					{
						assign(null);
					}
					else if (item2.Value is string s2 && float.TryParse(s2, NumberStyles.Float, CultureInfo.InvariantCulture, out result6))
					{
						assign(new float[1] { result6 });
					}
					else
					{
						float[] array2 = ParseProbabilityMap($"{path}.{item2.Key}", item2.Value);
						if (array2 != null)
						{
							assign(array2);
						}
						else
						{
							configErrors.Add(string.Format("{0}.{1} (value '{2}') is not a float or list of floats denoting probabilities", path, item2.Key, (item2.Value is string) ? item2.Value : (item2.Value?.GetType().Name ?? "null")));
						}
					}
				}
				else
				{
					configErrors.Add($"{path} contains unexpected affix key {item2.Key}, expecting either other, {result5.error}");
				}
				[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
				void assign([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)] float[] probabilityArray)
				{
					if (isOther)
					{
						hasOther = true;
						otherValue = probabilityArray;
					}
					else
					{
						affixProbabilities[result5.value] = probabilityArray;
					}
				}
			}
			if (hasOther)
			{
				int undefinedValueCount = allEnumValues.Count - affixProbabilities.Count;
				if (otherValue != null && undefinedValueCount > 0)
				{
					otherValue = otherValue.Select((float p) => p / (float)undefinedValueCount).ToArray();
				}
				foreach (T item3 in allEnumValues)
				{
					if (!affixProbabilities.ContainsKey(item3))
					{
						affixProbabilities[item3] = otherValue;
					}
				}
			}
			return affixProbabilities;
		}
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
		ParseResult<T> ParseEnum([_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)] string name)
		{
			T result5;
			return Enum.TryParse<T>(name, ignoreCase: true, out result5) ? new ParseResult<T>
			{
				value = result5
			} : new ParseResult<T>
			{
				error = string.Join(", ", allEnumValues.Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (T t) => t.ToString()))
			};
		}
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
		[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 0, 2 })]
		Dictionary<T, float[]> defaultEntryFromProbability(float probability)
		{
			return (typeof(T) == typeof(CreatureLevelControl.ModifyDamage)) ? new Dictionary<T, float[]> { 
			{
				(T)(object)CreatureLevelControl.ModifyDamage.All,
				new float[1] { probability }
			} } : allEnumValues.ToDictionary([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (T k) => k, [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (T _) => new float[1] { probability });
		}
	}
}
