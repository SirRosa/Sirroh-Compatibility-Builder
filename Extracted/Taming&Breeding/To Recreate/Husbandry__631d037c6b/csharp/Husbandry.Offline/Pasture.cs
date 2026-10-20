using System.Collections.Generic;
using UnityEngine;

namespace Husbandry.Offline;

internal static class Pasture
{
	internal struct Cursor
	{
		internal int Prefab;

		internal int Index;

		internal int Passes;
	}

	internal const int Slice = 128;

	internal static Cursor Next(Cursor at, int prefabCount)
	{
		if (prefabCount <= 0)
		{
			return default;
		}
		int num = at.Prefab + 1;
		int num2 = at.Passes;
		if (num >= prefabCount)
		{
			num = 0;
			num2++;
		}
		return new Cursor
		{
			Prefab = num,
			Index = 0,
			Passes = num2
		};
	}

	internal static Cursor Continued(Cursor at, int reached)
	{
		return new Cursor
		{
			Prefab = at.Prefab,
			Index = reached,
			Passes = at.Passes
		};
	}

	internal static bool Valid(Cursor at, int prefabCount)
	{
		if (prefabCount > 0 && at.Prefab >= 0 && at.Prefab < prefabCount)
		{
			return at.Index >= 0;
		}
		return false;
	}

	internal static bool Wrapped(Cursor before, Cursor after)
	{
		return after.Passes > before.Passes;
	}

	internal static List<string> Tameables(IEnumerable<GameObject> prefabs)
	{
		List<string> list = new List<string>();
		if (prefabs == null)
		{
			return list;
		}
		foreach (GameObject prefab in prefabs)
		{
			if (!((Object)(object)prefab == (Object)null) && !((Object)(object)prefab.GetComponent<Tameable>() == (Object)null))
			{
				list.Add(((Object)prefab).name);
			}
		}
		return list;
	}
}
