using System;
using System.Linq;
using HarmonyLib;
using UnityEngine;

namespace Zen.FixVanilla.Optimizations;

[HarmonyPatch]
internal static class OptimizeNetworkSpamEveryoneRPC
{
	private static int[]? _methodsNearbyOnlyCache;

	private static int[]? _methodsGlobalAllowCache;

	private static bool IsFeatureEnabled
	{
		get
		{
			if (!ZNet.IsSinglePlayer)
			{
				return ModLib.Configs.OptimizeNetworkRpcNoSendEveryoneActive.Value;
			}
			return false;
		}
	}

	private static bool IsDebugMode
	{
		get
		{
			if (Logging<ModLib>.IsEnabled)
			{
				return ZoneSystem.instance.GetGlobalKey("ZEN_DEBUG_RoutedRPC");
			}
			return false;
		}
	}

	private static int[] MethodsNearbyOnly => _methodsNearbyOnlyCache ?? (_methodsNearbyOnlyCache = ModLib.Configs.OptimizeNetworkRpcNoSendEveryoneNearbyOnly.Value.Select((string rpcName) => StringExtensionMethods.GetStableHashCode(rpcName)).ToArray());

	private static int[] MethodsGlobalAllow => _methodsGlobalAllowCache ?? (_methodsGlobalAllowCache = ModLib.Configs.OptimizeNetworkRpcNoSendEveryoneGlobalAllow.Value.Select((string rpcName) => StringExtensionMethods.GetStableHashCode(rpcName)).ToArray());

	static OptimizeNetworkSpamEveryoneRPC()
	{
		ModLib.Configs.OptimizeNetworkRpcNoSendEveryoneNearbyOnly.SettingChanged += (object _, EventArgs _) =>
		{
			_methodsNearbyOnlyCache = null;
		};
		ModLib.Configs.OptimizeNetworkRpcNoSendEveryoneGlobalAllow.SettingChanged += (object _, EventArgs _) =>
		{
			_methodsGlobalAllowCache = null;
		};
	}

