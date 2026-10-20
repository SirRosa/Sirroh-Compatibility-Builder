using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace QuickStackStore;

internal class StoreTakeAllModule
{
	internal static void DoTakeAllWithKeybind(Player player)
	{
		if (Object.op_Implicit((Object)(object)InventoryGui.instance) && InventoryGui.IsVisible() && !((Object)(object)player != (Object)(object)Player.m_localPlayer))
		{
			InventoryGui.instance.OnTakeAll();
		}
	}

	internal static void DoStoreAllWithKeybind(Player player)
	{
		if (Object.op_Implicit((Object)(object)InventoryGui.instance) && InventoryGui.IsVisible() && !((Object)(object)player != (Object)(object)Player.m_localPlayer))
		{
			StoreAllItemsInOrder(player);
		}
	}

	private static bool ShouldStoreItem(ItemData item, UserConfig playerConfig, int inventoryHeight, int inventoryWidth, bool includeHotbar)
	{
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		return ((item.m_gridPos.y > 0) | includeHotbar) && (QSSConfig.StoreTakeAllConfig.StoreAllIncludesEquippedItems.Value || !item.m_equipped) && !playerConfig.IsItemNameOrSlotFavorited(item) && !CompatibilitySupport.IsEquipOrQuickSlot(inventoryHeight, inventoryWidth, item.m_gridPos);
	}

	internal static void TakeAllItemsInOrder(Player player)
	{
		if (Object.op_Implicit((Object)(object)InventoryGui.instance.m_currentContainer))
		{
			Inventory inventory = InventoryGui.instance.m_currentContainer.m_inventory;
			Inventory inventory2 = ((Humanoid)player).m_inventory;
			MoveAllItemsInOrder(player, inventory, inventory2, takeAllOverride: true);
		}
	}

	internal static void StoreAllItemsInOrder(Player player)
	{
		if (Object.op_Implicit((Object)(object)InventoryGui.instance.m_currentContainer))
		{
			Inventory inventory = ((Humanoid)player).m_inventory;
			Inventory inventory2 = InventoryGui.instance.m_currentContainer.m_inventory;
			MoveAllItemsInOrder(player, inventory, inventory2);
		}
	}

	internal static void MoveAllItemsInOrder(Player player, Inventory fromInventory, Inventory toInventory, bool takeAllOverride = false)
	{
		if (((Character)player).IsTeleporting())
		{
			return;
		}
		InventoryGui.instance.SetupDragItem((ItemData)null, (Inventory)null, 0);
		List<ItemData> list;
		if (takeAllOverride)
		{
			list = new List<ItemData>(fromInventory.m_inventory);
		}
		else
		{
			UserConfig playerConfig = UserConfig.GetPlayerConfig(player.GetPlayerID());
			bool includeHotbar = QSSConfig.GeneralConfig.OverrideHotkeyBarBehavior.Value != QSSConfig.OverrideHotkeyBarBehavior.NeverAffectHotkeyBar && QSSConfig.StoreTakeAllConfig.StoreAllIncludesHotkeyBar.Value;
			list = fromInventory.m_inventory.Where((ItemData item) => ShouldStoreItem(item, playerConfig, fromInventory.GetHeight(), fromInventory.GetWidth(), includeHotbar)).ToList();
		}
		list.Sort((ItemData a, ItemData b) =>
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			return Helper.CompareSlotOrder(a.m_gridPos, b.m_gridPos);
		});
		int num = 0;
		foreach (ItemData item in list)
		{
			if (toInventory.AddItem(item))
			{
				fromInventory.RemoveItem(item);
				num++;
				if (item.m_equipped)
				{
					((Humanoid)Player.m_localPlayer).RemoveEquipAction(item);
					((Humanoid)Player.m_localPlayer).UnequipItem(item, false);
				}
			}
		}
		if (takeAllOverride)
		{
			Helper.Log($"Moved {num} item/s from container to player inventory");
		}
		else
		{
			Helper.Log($"Moved {num} item/s from player inventory to container");
		}
		toInventory.Changed(false, false);
		fromInventory.Changed(false, false);
	}
}
