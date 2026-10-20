using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace Zen.Lib;

public static class LocalizationExt
{
	internal static void RemoveRichTextTags(this Localization instance)
	{
		Logging<ModLib>.Info("Applying configs to remove rich text tags from translations");
		List<string> list = new List<string>();
		Dictionary<string, string> translations = instance.m_translations;
		foreach (var (text, text2) in translations.AsTuple())
		{
			if (IsMatch(text) && text2.Contains("<") && text2.Contains(">"))
			{
				list.Add(text);
			}
		}
		foreach (string item in list)
		{
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(18, 1, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Tags removed from ");
				msg.AppendFormatted(item);
			}
			Logging<ModLib>.Info(msg);
			translations[item] = StringExtensionMethods.RemoveRichTextTags(translations[item]);
		}
		static bool IsMatch(string input)
		{
			return ModLib.Configs.RemoveRichTextFromTranslations.Value.Any((string key) => Regex.Match(input, key).Success);
		}
	}
}
