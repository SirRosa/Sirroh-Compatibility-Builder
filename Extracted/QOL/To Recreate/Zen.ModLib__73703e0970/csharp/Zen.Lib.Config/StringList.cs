using System;
using System.Collections.Generic;
using System.Linq;
using BepInEx.Configuration;
using HarmonyLib;
using Jotunn.Configs;
using Zen.Compatibility;

namespace Zen.Lib.Config;

public class StringList : List<string>
{
	private const char ElementSeparator = ',';

	private const char FieldSeparator = ':';

	internal static readonly Tally AccessCount;

	private List<string[]>? _listCache;

	private HashSet<string>? _hashCache;

	private Dictionary<string, string>? _dictCache;

	public static StringList Empty => new StringList();

	public void ClearCache()
	{
		_dictCache = null;
		_listCache = null;
		_hashCache = null;
	}

	public StringList()
	{
	}

	public StringList(IEnumerable<string> collection)
		: base(collection)
	{
	}

	public StringList(IDictionary<string, string> dictionary)
		: this(FromDictionary(dictionary))
	{
	}

	public static StringList Parse(string? str)
	{
		if (str == null)
		{
			return Empty;
		}
		return new StringList(from s in str.Split(new char[1] { ',' }, StringSplitOptions.RemoveEmptyEntries)
			select s.Trim());
	}

	public static StringList FromDictionary<TKey, TValue>(IDictionary<TKey, TValue> dictionary)
	{
		return new StringList(dictionary.Select((KeyValuePair<TKey, TValue> kvp) => $"{kvp.Key}{':'}{kvp.Value}"));
	}

	static StringList()
	{
		AccessCount = new Tally();
		AddToTomlTypeConverter();
	}

	private static void AddToTomlTypeConverter()
	{
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0062: Expected Obj, but got Unknown
		if (!TomlTypeConverter.CanConvert(typeof(StringList)))
		{
			TypeConverter val = new TypeConverter
			{
				ConvertToString = (object obj, Type _) => ((StringList)obj).ToString(),
				ConvertToObject = (string str, Type _) =>
				{
					CheckPerformance(str);
					return Parse(str);
				}
			};
			TomlTypeConverter.AddConverter(typeof(StringList), val);
			Logging<ModLib>.Info("StringList added to TomlTypeConverter");
		}
	}

	private static void CheckPerformance(string s)
	{
		int value = ModLib.Configs.ConfigThrashWarningLimit.Value;
		if (value > 0 && !string.IsNullOrEmpty(s))
		{
			if (!ConfigurationManager.IsDisplayingWindow())
			{
				AccessCount[s]++;
			}
			if (AccessCount[s] > value)
			{
				Logging<ModLib>.Warning("Possible performance issue. (ConfigWatcher maybe?) " + $"ConvertToObject access count {AccessCount[s]} > {value}: \"{s}\"");
			}
		}
	}

	private IEnumerable<string[]> Split(char splitChar, bool trim = true)
	{
		if (_listCache != null)
		{
			return _listCache;
		}
		_listCache = new List<string[]>();
		using (List<string>.Enumerator enumerator = GetEnumerator())
		{
			while (enumerator.MoveNext())
			{
				string[] array = enumerator.Current.Split(new char[1] { splitChar });
				if (trim)
				{
					array = array.Select((string s) => s.Trim()).ToArray();
				}
				_listCache.Add(array);
			}
		}
		return _listCache;
	}

	public bool Contains(string key, bool unique = true)
	{
		if (!unique)
		{
			return base.Contains(key);
		}
		if (_hashCache == null)
		{
			HashSet<string> hashSet = new HashSet<string>();
			using (List<string>.Enumerator enumerator = GetEnumerator())
			{
				while (enumerator.MoveNext())
				{
					string current = enumerator.Current;
					hashSet.Add(current);
				}
			}
			_hashCache = hashSet;
		}
		return _hashCache.Contains(key);
	}

	public Dictionary<string, string> ToDictionary(char splitChar = ':')
	{
		if (_dictCache != null)
		{
			return _dictCache;
		}
		try
		{
			_dictCache = Split(splitChar).ToDictionary((string[] pair) => pair[0], (string[] pair) => pair[1]);
			return _dictCache;
		}
		catch (Exception ex)
		{
			Logging<ModLib>.Error($"Unable to parse dictionary. {ex.Message} {this}", 0);
		}
		return new Dictionary<string, string>();
	}

	public Requirement[] ToRequirements(char splitChar = ':')
	{
		return ((IEnumerable<RequirementConfig>)ToRequirementConfigs(splitChar)).Select((Func<RequirementConfig, Requirement>)((RequirementConfig config) =>
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			//IL_0020: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Expected Obj, but got Unknown
			return new Requirement
			{
				m_resItem = ObjectDB.instance.GetItemPrefab(config.Item).GetComponent<ItemDrop>(),
				m_amount = config.Amount,
				m_amountPerLevel = config.AmountPerLevel,
				m_recover = config.Recover
			};
		})).ToArray();
	}

	public RequirementConfig[] ToRequirementConfigs(char splitChar = ':')
	{
		try
		{
			return Split(splitChar).Select((Func<string[], RequirementConfig>)((string[] element) =>
			{
				//IL_002d: Unknown result type (might be due to invalid IL or missing references)
				//IL_0033: Expected Obj, but got Unknown
				return new RequirementConfig(element[0], int.Parse(element[1]), (element.Length > 2) ? int.Parse(element[2]) : 0, element.Length <= 3 || bool.Parse(element[3]));
			})).ToArray();
		}
		catch (Exception ex)
		{
			Logging<ModLib>.Error($"Unable to parse requirements. {ex.Message} {this}", 0);
		}
		return Array.Empty<RequirementConfig>();
	}

	public override string ToString()
	{
		return GeneralExtensions.Join<string>(this.Select((string s) => s.Trim()), (Func<string, string>)null, string.Format("{0}{1}", ',', " "));
	}
}
