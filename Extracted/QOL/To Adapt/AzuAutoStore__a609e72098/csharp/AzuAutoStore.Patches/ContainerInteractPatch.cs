using System.Runtime.CompilerServices;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.Patches;

[HarmonyPatch(typeof(Container), "Interact")]
internal static class ContainerInteractPatch
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	private static void Postfix(Container __instance, Humanoid character, bool hold, bool alt)
	{
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		long playerID = Game.instance.GetPlayerProfile().GetPlayerID();
		if ((!__instance.m_checkGuardStone || PrivateArea.CheckAccess(((Component)__instance).transform.position, 0f, true, false)) && __instance.CheckAccess(playerID))
		{
			ContainerAwakePatch.TryAddContainer(__instance);
		}
	}
}
