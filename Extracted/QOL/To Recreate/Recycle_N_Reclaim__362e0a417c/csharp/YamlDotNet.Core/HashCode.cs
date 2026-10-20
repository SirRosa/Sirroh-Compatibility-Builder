using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
internal static class HashCode
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
