using System.Runtime.CompilerServices;
using HarmonyLib;

namespace Recycle_N_Reclaim.GamePatches.MarkAsTrash;

[HarmonyPatch(typeof(InventoryGui), "Show")]
internal static class InventoryGuiShowPatch
{
	[HarmonyPriority(300)]
	[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
	private static void Postfix(InventoryGui __instance)
	{
		ButtonRenderer.hasOpenedInventoryOnce = true;
		ButtonRenderer.MainButtonUpdate.UpdateInventoryGuiButtons(__instance);
	}
}
