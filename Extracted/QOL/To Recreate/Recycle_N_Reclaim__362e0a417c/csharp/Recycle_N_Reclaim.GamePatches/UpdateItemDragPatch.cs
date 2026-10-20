using System.Runtime.CompilerServices;
using BepInEx.Configuration;
using HarmonyLib;
using UnityEngine;

namespace Recycle_N_Reclaim.GamePatches;

[HarmonyPatch(typeof(InventoryGui), "UpdateItemDrag")]
public static class UpdateItemDragPatch
{
	[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
	private static void Postfix(InventoryGui __instance, ItemData ___m_dragItem, Inventory ___m_dragInventory, int ___m_dragAmount, ref GameObject ___m_dragGo)
	{
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_0039: Unknown result type (might be due to invalid IL or missing references)
		if ((!Recycle_N_ReclaimPlugin.lockToAdmin.Value.IsOn() || Recycle_N_ReclaimPlugin.ConfigSyncVar.IsAdmin) && !Recycle_N_ReclaimPlugin.discardInvEnabled.Value.IsOff())
		{
			KeyboardShortcut value = Recycle_N_ReclaimPlugin.hotKey.Value;
			if (value.IsDown() && ___m_dragItem != null && ___m_dragInventory.ContainsItem(___m_dragItem))
			{
				Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)$"Discarding {___m_dragAmount}/{___m_dragItem.m_stack} {((Object)___m_dragItem.m_dropPrefab).name}");
				Utils.InventoryRecycleItem(___m_dragItem, ___m_dragAmount, ___m_dragInventory, __instance, ___m_dragGo);
				Object.Destroy((Object)(object)___m_dragGo);
				___m_dragGo = null;
				__instance.UpdateCraftingPanel(false);
			}
		}
	}
}
