using System.Runtime.CompilerServices;
using HarmonyLib;

namespace AzuAutoStore;

[HarmonyPatch(typeof(ZNet), "Disconnect")]
public static class RemoveDisconnectedPeerFromVerified
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	private static void Prefix(ZNetPeer peer, ref ZNet __instance)
	{
		if (__instance.IsServer())
		{
			AzuAutoStorePlugin.AzuAutoStoreLogger.LogInfo((object)("Peer (" + peer.m_rpc.m_socket.GetHostName() + ") disconnected, removing from validated list"));
			RpcHandlers.ValidatedPeers.Remove(peer.m_rpc);
		}
	}
}
