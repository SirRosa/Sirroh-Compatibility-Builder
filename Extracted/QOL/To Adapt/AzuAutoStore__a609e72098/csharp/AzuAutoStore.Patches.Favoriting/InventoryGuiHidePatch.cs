using System.Runtime.CompilerServices;
using HarmonyLib;

namespace AzuAutoStore.Patches.Favoriting;

[HarmonyPatch(typeof(InventoryGui), "Hide")]
internal static class InventoryGuiHidePatch
{
	[HarmonyPriority(300)]
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	private static void Postfix(InventoryGui __instance)
	{
		FavoritingMode.HasCurrentlyToggledFavoriting = false;
	}
}
