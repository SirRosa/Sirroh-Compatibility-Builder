using System.Collections.Generic;

namespace Husbandry.Offline;

internal sealed class Courtship
{
	private readonly Dictionary<ZDOID, float> _last = new Dictionary<ZDOID, float>();

	internal int Count => _last.Count;

	internal void Clear()
	{
		_last.Clear();
	}

	internal bool Ready(ZDOID id, float now, float interval)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		if (!_last.TryGetValue(id, out var value))
		{
			return true;
		}
		return now - value >= interval;
	}

	internal void Courted(ZDOID id, float now)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		_last[id] = now;
	}

	internal int Forget(float now, float after)
	{
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		//IL_005e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0066: Unknown result type (might be due to invalid IL or missing references)
		List<ZDOID> list = new List<ZDOID>();
		foreach (KeyValuePair<ZDOID, float> item in _last)
		{
			if (now - item.Value > after)
			{
				list.Add(item.Key);
			}
		}
		foreach (ZDOID item2 in list)
		{
			_last.Remove(item2);
		}
		return list.Count;
	}
}
