using System;
using System.Collections.Generic;
using System.Reflection;
using BepInEx;
using HarmonyLib;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixBlankPlayerKey
{
	[HarmonyTranspiler]
	[HarmonyPatch(typeof(Player), "AddUniqueKey")]
	private static IEnumerable<CodeInstruction> Player_AddUniqueKey_Transpiler(IEnumerable<CodeInstruction> codes)
	{
		MethodInfo methodInfo = AccessTools.Method(typeof(HashSet<string>), "Contains", (Type[])null, (Type[])null);
		Func<HashSet<string>, string, bool> func = HashSet_Contains_Intercept;
		return Transpilers.MethodReplacer(codes, (MethodBase)methodInfo, (MethodBase)func.Method);
	}

	private static bool HashSet_Contains_Intercept(HashSet<string> self, string? item)
	{
		Logging<ModLib>.Info("Fixed: Player key can not be blank");
		self.Remove(string.Empty);
		self.Remove(null);
		if (!Utility.IsNullOrWhiteSpace(item))
		{
			return self.Contains(item);
		}
		return true;
	}
}
