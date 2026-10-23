using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using AzuAutoStore.Patches.Favoriting;
using AzuAutoStore.Util;
using AzuExtendedPlayerInventory;
using Backpacks;
using UnityEngine;

namespace AzuAutoStore.Interfaces;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public class BackpackContainer(ItemContainer _container) : IContainer
{
	public GameObject gameObject => ((Component)Player.m_localPlayer).gameObject;

	public ZNetView m_nview => ((Character)Player.m_localPlayer).m_nview;

	public static bool CantStoreFavorite(ItemData item, UserConfig playerConfig)
	{
		return playerConfig.IsItemNameOrSlotFavorited(item);
	}

	internal static void LogDebug(string data)
	{
		AzuAutoStorePlugin.AzuAutoStoreLogger.LogDebug((object)data);
	}

	public int TryStore()
	{
		if (!Object.op_Implicit((Object)(object)Player.m_localPlayer))
		{
			return 0;
		}
		int num = 0;
		Inventory inventory = ((Humanoid)Player.m_localPlayer).GetInventory();
		List<ItemData> allItems = inventory.GetAllItems();
		for (int num2 = allItems.Count - 1; num2 >= 0; num2--)
		{
			ItemData item = allItems[num2];
			if (item.m_equipped)
			{
				LogDebug("Skipping equipped item " + ((Object)item.m_dropPrefab).name);
			}
			else
			{
				int x = item.m_gridPos.x;
				if (x >= 0 && x <= 8 && item.m_gridPos.y == 0 && AzuAutoStorePlugin.PlayerIgnoreHotbar.Value.IsOn())
				{
					LogDebug("Skipping item " + ((Object)item.m_dropPrefab).name + " because it is in the hotbar");
				}
				else if (AzuExtendedPlayerInventory.API.IsLoaded() && AzuExtendedPlayerInventory.API.GetQuickSlotsItems().Any([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemData quickSlotItem) =>
				{
					//IL_0001: Unknown result type (might be due to invalid IL or missing references)
					//IL_000c: Unknown result type (might be due to invalid IL or missing references)
					return quickSlotItem.m_gridPos == item.m_gridPos;
				}))
				{
					LogDebug("Skipping item " + ((Object)item.m_dropPrefab).name + " because it is in your quick slots");
				}
				else if (CantStoreFavorite(item, UserConfig.GetPlayerConfig(Player.m_localPlayer.GetPlayerID())))
				{
					LogDebug("Skipping favorited item/slot " + ((Object)item.m_dropPrefab).name);
				}
				else
				{
					LogDebug("Checking item " + ((Object)item.m_dropPrefab).name);
					int stack = item.m_stack;
					if (TryStore(_container, ref item, fromPlayer: true))
					{
						int num3 = stack - item.m_stack;
						if (num3 > 0)
						{
							num += num3;
							if (item.m_stack == 0)
							{
								inventory.RemoveItem(item);
							}
							else
							{
								inventory.Changed(false, false);
							}
							LogDebug($"Stored {num3} {((Object)item.m_dropPrefab).name} into {((Object)_container.Item.m_dropPrefab).name}");
							if (!Boxes.ContainersToPing.Contains(this))
							{
								Boxes.ContainersToPing.Add(this);
							}
						}
					}
				}
			}
		}
		return num;
	}

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(2)]
	public int TryStoreThisItem(ItemData singleItemData = null, Inventory playerInventory = null)
	{
		if (!Object.op_Implicit((Object)(object)Player.m_localPlayer))
		{
			return 0;
		}
		Inventory val = playerInventory ?? ((Humanoid)Player.m_localPlayer).GetInventory();
		if (singleItemData == null)
		{
			return 0;
		}
		ItemData item = singleItemData;
		if (item.m_equipped)
		{
			LogDebug("Skipping equipped item " + ((Object)item.m_dropPrefab).name);
			return 0;
		}
		int x = item.m_gridPos.x;
		if (x >= 0 && x <= 8 && item.m_gridPos.y == 0 && AzuAutoStorePlugin.PlayerIgnoreHotbar.Value.IsOn())
		{
			LogDebug("Skipping item " + ((Object)item.m_dropPrefab).name + " because it is in the hotbar");
			return 0;
		}
		if (AzuExtendedPlayerInventory.API.IsLoaded() && AzuExtendedPlayerInventory.API.GetQuickSlotsItems().Any([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemData quickSlotItem) =>
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			return quickSlotItem.m_gridPos == item.m_gridPos;
		}))
		{
			LogDebug("Skipping item " + ((Object)item.m_dropPrefab).name + " because it is in your quick slots");
			return 0;
		}
		if (CantStoreFavorite(item, UserConfig.GetPlayerConfig(Player.m_localPlayer.GetPlayerID())))
		{
			LogDebug("Skipping favorited item/slot " + ((Object)item.m_dropPrefab).name);
			return 0;
		}
		LogDebug("Checking item " + ((Object)item.m_dropPrefab).name);
		int stack = item.m_stack;
		if (!TryStore(_container, ref item, fromPlayer: true, singleItemData: true))
		{
			return 0;
		}
		int num = stack - item.m_stack;
		if (num <= 0)
		{
			return 0;
		}
		if (item.m_stack == 0)
		{
			val.RemoveItem(item);
		}
		else
		{
			val.Changed(false, false);
		}
		LogDebug($"Stored {num} {((Object)item.m_dropPrefab).name} into {((Object)_container.Item.m_dropPrefab).name}");
		if (!Boxes.ContainersToPing.Contains(this))
		{
			Boxes.ContainersToPing.Add(this);
		}
		return num;
	}

	internal bool TryStore(ItemContainer nearbyContainer, ref ItemData item, bool fromPlayer = false)
	{
		bool flag = false;
		LogDebug("Checking container " + ((Object)nearbyContainer.Item.m_dropPrefab).name);
		if (!MiscFunctions.CheckItemSharedIntegrity(item))
		{
			return flag;
		}
		if (AzuAutoStorePlugin.MustHaveExistingItemToPull.Value.IsOn() && !nearbyContainer.Inventory.HaveItem(item.m_shared.m_name, true))
		{
			return false;
		}
		if (!Boxes.CanItemBeStored(MiscFunctions.GetPrefabName(((Object)nearbyContainer.Item.m_dropPrefab).name), ((Object)item.m_dropPrefab).name))
		{
			return false;
		}
		while (item.m_stack > 0 && nearbyContainer.CanAddItem(item))
		{
			ItemData val = item.Clone();
			val.m_stack = 1;
			Backpacks.API.AddItemToBackpack(_container.Item, val);
			ItemData obj = item;
			obj.m_stack--;
			flag = true;
			LogDebug("Auto storing " + ((Object)item.m_dropPrefab).name + " in " + ((Object)nearbyContainer.Item.m_dropPrefab).name);
		}
		if (!flag)
		{
			return flag;
		}
		if (!fromPlayer)
		{
			Functions.PingContainer(((Component)Player.m_localPlayer).gameObject);
		}
		nearbyContainer.Save();
		return flag;
	}

	internal static bool TryStore(ItemContainer nearbyContainer, ref ItemData item, bool fromPlayer = false, bool singleItemData = false)
	{
		bool flag = false;
		LogDebug("Checking container " + ((Object)nearbyContainer.Item.m_dropPrefab).name);
		if (!MiscFunctions.CheckItemSharedIntegrity(item))
		{
			return flag;
		}
		if (AzuAutoStorePlugin.MustHaveExistingItemToPull.Value.IsOn() && !nearbyContainer.Inventory.HaveItem(item.m_shared.m_name, true))
		{
			if (singleItemData)
			{
				LogDebug("Skipping " + ((Object)item.m_dropPrefab).name + " because it is not in the container");
				((Character)Player.m_localPlayer).Message((MessageType)2, "<color=red>" + item.m_shared.m_name + " is not in nearby containers</color>", 0, (Sprite)null, false);
			}
			return false;
		}
		if (!Boxes.CanItemBeStored(MiscFunctions.GetPrefabName(((Object)nearbyContainer.Item.m_dropPrefab).name), ((Object)item.m_dropPrefab).name))
		{
			return false;
		}
		while (item.m_stack > 1 && nearbyContainer.Inventory.CanAddItem(item, 1))
		{
			ItemData val = item.Clone();
			val.m_stack = 1;
			Backpacks.API.AddItemToBackpack(nearbyContainer.Item, val);
			ItemData obj = item;
			obj.m_stack--;
			flag = true;
			LogDebug("Auto storing " + ((Object)item.m_dropPrefab).name + " in " + ((Object)nearbyContainer.Item.m_dropPrefab).name);
		}
		if (item.m_stack == 1 && nearbyContainer.Inventory.CanAddItem(item, 1))
		{
			ItemData item2 = item.Clone();
			item.m_stack = 0;
			Backpacks.API.AddItemToBackpack(nearbyContainer.Item, item2);
			flag = true;
		}
		if (!flag)
		{
			return flag;
		}
		if (!fromPlayer)
		{
			Functions.PingContainer(((Component)Player.m_localPlayer).gameObject);
		}
		try
		{
			nearbyContainer.Save();
		}
		catch
		{
		}
		return flag;
	}

	public bool IsOwner()
	{
		return true;
	}

	public static BackpackContainer Create(ItemContainer container)
	{
		return new BackpackContainer(container);
	}
}
