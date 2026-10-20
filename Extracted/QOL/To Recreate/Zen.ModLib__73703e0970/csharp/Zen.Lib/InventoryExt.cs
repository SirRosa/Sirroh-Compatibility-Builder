using System;
using System.Linq;
using UnityEngine;

namespace Zen.Lib;

public static class InventoryExt
{
	public static Tally SumItems(this Inventory inv, Func<ItemData, string> callback)
	{
		Tally tally = new Tally();
		foreach (ItemData allItem in inv.GetAllItems())
		{
			tally[callback(allItem)] += allItem.m_stack;
		}
		return tally;
	}

	public static Tally SumItemsByName(this Inventory inv)
	{
		return inv.SumItems((ItemData item) => item.GetName());
	}

	public static Tally SumItemsByPrefabName(this Inventory inv)
	{
		return inv.SumItems((ItemData item) => item.GetPrefabName());
	}

	public static bool HaveItemData(this Inventory inventory, ItemData itemData)
	{
		foreach (ItemData allItem in inventory.GetAllItems())
		{
			if (allItem.IsEqual(itemData))
			{
				return true;
			}
		}
		return false;
	}

	public static void SwapItem(this Inventory thisInv, ItemData thisItem, Inventory otherInv, ItemData otherItem)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0036: Unknown result type (might be due to invalid IL or missing references)
		Vector2i gridPos = thisItem.m_gridPos;
		Vector2i gridPos2 = otherItem.m_gridPos;
		bool equipped = thisItem.m_equipped;
		bool equipped2 = otherItem.m_equipped;
		thisInv.RemoveItem(thisItem);
		otherInv.RemoveItem(otherItem);
		thisInv.AddItem(otherItem, gridPos);
		otherInv.AddItem(thisItem, gridPos2);
		Player player = Player.m_localPlayer;
		if (equipped)
		{
			SwitchEquipped(thisItem, otherItem);
		}
		else if (equipped2)
		{
			SwitchEquipped(otherItem, thisItem);
		}
		void SwitchEquipped(ItemData a, ItemData b)
		{
			//IL_0013: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Unknown result type (might be due to invalid IL or missing references)
			((Humanoid)player).UnequipItem(a, false);
			if (a.m_shared.m_itemType == b.m_shared.m_itemType || (a.IsWeapon() && b.IsWeapon()))
			{
				((Humanoid)player).EquipItem(b, false);
			}
		}
	}

	public static bool ContainsItemByPrefab(this Inventory inventory, string prefabName)
	{
		return inventory.GetAllItems().Any((ItemData item) => item.GetPrefabName() == prefabName);
	}

	public static bool ContainsItemByPrefab(this Inventory inventory, GameObject prefab)
	{
		return inventory.ContainsItemByPrefab(Utils.GetPrefabName(((Object)prefab).name));
	}

	public static bool TryAddItem(this Inventory inventory, GameObject prefab, int amount, out ItemData item)
	{
		item = prefab.GetComponent<ItemDrop>().m_itemData.Clone();
		item.m_dropPrefab = prefab;
		item.m_stack = Mathf.Min(amount, item.m_shared.m_maxStackSize);
		item.m_worldLevel = Game.m_worldLevel;
		return inventory.AddItem(item);
	}
}
