using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using HarmonyLib;
using UnityEngine;

namespace ZenUI.Section;

[HarmonyPatch]
internal class StatusEffectRules
{
	[HarmonyTranspiler]
	[HarmonyPatch(typeof(SEMan), "GetHUDStatusEffects")]
	private static IEnumerable<CodeInstruction> SEMan_GetHUDStatusEffects_Transpiler(IEnumerable<CodeInstruction> codes)
	{
		//IL_0050: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Expected Obj, but got Unknown
		//IL_0066: Unknown result type (might be due to invalid IL or missing references)
		Func<StatusEffect, List<StatusEffect>, bool> func = ShowStatusEffect;
		CodeMatch[] array = new CodeMatch[3]
		{
			CodeMatch.op_Implicit(OpCodes.Ldloc_1),
			new CodeMatch((OpCode?)OpCodes.Ldfld, (object)AccessTools.Field(typeof(StatusEffect), "m_icon"), (string)null),
			CodeMatch.op_Implicit(OpCodes.Call)
		};
		return new CodeMatcher(codes, (ILGenerator)null).MatchStartForward(array).ThrowIfInvalid("Unable to match IL sequence").Advance(1)
			.SetAndAdvance(OpCodes.Ldarg_1, (object)null)
			.Set(OpCodes.Call, (object)func.Method)
			.InstructionEnumeration();
	}

	private static bool ShowStatusEffect(StatusEffect statusEffect, List<StatusEffect> effects)
	{
		if (effects == Hud.instance.m_tempStatusEffects)
		{
			if (Object.op_Implicit((Object)(object)statusEffect.m_icon))
			{
				return !Configs.HideStatusEffects.Value.Contains(statusEffect.m_name);
			}
			return false;
		}
		return Object.op_Implicit((Object)(object)statusEffect.m_icon);
	}
}
