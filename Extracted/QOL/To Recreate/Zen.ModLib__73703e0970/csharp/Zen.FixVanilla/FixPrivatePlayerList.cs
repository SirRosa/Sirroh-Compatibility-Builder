using HarmonyLib;
using Jotunn.Managers;
using TMPro;
using UnityEngine;
using Valheim.UI;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal class FixPrivatePlayerList
{
	[HarmonyPostfix]
	[HarmonyPatch(typeof(SessionPlayerListEntry), "SetValues")]
	private static void SessionPlayerListEntry_SetValues(SessionPlayerListEntry __instance)
	{
		((Behaviour)__instance._platformUserIdText).enabled = SynchronizationManager.Instance.PlayerIsAdmin;
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(ConnectPanel), "Update")]
	private static void ConnectPanel_Update(ConnectPanel __instance)
	{
		TMP_Text val2 = default;
		foreach (GameObject playerListElement in __instance.m_playerListElements)
		{
			Transform val = playerListElement.transform.Find("hostname");
			if (Object.op_Implicit((Object)(object)val) && ((Component)val).TryGetComponent<TMP_Text>(ref val2))
			{
				((Behaviour)val2).enabled = SynchronizationManager.Instance.PlayerIsAdmin;
			}
		}
	}
}
