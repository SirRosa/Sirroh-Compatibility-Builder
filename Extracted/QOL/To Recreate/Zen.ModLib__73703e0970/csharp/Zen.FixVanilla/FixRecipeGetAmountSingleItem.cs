using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using HarmonyLib;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixRecipeGetAmountSingleItem
{
	[HarmonyTranspiler]
	[HarmonyPatch(typeof(Recipe), "GetAmount")]
	private static IEnumerable<CodeInstruction> Recipe_GetAmount_Transpiler(IEnumerable<CodeInstruction> codes)
	{
		//IL_0030: Unknown result type (might be due to invalid IL or missing references)
		//IL_0036: Expected Obj, but got Unknown
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_004a: Expected Obj, but got Unknown
		//IL_006b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0071: Expected Obj, but got Unknown
		//IL_0074: Unknown result type (might be due to invalid IL or missing references)
		Func<ItemData, int> func = SingleReqItemQuality_Intercept;
		CodeMatch[] array = new CodeMatch[3]
		{
			new CodeMatch((OpCode?)OpCodes.Ldarg_3, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldind_Ref, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldfld, (object)AccessTools.Field(typeof(ItemData), "m_quality"), (string)null)
		};
		return new CodeMatcher(codes, (ILGenerator)null).End().MatchEndBackwards(array).ThrowIfInvalid("Unable to match IL")
			.Set(OpCodes.Call, (object)func.Method)
			.InstructionEnumeration();
	}

	private static int SingleReqItemQuality_Intercept(ItemData? singleReqItem)
	{
		return singleReqItem?.m_quality ?? 1;
	}
}
