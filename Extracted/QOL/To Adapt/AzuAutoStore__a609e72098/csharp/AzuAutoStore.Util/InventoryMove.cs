using System;
using System.Runtime.CompilerServices;
using UnityEngine;

namespace AzuAutoStore.Util;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
internal static class InventoryMove
{
	private static int FreeStackSpace(Inventory target, ItemData item, int max)
	{
		int num = 0;
		foreach (ItemData allItem in target.GetAllItems())
		{
			if (!(allItem.m_shared.m_name != item.m_shared.m_name) && allItem.m_quality == item.m_quality && allItem.m_worldLevel == item.m_worldLevel && allItem.m_stack < max)
			{
				num += max - allItem.m_stack;
			}
		}
		return num;
	}

	internal static int HowMuchFits(Inventory target, ItemData item)
	{
		if (target == null || item == null || item.m_stack <= 0)
		{
			return 0;
		}
		int num = Mathf.Max(1, item.m_shared.m_maxStackSize);
		int num2 = FreeStackSpace(target, item, num);
		int num3 = target.m_width * target.m_height - target.m_inventory.Count;
		if (num3 > 0)
		{
			num2 += num3 * num;
		}
		return Math.Min(item.m_stack, num2);
	}

	internal static int MoveStack(Inventory target, ItemData sourceItem)
	{
		if (target == null || sourceItem == null || sourceItem.m_stack <= 0)
		{
			return 0;
		}
		int num = HowMuchFits(target, sourceItem);
		if (num <= 0)
		{
			return 0;
		}
		ItemData val = sourceItem.Clone();
		val.m_stack = num;
		int num2 = (target.AddItem(val) ? num : (num - val.m_stack));
		sourceItem.m_stack -= num2;
		return num2;
	}
}
