using System.Runtime.CompilerServices;
using HarmonyLib;
using Recycle_N_Reclaim.GamePatches.Recycling;
using UnityEngine;

namespace Recycle_N_Reclaim.YAMLStuff;

[HarmonyPatch(typeof(ObjectDB), "Awake")]
internal static class PredefinedGroupGrab
{
	[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
	[HarmonyPriority(0)]
	private static void Postfix(ObjectDB __instance)
	{
		if (Object.op_Implicit((Object)(object)ZNetScene.instance))
		{
			GroupUtils.CreatePredefinedGroups(__instance);
			Reclaimer.BuildRecipeCache(__instance);
		}
	}
}
