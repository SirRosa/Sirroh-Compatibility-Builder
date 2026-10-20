using HarmonyLib;

namespace QuickStackStore;

[HarmonyPatch(typeof(Container))]
internal static class PatchContainer
{
	[HarmonyPatch("Awake")]
	[HarmonyPostfix]
	internal static void Awake(Container __instance)
	{
		ContainerFinder.AllContainers.Add(__instance);
	}

	[HarmonyPatch("OnDestroyed")]
	[HarmonyPostfix]
	internal static void OnDestroyed(Container __instance)
	{
		ContainerFinder.AllContainers.Remove(__instance);
	}
}
