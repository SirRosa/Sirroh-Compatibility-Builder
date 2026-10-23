using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;
using BepInEx.Bootstrap;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Patches.Compatibility;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public static class ItemDrawerCompat
{
	private static Type drawerContainerType;

	private static FieldRef<object, ItemData> drawerField_item;

	static ItemDrawerCompat()
	{
		if (Chainloader.PluginInfos.ContainsKey("mkz.itemdrawers"))
		{
			drawerContainerType = AccessTools.TypeByName("DrawerContainer, itemdrawers");
			drawerField_item = AccessTools.FieldRefAccess<ItemData>(drawerContainerType, "_item");
		}
	}

	public static bool IsItemDrawer(Container container)
	{
		if (drawerContainerType != null)
		{
			return Object.op_Implicit((Object)(object)((Component)container).GetComponent(drawerContainerType));
		}
		return false;
	}

	[HarmonyPatch("DrawerContainer, itemdrawers", "OnInventoryChanged")]
	[HarmonyPrefix]
	public static void UpdateItemOfDrawer(Container __instance)
	{
		if (!MUCCompat.DoNotPatch && __instance.m_inventory.m_inventory.Count != 0 && __instance.m_inventory.m_inventory[0] != null)
		{
			drawerField_item.Invoke((object)__instance) = __instance.m_inventory.m_inventory[0].Clone();
		}
	}

	[HarmonyPriority(700)]
	[HarmonyPatch(typeof(Inventory), "AddItem", new Type[] { typeof(ItemData) })]
	[HarmonyPatch(typeof(Inventory), "AddItem", new Type[]
	{
		typeof(ItemData),
		typeof(int),
		typeof(int),
		typeof(int),
		typeof(bool)
	})]
	[HarmonyPrefix]
	public static bool PreventItemAdd(Inventory __instance, ItemData item)
	{
		if (MUCCompat.DoNotPatch)
		{
			return true;
		}
		if (InventoryOwner.GetOwner(__instance) is ContainerInventoryOwner { IsItemDrawer: not false } containerInventoryOwner)
		{
			ItemData val = drawerField_item.Invoke((object)containerInventoryOwner.Container);
			if (val != null && val.PrefabName() != item?.PrefabName())
			{
				Log.LogInfo("PreventItemAdd: " + val.PrefabName() + " != " + item?.PrefabName());
				return false;
			}
		}
		return true;
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Inventory), "CanAddItem", new Type[]
	{
		typeof(ItemData),
		typeof(int)
	})]
	public static void CanAddItem(Inventory __instance, ref bool __result, ItemData item)
	{
		if (!MUCCompat.DoNotPatch && __result && InventoryOwner.GetOwner(__instance) is ContainerInventoryOwner { IsItemDrawer: not false } containerInventoryOwner)
		{
			ItemData val = drawerField_item.Invoke((object)containerInventoryOwner.Container);
			__result = val == null || val.PrefabName() == item?.PrefabName();
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch("DrawerContainer, itemdrawers", "AddItem")]
	public static IEnumerable<CodeInstruction> CloneItemBeforeAssignmentTranspiler(IEnumerable<CodeInstruction> instructions)
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_003e: Expected Obj, but got Unknown
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0060: Expected Obj, but got Unknown
		//IL_008e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0094: Expected Obj, but got Unknown
		if (MUCCompat.DoNotPatch)
		{
			return instructions;
		}
		return new CodeMatcher(instructions, (ILGenerator)null).MatchForward(false, new CodeMatch[2]
		{
			new CodeMatch((OpCode?)OpCodes.Ldfld, (object)AccessTools.Field(typeof(ItemDrop), "m_itemData"), (string)null),
			new CodeMatch((OpCode?)OpCodes.Stfld, (object)AccessTools.Field(drawerContainerType, "_item"), (string)null)
		}).Advance(1).InsertAndAdvance(new CodeInstruction[1]
		{
			new CodeInstruction(OpCodes.Call, (object)AccessTools.Method(typeof(InventoryHelper), "CloneDeeper", (Type[])null, (Type[])null))
		})
			.InstructionEnumeration();
	}
}
