using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Helpers;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal static class ReadOnlyCollectionExtensions
{
	public static IReadOnlyList<T> AsReadonlyList<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] T>(this List<T> list)
	{
		return list;
	}

	public static IReadOnlyDictionary<TKey, TValue> AsReadonlyDictionary<TKey, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] TValue>(this Dictionary<TKey, TValue> dictionary)
	{
		return dictionary;
	}
}
