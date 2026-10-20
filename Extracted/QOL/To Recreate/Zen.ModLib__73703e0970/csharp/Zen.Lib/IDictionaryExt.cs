using System.Collections.Generic;

namespace Zen.Lib;

public static class IDictionaryExt
{
	public static void AddToList<TKey, TValue, TList>(this IDictionary<TKey, TList> dict, TKey key, TValue value) where TList : ICollection<TValue>, new()
	{
		if (!dict.TryGetValue(key, out TList value2))
		{
			value2 = (dict[key] = new TList());
		}
		value2.Add(value);
	}
}
