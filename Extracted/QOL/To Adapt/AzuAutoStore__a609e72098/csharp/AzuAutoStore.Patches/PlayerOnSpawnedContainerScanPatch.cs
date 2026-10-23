using System.Runtime.CompilerServices;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.Patches;

[HarmonyPatch(typeof(Player), "OnSpawned")]
internal static class PlayerOnSpawnedContainerScanPatch
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	private static void Postfix(Player __instance)
	{
		if (!((Object)(object)__instance != (Object)(object)Player.m_localPlayer))
		{
			Container[] array = Resources.FindObjectsOfTypeAll<Container>();
			for (int i = 0; i < array.Length; i++)
			{
				ContainerAwakePatch.TryAddContainer(array[i]);
			}
		}
	}
}
