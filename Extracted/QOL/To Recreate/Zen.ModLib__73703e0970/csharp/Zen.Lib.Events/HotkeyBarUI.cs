using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using HarmonyLib;

namespace Zen.Lib.Events;

[HarmonyPatch]
public static class HotkeyBarUI
{
	public static event Action<HotkeyBar, ElementData, ItemData?>? UpdateElement;

	public static event Action<HotkeyBar>? ClearElements;

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(HotkeyBar), "UpdateIcons")]
	private static IEnumerable<CodeInstruction> HotkeyBar_UpdateIcons_ClearElements(IEnumerable<CodeInstruction> codes, ILGenerator gen)
	{
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Expected Obj, but got Unknown
		//IL_0041: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Expected Obj, but got Unknown
		//IL_006a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0070: Expected Obj, but got Unknown
		//IL_009c: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a2: Expected Obj, but got Unknown
		//IL_00af: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b5: Expected Obj, but got Unknown
		//IL_00bc: Unknown result type (might be due to invalid IL or missing references)
		CodeMatch[] array = new CodeMatch[3]
		{
			new CodeMatch((OpCode?)OpCodes.Ldarg_0, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldfld, (object)AccessTools.DeclaredField(typeof(HotkeyBar), "m_elements"), (string)null),
			new CodeMatch((OpCode?)OpCodes.Callvirt, (object)AccessTools.DeclaredMethod(typeof(List<ElementData>), "Clear", (Type[])null, (Type[])null), (string)null)
		};
		Action<HotkeyBar> action = InterceptClearElements;
		CodeInstruction[] instructions = new CodeInstruction[2]
		{
			new CodeInstruction(OpCodes.Ldarg_0, (object)null),
			new CodeInstruction(OpCodes.Call, (object)action.Method)
		};
		return new CodeMatcher(codes, gen).MatchEndForward(array).ThrowIfInvalid("Unable to match elements.Clear IL sequence").Repeat((Action<CodeMatcher>)((CodeMatcher matcher) =>
		{
			matcher.Advance(1).Insert(instructions);
		}), (Action<string>)null)
			.InstructionEnumeration();
		static void InterceptClearElements(HotkeyBar bar)
		{
			ClearElements?.Invoke(bar);
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(HotkeyBar), "UpdateIcons")]
	private static IEnumerable<CodeInstruction> HotkeyBar_UpdateIcons_LoopItems(IEnumerable<CodeInstruction> codes, ILGenerator gen)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Expected Obj, but got Unknown
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Expected Obj, but got Unknown
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Expected Obj, but got Unknown
		//IL_0050: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Expected Obj, but got Unknown
		//IL_0064: Unknown result type (might be due to invalid IL or missing references)
		//IL_006a: Expected Obj, but got Unknown
		//IL_0078: Unknown result type (might be due to invalid IL or missing references)
		//IL_007e: Expected Obj, but got Unknown
		//IL_009f: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a5: Expected Obj, but got Unknown
		//IL_00d0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d6: Expected Obj, but got Unknown
		//IL_00e4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ea: Expected Obj, but got Unknown
		//IL_00f8: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fe: Expected Obj, but got Unknown
		//IL_010b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0111: Expected Obj, but got Unknown
		//IL_0114: Unknown result type (might be due to invalid IL or missing references)
		CodeMatch[] array = new CodeMatch[7]
		{
			new CodeMatch((OpCode?)OpCodes.Ldloc_S, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldc_I4_1, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Add, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Stloc_S, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldloc_S, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldarg_0, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldfld, (object)AccessTools.DeclaredField(typeof(HotkeyBar), "m_items"), (string)null)
		};
		Action<HotkeyBar, ItemData, ElementData> action = InterceptLoopItem;
		CodeInstruction[] array2 = new CodeInstruction[4]
		{
			new CodeInstruction(OpCodes.Ldarg_0, (object)null),
			new CodeInstruction(OpCodes.Ldloc_S, (object)(byte)12),
			new CodeInstruction(OpCodes.Ldloc_S, (object)(byte)13),
			new CodeInstruction(OpCodes.Call, (object)action.Method)
		};
		return new CodeMatcher(codes, gen).End().MatchStartBackwards(array).ThrowIfInvalid("Unable to match loop-next IL sequence")
			.Advance(4)
			.Insert(array2)
			.InstructionEnumeration();
		static void InterceptLoopItem(HotkeyBar bar, ItemData? item, ElementData element)
		{
			UpdateElement?.Invoke(bar, element, item);
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(HotkeyBar), "UpdateIcons")]
	private static IEnumerable<CodeInstruction> HotkeyBar_UpdateIcons_LoopElements(IEnumerable<CodeInstruction> codes, ILGenerator gen)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Expected Obj, but got Unknown
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Expected Obj, but got Unknown
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Expected Obj, but got Unknown
		//IL_0050: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Expected Obj, but got Unknown
		//IL_0064: Unknown result type (might be due to invalid IL or missing references)
		//IL_006a: Expected Obj, but got Unknown
		//IL_0078: Unknown result type (might be due to invalid IL or missing references)
		//IL_007e: Expected Obj, but got Unknown
		//IL_009f: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a5: Expected Obj, but got Unknown
		//IL_00d0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d6: Expected Obj, but got Unknown
		//IL_00e4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ea: Expected Obj, but got Unknown
		//IL_00f7: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fd: Expected Obj, but got Unknown
		//IL_0100: Unknown result type (might be due to invalid IL or missing references)
		CodeMatch[] array = new CodeMatch[7]
		{
			new CodeMatch((OpCode?)OpCodes.Ldloc_S, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldc_I4_1, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Add, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Stloc_S, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldloc_S, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldarg_0, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldfld, (object)AccessTools.DeclaredField(typeof(HotkeyBar), "m_elements"), (string)null)
		};
		Action<HotkeyBar, ElementData> action = InterceptLoopElement;
		CodeInstruction[] array2 = new CodeInstruction[3]
		{
			new CodeInstruction(OpCodes.Ldarg_0, (object)null),
			new CodeInstruction(OpCodes.Ldloc_S, (object)(byte)16),
			new CodeInstruction(OpCodes.Call, (object)action.Method)
		};
		return new CodeMatcher(codes, gen).End().MatchStartBackwards(array).ThrowIfInvalid("Unable to match loop-next IL sequence")
			.Advance(4)
			.Insert(array2)
			.InstructionEnumeration();
		static void InterceptLoopElement(HotkeyBar bar, ElementData element)
		{
			if (!element.m_used)
			{
				UpdateElement?.Invoke(bar, element, null);
			}
		}
	}
}
