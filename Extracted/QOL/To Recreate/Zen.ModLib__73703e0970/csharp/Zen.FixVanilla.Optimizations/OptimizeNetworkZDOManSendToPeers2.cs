using HarmonyLib;
using UnityEngine;

namespace Zen.FixVanilla.Optimizations;

[HarmonyPatch]
internal static class OptimizeNetworkZDOManSendToPeers2
{
	private static bool IsFeatureEnabled
	{
		get
		{
			if (Object.op_Implicit((Object)(object)ZNet.instance) && ZNet.instance.IsDedicated())
			{
				return ModLib.Configs.OptimizeNetworkSendToPeersSync.Value;
			}
			return false;
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(ZDOMan), "SendZDOToPeers2")]
	private static void ZDOMan_SendZDOToPeers2(ZDOMan __instance, float dt, ref bool __runOriginal)
	{
		if (!IsFeatureEnabled)
		{
			return;
		}
		__runOriginal = false;
		if (__instance.m_peers.Count == 0)
		{
			return;
		}
		__instance.m_nextSendPeer = -1;
		__instance.m_sendTimer += dt;
		if (__instance.m_sendTimer <= 0.05f)
		{
			return;
		}
		__instance.m_sendTimer = 0f;
		foreach (ZDOPeer peer in __instance.m_peers)
		{
			__instance.SendZDOs(peer, false);
		}
	}
}
