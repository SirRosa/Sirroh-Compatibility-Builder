using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal static class _003Ceda05417_002Dc99c_002D442b_002D93de_002De22ef768bacb_003EHashCode
{
	public static int CombineHashCodes(int h1, int h2)
	{
		return ((h1 << 5) + h1) ^ h2;
	}

	public static int CombineHashCodes(int h1, object o2)
	{
		return CombineHashCodes(h1, GetHashCode(o2));
	}

	private static int GetHashCode(object obj)
	{
		return obj?.GetHashCode() ?? 0;
	}
}
