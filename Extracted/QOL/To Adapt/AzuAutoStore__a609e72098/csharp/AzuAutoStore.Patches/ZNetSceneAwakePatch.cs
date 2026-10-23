using System.Runtime.CompilerServices;
using AzuAutoStore.Util;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.Patches;

[HarmonyPatch(typeof(ZNetScene), "Awake")]
internal static class ZNetSceneAwakePatch
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	private static void Postfix(ZNetScene __instance)
	{
		Container[] array = Resources.FindObjectsOfTypeAll<Container>();
		foreach (Container val in array)
		{
			Functions.LogIfBuildDebug("Found container by the name of " + ((Object)val).name + " in your game.");
		}
	}
}
