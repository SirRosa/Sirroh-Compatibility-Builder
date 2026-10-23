using System;
using System.Runtime.CompilerServices;
using System.Text;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.Patches.Favoriting;

[HarmonyPatch(typeof(ItemData))]
internal static class TooltipRenderer
{
	[HarmonyPostfix]
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	[HarmonyPatch("GetTooltip", new Type[]
	{
		typeof(ItemData),
		typeof(int),
		typeof(bool),
		typeof(float),
		typeof(int),
		typeof(bool)
	})]
	public static void GetTooltip(ItemData item, bool crafting, ref string __result)
	{
		//IL_009c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ff: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ad: Unknown result type (might be due to invalid IL or missing references)
		//IL_011e: Unknown result type (might be due to invalid IL or missing references)
		if (!crafting && AzuAutoStorePlugin.DisplayTooltipHint.Value)
		{
			StringBuilder stringBuilder = new StringBuilder(256);
			stringBuilder.Append(__result);
			UserConfig playerConfig = UserConfig.GetPlayerConfig(Player.m_localPlayer.GetPlayerID());
			if (playerConfig.IsItemNameFavorited(item.m_shared))
			{
				string text = ColorUtility.ToHtmlStringRGB(AzuAutoStorePlugin.BorderColorFavoritedItem.Value);
				stringBuilder.Append(Environment.NewLine + "<color=#" + text + ">" + AzuAutoStorePlugin.FavoritedItemTooltip.Value + "</color>");
			}
			else if (playerConfig.IsSlotFavorited(item.m_gridPos))
			{
				string text2 = ColorUtility.ToHtmlStringRGB(AzuAutoStorePlugin.BorderColorFavoritedSlot.Value);
				stringBuilder.Append(Environment.NewLine + "<color=#" + text2 + ">" + AzuAutoStorePlugin.FavoritedSlotTooltip.Value + "</color>");
			}
			else if (playerConfig.IsSlotFavorited(item.m_gridPos) && playerConfig.IsItemNameFavorited(item.m_shared))
			{
				string text3 = ColorUtility.ToHtmlStringRGB(AzuAutoStorePlugin.BorderColorFavoritedItemOnFavoritedSlot.Value);
				stringBuilder.Append(Environment.NewLine + "<color=#" + text3 + ">" + AzuAutoStorePlugin.ItemOnFavoritedSlotTooltip.Value + "</color>");
			}
			__result = stringBuilder.ToString();
		}
	}
}
