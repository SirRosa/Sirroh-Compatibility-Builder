using System.Collections.Generic;
using Husbandry.Config;
using Husbandry.Util;
using UnityEngine;

namespace Husbandry.Herd;

internal static class Shoving
{
	internal const float Every = 0.5f;

	private static float _next;

	private static readonly Dictionary<long, bool> Known = new Dictionary<long, bool>();

	internal static int Phased { get; private set; }

	internal static int Solid { get; private set; }

	internal static int Sweeps { get; private set; }

	internal static bool Wanted
	{
		get
		{
			if (HusbandryConfig.Shoving != null)
			{
				return !HusbandryConfig.Shoving.Value;
			}
			return true;
		}
	}

	internal static void ResetForTests()
	{
		Phased = 0;
		Solid = 0;
		Sweeps = 0;
		_next = 0f;
		Known.Clear();
	}

	internal static long Pair(int one, int two)
	{
		int num = ((one < two) ? one : two);
		int num2 = ((one < two) ? two : one);
		return ((long)num << 32) ^ (uint)num2;
	}

	internal static void Tick(float now)
	{
		if (now < _next)
		{
			return;
		}
		_next = now + 0.5f;
		if (!Wanted)
		{
			if (Known.Count > 0)
			{
				Restore();
			}
		}
		else
		{
			Sweep();
		}
	}

	private static void Restore()
	{
		List<Character> allCharacters = Character.GetAllCharacters();
		if (allCharacters == null)
		{
			Known.Clear();
			return;
		}
		List<Character> list = new List<Character>();
		List<Character> list2 = new List<Character>();
		foreach (Character item in allCharacters)
		{
			if (!((Object)(object)item == (Object)null))
			{
				if (item.IsPlayer())
				{
					list.Add(item);
				}
				else if (item.IsTamed())
				{
					list2.Add(item);
				}
			}
		}
		foreach (Character item2 in list2)
		{
			CapsuleCollider collider = item2.GetCollider();
			if ((Object)(object)collider == (Object)null)
			{
				continue;
			}
			foreach (Character item3 in list)
			{
				CapsuleCollider collider2 = item3.GetCollider();
				if (!((Object)(object)collider2 == (Object)null))
				{
					Set((Collider)(object)collider, (Collider)(object)collider2, phase: false);
				}
			}
		}
		Known.Clear();
	}

	private static void Sweep()
	{
		List<Character> allCharacters = Character.GetAllCharacters();
		if (allCharacters == null)
		{
			return;
		}
		Sweeps++;
		List<Character> list = new List<Character>();
		List<Character> list2 = new List<Character>();
		foreach (Character item in allCharacters)
		{
			if (!((Object)(object)item == (Object)null))
			{
				if (item.IsPlayer())
				{
					list.Add(item);
				}
				else if (item.IsTamed())
				{
					list2.Add(item);
				}
			}
		}
		if (list.Count == 0 || list2.Count == 0)
		{
			return;
		}
		foreach (Character item2 in list2)
		{
			CapsuleCollider collider = item2.GetCollider();
			if ((Object)(object)collider == (Object)null)
			{
				continue;
			}
			bool phase = Bumping.Phased(tamed: true, IsSolid(item2));
			foreach (Character item3 in list)
			{
				CapsuleCollider collider2 = item3.GetCollider();
				if (!((Object)(object)collider2 == (Object)null))
				{
					Set((Collider)(object)collider, (Collider)(object)collider2, phase);
				}
			}
		}
	}

	private static void Set(Collider beast, Collider person, bool phase)
	{
		long key = Pair(((Object)beast).GetInstanceID(), ((Object)person).GetInstanceID());
		if (!Known.TryGetValue(key, out var value) || value != phase)
		{
			Physics.IgnoreCollision(beast, person, phase);
			Known[key] = phase;
			if (phase)
			{
				Phased++;
			}
			else
			{
				Solid++;
			}
		}
	}

	internal static bool IsSolid(Character beast)
	{
		ZNetView val = (((Object)(object)beast == (Object)null) ? null : ((Component)beast).GetComponent<ZNetView>());
		if ((Object)(object)val == (Object)null || !val.IsValid())
		{
			return false;
		}
		return val.GetZDO().GetBool(StringExtensionMethods.GetStableHashCode("husbandry_solid"), false);
	}

	internal static bool Toggle(Character beast)
	{
		if ((Object)(object)beast == (Object)null || !Bumping.Mine(beast.IsTamed()))
		{
			return false;
		}
		ZNetView component = ((Component)beast).GetComponent<ZNetView>();
		if ((Object)(object)component == (Object)null || !component.IsValid())
		{
			return false;
		}
		component.ClaimOwnership();
		bool flag = Bumping.Toggled(tamed: true, IsSolid(beast));
		component.GetZDO().Set(StringExtensionMethods.GetStableHashCode("husbandry_solid"), flag);
		Known.Clear();
		Sweep();
		Log.Debug("Husbandry: " + beast.m_name + " " + Bumping.Plain(flag));
		return true;
	}
}
