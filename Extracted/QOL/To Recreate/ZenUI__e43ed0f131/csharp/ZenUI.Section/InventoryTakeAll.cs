using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using HarmonyLib;
using JetBrains.Annotations;
using TMPro;
using UnityEngine;
using Zen;
using Zen.Lib;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class InventoryTakeAll
{
	private enum TakeMode
	{
		Stacks,
		Weight,
		All
	}

	[HarmonyPatch(typeof(Inventory), "Changed")]
	[HarmonyPriority(800)]
	private static class InventoryChangedEvent
	{
		public static bool CanInvoke = true;

		[UsedImplicitly]
		private static bool Prefix()
		{
			return CanInvoke;
		}

		public static void Invoke(params Inventory[] inventories)
		{
			for (int i = 0; i < inventories.Length; i++)
			{
				inventories[i].Changed(false, false);
			}
		}
	}

	private static TakeMode _takeMode;

	private static TMP_Text? _takeAllButtonLabel;

	private static bool IsSameName(this ItemData item, ItemData other)
	{
		return item.GetPrefabName() == other.GetPrefabName();
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Hud), "Update")]
	private static void Hud_Update()
	{
		if (!Configs.EnableTakeStacks.Value)
		{
			return;
		}
		InventoryGui instance = InventoryGui.instance;
		if (!Object.op_Implicit((Object)(object)instance) || !Object.op_Implicit((Object)(object)instance.m_currentContainer))
		{
			return;
		}
		Inventory inventory = ((Humanoid)Player.m_localPlayer).GetInventory();
		Inventory inventory2 = instance.m_currentContainer.GetInventory();
		if (inventory != null && inventory2 != null)
		{
			_takeMode = GetMoveMode(inventory, inventory2);
			string s = _takeMode switch
			{
				TakeMode.Stacks => "$inventory_take_stacks", 
				TakeMode.Weight => "$inventory_take_weight", 
				TakeMode.All => "$inventory_takeall", 
				_ => throw new ArgumentOutOfRangeException(), 
			};
			if (!Object.op_Implicit((Object)(object)_takeAllButtonLabel))
			{
				_takeAllButtonLabel = ((Component)instance.m_takeAllButton).GetComponentInChildren<TMP_Text>();
			}
			_takeAllButtonLabel.text = s.Localize();
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(InventoryGui), "OnTakeAll")]
	private static IEnumerable<CodeInstruction> InventoryGui_OnTakeAll_Transpiler(IEnumerable<CodeInstruction> codes)
	{
		MethodInfo methodInfo = AccessTools.Method(typeof(Inventory), "MoveAll", (Type[])null, (Type[])null);
		Action<Inventory, Inventory> action = InventoryMoveAll_Intercept;
		return Transpilers.MethodReplacer(codes, (MethodBase)methodInfo, (MethodBase)action.Method);
	}

	private static void InventoryMoveAll_Intercept(Inventory destInv, Inventory sourceInv)
	{
		if (!Configs.EnableTakeStacks.Value)
		{
			destInv.TakeAll(sourceInv);
		}
		Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(11, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Move mode: ");
			msg.AppendFormatted(_takeMode);
		}
		Logging<Plugin>.Info(msg);
		switch (_takeMode)
		{
		case TakeMode.Stacks:
			destInv.TakeStacks(sourceInv);
			break;
		case TakeMode.Weight:
			destInv.TakeWeightLimit(sourceInv);
			break;
		case TakeMode.All:
			destInv.TakeAll(sourceInv);
			break;
		default:
			throw new ArgumentOutOfRangeException();
		}
	}

	private static TakeMode GetMoveMode(Inventory destInv, Inventory sourceInv)
	{
		if (!HasIncompleteStacks())
		{
			if (!CanCarryMore())
			{
				return TakeMode.All;
			}
			return TakeMode.Weight;
		}
		return TakeMode.Stacks;
		bool CanCarryMore()
		{
			ItemData val = sourceInv.GetItemsByWeight().FirstOrDefault();
			if (val != null)
			{
				return destInv.GetTotalWeight() + val.GetWeight(-1) <= Player.m_localPlayer.GetMaxCarryWeight();
			}
			return false;
		}
		bool HasIncompleteStacks()
		{
			return GetIncompleteSourceStacks(destInv, sourceInv).Any();
		}
	}

	private static void TakeStacks(this Inventory destInv, Inventory sourceInv)
	{
		Logging<Plugin>.Info("Fill stacks");
		foreach (ItemData incompleteSourceStack in GetIncompleteSourceStacks(destInv, sourceInv))
		{
			destInv.FillStacksFrom(incompleteSourceStack);
		}
		if (Configs.StackingCombineExisting.Value)
		{
			destInv.CombineStacks();
		}
		sourceInv.m_inventory.RemoveAll((ItemData item) => item.m_shared.m_maxStackSize > 1 && item.m_stack == 0);
		InventoryChangedEvent.Invoke(destInv, sourceInv);
	}

	private static void FillStacksFrom(this Inventory destInv, ItemData sourceItem)
	{
		Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(19, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Filling stack from ");
			msg.AppendFormatted(sourceItem.GetName());
		}
		Logging<Plugin>.Info(msg);
		foreach (ItemData item in from d in destInv.GetAllItems()
			where d.IsSameName(sourceItem)
			select d)
		{
			int stack = sourceItem.m_stack;
			int val = item.m_shared.m_maxStackSize - item.m_stack;
			int num = Math.Min(stack, val);
			item.m_stack += num;
			ItemData val2 = sourceItem;
			val2.m_stack -= num;
			msg = new Logging<Plugin>.InterpolatedString(19, 2, out shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Added ");
				msg.AppendFormatted(num);
				msg.AppendLiteral(" to stack of ");
				msg.AppendFormatted(item.GetName());
			}
			Logging<Plugin>.Info(msg);
			if (sourceItem.m_stack < 0)
			{
				throw new ArgumentOutOfRangeException("sourceItem", sourceItem.m_stack, "Source stack is less than 0");
			}
			if (sourceItem.m_stack == 0)
			{
				break;
			}
		}
	}

	private static IEnumerable<ItemData> GetItemsByWeight(this Inventory inv)
	{
		return from item in inv.GetAllItems()
			orderby item.GetWeight(-1)
			select item;
	}

	private static void TakeWeightLimit(this Inventory destInv, Inventory sourceInv)
	{
		Logging<Plugin>.Info("Take weight limit");
		InventoryChangedEvent.CanInvoke = false;
		foreach (ItemData item in sourceInv.GetItemsByWeight())
		{
			destInv.UpdateTotalWeight();
			if (destInv.GetTotalWeight() + item.GetWeight(-1) <= Player.m_localPlayer.GetMaxCarryWeight())
			{
				destInv.MoveItemToThis(sourceInv, item);
				continue;
			}
			((Character)Player.m_localPlayer).Message((MessageType)2, "$se_max_carryweight", 0, (Sprite)null, false);
			break;
		}
		InventoryChangedEvent.CanInvoke = true;
		InventoryChangedEvent.Invoke(destInv, sourceInv);
	}

	private static void TakeAll(this Inventory destInv, Inventory sourceInv)
	{
		destInv.MoveAll(sourceInv);
	}

	private static IEnumerable<ItemData> GetIncompleteSourceStacks(Inventory destInv, Inventory sourceInv)
	{
		HashSet<string> incomplete = (from item in destInv.GetAllItems()
			where item.m_stack < item.m_shared.m_maxStackSize
			select item.GetPrefabName()).ToHashSet();
		return from item in sourceInv.GetItemsByWeight()
			where incomplete.Contains(item.GetPrefabName())
			select item;
	}
}
