using System;
using HarmonyLib;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixTurretLocalization
{
	[HarmonyPostfix]
	[HarmonyPatch(typeof(Localization), "Localize", new Type[] { typeof(string) })]
	private static void Localization_Localize(Localization __instance, string text, ref string __result)
	{
		if (text == "$msg_turretotherammo" && !__result.EndsWith(" "))
		{
			__result += " ";
		}
	}
}
