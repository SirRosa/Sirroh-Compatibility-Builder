using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using HarmonyLib;
using JetBrains.Annotations;
using UnityEngine;

namespace Zen.FixVanilla;

internal static class FixFuelLeak
{
	[HarmonyPatch]
	private static class FixSmelters
	{
		[UsedImplicitly]
		private static IEnumerable<MethodBase> TargetMethods()
		{
			return new _003C_003Ez__ReadOnlyArray<MethodBase>(new MethodBase[2]
			{
				AccessTools.DeclaredMethod(typeof(Smelter), "OnAddFuel", (Type[])null, (Type[])null),
				AccessTools.DeclaredMethod(typeof(Smelter), "OnAddOre", (Type[])null, (Type[])null)
			});
		}

		[UsedImplicitly]
		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> codes)
		{
			FieldInfo field = AccessTools.DeclaredField(typeof(Smelter), "m_nview");
			return Process(codes, field);
		}
	}

	[HarmonyPatch]
	private static class FixFireplaces
	{
		[UsedImplicitly]
		private static IEnumerable<MethodBase> TargetMethods()
		{
			return new _003C_003Ez__ReadOnlyArray<MethodBase>(new MethodBase[2]
			{
				AccessTools.DeclaredMethod(typeof(Fireplace), "Interact", (Type[])null, (Type[])null),
				AccessTools.DeclaredMethod(typeof(Fireplace), "UseItem", (Type[])null, (Type[])null)
			});
		}

		[UsedImplicitly]
		private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> codes)
		{
			FieldInfo field = AccessTools.DeclaredField(typeof(Fireplace), "m_nview");
			return Process(codes, field);
		}
	}

	private static IEnumerable<CodeInstruction> Process(IEnumerable<CodeInstruction> codes, FieldInfo field)
	{
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Expected Obj, but got Unknown
		//IL_006a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0070: Expected Obj, but got Unknown
		Func<ZNetView, ZNetView> func = ZNetViewIntercept;
		return new CodeMatcher(codes, (ILGenerator)null).End().MatchStartBackwards(new CodeMatch[1]
		{
			new CodeMatch((OpCode?)OpCodes.Ldfld, (object)field, (string)null)
		}).ThrowIfInvalid("Unable to match IL")
			.Advance(1)
			.Insert(new CodeInstruction[1]
			{
				new CodeInstruction(OpCodes.Call, (object)func.Method)
			})
			.InstructionEnumeration();
		static ZNetView ZNetViewIntercept(ZNetView nview)
		{
			if (!ModLib.Configs.FixFuelLeak.Value)
			{
				return nview;
			}
			if (Object.op_Implicit((Object)(object)nview.m_body) && nview.HasOwner())
			{
				return nview;
			}
			Logging<ModLib>.Info("Claim ZDO for fueling");
			nview.ClaimOwnership();
			return nview;
		}
	}
}
