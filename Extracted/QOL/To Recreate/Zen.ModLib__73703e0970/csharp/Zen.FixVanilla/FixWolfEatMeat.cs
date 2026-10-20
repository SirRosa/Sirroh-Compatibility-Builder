using UnityEngine;
using Zen.Lib;

namespace Zen.FixVanilla;

internal static class FixWolfEatMeat
{
	private const string WolfPrefabName = "Wolf";

	public static void InitPrefab()
	{
		MonsterAI monster = default;
		if (!GlobalStatic.TryGetPrefab("Wolf", out GameObject prefab, useCache: false) || !prefab.TryGetComponent<MonsterAI>(ref monster))
		{
			return;
		}
		foreach (string item in ModLib.Configs.FixWolfEatMeats.Value)
		{
			monster.AddFood(item);
		}
	}

	private static void AddFood(this MonsterAI monster, string foodID)
	{
		ItemDrop prefab = GlobalStatic.GetPrefab<ItemDrop>(foodID, false);
		if (!monster.m_consumeItems.Contains(prefab))
		{
			monster.m_consumeItems.Add(prefab);
		}
	}
}
