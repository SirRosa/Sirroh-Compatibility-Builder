using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Text;
using System.Text.RegularExpressions;
using UnityEngine;
using YamlDotNet.Serialization;

namespace CreatureLevelControl;

[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
public class LocalizationWrapper
{
	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
	public class LocalizedAttribute : DescriptionAttribute
	{
		private readonly object enumValue;

		public override string Description => getEnumTranslation(enumValue);

		public LocalizedAttribute(object enumValue)
		{
			this.enumValue = enumValue;
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	public struct SettingTexts
	{
		[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
		public string display;

		[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(1)]
		public string desc;
	}

	private string language = null;

	public Dictionary<string, string> creatureGender = null;

	public Dictionary<string, string> genderedCreatureTranslations = null;

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 2, 1, 1, 1, 1 })]
	public Dictionary<string, Dictionary<string, string>> genderedTranslations = null;

	public Dictionary<string, string> translations = null;

	public Dictionary<string, Dictionary<string, string>> enumTranslations = null;

	public Dictionary<string, string> settingGroups = null;

	public Dictionary<string, SettingTexts> settings = null;

	private static LocalizationWrapper instance = new LocalizationWrapper();

	[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	private static LocalizationWrapper english;

	public static LocalizationWrapper English => english ?? (english = loadLanguage("English"));

	public static void LoadLanguage(string language)
	{
		instance = loadLanguage(language);
	}

	private static LocalizationWrapper loadLanguage(string language)
	{
		Stream stream = null;
		string? directoryName = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
		char directorySeparatorChar = Path.DirectorySeparatorChar;
		string path = directoryName + directorySeparatorChar + language + ".yml";
		if (File.Exists(path))
		{
			stream = new FileStream(path, FileMode.Open);
		}
		if (stream == null)
		{
			stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("CreatureLevelControl.languages." + language + ".yml");
		}
		if (stream == null)
		{
			return (instance.language == "English") ? instance : loadLanguage("English");
		}
		LocalizationWrapper localizationWrapper = new DeserializerBuilder().Build().Deserialize<LocalizationWrapper>(new StreamReader(stream));
		localizationWrapper.language = language;
		stream.Dispose();
		return localizationWrapper;
	}

	private static string getEnumTranslation(object enumValue)
	{
		return instance.getEnumTranslationInternal(enumValue) ?? enumValue.ToString();
	}

	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	private string getEnumTranslationInternal(object enumValue)
	{
		string name = enumValue.GetType().Name;
		string key = enumValue.ToString();
		if (!enumTranslations.TryGetValue(name, out var value) || !value.TryGetValue(key, out var value2))
		{
			return (this == English) ? null : English.getEnumTranslationInternal(enumValue);
		}
		return value2;
	}

	public static string getCreatureTranslation(string creatureName, string creatureDisplayName, BossAffix? affix = null, CreatureExtraEffect? effect = null, CreatureInfusion? infusion = null)
	{
		return instance.getCreatureTranslationInternal(creatureName, creatureDisplayName, affix, effect, infusion);
	}

	public static string getCreatureTranslationPattern(string creatureName, bool boss)
	{
		return instance.getCreatureTranslationPatternInternal(creatureName, boss);
	}

	private string getCreatureTranslationPatternInternal(string creatureName, bool boss)
	{
		if (!creatureGender.TryGetValue(creatureName, out var gender) && !creatureGender.TryGetValue("default", out gender))
		{
			Debug.LogError((object)("Missing default gender for language " + language));
			return creatureName;
		}
		Dictionary<string, string> dictionary = new Dictionary<string, string> { { "name", "(?<name>\\b.+?\\b)" } };
		if (boss)
		{
			dictionary["effect"] = null;
			dictionary["infusion"] = null;
			dictionary["affix"] = "(?:" + string.Join("|", from affix in Enum.GetNames(typeof(BossAffix))
				select readGenderedTranslation(gender, affix) ?? affix) + ")";
		}
		else
		{
			dictionary["effect"] = "(?:" + string.Join("|", from effect in Enum.GetNames(typeof(CreatureExtraEffect))
				select readGenderedTranslation(gender, effect) ?? effect) + ")";
			dictionary["infusion"] = "(?:" + string.Join("|", from infusion in Enum.GetNames(typeof(CreatureInfusion))
				select readGenderedTranslation(gender, infusion) ?? infusion) + ")";
			dictionary["affix"] = null;
		}
		return getCreatureTranslation(creatureName, dictionary, regex: true);
	}

	private string getCreatureTranslationInternal(string creatureName, string creatureDisplayName, BossAffix? affix, CreatureExtraEffect? effect, CreatureInfusion? infusion)
	{
		Dictionary<string, string> placeholderNames = new Dictionary<string, string>
		{
			{
				"affix",
				(affix == BossAffix.None) ? null : affix?.ToString()
			},
			{
				"effect",
				(effect == CreatureExtraEffect.None) ? null : effect?.ToString()
			},
			{
				"infusion",
				(infusion == CreatureInfusion.None) ? null : infusion?.ToString()
			},
			{ "name", creatureDisplayName }
		};
		return getCreatureTranslation(creatureName, placeholderNames, regex: false);
	}

	private string getCreatureTranslation(string creatureName, [_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(new byte[] { 1, 1, 2 })] Dictionary<string, string> placeholderNames, bool regex)
	{
		if (!creatureGender.TryGetValue(creatureName, out var value) && !creatureGender.TryGetValue("default", out value))
		{
			Debug.LogError((object)("Missing default gender for language " + language));
			return creatureName;
		}
		if (!genderedCreatureTranslations.TryGetValue(value, out var value2))
		{
			Debug.LogError((object)("Missing genderedCreatureTranslation for " + value));
			return creatureName;
		}
		int num = -1;
		int num2 = -1;
		StringBuilder stringBuilder = new StringBuilder();
		for (int i = 0; i < value2.Length; i++)
		{
			if (value2[i] == '{')
			{
				num2 = i + 1;
			}
			else if (num2 != -1)
			{
				if (value2[i] != '}')
				{
					continue;
				}
				string text = value2.Substring(num2, i - num2);
				if (!placeholderNames.TryGetValue(text, out var value3))
				{
					Debug.LogError((object)("Invalid placeholder " + text));
					return creatureName;
				}
				if (value3 != null)
				{
					if (num != -1)
					{
						if (regex)
						{
							stringBuilder.Append('(');
						}
						stringBuilder.Append(value2.Substring(num, num2 - 1 - num));
					}
					stringBuilder.Append(readGenderedTranslation(value, value3) ?? value3);
					num = -1;
				}
				num2 = -1;
			}
			else if (value2[i] == '[')
			{
				num = i + 1;
			}
			else if (value2[i] == ']')
			{
				if (regex && num == -1)
				{
					stringBuilder.Append(")?");
				}
				num = -1;
			}
			else if (num == -1)
			{
				stringBuilder.Append(value2[i]);
			}
		}
		return Regex.Replace(stringBuilder.ToString(), "  +", " ").Trim();
	}

	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	private string readGenderedTranslation(string gender, string textEnglish)
	{
		if (genderedTranslations != null && genderedTranslations.TryGetValue(gender, out var value) && value.TryGetValue(textEnglish, out var value2))
		{
			return value2;
		}
		return translations.TryGetValue(textEnglish, out value2) ? value2 : null;
	}

	public static SettingTexts getSettingTranslation(string textEnglish)
	{
		return instance.SettingTranslation(textEnglish);
	}

	public SettingTexts SettingTranslation(string textEnglish)
	{
		if (!settings.TryGetValue(textEnglish, out var value))
		{
			if (this == English)
			{
				throw new Exception("Missing settings entry in base English language yml for " + textEnglish);
			}
			value = English.SettingTranslation(textEnglish);
		}
		ref string display = ref value.display;
		if (display == null)
		{
			display = textEnglish;
		}
		return value;
	}

	public static string getSettingGroupTranslation(string textEnglish)
	{
		return instance.getSettingGroupTranslationInternal(textEnglish);
	}

	private string getSettingGroupTranslationInternal(string textEnglish)
	{
		if (!settingGroups.TryGetValue(textEnglish, out var value))
		{
			if (this == English)
			{
				throw new Exception("Missing settings group entry in base English language yml for " + textEnglish);
			}
			return English.getSettingGroupTranslationInternal(textEnglish);
		}
		return value;
	}

	public static string getTranslationWithPlaceholders(string baseText, string placeholderName, string placeholderValue)
	{
		return getTranslationWithPlaceholders(baseText, new Dictionary<string, string> { { placeholderName, placeholderValue } });
	}

	public static string getTranslationWithPlaceholders(string baseText, Dictionary<string, string> placeholders)
	{
		return placeholders.Aggregate(getTranslation(baseText), [_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (string s, KeyValuePair<string, string> kv) => s.Replace("{" + kv.Key + "}", kv.Value));
	}

	public static string getTranslation(string textEnglish)
	{
		return instance.getTranslationInternal(textEnglish) ?? textEnglish;
	}

	[return: _003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(2)]
	public string getTranslationInternal(string textEnglish)
	{
		return readGenderedTranslation(creatureGender["default"], textEnglish) ?? ((this == English) ? null : English.getTranslationInternal(textEnglish));
	}
}
