using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Helpers;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal static class ReadOnlyCollectionExtensions
{
	public static IReadOnlyList<T> AsReadonlyList<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] T>(this List<T> list)
	{
		return list;
	}

	public static IReadOnlyDictionary<TKey, TValue> AsReadonlyDictionary<TKey, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] TValue>(this Dictionary<TKey, TValue> dictionary)
	{
		return dictionary;
	}
}
