using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Runtime.Serialization.Formatters.Binary;
using HarmonyLib;

namespace LetMeTameYou.RPC;

[Serializable]
public class CfgPackage
{
	[HarmonyPatch(typeof(Game), "Start")]
	public static class GameStartPatch
	{
		private static void Prefix()
		{
			//IL_0044: Unknown result type (might be due to invalid IL or missing references)
			//IL_004a: Expected Obj, but got Unknown
			ZRoutedRpc.instance.Register<ZPackage>("LMTY_RecieveConfigs", (Action<long, ZPackage>)RPC_RecieveConfigs);
			ZRoutedRpc.instance.Register<ZPackage>("LMTY_Configs", (Action<long, ZPackage>)RPC_LMTY_Configs);
			DBG.blogWarning("RPCs Registered");
			ZPackage val = new ZPackage();
			val.Write("0.1.0");
			version = val;
		}
	}

	public class SplitTameDict
	{
		public string[] keys { get; set; } = new string[0];

		public LetMeTameYou.TameConfig[] tmtbl { get; set; } = new LetMeTameYou.TameConfig[0];
	}

	public string[] split_keys;

	public LetMeTameYou.TameConfig[] split_tmtbl;

	public string[] mate_dict;

	public string[] trade_dict;

	public static ZPackage zpack;

	public static ZPackage version;

	public static void RPC_RecieveConfigs(long sender, ZPackage pkg)
	{
		DBG.blogWarning("Received Configs from Server");
		if (sender == ZRoutedRpc.instance.GetServerPeerID() && pkg != null && pkg.Size() > 0)
		{
			DBG.blogWarning("Has Valid Server and Package");
			Unpack(pkg);
			DBG.blogWarning("Unpacked");
			TameManager.UpdatesFromServer();
			PrefabManager.ItemReg();
		}
	}

	public static void RPC_RequestServerAnnouncement_Client(long sender, ZPackage pkg)
	{
	}

	public static void RPC_LMTY_Configs(long sender, ZPackage pkg)
	{
		string text = pkg.ReadString();
		DBG.blogInfo("Local version:0.1.0,  remote: " + text);
		ZNetPeer peer = ZNet.instance.GetPeer(sender);
		if (ZNet.instance.IsServer())
		{
			if (peer == null)
			{
				DBG.blogInfo("Peer is Null");
				return;
			}
			DBG.blogInfo("Peer is not Null");
			ZRoutedRpc.instance.InvokeRoutedRPC(sender, "LMTY_RecieveConfigs", new object[1] { PackTamelist() });
		}
	}

	public static void RPC_LMTY_Version(ZRpc rpc, ZPackage pkg)
	{
		string text = pkg.ReadString();
		DBG.blogInfo("Local version:0.1.0,  remote: " + text);
		if (text != "0.1.0")
		{
			DBG.blogWarning("Let Me Tame You Versions do not match");
			if (ZNet.instance.IsServer())
			{
				DBG.blogWarning("Peer (" + rpc.m_socket.GetHostName() + ") has incompatible version, disconnecting...");
				rpc.Invoke("Error", new object[1] { 3 });
			}
		}
	}

	[HarmonyPatch(typeof(ZNet), "OnNewConnection")]
	[HarmonyPostfix]
	private static void SyncVersionPatch(ZNetPeer peer, ref ZNet __instance)
	{
		//IL_0041: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Expected Obj, but got Unknown
		DBG.blogDebug("Registering version RPC handler");
		peer.m_rpc.Register<ZPackage>("LMTY_Version", (Action<ZRpc, ZPackage>)RPC_LMTY_Version);
		DBG.blogDebug("Invoking version check");
		if (version == null)
		{
			ZPackage val = new ZPackage();
			val.Write("0.1.0");
			version = val;
		}
		peer.m_rpc.Invoke("LMTY_Version", new object[1] { version });
		ZRoutedRpc.instance.InvokeRoutedRPC(peer.m_uid, "LMTY_Version", new object[1] { version });
	}

