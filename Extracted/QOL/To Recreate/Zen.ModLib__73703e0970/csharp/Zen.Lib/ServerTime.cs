using System;
using HarmonyLib;
using UnityEngine;

namespace Zen.Lib;

[HarmonyPatch]
public static class ServerTime
{
	private static DateTime _serverTimeUtc;

	private static double _serverSyncTimestamp;

	private static bool _hasSynced;

	private static bool IsServer
	{
		get
		{
			if (Object.op_Implicit((Object)(object)ZNet.instance))
			{
				return ZNet.instance.IsServer();
			}
			return false;
		}
	}

	public static DateTime UtcNow
	{
		get
		{
			if (!IsServer && _hasSynced)
			{
				return _serverTimeUtc + TimeSpan.FromSeconds(Time.realtimeSinceStartupAsDouble - _serverSyncTimestamp);
			}
			return DateTime.UtcNow;
		}
	}

	private static void SetTime(DateTime serverTimeUtc)
	{
		_serverTimeUtc = ((serverTimeUtc.Kind == DateTimeKind.Utc) ? serverTimeUtc : serverTimeUtc.ToUniversalTime());
		_serverSyncTimestamp = Time.realtimeSinceStartupAsDouble;
		_hasSynced = true;
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(27, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Time received from server: ");
			msg.AppendFormatted(_serverTimeUtc, "u");
		}
		Logging<ModLib>.Info(msg);
	}

	internal static void RegisterRPC()
	{
		ZRoutedRpc.instance.Register<long>("ZenRPC_SyncServerTime", (Action<long, long>)ZenRPC_SyncServerTime);
	}

	internal static void Shutdown()
	{
		ZRoutedRpc.instance.Unregister("ZenRPC_SyncServerTime");
	}

	private static void ZenRPC_SyncServerTime(long sender, long ticks)
	{
		if (IsServer)
		{
			Logging<ModLib>.Warning("Server should not be receiving this RPC");
		}
		else if (sender != ZRoutedRpc.instance.GetServerPeerID())
		{
			Logging<ModLib>.Warning("Sender was not the server");
		}
		else
		{
			SetTime(new DateTime(ticks, DateTimeKind.Utc));
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(ZRoutedRpc), "AddPeer")]
	private static void ZRoutedRpc_AddPeer(ZRoutedRpc __instance, ZNetPeer peer)
	{
		if (IsServer)
		{
			__instance.InvokeRoutedRPC(peer.m_uid, "ZenRPC_SyncServerTime", new object[1] { DateTime.UtcNow.Ticks });
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(ZNet), "Awake")]
	private static void ZNet_Awake(ZNet __instance)
	{
		RegisterRPC();
	}
}
