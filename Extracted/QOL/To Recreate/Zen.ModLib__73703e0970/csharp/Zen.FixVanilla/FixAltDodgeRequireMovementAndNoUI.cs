using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using HarmonyLib;
using UnityEngine;
using Zen.Lib;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixAltDodgeRequireMovementAndNoUI
{
	[HarmonyTranspiler]
	[HarmonyPatch(typeof(PlayerController), "FixedUpdate")]
	[HarmonyPriority(700)]
	private static IEnumerable<CodeInstruction> PlayerController_FixedUpdate(IEnumerable<CodeInstruction> codes)
	{
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Expected Obj, but got Unknown
		//IL_0041: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Expected Obj, but got Unknown
		//IL_0072: Unknown result type (might be due to invalid IL or missing references)
		//IL_0078: Expected Obj, but got Unknown
		//IL_0085: Unknown result type (might be due to invalid IL or missing references)
		//IL_008b: Expected Obj, but got Unknown
		//IL_008e: Unknown result type (might be due to invalid IL or missing references)
		CodeMatch[] array = new CodeMatch[2]
		{
			new CodeMatch((OpCode?)OpCodes.Ldstr, (object)"AltDodge", (string)null),
			new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(ZInput), "GetButtonDown", (Type[])null, (Type[])null), (string)null)
		};
		Func<bool, Vector3, bool> func = InterceptButton;
		CodeInstruction[] array2 = new CodeInstruction[2]
		{
			new CodeInstruction(OpCodes.Ldloc_3, (object)null),
			new CodeInstruction(OpCodes.Call, (object)func.Method)
		};
		return new CodeMatcher(codes, (ILGenerator)null).MatchEndForward(array).ThrowIfInvalid("Unable to match IL sequence").Advance(1)
			.Insert(array2)
			.InstructionEnumeration();
		static bool InterceptButton(bool isVanillaDodgePressed, Vector3 movement)
		{
			//IL_0015: Unknown result type (might be due to invalid IL or missing references)
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			if (!ModLib.Configs.FixAltDodgeRequireMovementAndNoUI.Value)
			{
				return isVanillaDodgePressed;
			}
			if (UI.IsOpen || movement == Vector3.zero)
			{
				return false;
			}
			return ZInput.GetButton("AltDodge");
		}
	}
}
