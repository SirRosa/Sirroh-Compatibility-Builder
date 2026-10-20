using HarmonyLib;
using UnityEngine;

namespace QuickStackStore;

[HarmonyPatch(typeof(Player))]
internal static class PlayerPatch
{
	[HarmonyPatch("Start")]
	[HarmonyPostfix]
	internal static void StartPatch(Player __instance)
	{
		if ((Object)(object)__instance == (Object)(object)Player.m_localPlayer)
		{
			QSSConfig.ResetAllFavoritingData_SettingChanged(null, null);
		}
	}
}
