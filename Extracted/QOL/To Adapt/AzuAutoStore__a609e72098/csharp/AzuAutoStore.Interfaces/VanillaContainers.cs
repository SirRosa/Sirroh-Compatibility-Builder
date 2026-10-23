using System.Collections.Generic;
using System.Runtime.CompilerServices;
using AzuAutoStore.Patches.Favoriting;
using AzuAutoStore.Util;
using AzuExtendedPlayerInventory;
using UnityEngine;

namespace AzuAutoStore.Interfaces;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public class VanillaContainers(Container _container) : IContainer
{
	public GameObject gameObject => ((Component)_container).gameObject;

	public ZNetView m_nview => _container.m_nview;

	public static bool CantStoreFavorite(ItemData item, UserConfig playerConfig)
	{
		return playerConfig.IsItemNameOrSlotFavorited(item);
	}

	internal static void LogDebug(string data)
	{
		AzuAutoStorePlugin.AzuAutoStoreLogger.LogDebug((object)data);
	}

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 2, 1 })]
	private static List<ItemData> QuickSlots()
	{
		if (!API.IsLoaded())
		{
			return null;
		}
		return API.GetQuickSlotsItems();
	}

	private static bool ShouldSkip(ItemData item, [_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 2, 1 })] List<ItemData> quickSlots)
	{
		//IL_0085: Unknown result type (might be due to invalid IL or missing references)
		//IL_008b: Unknown result type (might be due to invalid IL or missing references)
		if (item.m_equipped)
		{
			LogDebug("Skipping equipped item " + ((Object)item.m_dropPrefab).name);
			return true;
		}
		int x = item.m_gridPos.x;
		if (x >= 0 && x <= 8 && item.m_gridPos.y == 0 && AzuAutoStorePlugin.PlayerIgnoreHotbar.Value.IsOn())
		{
			LogDebug("Skipping item " + ((Object)item.m_dropPrefab).name + " because it is in the hotbar");
			return true;
		}
		if (quickSlots != null)
		{
			for (int i = 0; i < quickSlots.Count; i++)
			{
				if (!(quickSlots[i].m_gridPos != item.m_gridPos))
				{
					LogDebug("Skipping item " + ((Object)item.m_dropPrefab).name + " because it is in your quick slots");
					return true;
				}
			}
		}
		if (CantStoreFavorite(item, UserConfig.GetPlayerConfig(Player.m_localPlayer.GetPlayerID())))
		{
			LogDebug("Skipping favorited item/slot " + ((Object)item.m_dropPrefab).name);
			return true;
		}
		return false;
	}

	private int Commit(ItemData item, Inventory inv, int originalAmount)
	{
		int num = originalAmount - item.m_stack;
		if (num <= 0)
		{
			return 0;
		}
		if (item.m_stack > 0)
		{
			inv.Changed(false, false);
		}
		else if (inv.ContainsItem(item))
		{
			inv.RemoveItem(item);
		}
		LogDebug($"Stored {num} {((Object)item.m_dropPrefab).name} into {((Object)_container).name}");
		if (!Boxes.ContainersToPing.Contains(this))
		{
			Boxes.ContainersToPing.Add(this);
		}
		return num;
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
		List<ItemData> quickSlots = QuickSlots();
		for (int num2 = allItems.Count - 1; num2 >= 0; num2--)
		{
			ItemData item = allItems[num2];
			if (!ShouldSkip(item, quickSlots))
			{
				LogDebug("Checking item " + ((Object)item.m_dropPrefab).name);
				int stack = item.m_stack;
				if (Functions.TryStore(_container, ref item, fromPlayer: true))
				{
					num += Commit(item, inventory, stack);
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
		if (singleItemData == null)
		{
			return 0;
		}
		Inventory inv = playerInventory ?? ((Humanoid)Player.m_localPlayer).GetInventory();
		ItemData item = singleItemData;
		if (ShouldSkip(item, QuickSlots()))
		{
			return 0;
		}
		LogDebug("Checking item " + ((Object)item.m_dropPrefab).name);
		int stack = item.m_stack;
		if (!Functions.TryStore(_container, ref item, fromPlayer: true, singleItemData: true))
		{
			return 0;
		}
		return Commit(item, inv, stack);
	}

	public bool IsOwner()
	{
		return _container.m_nview.IsOwner();
	}

	public Inventory GetInventory()
	{
		return _container.GetInventory();
	}

	public static VanillaContainers Create(Container container)
	{
		return new VanillaContainers(container);
	}
}
