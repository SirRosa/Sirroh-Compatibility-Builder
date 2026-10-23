using System.Runtime.CompilerServices;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Helper;

public static class ConditionalWeakTableExtension
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	public static void TryAdd<TKey, TValue>(this ConditionalWeakTable<TKey, TValue> table, TKey key, ConditionalWeakTable<TKey, TValue>.CreateValueCallback createCallback) where TKey : class where TValue : class
	{
		table.GetValue(key, createCallback);
	}
}
