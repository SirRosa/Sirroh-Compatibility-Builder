using System;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Data;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;
using AzuAutoStore.Util;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public static class ContainerRPCHandler
{
	public static void RPC_RequestItemAdd(long sender, ZDOID containerId, ZPackage package)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		HandleRPC(containerId, sender, "MUC_RequestItemAddResponse", RequestItemAdd, new RequestChestAdd(package));
	}

	public static void RPC_RequestItemRemove(long sender, ZDOID containerId, ZPackage package)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		HandleRPC(containerId, sender, "MUC_RequestItemRemoveResponse", RequestItemRemove, new RequestChestRemove(package));
	}

	public static void RPC_RequestItemConsume(long sender, ZDOID containerId, ZPackage package)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		HandleRPC(containerId, sender, "MUC_RequestItemConsumeResponse", RequestItemConsume, new RequestConsume(package));
	}

	public static void RPC_RequestItemMove(long sender, ZDOID containerId, ZPackage package)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		HandleRPC(containerId, sender, "MUC_RequestItemMoveResponse", RequestItemMove, new RequestMove(package));
	}

	public static void RPC_RequestDrop(long sender, ZDOID containerId, ZPackage package)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		HandleRPC(containerId, sender, "MUC_RequestItemDropResponse", RequestDrop, new RequestDrop(package));
	}

	private static void HandleRPC<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)] TResponse, [_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)] TInput>(ZDOID containerId, long target, string rpcInvoke, Func<Inventory, TInput, TResponse> message, TInput input) where TResponse : IResponse, new() where TInput : IPackage
	{
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_00aa: Unknown result type (might be due to invalid IL or missing references)
		ZDO zDO = ZDOMan.instance.GetZDO(containerId);
		ZNetView val = ((zDO != null) ? ZNetScene.instance.FindInstance(zDO) : null);
		TResponse val2;
		if (!Object.op_Implicit((Object)(object)val) || !val.IsOwner())
		{
			val2 = FallbackResponse<TResponse>(input as IRequest);
		}
		else
		{
			Container componentInChildren = ((Component)val).GetComponentInChildren<Container>();
			if (Object.op_Implicit((Object)(object)componentInChildren))
			{
				val2 = message(componentInChildren.GetInventory(), input);
			}
			else
			{
				Log.LogWarning(input.GetType().Name + ": not handling RPC, Container component not found on " + ((Object)val).name);
				val2 = FallbackResponse<TResponse>(input as IRequest);
			}
		}
		ZRoutedRpc.instance.InvokeRoutedRPC(target, rpcInvoke, new object[2]
		{
			containerId,
			val2.WriteToPackage()
		});
	}

	private static TResponse FallbackResponse<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)] TResponse>(IRequest request) where TResponse : IResponse, new()
	{
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		//IL_005d: Unknown result type (might be due to invalid IL or missing references)
		TResponse val = new TResponse
		{
			SourceID = (request?.RequestID ?? 0)
		};
		if (request is RequestChestAdd requestChestAdd && val is RequestChestAddResponse requestChestAddResponse)
		{
			requestChestAddResponse.switchItem = requestChestAdd.dragItem;
			requestChestAddResponse.inventoryPos = requestChestAdd.dragItem?.m_gridPos ?? Vector2i.zero;
		}
		else if (request is RequestChestRemove requestChestRemove && val is RequestChestRemoveResponse requestChestRemoveResponse)
		{
			requestChestRemoveResponse.responseItem = requestChestRemove.switchItem;
		}
		return val;
	}

	public static RequestChestAddResponse RequestItemAdd(this Inventory inventory, RequestChestAdd request)
	{
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		if (request.dragItem == null)
		{
			return new RequestChestAddResponse(request.RequestID, success: false, Vector2i.zero, 0, request.dragItem);
		}
		if (request.toPos.x < 0 || request.toPos.y < 0)
		{
			return AddToAnySlot(inventory, request);
		}
		return AddToSlot(inventory, request);
	}

	private static RequestChestAddResponse AddToSlot(Inventory inventory, RequestChestAdd request)
	{
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0091: Unknown result type (might be due to invalid IL or missing references)
		//IL_007a: Unknown result type (might be due to invalid IL or missing references)
		//IL_007f: Unknown result type (might be due to invalid IL or missing references)
		if (!CanStack(inventory, request, out var stackSpace, out var removedItem))
		{
			return new RequestChestAddResponse(request.RequestID, success: false, request.dragItem.m_gridPos, 0, request.dragItem);
		}
		bool flag = inventory.AddItemToInventory(request.dragItem, stackSpace, request.toPos);
		if (!flag)
		{
			stackSpace = 0;
		}
		if (!flag || stackSpace != request.dragItem.m_stack)
		{
			removedItem = request.dragItem;
			removedItem.m_stack = request.dragItem.m_stack - stackSpace;
		}
		if (removedItem != null)
		{
			removedItem.m_gridPos = request.dragItem.m_gridPos;
		}
		return new RequestChestAddResponse(request.RequestID, flag, request.dragItem.m_gridPos, stackSpace, removedItem);
	}

	private static bool CanStack(Inventory inventory, RequestChestAdd request, out int stackSpace, out ItemData removedItem)
	{
		ItemData itemAt = inventory.GetItemAt(request.toPos.x, request.toPos.y);
		removedItem = null;
		if (itemAt == null)
		{
			stackSpace = request.dragItem.m_stack;
			return true;
		}
		if (InventoryHelper.CanStack(itemAt, request.dragItem))
		{
			stackSpace = Mathf.Min(itemAt.m_shared.m_maxStackSize - itemAt.m_stack, request.dragItem.m_stack);
			return true;
		}
		if (request.allowSwitch)
		{
			inventory.RemoveItem(itemAt, itemAt.m_stack);
			removedItem = itemAt;
			stackSpace = request.dragItem.m_stack;
			return true;
		}
		stackSpace = 0;
		return false;
	}

	private static RequestChestAddResponse AddToAnySlot(Inventory inventory, RequestChestAdd request)
	{
		//IL_0092: Unknown result type (might be due to invalid IL or missing references)
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		int num = InventoryMove.HowMuchFits(inventory, request.dragItem);
		if (num > 0)
		{
			ItemData val = request.dragItem.Clone();
			val.m_stack = num;
			if (!inventory.AddItem(val))
			{
				num -= val.m_stack;
			}
		}
		if (num >= request.dragItem.m_stack)
		{
			return new RequestChestAddResponse(request.RequestID, success: true, request.dragItem.m_gridPos, request.dragItem.m_stack, null);
		}
		ItemData val2 = request.dragItem.Clone();
		val2.m_stack -= num;
		return new RequestChestAddResponse(request.RequestID, num > 0, request.dragItem.m_gridPos, num, val2);
	}

	public static RequestChestRemoveResponse RequestItemRemove(this Inventory inventory, RequestChestRemove request)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d7: Unknown result type (might be due to invalid IL or missing references)
		Vector2i fromPos = request.fromPos;
		int dragAmount = request.dragAmount;
		ItemData switchItem = request.switchItem;
		ItemData itemAt = inventory.GetItemAt(request.fromPos.x, request.fromPos.y);
		if (itemAt == null)
		{
			Log.LogDebug("from is null");
			return new RequestChestRemoveResponse(request.RequestID, success: false, 0, hasSwitched: false, request.switchItem);
		}
		int num = 0;
		bool flag = false;
		bool flag2 = false;
		if (switchItem == null)
		{
			num = Mathf.Min(itemAt.m_stack, dragAmount);
			flag = inventory.RemoveItem(itemAt, num);
		}
		else if (InventoryHelper.CanStack(itemAt, switchItem))
		{
			num = Mathf.Min(switchItem.m_shared.m_maxStackSize - switchItem.m_stack, dragAmount);
			flag = inventory.RemoveItem(itemAt, num);
		}
		else
		{
			if (dragAmount < itemAt.m_stack)
			{
				return new RequestChestRemoveResponse(request.RequestID, success: false, 0, hasSwitched: false, request.switchItem);
			}
			flag = inventory.RemoveItem(itemAt, dragAmount);
			num = Mathf.Min(itemAt.m_stack, dragAmount);
			flag2 = inventory.AddItemToInventory(switchItem, switchItem.m_stack, fromPos);
			if (!flag2)
			{
				Log.LogWarning("Could not switch item in Remove Request");
				InventoryHandler.DropItem(switchItem, switchItem.m_stack);
			}
		}
		ItemData val = itemAt.Clone();
		val.m_stack = num;
		return new RequestChestRemoveResponse(request.RequestID, flag, num, flag2, val);
	}

	public static RequestConsumeResponse RequestItemConsume(this Inventory inventory, RequestConsume request)
	{
		ItemData itemAt = inventory.GetItemAt(request.itemPosX, request.itemPosY);
		if (itemAt == null || itemAt.m_stack <= 0)
		{
			return new RequestConsumeResponse(null, success: false, 0);
		}
		inventory.RemoveOneItem(itemAt);
		ItemData val = itemAt.Clone();
		val.m_stack = 1;
		return new RequestConsumeResponse(val, success: true, 1);
	}

	public static RequestMoveResponse RequestItemMove(this Inventory inventory, RequestMove request)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_005d: Unknown result type (might be due to invalid IL or missing references)
		Vector2i fromPos = request.fromPos;
		Vector2i toPos = request.toPos;
		int dragAmount = request.dragAmount;
		ItemData itemAt = inventory.GetItemAt(fromPos.x, fromPos.y);
		if (itemAt == null)
		{
			return new RequestMoveResponse(request.RequestID, success: false, 0);
		}
		if (StringExtensionMethods.GetStableHashCode(itemAt.PrefabName()) != request.itemHash)
		{
			return new RequestMoveResponse(request.RequestID, success: false, 0);
		}
		bool success = InventoryHelper.MoveItem(inventory, itemAt, dragAmount, toPos, out var movedAmount);
		return new RequestMoveResponse(request.RequestID, success, movedAmount);
	}

	public static RequestDropResponse RequestDrop(this Inventory inventory, RequestDrop request)
	{
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_006a: Unknown result type (might be due to invalid IL or missing references)
		//IL_004f: Unknown result type (might be due to invalid IL or missing references)
		ItemData itemAt = inventory.GetItemAt(request.targetContainerSlot.x, request.targetContainerSlot.y);
		if (itemAt == null)
		{
			return new RequestDropResponse(null, request.sender, success: false, 0);
		}
		int num = Mathf.Min(itemAt.m_stack, request.amount);
		inventory.RemoveItem(itemAt, num);
		if (num == 0)
		{
			return new RequestDropResponse(null, request.sender, success: false, 0);
		}
		ItemData val = itemAt.Clone();
		val.m_stack = num;
		return new RequestDropResponse(val, request.sender, success: true, num);
	}
}
