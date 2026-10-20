using System.Collections.Generic;
using HarmonyLib;
using UnityEngine;
using UnityEngine.UI;

namespace QuickStackStore;

[HarmonyPatch(typeof(InventoryGrid))]
internal static class BorderRenderer
{
	public static Sprite border;

	public const string borderImageKey = "QuickStackStoreBorderImage";

	[HarmonyPatch("UpdateGui")]
	[HarmonyPostfix]
	internal static void UpdateGui(Player player, Inventory ___m_inventory, List<InventoryElement> ___m_elements)
	{
		//IL_00b3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c4: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d2: Unknown result type (might be due to invalid IL or missing references)
		//IL_01bc: Unknown result type (might be due to invalid IL or missing references)
		//IL_0236: Unknown result type (might be due to invalid IL or missing references)
		//IL_0220: Unknown result type (might be due to invalid IL or missing references)
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
				Transform val = ((Component)___m_elements[index].m_queued).transform.Find("QuickStackStoreBorderImage");
				Image val2 = ((val != null) ? ((Component)val).GetComponent<Image>() : null);
				if ((Object)(object)val2 == (Object)null)
				{
					val2 = CreateBorderImage(___m_elements[index].m_queued);
				}
				if ((Object)(object)val2 != (Object)null)
				{
					((Graphic)val2).color = QSSConfig.FavoriteConfig.BorderColorFavoritedSlot.Value;
					((Behaviour)val2).enabled = playerConfig.IsSlotFavorited(new Vector2i(j, i));
				}
			}
		}
		foreach (ItemData item in ___m_inventory.m_inventory)
		{
			int index2 = item.GridVectorToGridIndex(width);
			Transform val3 = ((Component)___m_elements[index2].m_queued).transform.Find("QuickStackStoreBorderImage");
			Image val4 = ((val3 != null) ? ((Component)val3).GetComponent<Image>() : null);
			if ((Object)(object)val4 == (Object)null)
			{
				val4 = CreateBorderImage(___m_elements[index2].m_queued);
			}
			if ((Object)(object)val4 == (Object)null)
			{
				continue;
			}
			bool flag = playerConfig.IsItemNameFavorited(item.m_shared);
			if (flag)
			{
				if (((Behaviour)val4).enabled)
				{
					((Graphic)val4).color = QSSConfig.FavoriteConfig.BorderColorFavoritedItemOnFavoritedSlot.Value;
				}
				else
				{
					((Graphic)val4).color = QSSConfig.FavoriteConfig.BorderColorFavoritedItem.Value;
				}
				Image val5 = val4;
				((Behaviour)val5).enabled = ((Behaviour)val5).enabled | flag;
				continue;
			}
			bool flag2 = playerConfig.IsItemNameConsideredTrashFlagged(item.m_shared);
			if (flag2)
			{
				if (((Behaviour)val4).enabled)
				{
					((Graphic)val4).color = QSSConfig.FavoriteConfig.BorderColorTrashFlaggedItemOnFavoritedSlot.Value;
				}
				else
				{
					((Graphic)val4).color = QSSConfig.FavoriteConfig.BorderColorTrashFlaggedItem.Value;
				}
				Image val6 = val4;
				((Behaviour)val6).enabled = ((Behaviour)val6).enabled | flag2;
			}
		}
	}

	private static Image CreateBorderImage(Image baseImg)
	{
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Expected Obj, but got Unknown
		Image val = Object.Instantiate<Image>(baseImg, ((Component)baseImg).transform.parent);
		foreach (Transform item in ((Component)val).transform)
		{
			Transform val2 = item;
			Object.Destroy((Object)(object)((Component)val2).gameObject);
		}
		((Object)val).name = "QuickStackStoreBorderImage";
		((Component)val).transform.SetParent(((Component)baseImg).transform);
		val.sprite = border;
		return val;
	}
}
