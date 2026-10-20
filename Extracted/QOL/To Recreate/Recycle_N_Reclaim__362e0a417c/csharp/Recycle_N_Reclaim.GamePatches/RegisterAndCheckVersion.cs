using System;
using System.Runtime.CompilerServices;
using HarmonyLib;

namespace Recycle_N_Reclaim.GamePatches;

[HarmonyPatch(typeof(ZNet), "OnNewConnection")]
public static class RegisterAndCheckVersion
{
	[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
	private static void Prefix(ZNetPeer peer, ref ZNet __instance)
	{
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0040: Expected Obj, but got Unknown
		Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)"Registering version RPC handler");
		peer.m_rpc.Register<ZPackage>("Recycle_N_Reclaim_VersionCheck", (Action<ZRpc, ZPackage>)RpcHandlers.RPC_Recycle_N_Reclaim_Version);
		Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogInfo((object)"Invoking version check");
		ZPackage val = new ZPackage();
		val.Write("1.4.5");
		val.Write(RpcHandlers.ComputeHashForMod().Replace("-", ""));
		peer.m_rpc.Invoke("Recycle_N_Reclaim_VersionCheck", new object[1] { val });
	}
}
