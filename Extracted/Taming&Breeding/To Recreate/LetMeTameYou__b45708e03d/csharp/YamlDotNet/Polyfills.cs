using System.Runtime.CompilerServices;

namespace YamlDotNet;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal static class Polyfills
{
	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	internal static bool Contains(this string source, char c)
	{
		return source.IndexOf(c) != -1;
	}

	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	internal static bool EndsWith(this string source, char c)
	{
		if (source.Length > 0)
		{
			return source[source.Length - 1] == c;
		}
		return false;
	}

	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	internal static bool StartsWith(this string source, char c)
	{
		if (source.Length > 0)
		{
			return source[0] == c;
		}
		return false;
	}
}
