using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using HarmonyLib;
using Recycle_N_Reclaim.GamePatches.Recycling;
using UnityEngine;

namespace Recycle_N_Reclaim.GamePatches.MarkAsTrash;

[HarmonyPatch(typeof(ItemData))]
internal static class TooltipRenderer
{
	[HarmonyPostfix]
	[HarmonyPatch("GetTooltip", new Type[]
	{
		typeof(ItemData),
		typeof(int),
		typeof(bool),
		typeof(float),
		typeof(int),
		typeof(bool)
	})]
	[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
	public static void GetTooltip(ItemData item, bool crafting, ref string __result)
	{
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_006b: Unknown result type (might be due to invalid IL or missing references)
		if (crafting || (Object)(object)Player.m_localPlayer == (Object)null || (!Recycle_N_ReclaimPlugin.DisplayTooltipHint.Value && !Recycle_N_ReclaimPlugin.ShowRecycleYieldInTooltip.Value))
		{
			return;
		}
		StringBuilder stringBuilder = new StringBuilder(256);
		stringBuilder.Append(__result);
		if (Recycle_N_ReclaimPlugin.DisplayTooltipHint.Value && UserConfig.GetPlayerConfig(Player.m_localPlayer.GetPlayerID()).IsSlotTrashed(item.m_gridPos))
		{
			string text = ColorUtility.ToHtmlStringRGB(Recycle_N_ReclaimPlugin.BorderColorTrashedSlot.Value);
			stringBuilder.Append(Environment.NewLine + "<color=#" + text + ">" + Recycle_N_ReclaimPlugin.TrashedSlotTooltip.Value + "</color>");
		}
		if (Recycle_N_ReclaimPlugin.ShowRecycleYieldInTooltip.Value)
		{
			RecyclingAnalysisContext recyclingAnalysisContext = new RecyclingAnalysisContext(item);
			if (Reclaimer.TryAnalyzeOneItem(recyclingAnalysisContext, ((Humanoid)Player.m_localPlayer).GetInventory(), Player.m_localPlayer))
			{
				List<RecyclingAnalysisContext.ReclaimingYieldEntry> list = recyclingAnalysisContext.Entries.Where((RecyclingAnalysisContext.ReclaimingYieldEntry e) => e.Amount > 0).ToList();
				if (list.Count > 0)
				{
					stringBuilder.Append("\n\n<color=orange>" + Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_tooltip_yield_header") + "</color>");
					foreach (RecyclingAnalysisContext.ReclaimingYieldEntry item2 in list)
					{
						stringBuilder.Append($"\n  {item2.Amount}x {Recycle_N_ReclaimPlugin.Localize(item2.RecipeItemData.m_shared.m_name)}");
					}
					if (recyclingAnalysisContext.RecyclingImpediments.Count > 0)
					{
						stringBuilder.Append("\n<color=red>" + string.Join(", ", recyclingAnalysisContext.RecyclingImpediments) + "</color>");
					}
				}
			}
		}
		__result = stringBuilder.ToString();
	}
}
