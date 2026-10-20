using System;
using System.Collections.Generic;
using HarmonyLib;
using UnityEngine;

namespace LongshipUpgrades;

internal static class ItemNameTokens
{
	[HarmonyPatch(typeof(Player), "Load")]
	private static class Player_Load_UpdateRegisters
	{
		private static void Prefix()
		{
			UpdateRegisters();
		}
	}

	private static readonly Dictionary<string, string> itemNames = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);

	private static readonly Dictionary<string, GameObject> itemPrefabs = new Dictionary<string, GameObject>(StringComparer.OrdinalIgnoreCase);

	private static readonly Dictionary<string, string> craftingStationNames = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);

	internal static void UpdateRegisters()
	{
		if (!Object.op_Implicit((Object)(object)ObjectDB.instance))
		{
			return;
		}
		itemNames.Clear();
		itemPrefabs.Clear();
		craftingStationNames.Clear();
		ItemDrop val = default;
		foreach (GameObject item in ObjectDB.instance.m_items)
		{
			if (Object.op_Implicit((Object)(object)item) && item.TryGetComponent<ItemDrop>(ref val))
			{
				SharedData val2 = val.m_itemData?.m_shared;
				if (val2 != null && !string.IsNullOrWhiteSpace(val2.m_name))
				{
					RegisterItem(((Object)item).name, val2.m_name, item);
				}
			}
		}
		foreach (Recipe recipe in ObjectDB.instance.m_recipes)
		{
			RegisterCraftingStation(recipe?.m_craftingStation);
			RegisterCraftingStation(recipe?.m_repairStation);
		}
		if (!Object.op_Implicit((Object)(object)ZNetScene.instance))
		{
			return;
		}
		foreach (GameObject prefab in ZNetScene.instance.m_prefabs)
		{
			if (Object.op_Implicit((Object)(object)prefab))
			{
				CraftingStation componentInChildren = prefab.GetComponentInChildren<CraftingStation>(true);
				if (Object.op_Implicit((Object)(object)componentInChildren))
				{
					RegisterCraftingStation(componentInChildren, ((Object)prefab).name);
				}
			}
		}
	}

	private static void RegisterItem(string prefabName, string itemNameToken, GameObject prefab)
	{
		if (!string.IsNullOrWhiteSpace(prefabName) && !string.IsNullOrWhiteSpace(itemNameToken) && Object.op_Implicit((Object)(object)prefab))
		{
			itemNames[prefabName] = itemNameToken;
			itemNames[itemNameToken] = itemNameToken;
			itemPrefabs[prefabName] = prefab;
			itemPrefabs[itemNameToken] = prefab;
		}
	}

	private static void RegisterCraftingStation(CraftingStation station, string prefabName = null)
	{
		if (Object.op_Implicit((Object)(object)station) && !string.IsNullOrWhiteSpace(station.m_name))
		{
			string text = station.m_name.Trim();
			craftingStationNames[text] = text;
			string text2 = (string.IsNullOrWhiteSpace(prefabName) ? Utils.GetPrefabName(((Object)((Component)station).gameObject).name) : Utils.GetPrefabName(prefabName));
			if (!string.IsNullOrWhiteSpace(text2))
			{
				craftingStationNames[text2] = text;
			}
		}
	}

	internal static string GetItemName(this string input)
	{
		string text = input?.Trim() ?? string.Empty;
		string value;
		return itemNames.TryGetValue(text, out value) ? value : text;
	}

	internal static bool TryGetItemPrefab(string input, out GameObject prefab)
	{
		string key = input?.Trim() ?? string.Empty;
		if (itemPrefabs.Count == 0)
		{
			UpdateRegisters();
		}
		if (itemPrefabs.TryGetValue(key, out prefab) && Object.op_Implicit((Object)(object)prefab))
		{
			return true;
		}
		UpdateRegisters();
		if (itemPrefabs.TryGetValue(key, out prefab) && Object.op_Implicit((Object)(object)prefab))
		{
			return true;
		}
		prefab = null;
		return false;
	}

	internal static string GetCraftingStationName(this string input)
	{
		string text = input?.Trim() ?? string.Empty;
		if (string.IsNullOrWhiteSpace(text))
		{
			return string.Empty;
		}
		if (craftingStationNames.Count == 0)
		{
			UpdateRegisters();
		}
		if (craftingStationNames.TryGetValue(text, out var value))
		{
			return value;
		}
		UpdateRegisters();
		return craftingStationNames.TryGetValue(text, out value) ? value : text;
	}
}
