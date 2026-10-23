using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace AzuAutoStore.Patches.Favoriting;

public static class CollectionExtension
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	public static bool XAdd<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)] T>(this HashSet<T> instance, T item)
	{
		if (instance.Contains(item))
		{
			instance.Remove(item);
			return false;
		}
		instance.Add(item);
		return true;
	}
}
