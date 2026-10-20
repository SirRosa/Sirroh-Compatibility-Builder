using System.Runtime.CompilerServices;
using HarmonyLib;

namespace Recycle_N_Reclaim.GamePatches.MarkAsTrash;

[HarmonyPatch(typeof(InventoryGui), "Hide")]
internal static class InventoryGuiHidePatch
{
	[HarmonyPriority(300)]
	[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
	private static void Postfix(InventoryGui __instance)
	{
		if (__instance.m_animator.GetBool("visible"))
		{
			TrashingMode.HasCurrentlyToggledTrashing = false;
			UserConfig.ResetAllTrashing();
		}
	}
}
