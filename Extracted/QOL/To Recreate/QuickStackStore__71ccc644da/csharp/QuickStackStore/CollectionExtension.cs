using System.Collections.Generic;

namespace QuickStackStore;

public static class CollectionExtension
{
	public static bool XAdd<T>(this HashSet<T> instance, T item)
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
