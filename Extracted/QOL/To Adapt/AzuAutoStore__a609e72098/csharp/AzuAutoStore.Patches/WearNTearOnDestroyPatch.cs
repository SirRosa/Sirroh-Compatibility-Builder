using System.Collections.Generic;
using System.Runtime.CompilerServices;
using AzuAutoStore.Util;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.Patches;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[HarmonyPatch(typeof(WearNTear), "OnDestroy")]
internal static class WearNTearOnDestroyPatch
{
	private static readonly List<Container> Found = new List<Container>();

	private static void Prefix(WearNTear __instance)
	{
		if (Boxes.Containers.Count != 0)
		{
			Found.Clear();
			((Component)__instance).GetComponentsInChildren<Container>(Found);
			for (int i = 0; i < Found.Count; i++)
			{
				Boxes.RemoveContainer(Found[i]);
			}
			Found.Clear();
			((Component)__instance).GetComponentsInParent<Container>(false, Found);
			for (int j = 0; j < Found.Count; j++)
			{
				Boxes.RemoveContainer(Found[j]);
			}
			Found.Clear();
		}
	}
}
