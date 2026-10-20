using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Security.Cryptography;
using System.Text;

namespace Recycle_N_Reclaim.GamePatches;

[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
public static class RpcHandlers
{
	public static readonly List<ZRpc> ValidatedPeers = new List<ZRpc>();

	public static void RPC_Recycle_N_Reclaim_Version(ZRpc rpc, ZPackage pkg)
	{
		string text = pkg.ReadString();
		string text2 = pkg.ReadString();
		string text3 = ComputeHashForMod().Replace("-", "");
		Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogInfo((object)("Hash/Version check, local: 1.4.5 " + text3 + " remote: " + text + " " + text2));
		if (text2 != text3 || text != "1.4.5")
		{
			Recycle_N_ReclaimPlugin.ConnectionError = "Recycle_N_Reclaim Installed: 1.4.5 " + text3 + "\n Needed: " + text + " " + text2;
			if (ZNet.instance.IsServer())
			{
				Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogWarning((object)("Peer (" + rpc.m_socket.GetHostName() + ") has incompatible version, disconnecting..."));
				rpc.Invoke("Error", new object[1] { 3 });
			}
		}
		else if (!ZNet.instance.IsServer())
		{
			Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogInfo((object)"Received same version from server!");
		}
		else
		{
			Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogInfo((object)("Adding peer (" + rpc.m_socket.GetHostName() + ") to validated list"));
			ValidatedPeers.Add(rpc);
		}
	}

	public static string ComputeHashForMod()
	{
		using SHA256 sHA = SHA256.Create();
		byte[] array = sHA.ComputeHash(File.ReadAllBytes(Assembly.GetExecutingAssembly().Location));
		StringBuilder stringBuilder = new StringBuilder();
		byte[] array2 = array;
		foreach (byte b in array2)
		{
			stringBuilder.Append(b.ToString("X2"));
		}
		return stringBuilder.ToString();
	}
}
