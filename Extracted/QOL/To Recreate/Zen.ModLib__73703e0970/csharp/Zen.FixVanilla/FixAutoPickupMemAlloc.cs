using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using HarmonyLib;
using UnityEngine;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixAutoPickupMemAlloc
{
	private static readonly Collider[] Buffer = new Collider[1024];

	private static int _count;

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(Player), "AutoPickup")]
	private static IEnumerable<CodeInstruction> Player_AutoPickup_Transpiler(IEnumerable<CodeInstruction> codes)
	{
		MethodInfo methodInfo = AccessTools.Method(typeof(Physics), "OverlapSphere", new Type[3]
		{
			typeof(Vector3),
			typeof(float),
			typeof(int)
		}, (Type[])null);
		Func<Vector3, float, int, Collider[]> func = OverlapSphere_Intercept;
		Func<Array, int> getCount = GetCount;
		return Transpilers.Manipulator(Transpilers.MethodReplacer(codes, (MethodBase)methodInfo, (MethodBase)func.Method), (Func<CodeInstruction, bool>)((CodeInstruction code) => code.opcode == OpCodes.Ldlen), (Action<CodeInstruction>)((CodeInstruction code) =>
		{
			code.opcode = OpCodes.Call;
			code.operand = getCount.Method;
		}));
	}

	private static Collider[] OverlapSphere_Intercept(Vector3 center, float radius, int layerMask)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		_count = Physics.OverlapSphereNonAlloc(center, radius, Buffer, layerMask);
		return Buffer;
	}

	private static int GetCount(Array a)
	{
		if (Buffer != a)
		{
			return a.Length;
		}
		return _count;
	}
}
