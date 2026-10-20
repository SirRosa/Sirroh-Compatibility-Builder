using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using UnityEngine;

namespace Recycle_N_Reclaim.YAMLStuff;

[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
public class GroupUtils
{
	public static List<string> GetExcludedGroups(string container)
	{
		if (Recycle_N_ReclaimPlugin.yamlData.Containers.TryGetValue(container, out var value))
		{
			return value.Exclude.Where([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (string excludeItem) => Recycle_N_ReclaimPlugin.yamlData.Groups.ContainsKey(excludeItem)).ToList();
		}
		return new List<string>();
	}

	public static bool IsGroupDefined(string groupName)
	{
		return Recycle_N_ReclaimPlugin.yamlData.Groups.ContainsKey(groupName);
	}

	public static bool GroupExists(string groupName)
	{
		return Recycle_N_ReclaimPlugin.yamlData.Groups.ContainsKey(groupName);
	}

	public static List<string> GetAllGroups()
	{
		return Recycle_N_ReclaimPlugin.yamlData.Groups.Keys.ToList();
	}

	public static List<string> GetItemsInGroup(string groupName)
	{
		if (Recycle_N_ReclaimPlugin.yamlData.Groups.TryGetValue(groupName, out var value))
		{
			return value.ToList();
		}
		return new List<string>();
	}

	public static string GetPrefabName(string name)
	{
		char[] anyOf = new char[2] { '(', ' ' };
		int num = name.IndexOfAny(anyOf);
		if (num >= 0)
		{
			return name.Substring(0, num);
		}
		return name;
	}

	[return: _003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(2)]
	internal static GameObject GetItemPrefabFromGameObject(ItemDrop itemDropComponent, GameObject inputGameObject)
	{
		GameObject itemPrefab = ObjectDB.instance.GetItemPrefab(GetPrefabName(((Object)inputGameObject).name));
		itemDropComponent.m_itemData.m_dropPrefab = itemPrefab;
		if (!((Object)(object)itemPrefab != (Object)null))
		{
			return null;
		}
		return itemPrefab;
	}

	internal static bool CheckItemDropIntegrity(ItemDrop itemDropComp)
	{
		if (itemDropComp.m_itemData == null)
		{
			return false;
		}
		return itemDropComp.m_itemData.m_shared != null;
	}

	internal static void CreatePredefinedGroups(ObjectDB __instance)
	{
		//IL_0101: Unknown result type (might be due to invalid IL or missing references)
		//IL_0108: Invalid comparison between Unknown and I4
		//IL_0117: Unknown result type (might be due to invalid IL or missing references)
		//IL_011c: Unknown result type (might be due to invalid IL or missing references)
		//IL_011e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0121: Unknown result type (might be due to invalid IL or missing references)
		//IL_0183: Expected I4, but got Unknown
		//IL_018e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0193: Unknown result type (might be due to invalid IL or missing references)
		//IL_0195: Unknown result type (might be due to invalid IL or missing references)
		//IL_0198: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d6: Expected I4, but got Unknown
		foreach (GameObject item in __instance.m_items.Where([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (GameObject x) => (Object)(object)x.GetComponentInChildren<ItemDrop>() != (Object)null))
		{
			ItemDrop componentInChildren = item.GetComponentInChildren<ItemDrop>();
			if (!CheckItemDropIntegrity(componentInChildren))
			{
				continue;
			}
			GameObject itemPrefabFromGameObject = GetItemPrefabFromGameObject(componentInChildren, item);
			componentInChildren.m_itemData.m_dropPrefab = ((Component)componentInChildren).gameObject;
			if (!((Object)(object)itemPrefabFromGameObject != (Object)null))
			{
				continue;
			}
			SharedData sharedData = componentInChildren.m_itemData.m_shared;
			string text = "";
			if ((double)sharedData.m_food > 0.0 && (double)sharedData.m_foodStamina > 0.0)
			{
				text = "Food";
			}
			if ((double)sharedData.m_food > 0.0 && (double)sharedData.m_foodStamina == 0.0)
			{
				text = "Potion";
			}
			else if ((int)sharedData.m_itemType == 21)
			{
				text = "Fish";
			}
			ItemType itemType = sharedData.m_itemType;
			switch (itemType - 1)
			{
			case 2:
			case 3:
			case 13:
			case 21:
			{
				SkillType skillType = sharedData.m_skillType;
				switch (skillType - 1)
				{
				case 0:
					text = "Swords";
					break;
				case 7:
					text = "Bows";
					break;
				case 13:
					text = "Crossbows";
					break;
				case 6:
					text = "Axes";
					break;
				case 2:
					text = "Clubs";
					break;
				case 1:
					text = "Knives";
					break;
				case 11:
					text = "Pickaxes";
					break;
				case 3:
					text = "Polearms";
					break;
				case 4:
					text = "Spears";
					break;
				}
				break;
			}
			case 14:
				text = "Equipment";
				break;
			case 12:
				text = (new string[6] { "eikthyr", "elder", "bonemass", "dragonqueen", "goblinking", "SeekerQueen" }.Any(sharedData.m_name.EndsWith) ? "Boss Trophy" : "Trophy");
				break;
			case 0:
			{
				GameObject val = ObjectDB.instance.GetItemPrefab("Cultivator").GetComponent<ItemDrop>().m_itemData.m_shared.m_buildPieces.m_pieces.FirstOrDefault([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (GameObject p) =>
				{
					Requirement[] resources = p.GetComponent<Piece>().m_resources;
					return resources.Length == 1 && resources[0].m_resItem.m_itemData.m_shared.m_name == sharedData.m_name;
				});
				if (val != null)
				{
					Plant component = val.GetComponent<Plant>();
					text = ((component != null && component.m_grownPrefabs[0].GetComponent<Pickable>()?.m_amount > 1) ? "Crops" : "Seeds");
				}
				if (ZNetScene.instance.GetPrefab("smelter").GetComponent<Smelter>().m_conversion.Any([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (ItemConversion c) => c.m_from.m_itemData.m_shared.m_name == sharedData.m_name))
				{
					text = "Ores";
				}
				if (ZNetScene.instance.GetPrefab("smelter").GetComponent<Smelter>().m_conversion.Any([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (ItemConversion c) => c.m_to.m_itemData.m_shared.m_name == sharedData.m_name))
				{
					text = "Metals";
				}
				if (ZNetScene.instance.GetPrefab("blastfurnace").GetComponent<Smelter>().m_conversion.Any([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (ItemConversion c) => c.m_from.m_itemData.m_shared.m_name == sharedData.m_name))
				{
					text = "Ores";
				}
				if (ZNetScene.instance.GetPrefab("blastfurnace").GetComponent<Smelter>().m_conversion.Any([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (ItemConversion c) => c.m_to.m_itemData.m_shared.m_name == sharedData.m_name))
				{
					text = "Metals";
				}
				if (ZNetScene.instance.GetPrefab("charcoal_kiln").GetComponent<Smelter>().m_conversion.Any([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (ItemConversion c) => c.m_from.m_itemData.m_shared.m_name == sharedData.m_name))
				{
					text = "Woods";
				}
				if (sharedData.m_name == "$item_elderbark")
				{
					text = "Woods";
				}
				break;
			}
			case 5:
				text = "Helmets";
				break;
			case 6:
			case 10:
			case 11:
			case 16:
				text = "Armor";
				break;
			case 8:
			case 22:
				text = "Ammunition";
				break;
			case 17:
				text = "Utilities";
				break;
			case 18:
				text = "Tools";
				break;
			case 15:
				text = "Miscellaneous";
				break;
			case 9:
				text = "Customizations";
				break;
			}
			if (!string.IsNullOrEmpty(text))
			{
				AddItemToGroup(text, componentInChildren);
			}
			if (sharedData != null)
			{
				text = "All";
				AddItemToGroup(text, componentInChildren);
			}
		}
	}

	private static void AddItemToGroup(string groupName, ItemDrop itemDrop)
	{
		if (!GroupExists(groupName))
		{
			Recycle_N_ReclaimPlugin.yamlData.Groups[groupName] = new List<string>();
			Recycle_N_ReclaimPlugin.predefinedGroups[groupName] = new HashSet<string>();
		}
		string prefabName = Utils.GetPrefabName(itemDrop.m_itemData.m_dropPrefab);
		if (!Recycle_N_ReclaimPlugin.yamlData.Groups[groupName].Contains(prefabName))
		{
			Recycle_N_ReclaimPlugin.yamlData.Groups[groupName].Add(prefabName);
			Recycle_N_ReclaimPlugin.predefinedGroups[groupName].Add(prefabName);
		}
	}

	public static float? GetRecycleRateOverride(string prefabName)
	{
		Dictionary<string, float> dictionary = Recycle_N_ReclaimPlugin.yamlData?.Reclaiming?.RecycleRates;
		if (dictionary == null || dictionary.Count == 0)
		{
			return null;
		}
		if (dictionary.TryGetValue(prefabName, out var value))
		{
			return Mathf.Clamp01(value);
		}
		foreach (KeyValuePair<string, float> item in dictionary)
		{
			if (Recycle_N_ReclaimPlugin.yamlData.Groups.TryGetValue(item.Key, out var value2) && value2.Contains(prefabName))
			{
				return Mathf.Clamp01(item.Value);
			}
		}
		return null;
	}

	public static bool IsPrefabExcludedInReclaiming(string prefabName)
	{
		return IsPrefabExcludedInEntity(Recycle_N_ReclaimPlugin.yamlData.Reclaiming, prefabName);
	}

	public static bool IsPrefabExcludedInInventory(string prefabName)
	{
		return IsPrefabExcludedInEntity(Recycle_N_ReclaimPlugin.yamlData.Inventory, prefabName);
	}

	public static bool IsPrefabExcludedInContainer(string containerName, string prefabName)
	{
		if (Recycle_N_ReclaimPlugin.yamlData.Containers.TryGetValue(containerName, out var value))
		{
			return IsPrefabExcludedInEntity(value, prefabName);
		}
		return false;
	}

	private static bool IsPrefabExcludedInEntity(object entity, string prefabName)
	{
		bool flag = ((entity is excludeContainer || entity is Reclaiming || entity is Inventory) ? true : false);
		if (!flag)
		{
			throw new ArgumentException("The entity type is not supported.");
		}
		List<string> list = null;
		List<string> list2 = null;
		if (!(entity is excludeContainer excludeContainer2))
		{
			if (!(entity is Reclaiming reclaiming))
			{
				if (entity is Inventory inventory)
				{
					list2 = inventory.Exclude;
					list = inventory.IncludeOverride;
				}
			}
			else
			{
				list = reclaiming.IncludeOverride;
				list2 = reclaiming.Exclude;
			}
		}
		else
		{
			list = excludeContainer2.IncludeOverride;
			list2 = excludeContainer2.Exclude;
		}
		if (list != null)
		{
			foreach (string item in list)
			{
				if (item == prefabName)
				{
					flag = false;
				}
				else
				{
					if (!Recycle_N_ReclaimPlugin.yamlData.Groups.TryGetValue(item, out var value) || !value.Contains(prefabName))
					{
						continue;
					}
					flag = false;
				}
				goto IL_014b;
			}
		}
		if (list2 != null)
		{
			foreach (string item2 in list2)
			{
				if (item2 == prefabName)
				{
					flag = true;
				}
				else
				{
					if (!Recycle_N_ReclaimPlugin.yamlData.Groups.TryGetValue(item2, out var value2) || !value2.Contains(prefabName))
					{
						continue;
					}
					flag = true;
				}
				goto IL_014b;
			}
		}
		return false;
		IL_014b:
		return flag;
	}
}
