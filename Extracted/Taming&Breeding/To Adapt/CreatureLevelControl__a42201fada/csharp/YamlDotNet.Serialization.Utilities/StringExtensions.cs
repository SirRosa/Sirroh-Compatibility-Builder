using System;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;

namespace YamlDotNet.Serialization.Utilities;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal static class StringExtensions
{
	private static string ToCamelOrPascalCase(string str, Func<char, char> firstLetterTransform)
	{
		string text = Regex.Replace(str, "([_\\-])(?<char>[a-z])", [_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (Match match) => match.Groups["char"].Value.ToUpperInvariant(), RegexOptions.IgnoreCase);
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
		str = Regex.Replace(str.ToCamelCase(), "(?<char>[A-Z])", [_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (Match match) => separator + match.Groups["char"].Value.ToLowerInvariant());
		return str;
	}
}
