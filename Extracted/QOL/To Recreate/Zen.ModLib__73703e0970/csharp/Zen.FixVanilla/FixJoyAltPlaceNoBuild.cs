using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using HarmonyLib;
using Zen.Lib;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixJoyAltPlaceNoBuild
{
	[HarmonyTranspiler]
	[HarmonyPatch(typeof(Player), "Update")]
	private static IEnumerable<CodeInstruction> Player_Update_Transpile(IEnumerable<CodeInstruction> codes)
	{
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_004b: Expected Obj, but got Unknown
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		//IL_005f: Expected Obj, but got Unknown
		//IL_006d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0073: Expected Obj, but got Unknown
		//IL_0076: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00aa: Expected Obj, but got Unknown
		Func<bool, bool> func = ApplyFix;
		CodeMatch[] array = new CodeMatch[3]
		{
			new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.Method(typeof(ZInput), "IsGamepadActive", (Type[])null, (Type[])null), (string)null),
			new CodeMatch((OpCode?)OpCodes.Brfalse, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Ldloc_0, (object)null, (string)null)
		};
		return new CodeMatcher(codes, (ILGenerator)null).MatchEndForward(array).ThrowIfInvalid("Invalid IL match sequence").Advance(1)
			.Insert(new CodeInstruction[1]
			{
				new CodeInstruction(OpCodes.Call, (object)func.Method)
			})
			.InstructionEnumeration();
	}

	private static bool ApplyFix(bool isInventoryGuiVisible)
	{
		if (!isInventoryGuiVisible)
		{
			return !UI.IsBuildModeActive;
		}
		return true;
	}
}
