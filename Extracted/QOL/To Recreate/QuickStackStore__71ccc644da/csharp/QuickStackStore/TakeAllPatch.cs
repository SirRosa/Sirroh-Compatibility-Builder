using HarmonyLib;
using UnityEngine;

namespace QuickStackStore;

[HarmonyPatch(typeof(InventoryGui))]
internal class TakeAllPatch
{
	[HarmonyPatch("OnTakeAll")]
	[HarmonyPrefix]
	internal static bool ContextSensitiveTakeAll(InventoryGui __instance)
	{
		if (!QSSConfig.StoreTakeAllConfig.ChestsUseImprovedTakeAllLogic.Value)
		{
			return true;
		}
		if (!Object.op_Implicit((Object)(object)__instance.m_currentContainer) || Object.op_Implicit((Object)(object)((Component)__instance.m_currentContainer).GetComponent<TombStone>()))
		{
			return true;
		}
		StoreTakeAllModule.TakeAllItemsInOrder(Player.m_localPlayer);
		return false;
	}
}
