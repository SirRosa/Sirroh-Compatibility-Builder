using System.Runtime.CompilerServices;
using HarmonyLib;

namespace AzuAutoStore.Patches.Favoriting;

[HarmonyPatch(typeof(InventoryGui), "Show")]
internal static class InventoryGuiShowPatch
{
	[HarmonyPriority(300)]
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	private static void Postfix(InventoryGui __instance)
	{
		ButtonRenderer.hasOpenedInventoryOnce = true;
		ButtonRenderer.MainButtonUpdate.UpdateInventoryGuiButtons(__instance);
	}
}
