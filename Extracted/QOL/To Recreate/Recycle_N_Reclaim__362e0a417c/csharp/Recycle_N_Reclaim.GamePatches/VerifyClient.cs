using System.Runtime.CompilerServices;
using HarmonyLib;

namespace Recycle_N_Reclaim.GamePatches;

[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
[HarmonyPatch(typeof(ZNet), "RPC_PeerInfo")]
public static class VerifyClient
{
	private static bool Prefix(ZRpc rpc, ZPackage pkg, ref ZNet __instance)
	{
		if (!__instance.IsServer() || RpcHandlers.ValidatedPeers.Contains(rpc))
		{
			return true;
		}
		Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogWarning((object)("Peer (" + rpc.m_socket.GetHostName() + ") never sent version or couldn't due to previous disconnect, disconnecting"));
		rpc.Invoke("Error", new object[1] { 3 });
		return false;
	}

	private static void Postfix(ZNet __instance)
	{
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Expected Obj, but got Unknown
		ZRoutedRpc.instance.InvokeRoutedRPC(ZRoutedRpc.instance.GetServerPeerID(), "Recycle_N_ReclaimRequestAdminSync", new object[1] { (object)new ZPackage() });
	}
}
