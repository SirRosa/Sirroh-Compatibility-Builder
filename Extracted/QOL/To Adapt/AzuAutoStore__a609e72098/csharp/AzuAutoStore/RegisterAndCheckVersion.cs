using System;
using System.Runtime.CompilerServices;
using HarmonyLib;

namespace AzuAutoStore;

[HarmonyPatch(typeof(ZNet), "OnNewConnection")]
public static class RegisterAndCheckVersion
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	private static void Prefix(ZNetPeer peer, ref ZNet __instance)
	{
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0040: Expected Obj, but got Unknown
		AzuAutoStorePlugin.AzuAutoStoreLogger.LogDebug((object)"Registering version RPC handler");
		peer.m_rpc.Register<ZPackage>("AzuAutoStore_VersionCheck", (Action<ZRpc, ZPackage>)RpcHandlers.RPC_AzuAutoStore_Version);
		AzuAutoStorePlugin.AzuAutoStoreLogger.LogInfo((object)"Invoking version check");
		ZPackage val = new ZPackage();
		val.Write("3.1.7");
		peer.m_rpc.Invoke("AzuAutoStore_VersionCheck", new object[1] { val });
	}
}
