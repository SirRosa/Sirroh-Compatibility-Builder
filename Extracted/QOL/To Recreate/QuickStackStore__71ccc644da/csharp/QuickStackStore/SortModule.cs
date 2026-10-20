using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using UnityEngine;

namespace QuickStackStore;

public static class SortModule
{
	public static int[] TypeToCategory = new int[24]
	{
		0, 2, 4, 7, 7, 8, 10, 10, 0, 6,
		0, 10, 10, 1, 7, 7, 0, 10, 9, 7,
		7, 3, 7, 5
	};

	private static bool ShouldSortItem(ItemData item, UserConfig playerConfig, int inventoryHeight, int inventoryWidth, bool includeHotbar)
	{
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		return !playerConfig.IsItemNameFavorited(item.m_shared) && ShouldSortSlot(item.m_gridPos, playerConfig, inventoryHeight, inventoryWidth, includeHotbar);
	}

	private static bool ShouldSortSlot(Vector2i slot, UserConfig playerConfig, int playerInventoryHeight, int playerInventoryWidth, bool includeHotbar)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		return ((slot.y > 0) | includeHotbar) && !playerConfig.IsSlotFavorited(slot) && !CompatibilitySupport.IsEquipOrQuickSlot(playerInventoryHeight, playerInventoryWidth, slot);
	}

	public static void DoSort(Player player)
	{
		Container currentContainer = InventoryGui.instance.m_currentContainer;
		UserConfig playerConfig = UserConfig.GetPlayerConfig(player.GetPlayerID());
		if ((Object)(object)currentContainer != (Object)null)
		{
			switch (QSSConfig.SortConfig.SortHotkeyBehaviorWhenContainerOpen.Value)
			{
			case QSSConfig.SortBehavior.OnlySortContainer:
				SortContainer(InventoryGui.instance.m_currentContainer);
				break;
			case QSSConfig.SortBehavior.SortBoth:
				SortContainer(InventoryGui.instance.m_currentContainer);
				SortPlayerInv(((Humanoid)player).m_inventory, playerConfig);
				break;
			}
		}
		else
		{
			SortPlayerInv(((Humanoid)player).m_inventory, playerConfig);
		}
	}

	public static IComparable SortByGetter(ItemData item)
	{
		//IL_0071: Unknown result type (might be due to invalid IL or missing references)
		//IL_0077: Expected I4, but got Unknown
		//IL_009f: Unknown result type (might be due to invalid IL or missing references)
		switch (QSSConfig.SortConfig.SortCriteria.Value)
		{
		case QSSConfig.SortCriteriaEnum.TranslatedName:
			return Localization.instance.Localize(item.m_shared.m_name);
		case QSSConfig.SortCriteriaEnum.Value:
			return item.m_shared.m_value;
		case QSSConfig.SortCriteriaEnum.Weight:
			return item.m_shared.m_weight;
		case QSSConfig.SortCriteriaEnum.Type:
		{
			int num = (int)item.m_shared.m_itemType;
			if (num < 0 || num > 23)
			{
				return num;
			}
			return TypeToCategory[item.m_shared.m_itemType];
		}
		default:
			return item.m_shared.m_name;
		}
	}

	public static int SortCompare(ItemData a, ItemData b)
	{
		int num = SortByGetter(a).CompareTo(SortByGetter(b));
		if (!QSSConfig.SortConfig.SortInAscendingOrder.Value)
		{
			num *= -1;
		}
		if (num == 0)
		{
			num = a.m_shared.m_name.CompareTo(b.m_shared.m_name);
		}
		if (num == 0)
		{
			num = -a.m_quality.CompareTo(b.m_quality);
		}
		if (num == 0)
		{
			num = -a.m_stack.CompareTo(b.m_stack);
		}
		return num;
	}

	public static void SortContainer(Container container)
	{
		if (container.m_nview.IsOwner())
		{
			SortInternal(container.m_inventory);
		}
		else
		{
			container.m_nview.InvokeRPC("QuickStackStore_RequestSort", Array.Empty<object>());
		}
	}

	public static void SortPlayerInv(Inventory inventory, UserConfig playerConfig)
	{
		SortInternal(inventory, playerConfig);
	}

	internal static void SortInternal(Inventory inventory, UserConfig playerConfig = null)
	{
		//IL_0104: Unknown result type (might be due to invalid IL or missing references)
		//IL_0111: Unknown result type (might be due to invalid IL or missing references)
		//IL_0132: Unknown result type (might be due to invalid IL or missing references)
		//IL_0137: Unknown result type (might be due to invalid IL or missing references)
		Stopwatch stopwatch = new Stopwatch();
		stopwatch.Start();
		bool includeHotbar = playerConfig == null || (QSSConfig.GeneralConfig.OverrideHotkeyBarBehavior.Value != QSSConfig.OverrideHotkeyBarBehavior.NeverAffectHotkeyBar && QSSConfig.SortConfig.SortIncludesHotkeyBar.Value);
		List<Vector2i> allowedSlots = GetAllowedSlots(inventory, includeHotbar, playerConfig);
		List<ItemData> list = ((playerConfig != null) ? inventory.m_inventory.Where((ItemData item) => ShouldSortItem(item, playerConfig, inventory.GetHeight(), inventory.GetWidth(), includeHotbar)).ToList() : new List<ItemData>(inventory.m_inventory));
		if (QSSConfig.SortConfig.SortMergesStacks.Value)
		{
			MergeStacks(list, inventory);
		}
		list.Sort((ItemData a, ItemData b) => SortCompare(a, b));
		for (int num = 0; num < list.Count; num++)
		{
			Helper.Log($"Sorting item from ({list[num].m_gridPos}) to ({allowedSlots[num]})", QSSConfig.DebugSeverity.Everything);
			list[num].m_gridPos = allowedSlots[num];
		}
		stopwatch.Stop();
		Helper.Log($"Sorting time: {stopwatch.Elapsed}", QSSConfig.DebugSeverity.AlsoSpeedTests);
		inventory.Changed(false, false);
	}

	private static List<Vector2i> GetAllowedSlots(Inventory inventory, bool includeHotbar, UserConfig playerConfig)
	{
		//IL_00be: Unknown result type (might be due to invalid IL or missing references)
		//IL_0080: Unknown result type (might be due to invalid IL or missing references)
		//IL_011d: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cf: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ec: Unknown result type (might be due to invalid IL or missing references)
		//IL_010b: Unknown result type (might be due to invalid IL or missing references)
		List<Vector2i> list = new List<Vector2i>();
		int i;
		int num;
		if (QSSConfig.GeneralConfig.UseTopDownLogicForEverything.Value)
		{
			i = ((!includeHotbar) ? 1 : 0);
			num = inventory.GetHeight();
		}
		else
		{
			i = -inventory.GetHeight() + 1;
			num = (includeHotbar ? 1 : 0);
		}
		HashSet<Vector2i> hashSet = new HashSet<Vector2i>();
		if (playerConfig != null)
		{
			foreach (ItemData item in inventory.m_inventory)
			{
				if (playerConfig.IsItemNameFavorited(item.m_shared))
				{
					hashSet.Add(item.m_gridPos);
				}
			}
		}
		for (; i < num; i++)
		{
			for (int j = 0; j < inventory.GetWidth(); j++)
			{
				Vector2i val = new Vector2i(j, Math.Abs(i));
				if (playerConfig == null || (!hashSet.Contains(val) && (!QSSConfig.SortConfig.SortLeavesEmptyFavoritedSlotsEmpty.Value || !playerConfig.IsSlotFavorited(val)) && !CompatibilitySupport.IsEquipOrQuickSlot(inventory.GetHeight(), inventory.GetWidth(), val)))
				{
					list.Add(val);
				}
			}
		}
		return list;
	}

	internal static void MergeStacks(List<ItemData> toMerge, Inventory inventory)
	{
		List<List<ItemData>> list = (from itm in toMerge
			where itm.m_stack < itm.m_shared.m_maxStackSize && (itm.m_customData == null || itm.m_customData.Count == 0)
			group itm by new
			{
				itm.m_shared.m_name,
				itm.m_quality
			} into grouping
			select grouping.ToList()).ToList();
		foreach (List<ItemData> item in list)
		{
			if (item.Count <= 1)
			{
				continue;
			}
			int num = 0;
			foreach (ItemData item2 in item)
			{
				num += item2.m_stack;
			}
			int maxStackSize = item.First().m_shared.m_maxStackSize;
			int num2 = num;
			foreach (ItemData item3 in item)
			{
				if (num2 <= 0)
				{
					item3.m_stack = 0;
					inventory.RemoveItem(item3);
					toMerge.Remove(item3);
				}
				else
				{
					item3.m_stack = Math.Min(maxStackSize, num2);
					num2 -= item3.m_stack;
				}
			}
		}
	}
}
