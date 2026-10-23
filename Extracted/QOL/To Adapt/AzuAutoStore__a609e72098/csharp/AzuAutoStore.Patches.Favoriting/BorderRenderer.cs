using System.Collections.Generic;
using System.Runtime.CompilerServices;
using HarmonyLib;
using UnityEngine;
using UnityEngine.UI;

namespace AzuAutoStore.Patches.Favoriting;

[HarmonyPatch(typeof(InventoryGrid), "UpdateGui")]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
internal static class BorderRenderer
{
	public static Sprite Border;

	public const string BorderName = "AzuAutoStoreFavoritingBorder";

	[HarmonyAfter(new string[] { "goldenrevolver.quick_stack_store" })]
	[HarmonyPostfix]
	[HarmonyPriority(300)]
	private static void UpdateGui(InventoryGrid __instance, Player player, Inventory ___m_inventory, List<InventoryElement> ___m_elements)
	{
		//IL_00b6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c3: Unknown result type (might be due to invalid IL or missing references)
		//IL_01bd: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b1: Unknown result type (might be due to invalid IL or missing references)
		if ((Object)(object)player == (Object)null || ((Humanoid)player).m_inventory != ___m_inventory)
		{
			return;
		}
		int width = ___m_inventory.GetWidth();
		UserConfig playerConfig = UserConfig.GetPlayerConfig(player.GetPlayerID());
		for (int i = 0; i < ___m_inventory.GetHeight(); i++)
		{
			for (int j = 0; j < ___m_inventory.GetWidth(); j++)
			{
				int index = i * width + j;
				Image val = ((((Component)___m_elements[index].m_queued).transform.childCount > 0 && (Object)(object)Utils.FindChild(((Component)___m_elements[index].m_queued).transform, "AzuAutoStoreFavoritingBorder", (IterativeSearchType)0) != (Object)null) ? ((Component)Utils.FindChild(((Component)___m_elements[index].m_queued).transform, "AzuAutoStoreFavoritingBorder", (IterativeSearchType)0)).GetComponent<Image>() : CreateBorderImage(___m_elements[index].m_queued));
				((Graphic)val).color = AzuAutoStorePlugin.BorderColorFavoritedSlot.Value;
				((Behaviour)val).enabled = playerConfig.IsSlotFavorited(new Vector2i(j, i));
			}
		}
		foreach (ItemData item in ___m_inventory.m_inventory)
		{
			int index2 = item.GridVectorToGridIndex(width);
			Image val2 = ((((Component)___m_elements[index2].m_queued).transform.childCount > 0 && (Object)(object)Utils.FindChild(((Component)___m_elements[index2].m_queued).transform, "AzuAutoStoreFavoritingBorder", (IterativeSearchType)0) != (Object)null) ? ((Component)Utils.FindChild(((Component)___m_elements[index2].m_queued).transform, "AzuAutoStoreFavoritingBorder", (IterativeSearchType)0)).GetComponent<Image>() : CreateBorderImage(___m_elements[index2].m_queued));
			bool flag = playerConfig.IsItemNameFavorited(item.m_shared);
			if (flag)
			{
				((Graphic)val2).color = (((Behaviour)val2).enabled ? AzuAutoStorePlugin.BorderColorFavoritedItemOnFavoritedSlot.Value : AzuAutoStorePlugin.BorderColorFavoritedItem.Value);
				((Behaviour)val2).enabled = ((Behaviour)val2).enabled | flag;
			}
		}
	}

	private static Image CreateBorderImage(Image baseImg)
	{
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		Image val = Object.Instantiate<Image>(baseImg, ((Component)baseImg).transform);
		foreach (Transform item in ((Component)val).transform)
		{
			Object.Destroy((Object)(object)((Component)item).gameObject);
		}
		((Object)val).name = "AzuAutoStoreFavoritingBorder";
		((Component)val).transform.SetParent(((Component)baseImg).transform);
		val.sprite = Border;
		return val;
	}
}
