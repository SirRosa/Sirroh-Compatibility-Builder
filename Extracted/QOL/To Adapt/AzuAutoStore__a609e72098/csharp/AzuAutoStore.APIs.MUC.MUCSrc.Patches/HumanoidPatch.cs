using System.Runtime.CompilerServices;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Patches;

[HarmonyPatch]
public static class HumanoidPatch
{
	[HarmonyPostfix]
	[HarmonyPatch(typeof(Humanoid), "Awake")]
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	public static void HumanoidAwakePatch(Humanoid __instance)
	{
		if (!MUCCompat.DoNotPatch)
		{
			((Component)__instance).gameObject.AddComponent<HumanoidExtend>();
		}
	}
}
