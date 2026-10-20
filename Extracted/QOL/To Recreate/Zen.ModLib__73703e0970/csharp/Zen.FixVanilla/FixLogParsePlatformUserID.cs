using System;
using System.Collections.Generic;
using System.Reflection;
using HarmonyLib;
using UnityEngine;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixLogParsePlatformUserID
{
	[HarmonyTranspiler]
	[HarmonyPatch(/*Could not decode attribute arguments.*/)]
	[HarmonyPriority(0)]
	private static IEnumerable<CodeInstruction> PlatformUserID_Transpiler(IEnumerable<CodeInstruction> codes)
	{
		MethodInfo methodInfo = AccessTools.Method(typeof(Debug), "Log", new Type[1] { typeof(object) }, (Type[])null);
		Action<object> action = DebugLog_Intercept;
		return Transpilers.MethodReplacer(codes, (MethodBase)methodInfo, (MethodBase)action.Method);
	}

	private static void DebugLog_Intercept(object message)
	{
		if (Logging<ModLib>.IsEnabled)
		{
			Debug.Log(message);
		}
	}
}
