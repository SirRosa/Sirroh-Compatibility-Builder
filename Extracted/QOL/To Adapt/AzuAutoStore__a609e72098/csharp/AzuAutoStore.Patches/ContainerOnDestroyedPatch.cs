using System.Runtime.CompilerServices;
using AzuAutoStore.Util;
using HarmonyLib;

namespace AzuAutoStore.Patches;

[HarmonyPatch(typeof(Container), "OnDestroyed")]
internal static class ContainerOnDestroyedPatch
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	private static void Postfix(Container __instance)
	{
		if (__instance.m_nview.GetZDO().GetLong(ZDOVars.s_creator, 0L) != 0L && __instance.GetInventory() != null && __instance.m_nview.IsValid())
		{
			Boxes.RemoveContainer(__instance);
		}
	}
}