	[HarmonyPatch(typeof(ZNet), "RPC_PeerInfo")]
	[HarmonyPostfix]
	private static void SyncConfigsPatch_New(ZRpc rpc, ref ZNet __instance)
	{
		DBG.blogDebug("Registering version RPC handler");
		ZRoutedRpc.instance.InvokeRoutedRPC(__instance.GetPeer(rpc).m_uid, "LMTY_Configs", new object[1] { version });
	}

	public static ZPackage PackTamelist()
	{
		//IL_004c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0052: Expected Obj, but got Unknown
		if (zpack == null)
		{
			if (LetMeTameYou.CfgPackage == null)
			{
				LetMeTameYou.CfgPackage = new CfgPackage();
			}
			LetMeTameYou.CfgPackage.Pack();
			DBG.blogDebug("Packed List");
		}
		else
		{
			DBG.blogDebug("Already Packed List");
		}
		ZPackage val = new ZPackage();
		return zpack;
	}

	public ZPackage Pack()
	{
		//IL_00d2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d8: Expected Obj, but got Unknown
		SplitTameDict splitTameDict = createsplitdict();
		split_keys = splitTameDict.keys;
		split_tmtbl = splitTameDict.tmtbl;
		DBG.blogDebug("keysnull=" + (split_keys == null));
		DBG.blogDebug("tmblnull=" + (split_tmtbl == null));
		string[] array = split_keys;
		foreach (string text in array)
		{
			DBG.blogDebug("key=" + text);
		}
		LetMeTameYou.TameConfig[] array2 = split_tmtbl;
		foreach (LetMeTameYou.TameConfig tameConfig in array2)
		{
			DBG.blogDebug("consume=" + tameConfig.consumeItems);
		}
		ZPackage val = new ZPackage();
		using MemoryStream memoryStream = new MemoryStream();
		using (GZipStream serializationStream = new GZipStream(memoryStream, CompressionLevel.Optimal))
		{
			new BinaryFormatter().Serialize(serializationStream, this);
		}
		byte[] buffer = memoryStream.GetBuffer();
		val.Write(buffer);
		zpack = val;
		return val;
	}

	public static void Unpack(ZPackage package, bool setValue = true)
	{
		byte[] array = package.ReadByteArray();
		DBG.blogInfo($"Deserializing {array.Length} bytes of configs");
		using MemoryStream stream = new MemoryStream(array);
		using GZipStream serializationStream = new GZipStream(stream, CompressionMode.Decompress, leaveOpen: true);
		if (new BinaryFormatter().Deserialize(serializationStream) is CfgPackage cfgPackage)
		{
			DBG.blogInfo("Received and deserialized config package");
			DBG.blogInfo("Unpackaging configs.");
			string[] keys = cfgPackage.split_keys;
			LetMeTameYou.TameConfig[] tmtbl = cfgPackage.split_tmtbl;
			Combinesplitdict(keys, tmtbl);
			DBG.blogInfo("Successfully unpacked configs.");
			DBG.blogInfo("Unpacked general config");
		}
		else
		{
			DBG.blogWarning("Received bad config package. Unable to load.");
		}
	}

	public SplitTameDict createsplitdict()
	{
		int count = LetMeTameYou.customTamesList.Count;
		SplitTameDict splitTameDict = new SplitTameDict();
		splitTameDict.keys = new string[count];
		splitTameDict.tmtbl = new LetMeTameYou.TameConfig[count];
		int num = 0;
		foreach (KeyValuePair<string, LetMeTameYou.TameConfig> customTames in LetMeTameYou.customTamesList)
		{
			splitTameDict.keys[num] = customTames.Key;
			splitTameDict.tmtbl[num] = customTames.Value;
			num++;
		}
		return splitTameDict;
	}

	private static void Combinesplitdict(string[] keys, LetMeTameYou.TameConfig[] tmtbl)
	{
		int num = keys.Length;
		LetMeTameYou.customTamesList.Clear();
		for (int i = 0; i < num; i++)
		{
			LetMeTameYou.customTamesList.Add(keys[i], tmtbl[i]);
		}
	}
}
