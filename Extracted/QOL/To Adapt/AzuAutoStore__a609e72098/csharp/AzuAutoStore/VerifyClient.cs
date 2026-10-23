using System.Runtime.CompilerServices;
using HarmonyLib;

namespace AzuAutoStore;

[HarmonyPatch(typeof(ZNet), "RPC_PeerInfo")]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public static class VerifyClient
{
	private static bool Prefix(ZRpc rpc, ZPackage pkg, ref ZNet __instance)
	{
		if (!__instance.IsServer() || RpcHandlers.ValidatedPeers.Contains(rpc))
		{
			return true;
		}
		AzuAutoStorePlugin.AzuAutoStoreLogger.LogWarning((object)("Peer (" + rpc.m_socket.GetHostName() + ") never sent version or couldn't due to previous disconnect, disconnecting"));
		rpc.Invoke("Error", new object[1] { 3 });
		return false;
	}

	private static void Postfix(ZNet __instance)
	{
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Expected Obj, but got Unknown
		ZRoutedRpc.instance.InvokeRoutedRPC(ZRoutedRpc.instance.GetServerPeerID(), "AzuAutoStoreRequestAdminSync", new object[1] { (object)new ZPackage() });
	}
}
