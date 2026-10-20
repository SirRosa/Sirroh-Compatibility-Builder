using System;
using System.Collections.Generic;
using System.Reflection;
using HarmonyLib;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixToolUseRotateCamera
{
	[HarmonyTranspiler]
	[HarmonyPatch(typeof(Player), "AlwaysRotateCamera")]
	private static IEnumerable<CodeInstruction> Player_AlwaysRotateCamera(IEnumerable<CodeInstruction> codes)
	{
		MethodInfo methodInfo = AccessTools.Method(typeof(Character), "InPlaceMode", (Type[])null, (Type[])null);
		Func<Character, bool> func = InPlaceMode_Intercept;
		return Transpilers.MethodReplacer(codes, (MethodBase)methodInfo, (MethodBase)func.Method);
	}

	private static bool InPlaceMode_Intercept(Character c)
	{
		if (c.InPlaceMode())
		{
			return !Hud.IsUserHidden();
		}
		return false;
	}
}
