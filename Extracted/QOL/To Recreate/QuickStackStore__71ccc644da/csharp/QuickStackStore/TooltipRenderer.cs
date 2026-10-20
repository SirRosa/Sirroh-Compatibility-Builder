using System;
using System.Text;
using HarmonyLib;
using UnityEngine;

namespace QuickStackStore;

[HarmonyPatch(typeof(ItemData))]
internal static class TooltipRenderer
{
	[HarmonyPatch("GetTooltip", new Type[]
	{
		typeof(ItemData),
		typeof(int),
		typeof(bool),
		typeof(float),
		typeof(int),
		typeof(bool)
	})]
	[HarmonyPostfix]
	public static void GetTooltip(ItemData item, bool crafting, ref string __result)
	{
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c0: Unknown result type (might be due to invalid IL or missing references)
		if (!crafting && QSSConfig.FavoriteConfig.DisplayTooltipHint.Value)
		{
			StringBuilder stringBuilder = new StringBuilder(256);
			stringBuilder.Append(__result);
			UserConfig playerConfig = UserConfig.GetPlayerConfig(Player.m_localPlayer.GetPlayerID());
			if (playerConfig.IsItemNameFavorited(item.m_shared))
			{
				string text = ColorUtility.ToHtmlStringRGB(QSSConfig.FavoriteConfig.BorderColorFavoritedItem.Value);
				stringBuilder.Append("\n<color=#" + text + ">" + LocalizationConfig.GetRelevantTranslation(LocalizationConfig.FavoritedItemTooltip, "FavoritedItemTooltip") + "</color>");
			}
			else if (playerConfig.IsItemNameConsideredTrashFlagged(item.m_shared))
			{
				string text2 = ColorUtility.ToHtmlStringRGB(QSSConfig.FavoriteConfig.BorderColorTrashFlaggedItem.Value);
				stringBuilder.Append("\n<color=#" + text2 + ">" + LocalizationConfig.GetRelevantTranslation(LocalizationConfig.TrashFlaggedItemTooltip, "TrashFlaggedItemTooltip") + "</color>");
			}
			__result = stringBuilder.ToString();
		}
	}
}