	private static bool IsNearby(Vector3 a, Vector3 b)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		//IL_004f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0055: Unknown result type (might be due to invalid IL or missing references)
		if (Character.InInterior(a) != Character.InInterior(b))
		{
			return false;
		}
		int totalSimulationDistance = ZoneSystem.instance.m_simulationDistance.TotalSimulationDistance;
		float zoneSize = ZoneSystem.instance.m_zoneSize;
		float num = zoneSize / 2f;
		float num2 = (float)(totalSimulationDistance + 1) * zoneSize + num;
		if (Mathf.Abs(a.x - b.x) <= num2)
		{
			return Mathf.Abs(a.z - b.z) <= num2;
		}
		return false;
	}

	private static bool IsRangeLimitedRpc(RoutedRPCData rpcData)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		return IsRangeLimitedRpc(rpcData.m_methodHash, rpcData.m_targetZDO);
	}

	private static bool IsRangeLimitedRpc(int methodHash, ZDOID nviewTargetZDOID)
	{
		if (Enumerable.Contains(MethodsGlobalAllow, methodHash))
		{
			return false;
		}
		if (nviewTargetZDOID.IsNone())
		{
			return Enumerable.Contains(MethodsNearbyOnly, methodHash);
		}
		return true;
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(ZRoutedRpc), "InvokeRoutedRPC", new Type[]
	{
		typeof(long),
		typeof(ZDOID),
		typeof(string),
		typeof(object[])
	})]
	private static void ZRoutedRpc_InvokeRoutedRpc(ZRoutedRpc __instance, ZDOID targetZDO, ref long targetPeerID, string methodName)
	{
		//IL_003b: Unknown result type (might be due to invalid IL or missing references)
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0065: Unknown result type (might be due to invalid IL or missing references)
		//IL_005e: Unknown result type (might be due to invalid IL or missing references)
		//IL_006a: Unknown result type (might be due to invalid IL or missing references)
		if (!IsFeatureEnabled || (!__instance.m_server && !ModLib.Configs.OptimizeNetworkRpcNoSendEveryoneFromClient.Value) || targetPeerID != 0L || !Object.op_Implicit((Object)(object)Player.m_localPlayer) || !IsRangeLimitedRpc(StringExtensionMethods.GetStableHashCode(methodName), targetZDO))
		{
			return;
		}
		ZDO zDO = ZDOMan.instance.GetZDO(targetZDO);
		Vector3 srcPos = ((zDO != null) ? zDO.GetPosition() : ((Component)Player.m_localPlayer).transform.position);
		if (!Player.GetAllPlayers().Any((Player p) =>
		{
			//IL_000e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0019: Unknown result type (might be due to invalid IL or missing references)
			return (Object)(object)p != (Object)(object)Player.m_localPlayer && IsNearby(srcPos, ((Component)p).transform.position);
		}))
		{
			targetPeerID = __instance.m_id;
			if (IsDebugMode)
			{
				Logging<ModLib>.Message("Client side optimization: Nobody nearby, only sending RPC to self " + methodName);
			}
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(ZRoutedRpc), "RouteRPC")]
	private static void ZRoutedRpc_RouteRPC(ZRoutedRpc __instance, RoutedRPCData rpcData, ref bool __runOriginal)
	{
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_005e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0052: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ab: Expected Obj, but got Unknown
		//IL_00e4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00eb: Unknown result type (might be due to invalid IL or missing references)
		if (!IsFeatureEnabled || !__instance.m_server || rpcData.m_targetPeerID != 0L || !IsRangeLimitedRpc(rpcData))
		{
			return;
		}
		ZDO zDO = ZDOMan.instance.GetZDO(rpcData.m_targetZDO);
		Vector3? val = ((zDO != null) ? new Vector3?(zDO.GetPosition()) : __instance.GetPeer(rpcData.m_senderPeerID)?.m_refPos);
		if (!val.HasValue)
		{
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(49, 1, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("srcPosition is not available and no sender peer: ");
				msg.AppendFormatted(rpcData.m_senderPeerID);
			}
			Logging<ModLib>.Info(msg);
			return;
		}
		__runOriginal = false;
		ZPackage val2 = new ZPackage();
		rpcData.Serialize(val2);
		foreach (ZNetPeer peer in __instance.m_peers)
		{
			if (rpcData.m_senderPeerID != peer.m_uid && peer.IsReady() && IsNearby(val.Value, peer.m_refPos))
			{
				peer.m_rpc.Invoke("RoutedRPC", new object[1] { val2 });
			}
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(ZRoutedRpc), "RouteRPC")]
	private static void ZRoutedRpc_RouteRPC_ServerPeer_DEBUG(ZRoutedRpc __instance, RoutedRPCData rpcData)
	{
		if (!IsDebugMode || !__instance.m_server || !IsRangeLimitedRpc(rpcData))
		{
			return;
		}
		Logging<ModLib>.Warning(string.Format("SERVER ID: {0} MsgID: {1} MethodHash: {2} Peers: {3}", new object[4]
		{
			__instance.m_id,
			rpcData.m_msgID,
			rpcData.m_methodHash,
			__instance.m_peers.Count
		}));
		Logging<ModLib>.Warning("NAME\tID\t\tSendByID\tIsReady");
		foreach (ZNetPeer peer in __instance.m_peers)
		{
			Logging<ModLib>.Warning(string.Format("{0}\t{1}\t{2}\t\t{3}", new object[4]
			{
				peer.m_playerName,
				peer.m_uid,
				peer.m_uid == rpcData.m_senderPeerID,
				peer.IsReady()
			}));
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(ZRoutedRpc), "HandleRoutedRPC")]
	private static void ZRoutedRpc_HandleRoutedRPC_DEBUG(ZRoutedRpc __instance, RoutedRPCData data)
	{
		if (IsDebugMode && !__instance.m_server && IsRangeLimitedRpc(data))
		{
			Logging<ModLib>.Warning("CLIENT HANDLING RPC: " + $"localSession={ZDOMan.GetSessionID()}, " + $"msgID={data.m_msgID}, " + $"sender={data.m_senderPeerID}, " + $"targetPeer={data.m_targetPeerID}, " + $"method={data.m_methodHash}");
		}
	}
}
