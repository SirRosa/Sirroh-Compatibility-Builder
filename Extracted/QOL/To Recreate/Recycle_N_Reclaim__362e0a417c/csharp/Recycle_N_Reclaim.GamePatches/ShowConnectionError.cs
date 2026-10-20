using System.Runtime.CompilerServices;
using HarmonyLib;
using TMPro;

namespace Recycle_N_Reclaim.GamePatches;

[HarmonyPatch(typeof(FejdStartup), "ShowConnectError")]
public class ShowConnectionError
{
	[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
	private static void Postfix(FejdStartup __instance)
	{
		if (__instance.m_connectionFailedPanel.activeSelf)
		{
			__instance.m_connectionFailedError.fontSizeMax = 25f;
			__instance.m_connectionFailedError.fontSizeMin = 15f;
			TMP_Text connectionFailedError = __instance.m_connectionFailedError;
			connectionFailedError.text = connectionFailedError.text + "\n" + Recycle_N_ReclaimPlugin.ConnectionError;
		}
	}
}
