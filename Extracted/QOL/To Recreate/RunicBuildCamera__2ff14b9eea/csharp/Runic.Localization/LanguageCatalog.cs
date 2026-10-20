using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Runtime.Serialization.Json;
using System.Text;

namespace Runic.Localization;

internal sealed class LanguageCatalog
{
	private readonly Dictionary<string, string> _english;

	private Dictionary<string, string> _selected = new Dictionary<string, string>();

	private readonly Func<string, string> _read;

	private string _language;

	internal LanguageCatalog(string english, Func<string, string> read)
	{
		_english = Parse(english);
		_read = read;
	}

	internal static Dictionary<string, string> Parse(string json)
	{
		if (string.IsNullOrWhiteSpace(json))
		{
			return new Dictionary<string, string>();
		}
		if (json.Length > 2097152)
		{
			throw new InvalidDataException("Language file exceeds 2 MiB.");
		}
		DataContractJsonSerializer dataContractJsonSerializer = new DataContractJsonSerializer(typeof(Dictionary<string, string>), new DataContractJsonSerializerSettings
		{
			UseSimpleDictionaryFormat = true
		});
		using MemoryStream stream = new MemoryStream(Encoding.UTF8.GetBytes(json.TrimStart('\ufeff')));
		return ((Dictionary<string, string>)dataContractJsonSerializer.ReadObject(stream)) ?? new Dictionary<string, string>();
	}

	internal void Select(string language)
	{
		language = (string.IsNullOrWhiteSpace(language) ? "English" : language);
		if (string.Equals(language, _language, StringComparison.Ordinal))
		{
			return;
		}
		_language = language;
		_selected = new Dictionary<string, string>();
		if (language.IndexOfAny(new char[4] { '/', '\\', ':', '\0' }) >= 0 || language == "." || language == "..")
		{
			return;
		}
		try
		{
			_selected = Parse(_read(language));
		}
		catch (Exception)
		{
		}
	}

	internal string Get(string key)
	{
		_english.TryGetValue(key, out var value);
		if (_selected.TryGetValue(key, out var value2) && !string.IsNullOrWhiteSpace(value2) && (value == null || SameFields(value, value2)))
		{
			return value2;
		}
		return value ?? key;
	}

	internal string English(string key)
	{
		if (!_english.TryGetValue(key, out var value))
		{
			return key;
		}
		return value;
	}

	internal string TranslateEnglish(string text)
	{
		foreach (KeyValuePair<string, string> item in _english)
		{
			if (item.Value == text)
			{
				return Get(item.Key);
			}
		}
		return text;
	}

	internal string Format(string key, params object[] args)
	{
		_english.TryGetValue(key, out var value);
		string text = Get(key);
		if (value != null && !SameFields(value, text))
		{
			text = value;
		}
		try
		{
			return string.Format(CultureInfo.CurrentCulture, text, args);
		}
		catch (FormatException)
		{
			try
			{
				return string.Format(CultureInfo.CurrentCulture, value ?? key, args);
			}
			catch (FormatException)
			{
				return value ?? key;
			}
		}
	}

	private static bool SameFields(string a, string b)
	{
		try
		{
			return Fields(a).SetEquals(Fields(b));
		}
		catch (FormatException)
		{
			return false;
		}
	}

	private static HashSet<int> Fields(string text)
	{
		HashSet<int> hashSet = new HashSet<int>();
		for (int i = 0; i < text.Length; i++)
		{
			if (text[i] == '}')
			{
				if (i + 1 >= text.Length || text[i + 1] != '}')
				{
					throw new FormatException();
				}
				i++;
			}
			else
			{
				if (text[i] != '{')
				{
					continue;
				}
				if (i + 1 < text.Length && text[i + 1] == '{')
				{
					i++;
					continue;
				}
				int num = ++i;
				for (; i < text.Length && char.IsDigit(text[i]); i++)
				{
				}
				if (num == i || !int.TryParse(text.Substring(num, i - num), out var result))
				{
					throw new FormatException();
				}
				hashSet.Add(result);
				for (; i < text.Length && text[i] != '}'; i++)
				{
					if (text[i] == '{')
					{
						throw new FormatException();
					}
				}
				if (i == text.Length)
				{
					throw new FormatException();
				}
			}
		}
		return hashSet;
	}
}
