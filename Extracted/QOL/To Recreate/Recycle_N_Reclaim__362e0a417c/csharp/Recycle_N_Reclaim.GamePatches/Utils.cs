using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using EpicLootAPI;
using Jewelcrafting;
using Recycle_N_Reclaim.YAMLStuff;
using UnityEngine;

namespace Recycle_N_Reclaim.GamePatches;

[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
public static class Utils
{
	public static Texture2D LoadTextureFromResources(string pathName, string folderName = "Assets")
	{
		//IL_004c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0052: Expected Obj, but got Unknown
		//IL_0054: Unknown result type (might be due to invalid IL or missing references)
		//IL_005a: Expected Obj, but got Unknown
		Stream manifestResourceStream = typeof(Recycle_N_ReclaimPlugin).Assembly.GetManifestResourceStream(typeof(Recycle_N_ReclaimPlugin).Namespace + "." + folderName + "." + pathName);
		Texture2D val = new Texture2D(2, 2);
		Texture2D result = new Texture2D(2, 2);
		if (manifestResourceStream == null)
		{
			return result;
		}
		byte[] array;
		using (BinaryReader binaryReader = new BinaryReader(manifestResourceStream))
		{
			array = binaryReader.ReadBytes((int)manifestResourceStream.Length);
		}
		if (!ImageConversion.LoadImage(val, array))
		{
			return result;
		}
		return val;
	}

	[return: _003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(2)]
	public static GameObject FindItemPrefab(ItemData rItemData)
	{
		GameObject val = default;
		if (ObjectDB.instance.TryGetItemPrefab(rItemData.m_shared, ref val) && (Object)(object)val != (Object)null)
		{
			return val;
		}
		foreach (GameObject item in ObjectDB.instance.m_items)
		{
			if (!((Object)(object)item == (Object)null))
			{
				ItemDrop component = item.GetComponent<ItemDrop>();
				if (!((Object)(object)component == (Object)null) && component.m_itemData?.m_shared != null && component.m_itemData.m_shared.m_name == rItemData.m_shared.m_name)
				{
					return item;
				}
			}
		}
		return null;
	}

	public static IEnumerable<int> SpentQualityLevels(Requirement req, ItemData item)
	{
		int maxQuality = item.m_shared.m_maxQuality;
		if (!req.m_upgraderResource)
		{
			return Enumerable.Range(1, Math.Max(0, Math.Min(item.m_quality, maxQuality)));
		}
		return Enumerable.Range(maxQuality + 1, Math.Max(0, item.m_quality - maxQuality));
	}

	public static void InventoryRecycleItem(ItemData ___m_dragItem, int ___m_dragAmount, Inventory ___m_dragInventory, InventoryGui __instance, GameObject ___m_dragGo)
	{
		//IL_01d8: Unknown result type (might be due to invalid IL or missing references)
		//IL_01dd: Unknown result type (might be due to invalid IL or missing references)
		//IL_03b4: Unknown result type (might be due to invalid IL or missing references)
		//IL_03b9: Unknown result type (might be due to invalid IL or missing references)
		//IL_01fd: Unknown result type (might be due to invalid IL or missing references)
		//IL_020a: Expected Obj, but got Unknown
		//IL_03de: Unknown result type (might be due to invalid IL or missing references)
		//IL_03f0: Expected Obj, but got Unknown
		//IL_05c1: Unknown result type (might be due to invalid IL or missing references)
		//IL_05c8: Unknown result type (might be due to invalid IL or missing references)
		//IL_05cd: Unknown result type (might be due to invalid IL or missing references)
		//IL_05d4: Unknown result type (might be due to invalid IL or missing references)
		//IL_05d9: Unknown result type (might be due to invalid IL or missing references)
		//IL_05e0: Unknown result type (might be due to invalid IL or missing references)
		if (GroupUtils.IsPrefabExcludedInInventory(((Object)___m_dragItem.m_dropPrefab).name))
		{
			((Character)Player.m_localPlayer).Message((MessageType)2, ((Object)___m_dragItem.m_dropPrefab).name + " is blocked via ExcludeLists.yml file [inventory excludes]", 0, (Sprite)null, false);
			return;
		}
		if (Recycle_N_ReclaimPlugin.returnResources.Value > 0f)
		{
			Recipe recipe = ObjectDB.instance.GetRecipe(___m_dragItem);
			if ((Object)(object)recipe != (Object)null && (Recycle_N_ReclaimPlugin.returnUnknownResources.Value.IsOn() || Player.m_localPlayer.IsRecipeKnown(___m_dragItem.m_shared.m_name)))
			{
				Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)$"Recipe stack: {recipe.m_amount} num of stacks: {___m_dragAmount / recipe.m_amount}");
				List<Requirement> list = recipe.m_resources.ToList();
				if (Recycle_N_ReclaimPlugin.HasEpicLoot && Recycle_N_ReclaimPlugin.returnEnchantedResources.Value.IsOn() && ___m_dragItem.IsMagicItem() && ___m_dragItem.TryGetRarity(out var rarity))
				{
					foreach (ItemAmount enchantCost in ___m_dragItem.GetEnchantCosts(rarity))
					{
						GameObject itemPrefab = ObjectDB.instance.GetItemPrefab(enchantCost.Item);
						ItemDrop val = ((itemPrefab != null) ? itemPrefab.GetComponent<ItemDrop>() : null);
						if (!((Object)(object)val == (Object)null))
						{
							Recipe recipe2 = ObjectDB.instance.GetRecipe(val.m_itemData);
							bool flag = (Object)(object)recipe2 != (Object)null && Player.m_localPlayer.IsRecipeKnown(val.m_itemData.m_shared.m_name);
							bool flag2 = Player.m_localPlayer.m_knownMaterial.Contains(val.m_itemData.m_shared.m_name);
							if (Recycle_N_ReclaimPlugin.returnUnknownResources.Value.IsOff() && (!flag || !flag2))
							{
								((Character)Player.m_localPlayer).Message((MessageType)2, Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_no_material_recipes"), 0, (Sprite)null, false);
								return;
							}
							list.Add(new Requirement
							{
								m_amount = (((Object)(object)recipe2 != (Object)null) ? recipe2.m_amount : enchantCost.Amount),
								m_resItem = val
							});
						}
					}
				}
				if (API.IsLoaded() && Recycle_N_ReclaimPlugin.returnEnchantedResources.Value.IsOn() && API.GetGems(___m_dragItem).Any())
				{
					foreach (KeyValuePair<ItemDrop, ItemData> item in (from gem in API.GetGems(___m_dragItem)
						where gem != null
						select ObjectDB.instance.GetItemPrefab(gem.gemPrefab).GetComponent<ItemDrop>() into itemDrop
						where (Object)(object)itemDrop != (Object)null
						select itemDrop).ToDictionary([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (ItemDrop itemDrop) => itemDrop, [_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (ItemDrop itemDrop) => itemDrop.m_itemData))
					{
						Recipe recipe3 = ObjectDB.instance.GetRecipe(item.Value);
						bool flag3 = (Object)(object)recipe3 != (Object)null && Player.m_localPlayer.IsRecipeKnown(item.Value.m_shared.m_name);
						bool flag4 = Player.m_localPlayer.m_knownMaterial.Contains(item.Value.m_shared.m_name);
						if (Recycle_N_ReclaimPlugin.returnUnknownResources.Value.IsOff() && (!flag3 || !flag4))
						{
							((Character)Player.m_localPlayer).Message((MessageType)2, Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_no_material_recipes"), 0, (Sprite)null, false);
							return;
						}
						list.Add(new Requirement
						{
							m_amount = (((Object)(object)recipe3 != (Object)null) ? recipe3.m_amount : item.Value.m_stack),
							m_resItem = item.Key
						});
					}
				}
				if (___m_dragAmount / recipe.m_amount > 0)
				{
					for (int num = 0; num < ___m_dragAmount / recipe.m_amount; num++)
					{
						foreach (Requirement item2 in list)
						{
							foreach (int item3 in SpentQualityLevels(item2, ___m_dragItem))
							{
								GameObject val2 = FindItemPrefab(item2.m_resItem.m_itemData);
								if ((Object)(object)val2 == (Object)null)
								{
									continue;
								}
								ItemData itemData = val2.GetComponent<ItemDrop>().m_itemData.Clone();
								int num2 = Mathf.RoundToInt((float)item2.GetAmount(item3) * Recycle_N_ReclaimPlugin.returnResources.Value);
								Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)$"Returning {num2}/{item2.GetAmount(item3)} {((Object)val2).name}");
								while (num2 > 0)
								{
									int num3 = Mathf.Min(item2.m_resItem.m_itemData.m_shared.m_maxStackSize, num2);
									num2 -= num3;
									if (!GroupUtils.IsPrefabExcludedInInventory(Utils.GetPrefabName(val2)))
									{
										Player localPlayer = Player.m_localPlayer;
										Inventory inventory = ((Humanoid)localPlayer).GetInventory();
										if ((Recycle_N_ReclaimPlugin.ApplyCraftedBy.Value.IsOn() ? inventory.AddItem(((Object)val2).name, num3, item2.m_resItem.m_itemData.m_quality, item2.m_resItem.m_itemData.m_variant, localPlayer.GetPlayerID(), localPlayer.GetPlayerName(), false, false) : inventory.AddItem(((Object)val2).name, num3, item2.m_resItem.m_itemData.m_quality, item2.m_resItem.m_itemData.m_variant, 0L, "", false, false)) == null)
										{
											Transform transform;
											ItemDrop component = Object.Instantiate<GameObject>(val2, (transform = ((Component)Player.m_localPlayer).transform).position + transform.forward + transform.up, transform.rotation).GetComponent<ItemDrop>();
											component.m_itemData = itemData;
											component.m_itemData.m_dropPrefab = val2;
											component.m_itemData.m_stack = num3;
											component.Save();
										}
									}
								}
							}
						}
					}
				}
			}
		}
		if (___m_dragAmount == ___m_dragItem.m_stack)
		{
			((Humanoid)Player.m_localPlayer).RemoveEquipAction(___m_dragItem);
			((Humanoid)Player.m_localPlayer).UnequipItem(___m_dragItem, false);
			___m_dragInventory.RemoveItem(___m_dragItem);
		}
		else
		{
			___m_dragInventory.RemoveItem(___m_dragItem, ___m_dragAmount);
		}
	}
}
