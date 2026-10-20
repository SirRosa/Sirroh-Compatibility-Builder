using System.Collections.Generic;
using System.Runtime.CompilerServices;
using HarmonyLib;
using UnityEngine;
using UnityEngine.UI;

namespace Recycle_N_Reclaim.GamePatches.MarkAsTrash;

[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
[HarmonyPatch(typeof(InventoryGrid), "UpdateGui")]
internal static class InventoryGridUpdateGuiPatch
{
	public static Sprite border;

	[HarmonyAfter(new string[] { "Azumatt.AzuAutoStore", "goldenrevolver.quick_stack_store" })]
	internal static void Postfix(Player player, Inventory ___m_inventory, List<InventoryElement> ___m_elements)
	{
		//IL_00f2: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d6: Unknown result type (might be due to invalid IL or missing references)
		//IL_0106: Unknown result type (might be due to invalid IL or missing references)
		//IL_0145: Unknown result type (might be due to invalid IL or missing references)
		//IL_00af: Unknown result type (might be due to invalid IL or missing references)
		//IL_00be: Unknown result type (might be due to invalid IL or missing references)
		//IL_0187: Unknown result type (might be due to invalid IL or missing references)
		if ((Object)(object)player == (Object)null || ((Humanoid)player).m_inventory != ___m_inventory)
		{
			return;
		}
		int width = ___m_inventory.GetWidth();
		UserConfig playerConfig = UserConfig.GetPlayerConfig(player.GetPlayerID());
		for (int i = 0; i < ___m_inventory.GetHeight(); i++)
		{
			for (int num = 0; num < ___m_inventory.GetWidth(); num++)
			{
				int index = i * width + num;
				Image val3;
				if (((Component)___m_elements[index].m_queued).transform.childCount > 0)
				{
					Transform val = Utils.FindChild(((Component)___m_elements[index].m_queued).transform, "RecycleNReclaimBorderImage", (IterativeSearchType)0);
					Image val2 = ((val != null) ? ((Component)val).GetComponent<Image>() : null);
					if (val2 != null)
					{
						val3 = val2;
						goto IL_009e;
					}
				}
				val3 = CreateBorderImage(___m_elements[index].m_queued);
				goto IL_009e;
				IL_009e:
				if ((Object)(object)val3 != (Object)null)
				{
					((Graphic)val3).color = Recycle_N_ReclaimPlugin.BorderColorTrashedSlot.Value;
					((Behaviour)val3).enabled = playerConfig.IsSlotTrashed(new Vector2i(num, i));
				}
			}
		}
		if (Recycle_N_ReclaimPlugin.TrashingModifierKeybind1.Value.IsKeyHeld() && Recycle_N_ReclaimPlugin.TrashingKeybind.Value.IsKeyDown())
		{
			List<ItemData> list = new List<ItemData>();
			List<ItemData> allItems = ___m_inventory.GetAllItems();
			for (int j = 0; j < allItems.Count; j++)
			{
				ItemData val4 = allItems[j];
				if (UserConfig.GetPlayerConfig(Player.m_localPlayer.GetPlayerID()).IsSlotTrashed(val4.m_gridPos))
				{
					list.Add(val4);
				}
			}
			for (int k = 0; k < list.Count; k++)
			{
				ItemData val5 = list[k];
				Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)$"Recycling item at grid position {val5.m_gridPos}");
				Utils.InventoryRecycleItem(val5, val5.m_stack, ___m_inventory, null, null);
			}
			Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)"Resetting all MarkAsTrash data!");
			UserConfig.ResetAllTrashing();
		}
		if (!Recycle_N_ReclaimPlugin.TrashingModifierKeybind1.Value.IsKeyHeld())
		{
			TrashingMode.HasCurrentlyToggledTrashing = false;
			UserConfig.ResetAllTrashing();
		}
	}

	private static Image CreateBorderImage(Image baseImg)
	{
		//IL_0026: Unknown result type (might be due to invalid IL or missing references)
		Image val = Object.Instantiate<Image>(baseImg, ((Component)baseImg).transform.parent);
		foreach (Transform item in ((Component)val).transform)
		{
			Object.Destroy((Object)(object)((Component)item).gameObject);
		}
		((Object)val).name = "RecycleNReclaimBorderImage";
		((Component)val).transform.SetParent(((Component)baseImg).transform);
		val.sprite = border;
		return val;
	}
}
