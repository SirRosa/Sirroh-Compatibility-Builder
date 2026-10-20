using HarmonyLib;
using TMPro;
using UnityEngine;

namespace Zen.Lib;

[HarmonyPatch]
internal static class AchievementsRules
{
	[HarmonyPostfix]
	[HarmonyPatch(/*Could not decode attribute arguments.*/)]
	private static void PlayerProfile_BypassCheatChecks(ref bool __result)
	{
		if (ModLib.Configs.AllowAchievementsWithDevCommands.Value)
		{
			__result = true;
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(AchievementsGui), "OnEnable")]
	private static void AchievementsGui_OnEnable()
	{
		TextMeshProUGUI achievementsCheatedText = InventoryGui.instance.m_achievementsCheatedText;
		if (Object.op_Implicit((Object)(object)achievementsCheatedText) && ModLib.Configs.AllowAchievementsWithDevCommands.Value)
		{
			((Behaviour)achievementsCheatedText).enabled = false;
		}
	}
}
