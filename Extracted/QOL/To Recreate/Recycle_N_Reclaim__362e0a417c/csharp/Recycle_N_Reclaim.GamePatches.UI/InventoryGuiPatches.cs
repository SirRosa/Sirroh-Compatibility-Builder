using System;
using System.Runtime.CompilerServices;
using HarmonyLib;
using Recycle_N_Reclaim.Managers;
using UnityEngine;

namespace Recycle_N_Reclaim.GamePatches.UI;

[HarmonyPatch]
[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
public static class InventoryGuiPatches
{
	[HarmonyPatch(typeof(InventoryGui), "OnTabCraftPressed")]
	[HarmonyPatch(typeof(InventoryGui), "OnTabUpgradePressed")]
	[HarmonyPriority(600)]
	[HarmonyPrefix]
	private static void OnTabCraftPressedAlsoEnableRecycling1(InventoryGui __instance)
	{
		Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder.SetInteractable(interactable: true);
		__instance.UpdateCraftingPanel(false);
	}

	[HarmonyPatch(typeof(InventoryGui), "UpdateCraftingPanel")]
	[HarmonyPrefix]
	private static bool UpdateCraftingPanelDetourOnRecyclingTab(InventoryGui __instance)
	{
		if (Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder.InRecycleTab())
		{
			return false;
		}
		return true;
	}

	[HarmonyPatch(typeof(InventoryGui), "Hide")]
	[HarmonyPrefix]
	private static void OnHideSetToCraftingTab(InventoryGui __instance)
	{
		if (!((Object)(object)Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder == (Object)null) && Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder.InRecycleTab())
		{
			InventoryGui.instance.OnTabCraftPressed();
			Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder.SetActive(active: false);
		}
	}

	[HarmonyPatch(typeof(InventoryGui), "UpdateCraftingPanel")]
	[HarmonyPostfix]
	private static void UpdateCraftingPanelDetourOnOtherTabsEnableRecyclingButton(InventoryGui __instance)
	{
		if (!Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder.InRecycleTab())
		{
			Player localPlayer = Player.m_localPlayer;
			Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder.SetInteractable(interactable: true);
			if (!Object.op_Implicit((Object)(object)localPlayer.GetCurrentCraftingStation()) && !localPlayer.NoCostCheat())
			{
				Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder.SetActive(active: false);
			}
			else
			{
				Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder.SetActive(active: true);
			}
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "UpdateRecipe", new Type[]
	{
		typeof(Player),
		typeof(float)
	})]
	private static bool UpdateRecipeOnRecyclingTab(InventoryGui __instance, Player player, float dt)
	{
		if (!Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder.InRecycleTab())
		{
			return true;
		}
		Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder.UpdateRecipe(player, dt);
		return false;
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Inventory), "Changed")]
	private static void InventorySave(Inventory __instance)
	{
		if (!((Object)(object)Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder == (Object)null) && Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder.InRecycleTab() && __instance == ((Humanoid)Player.m_localPlayer).GetInventory() && Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder.HasInventoryChanged(__instance))
		{
			Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder.UpdateRecyclingList();
			InventoryGui.instance.SetRecipe(-1, false);
		}
	}

	[HarmonyPatch(typeof(InventoryGui), "Update")]
	[HarmonyPostfix]
	private static void OnInventoryGuiUpdate()
	{
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		if (InventoryGui.IsVisible() && !((Object)(object)Player.m_localPlayer == (Object)null) && Recycle_N_ReclaimPlugin.UndoRecycleKeybind.Value.IsKeyDown() && RecycleUndoManager.CanUndo)
		{
			RecycleUndoManager.TryUndo();
		}
	}

	[HarmonyPatch(typeof(Humanoid), "EquipItem", new Type[]
	{
		typeof(ItemData),
		typeof(bool)
	})]
	[HarmonyPatch(typeof(Humanoid), "UnequipItem", new Type[]
	{
		typeof(ItemData),
		typeof(bool)
	})]
	[HarmonyPostfix]
	private static void HumanoidEquip(Humanoid __instance)
	{
		if (!((Object)(object)Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder == (Object)null) && !((Object)(object)__instance != (Object)(object)Player.m_localPlayer) && Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder.InRecycleTab() && __instance.GetInventory() == ((Humanoid)Player.m_localPlayer).GetInventory())
		{
			Recycle_N_ReclaimPlugin.RecyclingTabButtonHolder.UpdateRecyclingList();
			InventoryGui.instance.SetRecipe(-1, false);
		}
	}
}
