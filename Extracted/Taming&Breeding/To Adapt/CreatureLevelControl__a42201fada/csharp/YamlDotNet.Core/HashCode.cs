using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
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

	public static int CombineHashCodes(object first, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 1, 2 })] params object[] others)
	{
		int num = GetHashCode(first);
		foreach (object o in others)
		{
			num = CombineHashCodes(num, o);
		}
		return num;
	}

	private static int GetHashCode(object obj)
	{
		return obj?.GetHashCode() ?? 0;
	}
}
