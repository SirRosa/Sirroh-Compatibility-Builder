using System.Runtime.CompilerServices;
using AzuAutoStore.Util;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.Patches;

[HarmonyPatch(typeof(ObjectDB), "Awake")]
internal static class PredefinedGroupGrab
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	private static void Postfix(ObjectDB __instance)
	{
		if (Object.op_Implicit((Object)(object)ZNetScene.instance))
		{
			MiscFunctions.CreatePredefinedGroups(__instance);
		}
	}
}
