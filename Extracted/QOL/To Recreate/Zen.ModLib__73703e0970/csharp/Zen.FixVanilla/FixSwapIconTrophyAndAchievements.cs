using HarmonyLib;
using UnityEngine;
using UnityEngine.UI;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal class FixSwapIconTrophyAndAchievements
{
	[HarmonyPostfix]
	[HarmonyPatch(typeof(InventoryGui), "Awake")]
	private static void InventoryGui_Awake(InventoryGui __instance)
	{
		if (ModLib.Configs.FixIconSwapTrophyAndAchievement.Value)
		{
			Transform infoPanel = __instance.m_infoPanel;
			Image component = ((Component)infoPanel.Find("Achievements/Image")).GetComponent<Image>();
			Image component2 = ((Component)infoPanel.Find("Trophies/Image")).GetComponent<Image>();
			Image val = component;
			Image val2 = component2;
			Sprite sprite = component2.sprite;
			Sprite sprite2 = component.sprite;
			val.sprite = sprite;
			val2.sprite = sprite2;
		}
	}
}
