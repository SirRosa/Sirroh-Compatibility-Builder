using System.Collections.Generic;
using UnityEngine;

namespace Husbandry.Herd;

internal sealed class Kinds
{
	internal struct Kind
	{
		internal string Name;

		internal int Hash;

		internal bool Breeds;

		internal float FedDuration;

		internal float PregnancyDuration;

		internal int RequiredLovePoints;

		internal int MaxCreatures;

		internal float TotalCheckRange;

		internal float PartnerCheckRange;

		internal float MaxHealth;
	}

	private readonly Dictionary<int, Kind> _by = new Dictionary<int, Kind>();

	internal int Count => _by.Count;

	internal void Clear()
	{
		_by.Clear();
	}

	internal void Load(IEnumerable<Kind> kinds)
	{
		_by.Clear();
		if (kinds == null)
		{
			return;
		}
		foreach (Kind kind in kinds)
		{
			_by[kind.Hash] = kind;
		}
	}

	internal bool Find(int hash, out Kind kind)
	{
		return _by.TryGetValue(hash, out kind);
	}

	internal static List<Kind> Read(IEnumerable<GameObject> prefabs)
	{
		List<Kind> list = new List<Kind>();
		if (prefabs == null)
		{
			return list;
		}
		foreach (GameObject prefab in prefabs)
		{
			if (!((Object)(object)prefab == (Object)null))
			{
				Tameable component = prefab.GetComponent<Tameable>();
				if (!((Object)(object)component == (Object)null))
				{
					Procreation component2 = prefab.GetComponent<Procreation>();
					Character component3 = prefab.GetComponent<Character>();
					list.Add(new Kind
					{
						Name = ((Object)prefab).name,
						Hash = StringExtensionMethods.GetStableHashCode(((Object)prefab).name),
						Breeds = ((Object)(object)component2 != (Object)null),
						FedDuration = component.m_fedDuration,
						PregnancyDuration = (((Object)(object)component2 == (Object)null) ? 0f : component2.m_pregnancyDuration),
						RequiredLovePoints = ((!((Object)(object)component2 == (Object)null)) ? component2.m_requiredLovePoints : 0),
						MaxCreatures = ((!((Object)(object)component2 == (Object)null)) ? component2.m_maxCreatures : 0),
						TotalCheckRange = (((Object)(object)component2 == (Object)null) ? 0f : component2.m_totalCheckRange),
						PartnerCheckRange = (((Object)(object)component2 == (Object)null) ? 0f : component2.m_partnerCheckRange),
						MaxHealth = (((Object)(object)component3 == (Object)null) ? 0f : component3.m_health)
					});
				}
			}
		}
		return list;
	}
}
