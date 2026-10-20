using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using HarmonyLib;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixTextInputInventoryHide
{
	[HarmonyTranspiler]
	[HarmonyPatch(typeof(InventoryGui), "Update")]
	[HarmonyPriority(100)]
	private static IEnumerable<CodeInstruction> InventoryGui_Update_Transpiler(IEnumerable<CodeInstruction> codes)
	{
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		//IL_0027: Expected Obj, but got Unknown
		//IL_0061: Unknown result type (might be due to invalid IL or missing references)
		CodeMatch val = new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.Method(typeof(InventoryGui), "Hide", (Type[])null, (Type[])null), (string)null);
		Action<InventoryGui> action = InventoryGui_HideCancel_Intercept;
		Action<InventoryGui> action2 = InventoryGui_HideForce_Intercept;
		return new CodeMatcher(codes, (ILGenerator)null).MatchStartForward(new CodeMatch[1] { val }).ThrowIfInvalid("Unable to match first IL").Set(OpCodes.Call, (object)action2.Method)
			.MatchStartForward(new CodeMatch[1] { val })
			.ThrowIfInvalid("Unable to match second IL")
			.Set(OpCodes.Call, (object)action.Method)
			.InstructionEnumeration();
	}

	private static void InventoryGui_HideForce_Intercept(InventoryGui gui)
	{
		if (TextInput.IsVisible())
		{
			TextInput.instance.Hide();
		}
		gui.Hide();
	}

	private static void InventoryGui_HideCancel_Intercept(InventoryGui gui)
	{
		if (!TextInput.IsVisible())
		{
			gui.Hide();
		}
	}
}
