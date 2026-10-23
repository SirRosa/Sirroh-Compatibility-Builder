using System;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Data;
using HarmonyLib;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Patches;

[HarmonyPatch]
public static class GamePatches
{
	[HarmonyPostfix]
	[HarmonyPatch(typeof(Game), "Start")]
	public static void GameStartPatch()
	{
		if (!MUCCompat.DoNotPatch)
		{
			RegisterRPCs();
		}
	}

	public static void RegisterRPCs()
	{
		ZRoutedRpc.instance.Register<ZDOID, ZPackage>("MUC_RequestItemMove", (Action<long, ZDOID, ZPackage>)ContainerRPCHandler.RPC_RequestItemMove);
		ZRoutedRpc.instance.Register<ZDOID, ZPackage>("MUC_RequestItemAdd", (Action<long, ZDOID, ZPackage>)ContainerRPCHandler.RPC_RequestItemAdd);
		ZRoutedRpc.instance.Register<ZDOID, ZPackage>("MUC_RequestItemRemove", (Action<long, ZDOID, ZPackage>)ContainerRPCHandler.RPC_RequestItemRemove);
		ZRoutedRpc.instance.Register<ZDOID, ZPackage>("MUC_RequestItemConsume", (Action<long, ZDOID, ZPackage>)ContainerRPCHandler.RPC_RequestItemConsume);
		ZRoutedRpc.instance.Register<ZDOID, ZPackage>("MUC_RequestItemDrop", (Action<long, ZDOID, ZPackage>)ContainerRPCHandler.RPC_RequestDrop);
		ZRoutedRpc.instance.Register<ZDOID, ZPackage>("MUC_RequestItemMoveResponse", (Action<long, ZDOID, ZPackage>)InventoryHandler.RPC_RequestItemMoveResponse);
		ZRoutedRpc.instance.Register<ZDOID, ZPackage>("MUC_RequestItemAddResponse", (Action<long, ZDOID, ZPackage>)InventoryHandler.RPC_RequestItemAddResponse);
		ZRoutedRpc.instance.Register<ZDOID, ZPackage>("MUC_RequestItemRemoveResponse", (Action<long, ZDOID, ZPackage>)InventoryHandler.RPC_RequestItemRemoveResponse);
		ZRoutedRpc.instance.Register<ZDOID, ZPackage>("MUC_RequestItemConsumeResponse", (Action<long, ZDOID, ZPackage>)InventoryHandler.RPC_RequestItemConsumeResponse);
		ZRoutedRpc.instance.Register<ZDOID, ZPackage>("MUC_RequestItemDropResponse", (Action<long, ZDOID, ZPackage>)InventoryHandler.RPC_RequestDropResponse);
	}

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	public static void InvokeRPC(ZNetView netView, string rpc, IPackage package)
	{
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		ZRoutedRpc.instance.InvokeRoutedRPC(netView.m_zdo.GetOwner(), rpc, new object[2]
		{
			netView.m_zdo.m_uid,
			package.WriteToPackage()
		});
	}
}
