using System;
using System.Text;
using System.Text.RegularExpressions;
using BepInEx;
using UnityEngine;

namespace Zen.Lib;

public static class StringExt
{
	public static string ToHumanString(this int num)
	{
		if (num >= 1000000)
		{
			if (num >= 1000000000)
			{
				return "∞";
			}
			return $"{Mathf.Round((float)num / 1000000f):0}M";
		}
		if (num >= 10000)
		{
			return $"{Mathf.Round((float)num / 1000f):0}K";
		}
		return num.ToString();
	}

	public static string Truncate(this string? s, int length)
	{
		return ((s != null && s.Length > length) ? s.Substring(0, length) : s) ?? string.Empty;
	}

	public static string Localize(this string? s, params string[] words)
	{
		return Localization.instance.Localize(s ?? string.Empty, words);
	}

	public static string Localize(this string? s)
	{
		return Localization.instance.Localize(s ?? string.Empty);
	}

	public static string ToProperCase(this string? str, bool forceLower = true)
	{
		if (str == null || Utility.IsNullOrWhiteSpace(str))
		{
			return "";
		}
		string text = str[0].ToString().ToUpper();
		string text2 = str.Substring(1);
		return text + (forceLower ? text2.ToLower() : text2);
	}

	public static string RegexPattern(this string? pattern, bool localize = true)
	{
		return pattern.RegexPattern((string s) => s, localize);
	}

	public static string RegexPattern(this string? pattern, Func<string, string> func, bool localize = true)
	{
		return Regex.Escape(func(localize ? pattern.Localize() : (pattern ?? string.Empty)));
	}

	public static string GlyphFix(this string s, bool onlyIfGamepad = true)
	{
		if (!ZInput.IsGamepadActive() && onlyIfGamepad)
		{
			return s;
		}
		return s.Replace("[<color=yellow><b><sprite=", "<sprite=").Replace("\"></b></color>]", "\">");
	}

	public static string Repeat(this string s, int n)
	{
		return new StringBuilder(s.Length * n).Insert(0, s, n).ToString();
	}
}
