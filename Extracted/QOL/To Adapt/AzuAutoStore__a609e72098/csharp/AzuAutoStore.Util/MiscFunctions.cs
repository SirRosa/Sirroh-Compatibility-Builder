using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using UnityEngine;

namespace AzuAutoStore.Util;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public class MiscFunctions
{
	private static bool dataChanged;

	private static void LogResourceInfo(int totalAmount, int totalRequirement, string reqName)
	{
		AzuAutoStorePlugin.AzuAutoStoreLogger.LogDebug((object)$"(ConsumeResourcesPatch) Have {totalAmount}/{totalRequirement} {reqName} in player inventory");
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

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
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

	internal static bool CheckItemSharedIntegrity(ItemData itemData)
	{
		return itemData.m_shared != null;
	}

	internal static void CreatePredefinedGroups(ObjectDB __instance)
	{
		//IL_01bb: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c2: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c5: Unknown result type (might be due to invalid IL or missing references)
		//IL_022b: Expected I4, but got Unknown
		//IL_0239: Unknown result type (might be due to invalid IL or missing references)
		//IL_023e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0240: Unknown result type (might be due to invalid IL or missing references)
		//IL_0243: Unknown result type (might be due to invalid IL or missing references)
		//IL_0281: Expected I4, but got Unknown
		//IL_01a0: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a7: Invalid comparison between Unknown and I4
		foreach (GameObject item in __instance.m_items.Where([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (GameObject x) => (Object)(object)x.GetComponentInChildren<ItemDrop>() != (Object)null))
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
			List<string> list = new List<string>();
			if ((double)sharedData.m_food > 0.0 && (double)sharedData.m_foodStamina > 0.0)
			{
				list.Add("Food");
			}
			if ((Object)(object)sharedData.m_consumeStatusEffect != (Object)null)
			{
				if (((double)sharedData.m_food > 0.0 && (double)sharedData.m_foodStamina == 0.0) || ((Object)sharedData.m_consumeStatusEffect).name.ToLower().Contains("potion") || sharedData.m_consumeStatusEffect.m_name.ToLower().Contains("potion") || sharedData.m_consumeStatusEffect.m_category.ToLower().Contains("potion") || sharedData.m_ammoType.ToLower().Contains("mead"))
				{
					list.Add("Potion");
				}
				else if ((int)sharedData.m_itemType == 21)
				{
					list.Add("Fish");
				}
			}
			ItemType itemType = sharedData.m_itemType;
			switch (itemType - 1)
			{
			case 2:
			case 3:
			case 13:
			case 21:
			{
				bool flag = true;
				SkillType skillType = sharedData.m_skillType;
				switch (skillType - 1)
				{
				case 0:
					list.Add("Swords");
					break;
				case 7:
					list.Add("Bows");
					break;
				case 13:
					list.Add("Crossbows");
					break;
				case 6:
					list.Add("Axes");
					break;
				case 2:
					list.Add("Clubs");
					break;
				case 1:
					list.Add("Knives");
					break;
				case 11:
					list.Add("Pickaxes");
					break;
				case 3:
					list.Add("Polearms");
					break;
				case 4:
					list.Add("Spears");
					break;
				case 8:
					list.Add("ElementalMagic");
					break;
				case 9:
					list.Add("BloodMagic");
					break;
				default:
					flag = false;
					break;
				}
				if (flag)
				{
					list.Add("Weapons");
				}
				break;
			}
			case 4:
				list.Add("Shield");
				list.Add(((double)sharedData.m_timedBlockBonus > 0.0) ? "Round Shield" : "Tower Shield");
				break;
			case 5:
				list.AddRange(new _003C_003Ez__ReadOnlyArray<string>(new string[2] { "Armor", "Helmet" }));
				break;
			case 6:
				list.AddRange(new _003C_003Ez__ReadOnlyArray<string>(new string[2] { "Armor", "Chest" }));
				break;
			case 10:
				list.AddRange(new _003C_003Ez__ReadOnlyArray<string>(new string[2] { "Armor", "Legs" }));
				break;
			case 16:
				list.AddRange(new _003C_003Ez__ReadOnlyArray<string>(new string[2] { "Armor", "Shoulder" }));
				break;
			case 17:
				list.AddRange(new _003C_003Ez__ReadOnlySingleElementList<string>("Utility"));
				break;
			case 23:
				list.AddRange(new _003C_003Ez__ReadOnlySingleElementList<string>("Trinket"));
				break;
			case 8:
			{
				string ammoType = sharedData.m_ammoType;
				if (ammoType != "$ammo_bolts")
				{
					if (ammoType == "$ammo_arrows")
					{
						list.Add("Arrows");
					}
				}
				else
				{
					list.Add("Bolts");
				}
				list.Add("Ammo");
				break;
			}
			case 14:
			case 18:
				list.Add("Equipment");
				break;
			case 12:
			{
				string[] source = new string[6] { "eikthyr", "elder", "bonemass", "dragonqueen", "goblinking", "SeekerQueen" };
				list.Add(source.Any(sharedData.m_name.EndsWith) ? "Boss Trophy" : "Trophy");
				break;
			}
			case 0:
			{
				GameObject val = ObjectDB.instance.GetItemPrefab("Cultivator").GetComponent<ItemDrop>().m_itemData.m_shared.m_buildPieces.m_pieces.FirstOrDefault([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (GameObject p) =>
				{
					Requirement[] resources = p.GetComponent<Piece>().m_resources;
					return resources.Length == 1 && resources[0].m_resItem.m_itemData.m_shared.m_name == sharedData.m_name;
				});
				if (val != null)
				{
					Plant component = val.GetComponent<Plant>();
					list.Add((component != null && component.m_grownPrefabs[0].GetComponent<Pickable>()?.m_amount > 1) ? "Crops" : "Seeds");
				}
				if (ZNetScene.instance.GetPrefab("smelter").GetComponent<Smelter>().m_conversion.Any([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemConversion c) => c.m_from.m_itemData.m_shared.m_name == sharedData.m_name))
				{
					list.Add("Ores");
				}
				if (ZNetScene.instance.GetPrefab("smelter").GetComponent<Smelter>().m_conversion.Any([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemConversion c) => c.m_to.m_itemData.m_shared.m_name == sharedData.m_name))
				{
					list.Add("Metals");
				}
				if (ZNetScene.instance.GetPrefab("blastfurnace").GetComponent<Smelter>().m_conversion.Any([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemConversion c) => c.m_from.m_itemData.m_shared.m_name == sharedData.m_name))
				{
					list.Add("Ores");
				}
				if (ZNetScene.instance.GetPrefab("blastfurnace").GetComponent<Smelter>().m_conversion.Any([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemConversion c) => c.m_to.m_itemData.m_shared.m_name == sharedData.m_name))
				{
					list.Add("Metals");
				}
				if (ZNetScene.instance.GetPrefab("charcoal_kiln").GetComponent<Smelter>().m_conversion.Any([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemConversion c) => c.m_from.m_itemData.m_shared.m_name == sharedData.m_name))
				{
					list.Add("Woods");
				}
				if (sharedData.m_name == "$item_elderbark")
				{
					list.Add("Woods");
				}
				break;
			}
			}
			foreach (string item2 in list)
			{
				if (!string.IsNullOrEmpty(item2))
				{
					AddItemToGroup(item2, componentInChildren);
				}
			}
			if (sharedData != null)
			{
				AddItemToGroup("All", componentInChildren);
			}
		}
		SaveGroupsToFile();
	}

	private static void AddItemToGroup([_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)] string groupName, ItemDrop itemDrop)
	{
		if (!GroupUtils.GroupExists(groupName))
		{
			AzuAutoStorePlugin.groups[groupName] = new HashSet<string>();
		}
		string prefabName = Utils.GetPrefabName(itemDrop.m_itemData.m_dropPrefab);
		if (!AzuAutoStorePlugin.groups[groupName].Contains(prefabName))
		{
			AzuAutoStorePlugin.groups[groupName].Add(prefabName);
			AzuAutoStorePlugin.AzuAutoStoreLogger.LogDebug((object)("(CreatePredefinedGroups) Added " + prefabName + " to " + groupName));
		}
	}

	private static void SaveGroupsToFile()
	{
		if (!dataChanged)
		{
			return;
		}
		using StreamWriter streamWriter = new StreamWriter(Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location) ?? string.Empty, "AzuAutoStore_PredefinedGroups.txt"), append: false);
		foreach (string item in AzuAutoStorePlugin.groups.Keys.OrderBy([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (string x) => x))
		{
			streamWriter.WriteLine(item);
			if (item == null)
			{
				continue;
			}
			foreach (string item2 in AzuAutoStorePlugin.groups[item].OrderBy([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (string x) => x))
			{
				streamWriter.WriteLine("\t" + item2);
			}
		}
		dataChanged = false;
	}
}
