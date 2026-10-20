using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Helpers;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal static class DictionaryExtensions
{
	public static bool TryAdd<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] T, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] V>(this Dictionary<T, V> dictionary, T key, V value)
	{
		if (dictionary.ContainsKey(key))
		{
			return false;
		}
		dictionary.Add(key, value);
		return true;
	}

	public static TValue GetOrAdd<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TKey, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TValue, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TArg>(this ConcurrentDictionary<TKey, TValue> dictionary, TKey key, Func<TKey, TArg, TValue> valueFactory, TArg arg)
	{
		if (dictionary == null)
		{
			throw new ArgumentNullException("dictionary");
		}
		if (key == null)
		{
			throw new ArgumentNullException("key");
		}
		if (valueFactory == null)
		{
			throw new ArgumentNullException("valueFactory");
		}
		TValue value;
		do
		{
			if (dictionary.TryGetValue(key, out value))
			{
				return value;
			}
			value = valueFactory(key, arg);
		}
		while (!dictionary.TryAdd(key, value));
		return value;
	}
}
