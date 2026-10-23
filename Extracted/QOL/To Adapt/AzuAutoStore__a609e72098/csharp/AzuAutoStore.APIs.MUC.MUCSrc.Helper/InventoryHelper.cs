using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Helper;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public static class InventoryHelper
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)]
	public delegate void MoveAction(Inventory from, Inventory to);

	private static MethodBase memberwiseCloneMethod = AccessTools.Method(typeof(object), "MemberwiseClone", (Type[])null, (Type[])null);

	public static ItemData LoadItemFromPackage(ZPackage pkg)
	{
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		//IL_0097: Unknown result type (might be due to invalid IL or missing references)
		//IL_009f: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a7: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ac: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c8: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cf: Unknown result type (might be due to invalid IL or missing references)
		if (!pkg.ReadBool())
		{
			return null;
		}
		string text = pkg.ReadString();
		int num = pkg.ReadInt();
		float num2 = pkg.ReadSingle();
		Vector2i val = pkg.ReadVector2i();
		int num3 = pkg.ReadInt();
		int num4 = pkg.ReadInt();
		long num5 = pkg.ReadLong();
		string text2 = pkg.ReadString();
		int num6 = pkg.ReadInt();
		bool flag = pkg.ReadBool();
		Dictionary<string, string> dictionary = new Dictionary<string, string>();
		int num7 = pkg.ReadInt();
		for (int i = 0; i < num7; i++)
		{
			string key = pkg.ReadString();
			string value = pkg.ReadString();
			dictionary[key] = value;
		}
		Inventory val2 = new Inventory("tmp", (Sprite)null, val.x + 1, val.y + 1);
		val2.AddItem(text, num, num2, val, false, num3, num4, num5, text2, dictionary, num6, flag, false, false);
		ItemData itemAt = val2.GetItemAt(val.x, val.y);
		val2.RemoveItem(itemAt);
		return itemAt;
	}

	public static void WriteItemToPackage(ItemData itemData, ZPackage pkg)
	{
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		pkg.Write(itemData != null);
		if (itemData == null)
		{
			return;
		}
		pkg.Write(itemData.PrefabName());
		pkg.Write(itemData.m_stack);
		pkg.Write(itemData.m_durability);
		pkg.Write(itemData.m_gridPos);
		pkg.Write(itemData.m_quality);
		pkg.Write(itemData.m_variant);
		pkg.Write(itemData.m_crafterID);
		pkg.Write(itemData.m_crafterName);
		pkg.Write(itemData.m_worldLevel);
		pkg.Write(itemData.m_pickedUp);
		pkg.Write(itemData.m_customData.Count);
		foreach (KeyValuePair<string, string> customDatum in itemData.m_customData)
		{
			pkg.Write(customDatum.Key);
			pkg.Write(customDatum.Value);
		}
	}

	public static ItemData ClampStackSize(this ItemData item)
	{
		if (item == null)
		{
			return null;
		}
		ItemDrop component = ObjectDB.instance.GetItemPrefab(item.PrefabName()).GetComponent<ItemDrop>();
		item.m_shared.m_maxStackSize = component.m_itemData.m_shared.m_maxStackSize;
		return item;
	}

	public static string PrefabName(this ItemData item)
	{
		if ((Object)(object)item.m_dropPrefab != (Object)null)
		{
			return ((Object)item.m_dropPrefab).name;
		}
		Log.LogWarning("Item missing prefab " + item.m_shared.m_name);
		return item.m_shared.m_name;
	}

	public static bool MoveItem(Inventory inventory, ItemData item, int amount, Vector2i toPos, out int movedAmount)
	{
		//IL_000a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_0069: Unknown result type (might be due to invalid IL or missing references)
		//IL_006f: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b7: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bd: Unknown result type (might be due to invalid IL or missing references)
		movedAmount = 0;
		if (item == null)
		{
			return false;
		}
		ItemData itemAt = inventory.GetItemAt(toPos.x, toPos.y);
		if (itemAt == item)
		{
			return true;
		}
		if (itemAt == null)
		{
			movedAmount = amount;
			return inventory.MoveItemToThis(inventory, item, amount, toPos.x, toPos.y);
		}
		if (CanStack(itemAt, item))
		{
			movedAmount = Mathf.Min(amount, itemAt.m_shared.m_maxStackSize - itemAt.m_stack);
			return inventory.MoveItemToThis(inventory, item, movedAmount, toPos.x, toPos.y);
		}
		if (item.m_stack != amount)
		{
			return false;
		}
		inventory.RemoveItem(item);
		inventory.MoveItemToThis(inventory, itemAt, itemAt.m_stack, item.m_gridPos.x, item.m_gridPos.y);
		inventory.MoveItemToThis(inventory, item, amount, toPos.x, toPos.y);
		movedAmount = amount;
		return true;
	}

	public static bool CanStack(ItemData itemA, ItemData itemB)
	{
		if (itemA.m_shared.m_name == itemB.m_shared.m_name && (itemA.m_shared.m_maxQuality <= 1 || itemB.m_quality == itemA.m_quality))
		{
			return itemA.m_shared.m_maxStackSize != 1;
		}
		return false;
	}

	public static Vector2i FindEmptySlot(Inventory inventory, List<Vector2i> blockedSlots)
	{
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_0015: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		for (int i = 0; i < inventory.m_height; i++)
		{
			for (int j = 0; j < inventory.m_width; j++)
			{
				if (inventory.GetItemAt(j, i) == null && !blockedSlots.Contains(new Vector2i(j, i)))
				{
					return new Vector2i(j, i);
				}
			}
		}
		return new Vector2i(-1, -1);
	}

	public static List<ItemData> GetAllMoveableItems(Inventory from, Inventory to, MoveAction moveAction)
	{
		Inventory val = CopyInventory(from);
		Inventory to2 = CopyInventory(to);
		moveAction(val, to2);
		return CountMoved(from, val);
	}

	public static List<ItemData> GetAllMoveableItems(Inventory from, Inventory to)
	{
		return GetAllMoveableItems(from, to, MoveAll);
	}

	public static void MoveAll(Inventory from, Inventory to)
	{
		to.MoveAll(from);
	}

	private static List<ItemData> CountMoved(Inventory from, Inventory fromCopy)
	{
		List<ItemData> list = new List<ItemData>();
		foreach (ItemData item in from.m_inventory)
		{
			ItemData itemAt = fromCopy.GetItemAt(item.m_gridPos.x, item.m_gridPos.y);
			if (itemAt == null)
			{
				list.Add(item);
			}
			else if (item.m_stack > itemAt.m_stack)
			{
				ItemData val = item.Clone();
				val.m_stack = item.m_stack - itemAt.m_stack;
				list.Add(val);
			}
		}
		return list;
	}

	public static Inventory CopyInventory(Inventory target)
	{
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0053: Expected Obj, but got Unknown
		return new Inventory(target.m_name, target.m_bkg, target.m_width, target.m_height)
		{
			m_inventory = new List<ItemData>(from x in target.GetAllItems()
				select x.Clone())
		};
	}

	public static bool AddItemToInventory(this Inventory target, ItemData item, int amount, Vector2i pos)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0054: Unknown result type (might be due to invalid IL or missing references)
		if (amount == 0)
		{
			return false;
		}
		ItemData itemAt = target.GetItemAt(pos.x, pos.y);
		if (itemAt != null)
		{
			if (!CanStack(itemAt, item))
			{
				return false;
			}
			if (itemAt.m_stack + amount > itemAt.m_shared.m_maxStackSize)
			{
				return false;
			}
		}
		ItemData val = item.CloneDeeper();
		val.m_stack = amount;
		return target.AddItem(val, amount, pos.x, pos.y, false);
	}

	public static ItemData CloneDeeper(this ItemData itemDrop)
	{
		ItemData val = itemDrop.Clone();
		object? obj = memberwiseCloneMethod.Invoke(itemDrop.m_shared, null);
		val.m_shared = (SharedData)((obj is SharedData) ? obj : null);
		return val;
	}

	public static void PrintItem(string title, ItemData itemData)
	{
	}
}
