using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;
using AzuAutoStore.Util;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Data;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public class SlotPreview
{
	private Inventory originalInventory;

	private Inventory inventory;

	private bool hasChanges;

	public SlotPreview(Inventory inventory)
	{
		originalInventory = inventory;
		this.inventory = InventoryHelper.CopyInventory(inventory);
	}

	public void Add(Vector2i pos, ItemData item, int amount)
	{
		//IL_0015: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		if (item == null || amount == 0)
		{
			return;
		}
		ItemData val = item.Clone();
		val.m_stack = amount;
		if (pos.x >= 0 && pos.y >= 0)
		{
			inventory.AddItem(val, amount, pos.x, pos.y, false);
		}
		else
		{
			val.m_stack = InventoryMove.HowMuchFits(inventory, val);
			if (val.m_stack > 0)
			{
				inventory.AddItem(val);
			}
		}
		hasChanges = true;
	}

	public void Add(Vector2i pos, ItemData item)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		Add(pos, item, item?.m_stack ?? 0);
	}

	public void Remove(Vector2i pos, ItemData item)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		Remove(pos, item, item?.m_stack ?? 0);
	}

	public void Remove(Vector2i pos, ItemData item, int amount)
	{
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		if (item != null && amount != 0 && inventory.GetItemAt(pos.x, pos.y) != null)
		{
			inventory.RemoveItem(inventory.GetItemAt(pos.x, pos.y), amount);
			hasChanges = true;
		}
	}

	public bool GetSlot(Vector2i pos, out ItemData item)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		ItemData itemAt = originalInventory.GetItemAt(pos.x, pos.y);
		item = inventory.GetItemAt(pos.x, pos.y);
		if (itemAt == null && item == null)
		{
			return false;
		}
		if (itemAt == null || item == null)
		{
			return true;
		}
		if (!(itemAt.m_shared.m_name != item.m_shared.m_name))
		{
			return itemAt.m_stack != item.m_stack;
		}
		return true;
	}

	public bool HasChanges()
	{
		return hasChanges;
	}
}
