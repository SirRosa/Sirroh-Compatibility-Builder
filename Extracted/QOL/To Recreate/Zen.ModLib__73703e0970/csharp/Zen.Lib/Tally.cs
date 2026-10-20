using System.Collections.Generic;
using System.Linq;

namespace Zen.Lib;

public class Tally : Tally<string>
{
}
public class Tally<T> : Dictionary<T, int> where T : notnull
{
	public new int this[T key]
	{
		get
		{
			if (!TryGetValue(key, out var value))
			{
				return 0;
			}
			return value;
		}
		set
		{
			base[key] = value;
		}
	}

	public HashSet<T> Diff(Tally<T>? other, IEqualityComparer<KeyValuePair<T, int>>? comparer = null)
	{
		HashSet<T> hashSet;
		if (other == null)
		{
			hashSet = new HashSet<T>();
			{
				foreach (T key in Keys)
				{
					hashSet.Add(key);
				}
				return hashSet;
			}
		}
		IEnumerable<KeyValuePair<T, int>> first = this.Except(other, comparer);
		IEnumerable<KeyValuePair<T, int>> second = other.Except(this, comparer);
		hashSet = new HashSet<T>();
		foreach (T item in from item in first.Union(second, comparer)
			select item.Key)
		{
			hashSet.Add(item);
		}
		return hashSet;
	}

	public IEnumerable<(T Key, int Amount)> Sorted()
	{
		return this.OrderByDescending((KeyValuePair<T, int> pair) =>
		{
			KeyValuePair<T, int> keyValuePair = pair;
			return keyValuePair.Value;
		}).Select((KeyValuePair<T, int> pair) =>
		{
			KeyValuePair<T, int> keyValuePair = pair;
			T key = keyValuePair.Key;
			keyValuePair = pair;
			return (Key: key, Value: keyValuePair.Value);
		});
	}
}
