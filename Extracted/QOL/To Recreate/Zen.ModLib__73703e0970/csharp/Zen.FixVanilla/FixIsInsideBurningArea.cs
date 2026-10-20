using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using HarmonyLib;
using UnityEngine;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixIsInsideBurningArea
{
	[HarmonyTranspiler]
	[HarmonyPatch(typeof(EffectArea), "IsPointPlus025InsideBurningArea")]
	[HarmonyPriority(100)]
	private static IEnumerable<CodeInstruction> EffectArea_IsPointPlus025InsideBurningArea(IEnumerable<CodeInstruction> codes)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Expected Obj, but got Unknown
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Expected Obj, but got Unknown
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		//IL_0057: Expected Obj, but got Unknown
		//IL_0087: Unknown result type (might be due to invalid IL or missing references)
		//IL_008d: Expected Obj, but got Unknown
		//IL_009a: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a0: Expected Obj, but got Unknown
		//IL_00a3: Unknown result type (might be due to invalid IL or missing references)
		CodeMatch[] array = new CodeMatch[3]
		{
			new CodeMatch((OpCode?)OpCodes.Ldarg_0, (object)null, (string)null),
			new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(Bounds), "Contains", (Type[])null, (Type[])null), (string)null),
			new CodeMatch((OpCode?)OpCodes.Brfalse, (object)null, (string)null)
		};
		_003C_003EF_007B00000008_007D<bool, KeyValuePair<Bounds, EffectArea>, bool> obj = IsActive;
		CodeInstruction[] array2 = new CodeInstruction[2]
		{
			new CodeInstruction(OpCodes.Ldloca_S, (object)(byte)1),
			new CodeInstruction(OpCodes.Call, (object)obj.Method)
		};
		return new CodeMatcher(codes, (ILGenerator)null).MatchEndForward(array).ThrowIfInvalid("Unable to match IL sequence").Insert(array2)
			.InstructionEnumeration();
		static bool IsActive(bool inArea, ref KeyValuePair<Bounds, EffectArea> burningArea)
		{
			if (!inArea)
			{
				return false;
			}
			if (!ModLib.Configs.FixFireIsLit.Value)
			{
				return true;
			}
			EffectArea value = burningArea.Value;
			if (Object.op_Implicit((Object)(object)value))
			{
				return ((Behaviour)value).isActiveAndEnabled;
			}
			return false;
		}
	}
}
