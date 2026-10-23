using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using System.Runtime.CompilerServices;
using HarmonyLib;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Patches.Compatibility;

public static class QuickStackPatch
{
	[HarmonyPatch("QuickStack.QuickStackPlugin, QuickStack", "StackToMany")]
	[HarmonyTranspiler]
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	public static IEnumerable<CodeInstruction> QuickStackPatchTranspiler(IEnumerable<CodeInstruction> instructions)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Expected Obj, but got Unknown
		//IL_0044: Unknown result type (might be due to invalid IL or missing references)
		//IL_004a: Expected Obj, but got Unknown
		return new CodeMatcher(instructions, (ILGenerator)null).MatchForward(false, new CodeMatch[2]
		{
			new CodeMatch((OpCode?)OpCodes.Ldloc_S, (object)null, (string)null),
			new CodeMatch((Func<CodeInstruction, bool>)((CodeInstruction i) => i.IsVirtCall("ZNetView", "ClaimOwnership")), (string)null)
		}).RemoveInstructions(9).InstructionEnumeration();
	}
}
