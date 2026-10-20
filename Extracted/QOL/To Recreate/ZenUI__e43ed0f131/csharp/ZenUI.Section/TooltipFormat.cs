using HarmonyLib;
using TMPro;
using UnityEngine;
using Zen.Lib;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class TooltipFormat
{
	public static GameObject TooltipPrefab => GlobalStatic.GetPrefab("InventoryTooltip");

	internal static void ApplyTooltipFormatDefaults()
	{
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		Transform child = TooltipPrefab.transform.GetChild(0);
		((Component)child).gameObject.AddOutline(2f, UIColor.DarkGray);
		if (Configs.TooltipShowTitleNorse.Value)
		{
			TMP_Text component = ((Component)child.Find("Topic")).GetComponent<TMP_Text>();
			component.font = InventoryGui.instance.m_craftingStationName.font;
			component.fontStyle = (FontStyles)32;
			component.fontSize = 28f;
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(SE_Stats), "GetDamageModifiersTooltipString")]
	private static void SE_Stats_GetDamageModifiersTooltipString(ref string __result)
	{
		__result = __result.Replace("$inventory_dmgmod: ", string.Empty);
	}
}
