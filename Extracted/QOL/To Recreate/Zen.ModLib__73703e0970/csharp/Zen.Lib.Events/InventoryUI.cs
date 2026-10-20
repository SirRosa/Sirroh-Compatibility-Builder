using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using HarmonyLib;
using UnityEngine;

namespace Zen.Lib.Events;

[HarmonyPatch]
public static class InventoryUI
{
	public static event Action<InventoryGrid, InventoryElement, ItemData?>? UpdateGridElement;

	public static event Action<InventoryGrid>? ClearGridElements;

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(InventoryGrid), "UpdateGui")]
	private static IEnumerable<CodeInstruction> InventoryGrid_UpdateGui_ClearElements(IEnumerable<CodeInstruction> codes, ILGenerator gen)
	{
		//IL_0027: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Expected Obj, but got Unknown
		//IL_0050: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Expected Obj, but got Unknown
		//IL_0081: Unknown result type (might be due to invalid IL or missing references)
		//IL_0087: Expected Obj, but got Unknown
		//IL_0094: Unknown result type (might be due to invalid IL or missing references)
		//IL_009a: Expected Obj, but got Unknown
		//IL_009d: Unknown result type (might be due to invalid IL or missing references)
		CodeMatch[] array = new CodeMatch[2]
		{
			new CodeMatch((OpCode?)OpCodes.Ldfld, (object)AccessTools.DeclaredField(typeof(InventoryGrid), "m_elements"), (string)null),
			new CodeMatch((OpCode?)OpCodes.Callvirt, (object)AccessTools.DeclaredMethod(typeof(List<InventoryElement>), "Clear", (Type[])null, (Type[])null), (string)null)
		};
		Action<InventoryGrid> action = ClearElements;
		CodeInstruction[] array2 = new CodeInstruction[2]
		{
			new CodeInstruction(OpCodes.Ldarg_0, (object)null),
			new CodeInstruction(OpCodes.Call, (object)action.Method)
		};
		return new CodeMatcher(codes, gen).MatchEndForward(array).ThrowIfInvalid("Unable to match IL sequence: clear grid elements").Advance(1)
			.Insert(array2)
			.InstructionEnumeration();
		static void ClearElements(InventoryGrid grid)
		{
			ClearGridElements?.Invoke(grid);
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(InventoryGrid), "UpdateGui")]
	private static IEnumerable<CodeInstruction> InventoryGrid_UpdateGui_LoopItems(IEnumerable<CodeInstruction> codes, ILGenerator gen)
	{
		//IL_0030: Unknown result type (might be due to invalid IL or missing references)
		//IL_0036: Expected Obj, but got Unknown
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_004a: Expected Obj, but got Unknown
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_005e: Expected Obj, but got Unknown
		//IL_0089: Unknown result type (might be due to invalid IL or missing references)
		//IL_008f: Expected Obj, but got Unknown
		//IL_009d: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a3: Expected Obj, but got Unknown
		//IL_00b1: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b7: Expected Obj, but got Unknown
		//IL_00c4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ca: Expected Obj, but got Unknown
		//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
		MethodInfo methodInfo = AccessTools.DeclaredMethod(typeof(List<ItemData>), "GetEnumerator", (Type[])null, (Type[])null);
		CodeMatch[] array = new CodeMatch[3]
		{
			new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.EnumeratorMoveNext((MethodBase)methodInfo), (string)null),
			new CodeMatch((OpCode?)OpCodes.Brtrue, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Leave, (object)null, (string)null)
		};
		Action<InventoryGrid, InventoryElement, ItemData> action = InterceptElement;
		CodeInstruction[] array2 = new CodeInstruction[4]
		{
			new CodeInstruction(OpCodes.Ldarg_0, (object)null),
			new CodeInstruction(OpCodes.Ldloc_S, (object)(byte)17),
			new CodeInstruction(OpCodes.Ldloc_S, (object)(byte)16),
			new CodeInstruction(OpCodes.Call, (object)action.Method)
		};
		return new CodeMatcher(codes, gen).End().MatchStartBackwards(array).ThrowIfInvalid("Unable to match IL sequence: end of loop ItemDrop.ItemData")
			.Insert(array2)
			.InstructionEnumeration();
		static void InterceptElement(InventoryGrid grid, InventoryElement? element, ItemData? itemData)
		{
			if ((Object)(object)element != (Object)null && itemData != null)
			{
				UpdateGridElement?.Invoke(grid, element, itemData);
			}
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(InventoryGrid), "UpdateGui")]
	private static IEnumerable<CodeInstruction> InventoryGrid_UpdateGui_LoopElements(IEnumerable<CodeInstruction> codes, ILGenerator gen)
	{
		//IL_0030: Unknown result type (might be due to invalid IL or missing references)
		//IL_0036: Expected Obj, but got Unknown
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_004a: Expected Obj, but got Unknown
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_005e: Expected Obj, but got Unknown
		//IL_0089: Unknown result type (might be due to invalid IL or missing references)
		//IL_008f: Expected Obj, but got Unknown
		//IL_009d: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a3: Expected Obj, but got Unknown
		//IL_00b0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b6: Expected Obj, but got Unknown
		//IL_00b9: Unknown result type (might be due to invalid IL or missing references)
		MethodInfo methodInfo = AccessTools.DeclaredMethod(typeof(List<InventoryElement>), "GetEnumerator", (Type[])null, (Type[])null);
		CodeMatch[] array = new CodeMatch[3]
		{
			new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.EnumeratorMoveNext((MethodBase)methodInfo), (string)null),
			new CodeMatch((OpCode?)OpCodes.Brtrue, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Leave, (object)null, (string)null)
		};
		Action<InventoryGrid, InventoryElement> action = InterceptElement;
		CodeInstruction[] array2 = new CodeInstruction[3]
		{
			new CodeInstruction(OpCodes.Ldarg_0, (object)null),
			new CodeInstruction(OpCodes.Ldloc_S, (object)(byte)19),
			new CodeInstruction(OpCodes.Call, (object)action.Method)
		};
		return new CodeMatcher(codes, gen).End().MatchStartBackwards(array).ThrowIfInvalid("Unable to match IL sequence: end of loop InventoryGrid.Element")
			.Insert(array2)
			.InstructionEnumeration();
		static void InterceptElement(InventoryGrid grid, InventoryElement? element)
		{
			if (element != null && !element.m_used)
			{
				UpdateGridElement?.Invoke(grid, element, null);
			}
		}
	}
}
