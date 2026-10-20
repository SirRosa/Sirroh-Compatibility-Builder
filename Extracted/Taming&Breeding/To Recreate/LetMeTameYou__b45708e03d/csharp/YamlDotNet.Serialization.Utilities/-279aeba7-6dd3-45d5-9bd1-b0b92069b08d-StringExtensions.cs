using System;
using System.Globalization;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;

namespace YamlDotNet.Serialization.Utilities;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal static class _003C279aeba7_002D6dd3_002D45d5_002D9bd1_002Db0b92069b08d_003EStringExtensions
{
	private static string ToCamelOrPascalCase(string str, Func<char, char> firstLetterTransform)
	{
		string text = Regex.Replace(str, "([_\\-])(?<char>[a-z])", [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (Match match) => match.Groups["char"].Value.ToUpperInvariant(), RegexOptions.IgnoreCase);
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
		str = char.ToLower(str[0], CultureInfo.InvariantCulture) + str.Substring(1);
		str = Regex.Replace(ToCamelCase(str), "(?<char>[A-Z])", [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (Match match) => separator + match.Groups["char"].Value.ToLowerInvariant());
		return str;
	}
}
