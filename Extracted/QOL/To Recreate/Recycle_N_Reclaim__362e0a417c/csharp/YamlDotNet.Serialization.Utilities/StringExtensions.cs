using System;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;

namespace YamlDotNet.Serialization.Utilities;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal static class StringExtensions
{
	private static string ToCamelOrPascalCase(string str, Func<char, char> firstLetterTransform)
	{
		string text = Regex.Replace(str, "([_\\-])(?<char>[a-z])", [_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)] (Match match) => match.Groups["char"].Value.ToUpperInvariant(), RegexOptions.IgnoreCase);
		return firstLetterTransform(text[0]) + text.Substring(1);
	}

	public static string ToCamelCase(this string str)
	{
		return ToCamelOrPascalCase(str, char.ToLowerInvariant);
	}

	public static string ToPascalCase(this string str)
	{
		return ToCamelOrPascalCase(str, char.ToUpperInvariant);
	}

	public static string FromCamelCase(this string str, string separator)
	{
		str = char.ToLower(str[0]) + str.Substring(1);
		str = Regex.Replace(str.ToCamelCase(), "(?<char>[A-Z])", [_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)] (Match match) => separator + match.Groups["char"].Value.ToLowerInvariant());
		return str;
	}
}
