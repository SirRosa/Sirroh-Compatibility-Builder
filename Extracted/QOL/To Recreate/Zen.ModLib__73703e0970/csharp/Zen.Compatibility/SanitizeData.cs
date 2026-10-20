using System.Collections.Generic;
using System.Linq;
using HarmonyLib;
using UnityEngine;
using Zen.Lib;

namespace Zen.Compatibility;

[HarmonyPatch]
internal static class SanitizeData
{
	private static readonly Dictionary<string, ItemDrop> ItemNameToItemDrop = new Dictionary<string, ItemDrop>();

	private const int SuperFirst = 10800;

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Game), "Start")]
	[HarmonyPriority(10800)]
	private static void Game_Start()
	{
		SanitizeItemsAndRecipes("Early - Game Start");
	}

	internal static bool TryGetItemDropFromItemName(string itemName, out ItemDrop itemDrop)
	{
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(32, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Lookup ItemDrop from item name: ");
			msg.AppendFormatted(itemName);
		}
		Logging<ModLib>.Info(msg);
		bool flag = ItemNameToItemDrop.TryGetValue(itemName, out itemDrop);
		if (!flag)
		{
			Logging<ModLib>.Warning("Unable to find ItemDrop for item name: " + itemName);
		}
		return flag;
	}

	internal static void SanitizeItemsAndRecipes(string entry)
	{
		ItemNameToItemDrop.Clear();
		if (!ModLib.Configs.SanitizeData.Value)
		{
			Logging<ModLib>.Warning("Data sanitization is DISABLED in the config settings.");
			return;
		}
		Logging<ModLib>.Message("Sanitizing items and recipes: " + entry);
		foreach (Recipe recipe in ObjectDB.instance.m_recipes)
		{
			ItemDrop item = recipe.m_item;
			if (!Object.op_Implicit((Object)(object)item))
			{
				Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(26, 2, out var shouldAppend);
				if (shouldAppend)
				{
					msg.AppendLiteral("Recipe ");
					msg.AppendFormatted(((Object)recipe).name);
					msg.AppendLiteral(" has no ");
					msg.AppendFormatted("m_item");
					msg.AppendLiteral(". Skipping.");
				}
				Logging<ModLib>.Info(msg);
			}
			else
			{
				ValidateItem("Recipe: " + ((Object)recipe).name, item);
				Requirement[] resources = recipe.m_resources;
				foreach (Requirement val in resources)
				{
					ValidateItem("Recipe: " + ((Object)recipe).name + "/resource", val.m_resItem);
				}
			}
		}
		GameObject[] array = ObjectDB.instance.m_items.ToArray();
		foreach (GameObject val2 in array)
		{
			ItemDrop component = val2.GetComponent<ItemDrop>();
			ValidateItem("ObjectDB.m_items " + ((Object)val2).name, component);
		}
	}

	private static void ValidateItem(string logPrefix, ItemDrop? itemDrop)
	{
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(16, 2, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendFormatted(logPrefix);
			msg.AppendLiteral(" validate item: ");
			ItemDrop? val = itemDrop;
			msg.AppendFormatted(((val != null) ? ((Object)val).name : null) ?? "(null)");
		}
		Logging<ModLib>.Debug(msg);
		if (!Object.op_Implicit((Object)(object)itemDrop))
		{
			if (Logging<ModLib>.IsEnabled)
			{
				Logging<ModLib>.Warning(logPrefix + " missing ItemDrop componenet, skipping validation.");
			}
			return;
		}
		if (!Object.op_Implicit((Object)(object)((Component)itemDrop).gameObject))
		{
			Logging<ModLib>.Error(logPrefix + " malformed, missing GameObject", 0);
			return;
		}
		if (itemDrop.m_itemData == null)
		{
			Logging<ModLib>.Error(logPrefix + " malformed, missing ItemDrop.m_itemData", 0);
			return;
		}
		if (itemDrop.m_itemData.m_shared == null)
		{
			Logging<ModLib>.Error(logPrefix + " malformed, missing ItemData.m_shared", 0);
			return;
		}
		msg = new Logging<ModLib>.InterpolatedString(26, 4, out shouldAppend);
		if (shouldAppend)
		{
			msg.AppendFormatted(logPrefix);
			msg.AppendLiteral(" Validating ");
			msg.AppendFormatted(((Object)itemDrop).name);
			msg.AppendLiteral(" ");
			msg.AppendFormatted(itemDrop.GetName());
			msg.AppendLiteral(" GameObject: ");
			msg.AppendFormatted(((object)((Component)itemDrop).gameObject).GetHashCode(), "x8");
		}
		Logging<ModLib>.Debug(msg);
		int stableHashCode = StringExtensionMethods.GetStableHashCode(((Object)itemDrop).name);
		msg = new Logging<ModLib>.InterpolatedString(35, 1, out shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Adding item name to prefab lookup: ");
			msg.AppendFormatted(itemDrop.GetName());
		}
		Logging<ModLib>.Debug(msg);
		ItemNameToItemDrop[itemDrop.GetName()] = itemDrop;
		if (!ObjectDB.instance.m_items.Contains(((Component)itemDrop).gameObject))
		{
			Logging<ModLib>.Warning(((Object)itemDrop).name + " Possibly missing from ObjectDB, verifying...");
			if (ObjectDB.instance.m_itemByHash.TryGetValue(stableHashCode, out var _))
			{
				Logging<ModLib>.Warning(((Object)itemDrop).name + " is missing from ObjectDB, but found in ObjectDB.m_itemByHash index, ignoring");
			}
			else if (ObjectDB.instance.m_items.Any((GameObject p) => ((Object)p).name == ((Object)itemDrop).name))
			{
				Logging<ModLib>.Warning(((Object)itemDrop).name + " is missing from ObjectDB, adding it");
				ObjectDB.instance.m_items.Add(((Component)itemDrop).gameObject);
			}
			else
			{
				Logging<ModLib>.Warning(((Object)itemDrop).name + " is already in ObjectDB but it is not this instance of GameObject");
			}
		}
		if (!ObjectDB.instance.m_itemByHash.ContainsKey(stableHashCode))
		{
			Logging<ModLib>.Warning(((Object)itemDrop).name + " is not in index: ObjectDB.m_itemByHash, fixing");
			ObjectDB.instance.m_itemByHash[stableHashCode] = ((Component)itemDrop).gameObject;
		}
		SharedData shared = itemDrop.m_itemData.m_shared;
		if (shared == null)
		{
			Logging<ModLib>.Error(((Object)itemDrop).name + " is missing ItemData.m_shared", 0);
		}
		else if (!ObjectDB.instance.m_itemByData.ContainsKey(shared))
		{
			Logging<ModLib>.Warning(((Object)itemDrop).name + " is not in index: ObjectDB.m_itemByData, fixing");
			ObjectDB.instance.m_itemByData[shared] = ((Component)itemDrop).gameObject;
		}
		if (!Object.op_Implicit((Object)(object)itemDrop.m_itemData.m_dropPrefab))
		{
			msg = new Logging<ModLib>.InterpolatedString(28, 3, out shouldAppend);
			if (shouldAppend)
			{
				msg.AppendFormatted(((Object)itemDrop).name);
				msg.AppendLiteral(" missing ");
				msg.AppendFormatted("ItemData");
				msg.AppendLiteral(".");
				msg.AppendFormatted("m_dropPrefab");
				msg.AppendLiteral(", trying to fix...");
			}
			Logging<ModLib>.Info(msg);
			FixMissingDropPrefab(itemDrop);
		}
	}

	private static void FixMissingDropPrefab(ItemDrop itemDrop)
	{
		Logging<ModLib>.Info("Trying shared data index lookup...");
		if (ObjectDB.instance.m_itemByData.TryGetValue(itemDrop.m_itemData.m_shared, out var value))
		{
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(26, 1, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Found shared data, fixed: ");
				msg.AppendFormatted(((Object)value).name);
			}
			Logging<ModLib>.Info(msg);
			itemDrop.m_itemData.m_dropPrefab = value;
			return;
		}
		Logging<ModLib>.Warning("Unable to find prefab in shared data lookup, trying lookup by name...");
		List<GameObject> list = ObjectDB.instance.m_items.Where((GameObject p) => ((Object)p).name == ((Object)itemDrop).name).ToList();
		if (list.Count > 1)
		{
			Logging<ModLib>.Warning("Multiple prefabs found for " + ((Object)itemDrop).name + ", using first.");
		}
		GameObject val = list.FirstOrDefault();
		if (Object.op_Implicit((Object)(object)val))
		{
			Logging<ModLib>.Warning("Found prefab by name, fixed.");
			itemDrop.m_itemData.m_dropPrefab = val;
		}
		else
		{
			Logging<ModLib>.Error("Unable to find item prefab for item: " + ((Object)itemDrop).name, 0);
		}
	}
}
