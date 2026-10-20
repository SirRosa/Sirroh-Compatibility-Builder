using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace Zen.Lib;

public static class IEnumerableExt
{
	public static IEnumerable<(TKey Key, TValue Value)> AsTuple<TKey, TValue>(this Dictionary<TKey, TValue> self) where TKey : notnull
	{
		return self.Select((KeyValuePair<TKey, TValue> kvp) => (Key: kvp.Key, Value: kvp.Value));
	}

	public static IEnumerable<(T Item, int Index)> WithIndex<T>(this IEnumerable<T> self)
	{
		return self.Select((T obj, int index) => (obj: obj, index: index));
	}

	public static IEnumerable<T> InRangeXZ<T>(this IEnumerable<T> list, Vector3 position, float range) where T : Component
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		return list.Where((T p) =>
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			return position.DistanceToXZ(((Component)p).transform.position) < range;
		});
	}

	public static IEnumerable<T> InRange<T>(this IEnumerable<T> list, Vector3 position, float range) where T : Component
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		return list.Where((T p) =>
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0011: Unknown result type (might be due to invalid IL or missing references)
			return position.DistanceToSqr(((Component)p).transform.position) < range * range;
		});
	}

	public static IEnumerable<T> WhereNot<T>(this IEnumerable<T> source, Func<T, bool> predicate)
	{
		return source.Where((T x) => !predicate(x));
	}
}
