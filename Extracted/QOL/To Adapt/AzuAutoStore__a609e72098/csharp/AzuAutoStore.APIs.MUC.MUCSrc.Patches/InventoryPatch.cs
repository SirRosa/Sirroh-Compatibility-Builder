using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Data;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;
using AzuAutoStore.APIs.MUC.MUCSrc.Patches.Compatibility;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Patches;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[HarmonyPatch]
public static class InventoryPatch
{
	public static readonly ConditionalWeakTable<ItemData, Inventory> InventoryOfItem = new ConditionalWeakTable<ItemData, Inventory>();

	private static readonly WeakReference<ItemData> LastRemovedItem = new WeakReference<ItemData>(null);

	private static bool allowItemSwap = true;

	[HarmonyPatch(typeof(Inventory), "AddItem", new Type[]
	{
		typeof(ItemData),
		typeof(int),
		typeof(int),
		typeof(int),
		typeof(bool)
	})]
	[HarmonyPrefix]
	[HarmonyPriority(100)]
	public static void AddItem1Prefix(Inventory __instance, ref bool __runOriginal, ItemData item, int amount, int x, int y, ref bool __result)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		if (!MUCCompat.DoNotPatch && __runOriginal && InterceptAddItem(__instance, item, amount, new Vector2i(x, y), out var successfulAdded))
		{
			__result = successfulAdded;
			__runOriginal = false;
		}
	}

	[HarmonyPatch(typeof(Inventory), "AddItem", new Type[] { typeof(ItemData) })]
	[HarmonyPrefix]
	[HarmonyPriority(100)]
	public static void AddItem2Prefix(Inventory __instance, ref bool __runOriginal, ItemData item, ref bool __result)
	{
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		if (!MUCCompat.DoNotPatch && __runOriginal && InterceptAddItem(__instance, item, item.m_stack, new Vector2i(-1, -1), out var successfulAdded))
		{
			__result = successfulAdded;
			__runOriginal = false;
		}
	}

	[HarmonyPatch(typeof(Inventory), "RemoveItem", new Type[] { typeof(ItemData) })]
	[HarmonyPrefix]
	[HarmonyPriority(100)]
	public static void RemoveItemPrefix(Inventory __instance, ref bool __runOriginal, ref bool __result)
	{
		if (!MUCCompat.DoNotPatch && __runOriginal)
		{
			InventoryOwner owner = InventoryOwner.GetOwner(__instance);
			if (!owner.IgnoreInventory() && owner != null && owner.IsValid() && !owner.ZNetView.IsOwner())
			{
				__result = false;
				__runOriginal = false;
			}
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Inventory), "RemoveItem", new Type[] { typeof(ItemData) })]
	public static void RemoveItemPostfix(Inventory __instance, ItemData item, ref bool __result)
	{
		if (!MUCCompat.DoNotPatch)
		{
			if (__result)
			{
				LastRemovedItem.SetTarget(item);
			}
			else
			{
				LastRemovedItem.SetTarget(null);
			}
		}
	}

	[HarmonyPriority(800)]
	[HarmonyPrefix]
	[HarmonyPatch(typeof(Inventory), "MoveAll")]
	public static void MoveAllPrefix()
	{
		if (!MUCCompat.DoNotPatch)
		{
			allowItemSwap = false;
		}
	}

	[HarmonyPriority(0)]
	[HarmonyPostfix]
	[HarmonyPatch(typeof(Inventory), "MoveAll")]
	public static void MoveAllPostfix()
	{
		if (!MUCCompat.DoNotPatch)
		{
			allowItemSwap = true;
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Inventory), "Changed")]
	public static void AddItemPostfix(Inventory __instance)
	{
		if (MUCCompat.DoNotPatch)
		{
			return;
		}
		foreach (Inventory inventory in __instance.GetInventories())
		{
			AssignItemsOfInventory(inventory);
		}
		if (LastRemovedItem.TryGetTarget(out var target) && InventoryOwner.GetOwner(target)?.Inventory == __instance)
		{
			LastRemovedItem.SetTarget(null);
		}
	}

	[HarmonyPatch(typeof(Inventory), "AddItem", new Type[]
	{
		typeof(ItemData),
		typeof(int),
		typeof(int),
		typeof(int),
		typeof(bool)
	})]
	[HarmonyTranspiler]
	[HarmonyWrapSafe]
	public static IEnumerable<CodeInstruction> RemoveLogging(IEnumerable<CodeInstruction> instructions)
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0039: Unknown result type (might be due to invalid IL or missing references)
		//IL_003f: Expected Obj, but got Unknown
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0054: Expected Obj, but got Unknown
		if (MUCCompat.DoNotPatch)
		{
			return instructions;
		}
		return new CodeMatcher(instructions, (ILGenerator)null).MatchForward(false, new CodeMatch[1]
		{
			new CodeMatch((Func<CodeInstruction, bool>)([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (CodeInstruction i) => CodeInstructionExtensions.Calls(i, AccessTools.Method(typeof(ZLog), "Log", (Type[])null, (Type[])null))), (string)null)
		}).SetInstruction(new CodeInstruction(OpCodes.Pop, (object)null)).Instructions();
	}

	private static void AssignItemsOfInventory(Inventory inventory)
	{
		if (MUCCompat.DoNotPatch)
		{
			return;
		}
		foreach (ItemData allItem in inventory.GetAllItems())
		{
			InventoryOfItem.Remove(allItem);
			InventoryOfItem.Add(allItem, inventory);
		}
	}

	internal static bool InterceptAddItem(Inventory inventory, ItemData item, int amount, Vector2i pos, out bool successfulAdded)
	{
		//IL_0071: Unknown result type (might be due to invalid IL or missing references)
		//IL_007d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0101: Unknown result type (might be due to invalid IL or missing references)
		//IL_0107: Unknown result type (might be due to invalid IL or missing references)
		//IL_01f3: Unknown result type (might be due to invalid IL or missing references)
		//IL_0173: Unknown result type (might be due to invalid IL or missing references)
		//IL_017f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0132: Unknown result type (might be due to invalid IL or missing references)
		//IL_0137: Unknown result type (might be due to invalid IL or missing references)
		InventoryOwner owner = InventoryOwner.GetOwner(item);
		InventoryOwner owner2 = InventoryOwner.GetOwner(inventory);
		if (owner == null || !owner.IsValid() || owner2 == null || !owner2.IsValid())
		{
			successfulAdded = false;
			return false;
		}
		if (owner2.IgnoreInventory() || owner.IgnoreInventory())
		{
			successfulAdded = false;
			return false;
		}
		if (owner.ZNetView.IsOwner() && !owner2.ZNetView.IsOwner() && owner2 is ContainerInventoryOwner containerInventoryOwner)
		{
			RequestChestAdd requestChestAdd = containerInventoryOwner.Container.AddItemToChest(item, owner.Inventory, pos, owner.ZNetView.GetZDO().m_uid, amount);
			successfulAdded = requestChestAdd != null && requestChestAdd.dragItem?.m_stack == amount;
			return true;
		}
		if (!owner.ZNetView.IsOwner() && owner2.ZNetView.IsOwner() && owner is ContainerInventoryOwner containerInventoryOwner2)
		{
			ItemData val = owner2.Inventory.GetItemAt(pos.x, pos.y);
			if (val == null && LastRemovedItem.TryGetTarget(out var target) && InventoryOwner.GetOwner(target) == owner2 && target.m_gridPos == pos)
			{
				val = target;
			}
			if (!allowItemSwap && val != null)
			{
				successfulAdded = false;
				return true;
			}
			if (val != null && InventoryHelper.CanStack(item, val))
			{
				val = null;
			}
			RequestChestRemove requestChestRemove = containerInventoryOwner2.Container.RemoveItemFromChest(item, owner2.Inventory, pos, owner2.ZNetView.GetZDO().m_uid, amount, val);
			successfulAdded = requestChestRemove != null && requestChestRemove.dragAmount == amount;
			return true;
		}
		if (!owner.ZNetView.IsOwner() && !owner2.ZNetView.IsOwner() && owner is ContainerInventoryOwner containerInventoryOwner3 && owner2 is ContainerInventoryOwner containerInventoryOwner4 && (Object)(object)containerInventoryOwner3.Container == (Object)(object)containerInventoryOwner4.Container)
		{
			containerInventoryOwner3.Container.MoveItemInChest(item, pos, amount);
			successfulAdded = true;
			return true;
		}
		successfulAdded = false;
		return false;
	}
}
