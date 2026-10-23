using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace AzuAutoStore;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public static class RpcHandlers
{
	public static readonly List<ZRpc> ValidatedPeers = new List<ZRpc>();

	public static void RPC_AzuAutoStore_Version(ZRpc rpc, ZPackage pkg)
	{
		string text = pkg.ReadString();
		AzuAutoStorePlugin.AzuAutoStoreLogger.LogInfo((object)("Version check, local: 3.1.7,  remote: " + text));
		if (text != "3.1.7")
		{
			AzuAutoStorePlugin.ConnectionError = "AzuAutoStore Installed: 3.1.7\n Needed: " + text;
			if (ZNet.instance.IsServer())
			{
				AzuAutoStorePlugin.AzuAutoStoreLogger.LogWarning((object)("Peer (" + rpc.m_socket.GetHostName() + ") has incompatible version, disconnecting..."));
				rpc.Invoke("Error", new object[1] { 3 });
			}
		}
		else if (!ZNet.instance.IsServer())
		{
			AzuAutoStorePlugin.AzuAutoStoreLogger.LogInfo((object)"Received same version from server!");
		}
		else
		{
			AzuAutoStorePlugin.AzuAutoStoreLogger.LogInfo((object)("Adding peer (" + rpc.m_socket.GetHostName() + ") to validated list"));
			ValidatedPeers.Add(rpc);
		}
	}
}
