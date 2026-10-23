using System.Runtime.CompilerServices;
using HarmonyLib;

namespace AzuAutoStore.Patches;

[HarmonyPatch(typeof(Container), "SetInUse")]
internal static class ContainerSetInUseClearWithoutOwnershipPatch
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	private static void Prefix(Container __instance, bool inUse)
	{
		if (!inUse && !__instance.m_nview.IsOwner())
		{
			__instance.m_inUse = false;
		}
	}
}
