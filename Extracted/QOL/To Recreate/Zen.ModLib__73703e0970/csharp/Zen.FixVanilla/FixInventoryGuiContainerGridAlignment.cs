using HarmonyLib;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixInventoryGuiContainerGridAlignment
{
	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "Show")]
	private static void InventoryGui_Show(InventoryGui __instance)
	{
		__instance.m_firstContainerUpdate = true;
	}
}
