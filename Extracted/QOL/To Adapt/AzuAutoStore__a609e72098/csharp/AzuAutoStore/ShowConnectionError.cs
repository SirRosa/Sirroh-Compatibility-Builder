using System.Runtime.CompilerServices;
using HarmonyLib;
using TMPro;

namespace AzuAutoStore;

[HarmonyPatch(typeof(FejdStartup), "ShowConnectError")]
public class ShowConnectionError
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	private static void Postfix(FejdStartup __instance)
	{
		if (__instance.m_connectionFailedPanel.activeSelf)
		{
			__instance.m_connectionFailedError.fontSizeMax = 25f;
			__instance.m_connectionFailedError.fontSizeMin = 15f;
			TMP_Text connectionFailedError = __instance.m_connectionFailedError;
			connectionFailedError.text = connectionFailedError.text + "\n" + AzuAutoStorePlugin.ConnectionError;
		}
	}
}
