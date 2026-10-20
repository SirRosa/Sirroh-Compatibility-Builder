using System.Runtime.CompilerServices;
using HarmonyLib;

namespace Recycle_N_Reclaim.GamePatches;

[HarmonyPatch(typeof(ZNet), "Disconnect")]
public static class RemoveDisconnectedPeerFromVerified
{
	[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
	private static void Prefix(ZNetPeer peer, ref ZNet __instance)
	{
		if (__instance.IsServer())
		{
			Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogInfo((object)("Peer (" + peer.m_rpc.m_socket.GetHostName() + ") disconnected, removing from validated list"));
			RpcHandlers.ValidatedPeers.Remove(peer.m_rpc);
		}
	}
}
