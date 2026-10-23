using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Data;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;
using AzuAutoStore.APIs.MUC.MUCSrc.Patches.Compatibility;
using HarmonyLib;
using UnityEngine;
using UnityEngine.UI;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Patches;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[HarmonyPatch]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public static class InventoryGuiPatch
{
	[HarmonyPostfix]
	[HarmonyPatch(typeof(InventoryGui), "Update")]
	public static void InventoryGuiUpdatePatch(InventoryGui __instance)
	{
		if (!MUCCompat.DoNotPatch && Object.op_Implicit((Object)(object)__instance.m_currentContainer) && Object.op_Implicit((Object)(object)__instance.m_currentContainer.m_nview) && __instance.m_currentContainer.m_nview.IsValid())
		{
			__instance.m_currentContainer.CheckForChanges();
		}
	}

	[HarmonyPatch(typeof(InventoryGui), "OnRightClickItem")]
	[HarmonyPrefix]
	public static bool InventoryGuiOnRightClickItemPatch(InventoryGui __instance, InventoryGrid grid, ItemData item)
	{
		if (MUCCompat.DoNotPatch)
		{
			return true;
		}
		Player localPlayer = Player.m_localPlayer;
		if (item == null || !Object.op_Implicit((Object)(object)localPlayer))
		{
			return true;
		}
		if (grid.GetInventory() == ((Humanoid)localPlayer).GetInventory())
		{
			return true;
		}
		if (!Object.op_Implicit((Object)(object)__instance.m_currentContainer) || __instance.m_currentContainer.IsOwner())
		{
			return true;
		}
		if (InventoryBlock.Get(((Humanoid)localPlayer).GetInventory()).BlockConsume)
		{
			return false;
		}
		if (((Humanoid)localPlayer).CanConsumeItem(item, false))
		{
			InventoryBlock.Get(((Humanoid)localPlayer).GetInventory()).BlockConsume = true;
			RequestConsume package = new RequestConsume(item);
			GamePatches.InvokeRPC(__instance.m_currentContainer.m_nview, "MUC_RequestItemConsume", package);
		}
		return false;
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(InventoryGui), "UpdateContainer")]
	public static IEnumerable<CodeInstruction> ChangeOwnerCheck(IEnumerable<CodeInstruction> instructions)
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Expected Obj, but got Unknown
		//IL_004d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0053: Expected Obj, but got Unknown
		//IL_0075: Unknown result type (might be due to invalid IL or missing references)
		//IL_007b: Expected Obj, but got Unknown
		//IL_00a9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00af: Expected Obj, but got Unknown
		if (MUCCompat.DoNotPatch)
		{
			return instructions;
		}
		return new CodeMatcher(instructions, (ILGenerator)null).MatchForward(true, new CodeMatch[3]
		{
			new CodeMatch((OpCode?)OpCodes.Ldarg_0, (object)null, (string)null),
			new CodeMatch((Func<CodeInstruction, bool>)([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (CodeInstruction i) => i.opcode == OpCodes.Ldfld && ((FieldInfo)i.operand).Name == "m_currentContainer"), (string)null),
			new CodeMatch((Func<CodeInstruction, bool>)([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (CodeInstruction i) => i.opcode == OpCodes.Callvirt && ((MethodInfo)i.operand).Name == "IsOwner"), (string)null)
		}).RemoveInstructions(1).Insert(new CodeInstruction[1]
		{
			new CodeInstruction(OpCodes.Call, (object)AccessTools.Method(typeof(InventoryGuiPatch), "CanOpenContainer", (Type[])null, (Type[])null))
		})
			.InstructionEnumeration();
	}

	public static bool CanOpenContainer(Container container)
	{
		if (container.IgnoreInventory())
		{
			return container.IsOwner();
		}
		return true;
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "OnDropOutside")]
	public static void InventoryGuiOnDropOutsidePatch(InventoryGui __instance, ref bool __runOriginal)
	{
		//IL_0077: Unknown result type (might be due to invalid IL or missing references)
		//IL_0087: Unknown result type (might be due to invalid IL or missing references)
		if (MUCCompat.DoNotPatch || !__runOriginal || !Object.op_Implicit((Object)(object)__instance.m_dragGo))
		{
			return;
		}
		if (((Humanoid)Player.m_localPlayer).GetInventory().GetInventories().Contains(__instance.m_dragInventory))
		{
			Log.LogDebug("Drop item from own inventory");
			return;
		}
		bool flag = Object.op_Implicit((Object)(object)__instance.m_currentContainer) && __instance.m_currentContainer.IsOwner();
		if (!(!Object.op_Implicit((Object)(object)__instance.m_currentContainer) | flag))
		{
			RequestDrop package = new RequestDrop(__instance.m_dragItem.m_gridPos, __instance.m_dragAmount, ((Character)Player.m_localPlayer).GetZDOID());
			GamePatches.InvokeRPC(__instance.m_currentContainer.m_nview, "MUC_RequestItemDrop", package);
			__instance.SetupDragItem((ItemData)null, (Inventory)null, 1);
			__runOriginal = false;
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Inventory), "Load", new Type[] { typeof(ZPackage) })]
	public static void InventorySelectSameItemAfterLoad(Inventory __instance)
	{
		if (!MUCCompat.DoNotPatch && Object.op_Implicit((Object)(object)InventoryGui.instance) && InventoryGui.instance.m_dragItem != null && Object.op_Implicit((Object)(object)InventoryGui.instance.m_currentContainer) && InventoryGui.instance.m_currentContainer.GetInventory() == __instance && InventoryGui.instance.m_dragInventory != null && InventoryGui.instance.m_dragInventory == __instance)
		{
			ItemData dragItem = InventoryGui.instance.m_dragItem;
			ItemData itemAt = __instance.GetItemAt(dragItem.m_gridPos.x, dragItem.m_gridPos.y);
			if (itemAt == null)
			{
				InventoryGui.instance.SetupDragItem((ItemData)null, (Inventory)null, 1);
				return;
			}
			int dragAmount = Mathf.Min(itemAt.m_stack, InventoryGui.instance.m_dragAmount);
			InventoryGui.instance.m_dragAmount = dragAmount;
			InventoryGui.instance.m_dragItem = itemAt;
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(InventoryGrid), "UpdateInventory")]
	public static void InventoryGridUpdateInventoryPatch(InventoryGrid __instance)
	{
		//IL_0030: Unknown result type (might be due to invalid IL or missing references)
		if (MUCCompat.DoNotPatch || !InventoryPreview.GetChanges(__instance.m_inventory, out var preview))
		{
			return;
		}
		foreach (InventoryElement element in __instance.m_elements)
		{
			if (preview.GetSlot(element.Position, out var item))
			{
				if (item == null)
				{
					ShowNoItem(element);
				}
				else
				{
					ShowItem(__instance, element, item);
				}
			}
		}
	}

	private static void ShowItem(InventoryGrid inventoryGrid, InventoryElement element, ItemData item)
	{
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		//IL_018e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0194: Invalid comparison between Unknown and I4
		//IL_011e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0117: Unknown result type (might be due to invalid IL or missing references)
		//IL_0276: Unknown result type (might be due to invalid IL or missing references)
		//IL_023c: Unknown result type (might be due to invalid IL or missing references)
		//IL_02bf: Unknown result type (might be due to invalid IL or missing references)
		//IL_02ad: Unknown result type (might be due to invalid IL or missing references)
		if (item?.m_shared == null)
		{
			return;
		}
		int stack = item.m_stack;
		int maxStackSize = item.m_shared.m_maxStackSize;
		((Behaviour)element.m_icon).enabled = stack > 0;
		element.m_icon.sprite = item.GetIcon();
		((Graphic)element.m_icon).color = Color.white;
		((Behaviour)element.m_amount).enabled = stack > 0 && maxStackSize > 1;
		element.m_amount.text = $"{stack}/{maxStackSize}";
		bool flag = item.m_shared.m_useDurability && item.m_durability < item.GetMaxDurability();
		((Component)element.m_durability).gameObject.SetActive(flag);
		if (flag)
		{
			if ((double)item.m_durability <= 0.0)
			{
				element.m_durability.SetValue(1f);
				element.m_durability.SetColor((Color)(((double)Mathf.Sin(Time.time * 10f) > 0.0) ? Color.red : new Color(0f, 0f, 0f, 0f)));
			}
			else
			{
				element.m_durability.SetValue(item.GetDurabilityPercentage());
				element.m_durability.ResetColor();
			}
		}
		((Behaviour)element.m_equiped).enabled = false;
		((Behaviour)element.m_queued).enabled = false;
		((Behaviour)element.m_noteleport).enabled = !item.m_shared.m_teleportable && !ZoneSystem.instance.GetGlobalKey((GlobalKeys)35);
		if ((int)item.m_shared.m_itemType == 2 && ((double)item.m_shared.m_food > 0.0 || (double)item.m_shared.m_foodStamina > 0.0 || (double)item.m_shared.m_foodEitr > 0.0))
		{
			((Behaviour)element.m_food).enabled = true;
			if ((double)item.m_shared.m_food < (double)item.m_shared.m_foodEitr / 2.0 && (double)item.m_shared.m_foodStamina < (double)item.m_shared.m_foodEitr / 2.0)
			{
				((Graphic)element.m_food).color = inventoryGrid.m_foodEitrColor;
			}
			else if ((double)item.m_shared.m_foodStamina < (double)item.m_shared.m_food / 2.0)
			{
				((Graphic)element.m_food).color = inventoryGrid.m_foodHealthColor;
			}
			else if ((double)item.m_shared.m_food < (double)item.m_shared.m_foodStamina / 2.0)
			{
				((Graphic)element.m_food).color = inventoryGrid.m_foodStaminaColor;
			}
			else
			{
				((Graphic)element.m_food).color = Color.white;
			}
		}
		else
		{
			((Behaviour)element.m_food).enabled = false;
		}
		((Behaviour)element.m_quality).enabled = item.m_shared.m_maxQuality > 1;
		if (item.m_shared.m_maxQuality > 1)
		{
			element.m_quality.text = item.m_quality.ToString();
		}
	}

	private static void ShowNoItem(InventoryElement element)
	{
		((Component)element.m_durability).gameObject.SetActive(false);
		((Behaviour)element.m_icon).enabled = false;
		((Behaviour)element.m_amount).enabled = false;
		((Behaviour)element.m_quality).enabled = false;
		((Behaviour)element.m_equiped).enabled = false;
		((Behaviour)element.m_queued).enabled = false;
		((Behaviour)element.m_noteleport).enabled = false;
		((Behaviour)element.m_food).enabled = false;
		element.m_tooltip.m_text = "";
		element.m_tooltip.m_topic = "";
	}
}
