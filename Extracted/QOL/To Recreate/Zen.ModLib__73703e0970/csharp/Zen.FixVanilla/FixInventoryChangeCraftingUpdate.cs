using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using HarmonyLib;
using Zen.Lib;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixInventoryChangeCraftingUpdate
{
	[HarmonyPostfix]
	[HarmonyPatch(typeof(InventoryGui), "OnTakeAll")]
	private static void InventoryGui_OnTakeAll()
	{
		InventoryGui.instance.UpdateCraftingPanel(false);
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(InventoryGui), "OnStackAll")]
	private static void InventoryGui_OnStackAll()
	{
		InventoryGui.instance.UpdateCraftingPanel(false);
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Inventory), "MoveItemToThis", new Type[]
	{
		typeof(Inventory),
		typeof(ItemData)
	})]
	private static void Inventory_MoveItemToThis(Inventory __instance)
	{
		if (!InventoryGui.IsVisible())
		{
			return;
		}
		InventoryGui instance = InventoryGui.instance;
		if (__instance != instance.m_playerGrid.GetInventory())
		{
			InventoryGrid containerGrid = instance.m_containerGrid;
			if (__instance != ((containerGrid != null) ? containerGrid.GetInventory() : null))
			{
				return;
			}
		}
		InventoryGui.instance.UpdateCraftingPanel(false);
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Humanoid), "DropItem")]
	private static void Humanoid_DropItem(Humanoid __instance, bool __result)
	{
		if (Player.m_localPlayer.Is((Character)(object)__instance) && InventoryGui.IsVisible() && __result)
		{
			InventoryGui.instance.UpdateCraftingPanel(false);
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(InventoryGui), "OnDropOutside")]
	private static IEnumerable<CodeInstruction> InventoryGui_OnDropOutside_Transpiler(IEnumerable<CodeInstruction> codes)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Expected Obj, but got Unknown
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Expected Obj, but got Unknown
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		//IL_0057: Expected Obj, but got Unknown
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		CodeMatch[] array = new CodeMatch[3]
		{
			new CodeMatch((OpCode?)OpCodes.Ldarg_0, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldc_I4_0, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.Method(typeof(InventoryGui), "UpdateCraftingPanel", (Type[])null, (Type[])null), (string)null)
		};
		return new CodeMatcher(codes, (ILGenerator)null).End().MatchStartBackwards(array).ThrowIfInvalid("Unable to match IL sequence")
			.SetAndAdvance(OpCodes.Nop, (object)null)
			.SetAndAdvance(OpCodes.Nop, (object)null)
			.SetAndAdvance(OpCodes.Nop, (object)null)
			.InstructionEnumeration();
	}
}
