using System;
using System.Collections.Generic;
using System.Linq;
using BepInEx.Configuration;
using HarmonyLib;
using UnityEngine;
using Zen.Lib;
using Zen.Lib.Config;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class InventoryEquip
{
	private static bool _autoReposition = true;

	private static readonly Dictionary<ItemType, Vector2i> SlotPositionsByType = new Dictionary<ItemType, Vector2i>
	{
		{
			(ItemType)6,
			new Vector2i(0, 1)
		},
		{
			(ItemType)7,
			new Vector2i(0, 2)
		},
		{
			(ItemType)11,
			new Vector2i(0, 3)
		},
		{
			(ItemType)17,
			new Vector2i(1, 1)
		},
		{
			(ItemType)18,
			new Vector2i(1, 2)
		},
		{
			(ItemType)24,
			new Vector2i(1, 3)
		},
		{
			(ItemType)15,
			new Vector2i(-1, -1)
		},
		{
			(ItemType)9,
			new Vector2i(-1, -1)
		},
		{
			(ItemType)5,
			new Vector2i(-1, -1)
		}
	};

	internal static void InitConfigs(string sectionName)
	{
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		//IL_0036: Unknown result type (might be due to invalid IL or missing references)
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		//IL_004f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Unknown result type (might be due to invalid IL or missing references)
		//IL_005d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0068: Unknown result type (might be due to invalid IL or missing references)
		//IL_0087: Unknown result type (might be due to invalid IL or missing references)
		//IL_0092: Unknown result type (might be due to invalid IL or missing references)
		//IL_0097: Unknown result type (might be due to invalid IL or missing references)
		ItemType[] array = SlotPositionsByType.Keys.ToArray();
		foreach (ItemType key in array)
		{
			Vector2i val = SlotPositionsByType[key];
			ConfigEntry<Vector2> config = Config.Define<Vector2>(isAdmin: false, sectionName, $"Assigned Slot {key}", new Vector2((float)val.x, (float)val.y), $"The inventory slot position for {key} items when equipped.\r\nInteger values only.  Set to -1 to disable.\r\nBe careful that every slot is assigned to a different grid position.");
			SlotPositionsByType[key] = new Vector2i(config.Value);
			config.SettingChanged += (object _, EventArgs _) =>
			{
				//IL_0006: Unknown result type (might be due to invalid IL or missing references)
				//IL_0011: Unknown result type (might be due to invalid IL or missing references)
				//IL_0016: Unknown result type (might be due to invalid IL or missing references)
				SlotPositionsByType[key] = new Vector2i(config.Value);
			};
		}
	}

	private static void MoveToConfigPosition(ItemData item)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_004c: Unknown result type (might be due to invalid IL or missing references)
		//IL_005e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0064: Unknown result type (might be due to invalid IL or missing references)
		//IL_007c: Unknown result type (might be due to invalid IL or missing references)
		//IL_007d: Unknown result type (might be due to invalid IL or missing references)
		if (!SlotPositionsByType.TryGetValue(item.GetItemType(), out var value))
		{
			return;
		}
		Inventory inventory = ((Humanoid)Player.m_localPlayer).GetInventory();
		if (inventory.ContainsItem(item) && value.x >= 0 && value.x <= inventory.m_width - 1 && value.y >= 0 && value.y <= inventory.m_height - 1)
		{
			ItemData itemAt = inventory.GetItemAt(value.x, value.y);
			if (itemAt != null)
			{
				SwapPosition(item, itemAt);
			}
			else
			{
				item.m_gridPos = value;
			}
		}
	}

	private static void SwapPosition(ItemData item, ItemData existingItem)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		Vector2i gridPos = existingItem.m_gridPos;
		Vector2i gridPos2 = item.m_gridPos;
		existingItem.m_gridPos = gridPos2;
		item.m_gridPos = gridPos;
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Humanoid), "EquipItem")]
	private static void Humanoid_EquipItem(Humanoid __instance, ItemData item, ref bool __runOriginal)
	{
		if (Configs.AssignedGearSlots.Value && Player.m_localPlayer.Is((Character)(object)__instance) && _autoReposition)
		{
			MoveToConfigPosition(item);
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(InventoryGui), "OnSelectedItem")]
	private static void InventoryGui_OnSelectedItem(InventoryGui __instance)
	{
		_autoReposition = true;
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGrid), "DropItem")]
	private static void InventoryGrid_DropItem(InventoryGrid __instance)
	{
		_autoReposition = false;
	}

	static InventoryEquip()
	{
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		//IL_003b: Unknown result type (might be due to invalid IL or missing references)
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		//IL_0068: Unknown result type (might be due to invalid IL or missing references)
		//IL_0077: Unknown result type (might be due to invalid IL or missing references)
		//IL_0085: Unknown result type (might be due to invalid IL or missing references)
	}
}
