using System.Collections.Generic;
using UnityEngine;

namespace Husbandry.Herd;

internal sealed class Census
{
	internal struct Head
	{
		internal int Prefab;

		internal Vector3 Where;

		internal bool Tamed;
	}

	private readonly Dictionary<int, List<Vector3>> _by = new Dictionary<int, List<Vector3>>();

	internal float TakenAt { get; private set; } = float.NegativeInfinity;

	internal int Counted { get; private set; }

	internal int Species => _by.Count;

	internal void Clear()
	{
		_by.Clear();
		Counted = 0;
		TakenAt = float.NegativeInfinity;
	}

	internal bool Stale(float now, float interval)
	{
		return now - TakenAt >= interval;
	}

	internal void Take(IEnumerable<Head> heads, float now)
	{
		//IL_0064: Unknown result type (might be due to invalid IL or missing references)
		_by.Clear();
		Counted = 0;
		TakenAt = now;
		if (heads == null)
		{
			return;
		}
		foreach (Head head in heads)
		{
			if (head.Tamed)
			{
				if (!_by.TryGetValue(head.Prefab, out var value))
				{
					value = new List<Vector3>();
					_by[head.Prefab] = value;
				}
				value.Add(head.Where);
				Counted++;
			}
		}
	}

	internal int Total(int prefab)
	{
		if (!_by.TryGetValue(prefab, out var value))
		{
			return 0;
		}
		return value.Count;
	}

	internal int Within(int prefab, Vector3 point, float radius)
	{
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0046: Unknown result type (might be due to invalid IL or missing references)
		//IL_004c: Unknown result type (might be due to invalid IL or missing references)
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		if (!_by.TryGetValue(prefab, out var value))
		{
			return 0;
		}
		if (radius <= 0f)
		{
			return value.Count;
		}
		float num = radius * radius;
		int num2 = 0;
		foreach (Vector3 item in value)
		{
			float num3 = item.x - point.x;
			float num4 = item.y - point.y;
			float num5 = item.z - point.z;
			if (num3 * num3 + num4 * num4 + num5 * num5 <= num)
			{
				num2++;
			}
		}
		return num2;
	}
}
