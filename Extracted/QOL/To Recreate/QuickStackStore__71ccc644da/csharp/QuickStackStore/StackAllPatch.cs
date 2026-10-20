using HarmonyLib;
using UnityEngine;

namespace QuickStackStore;

[HarmonyPatch(typeof(Container))]
public static class StackAllPatch
{
	[HarmonyPatch("RPC_StackResponse")]
	[HarmonyPrefix]
	public static bool ContainerStackAllPatch(Container __instance, bool granted)
	{
		if (!QSSConfig.QuickStackConfig.ChangeHoldToStackFeatureToUseModdedQuickStackingLogic.Value)
		{
			return true;
		}
		if (!Object.op_Implicit((Object)(object)Player.m_localPlayer))
		{
			return false;
		}
		if (granted)
		{
			QuickStackModule.DoQuickStack(Player.m_localPlayer, onlyQuickStackToCurrentContainer: true, __instance);
		}
		else
		{
			((Character)Player.m_localPlayer).Message((MessageType)2, "$msg_inuse", 0, (Sprite)null, false);
		}
		return false;
	}
}
