using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Data;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;
using AzuAutoStore.APIs.MUC.MUCSrc.Patches;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public static class ContainerHandler
{
	public static RequestChestAdd AddItemToChest(this Container container, ItemData item, Inventory sourceInventory, Vector2i to, ZDOID sender, int dragAmount = -1)
	{
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Unknown result type (might be due to invalid IL or missing references)
		//IL_008a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0099: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b1: Unknown result type (might be due to invalid IL or missing references)
		if (!Object.op_Implicit((Object)(object)container) || !Object.op_Implicit((Object)(object)container.m_nview) || !container.m_nview.HasOwner())
		{
			return new RequestChestAdd(Vector2i.zero, 0, null, null, null);
		}
		dragAmount = PossibleDragAmount(container.GetInventory(), item, to, dragAmount);
		ItemData itemAt = container.GetInventory().GetItemAt(to.x, to.y);
		bool flag = itemAt != null && dragAmount != item.m_stack && !InventoryHelper.CanStack(itemAt, item);
		if (((dragAmount <= 0) | flag) || !sourceInventory.ContainsItem(item))
		{
			return new RequestChestAdd(Vector2i.zero, 0, null, null, null);
		}
		RequestChestAdd requestChestAdd = new RequestChestAdd(to, dragAmount, item, sourceInventory, container.GetInventory());
		InventoryBlock.Get(sourceInventory).BlockSlot(item.m_gridPos);
		InventoryPreview.AddPackage(requestChestAdd);
		sourceInventory.RemoveItem(item, dragAmount);
		if (container.m_nview.IsOwner())
		{
			RequestChestAddResponse response = container.GetInventory().RequestItemAdd(requestChestAdd);
			InventoryHandler.RPC_RequestItemAddResponse(sourceInventory, response);
			return null;
		}
		GamePatches.InvokeRPC(container.m_nview, "MUC_RequestItemAdd", requestChestAdd);
		RequestRefund.Watch(requestChestAdd);
		return requestChestAdd;
	}

	internal static int PossibleDragAmount(Inventory inventoryTo, ItemData dragItem, Vector2i to, int dragAmount)
	{
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		dragAmount = ((dragAmount >= 0) ? Mathf.Min(dragAmount, dragItem.m_stack) : dragItem.m_stack);
		if (to.x >= 0 && to.y >= 0)
		{
			ItemData itemAt = inventoryTo.GetItemAt(to.x, to.y);
			if (itemAt != null && dragAmount < dragItem.m_stack)
			{
				if (InventoryHelper.CanStack(itemAt, dragItem))
				{
					return Mathf.Min(dragAmount, itemAt.m_shared.m_maxStackSize - itemAt.m_stack);
				}
				return 0;
			}
		}
		else if (!inventoryTo.HaveEmptySlot())
		{
			int num = inventoryTo.FindFreeStackSpace(dragItem.m_shared.m_name, (float)dragItem.m_worldLevel);
			return Mathf.Min(dragAmount, num);
		}
		return dragAmount;
	}

	public static RequestChestRemove RemoveItemFromChest(this Container container, ItemData item, Inventory destinationInventory, Vector2i to, ZDOID sender, int dragAmount = -1, ItemData switchItem = null)
	{
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_0027: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_005f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0052: Unknown result type (might be due to invalid IL or missing references)
		//IL_0074: Unknown result type (might be due to invalid IL or missing references)
		//IL_0079: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cc: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a8: Unknown result type (might be due to invalid IL or missing references)
		if (!Object.op_Implicit((Object)(object)container) || !Object.op_Implicit((Object)(object)container.m_nview) || !container.m_nview.HasOwner())
		{
			return new RequestChestRemove(Vector2i.zero, Vector2i.zero, 0, null, container.GetInventory(), destinationInventory);
		}
		dragAmount = PossibleDragAmount(destinationInventory, item, to, dragAmount);
		if (dragAmount <= 0 || InventoryBlock.Get(destinationInventory).IsSlotBlocked(to))
		{
			return new RequestChestRemove(Vector2i.zero, Vector2i.zero, 0, null, container.GetInventory(), destinationInventory);
		}
		RequestChestRemove requestChestRemove = new RequestChestRemove(item.m_gridPos, to, dragAmount, switchItem, container.GetInventory(), destinationInventory);
		if (switchItem != null && !InventoryHelper.CanStack(item, switchItem))
		{
			if (dragAmount != item.m_stack)
			{
				return new RequestChestRemove(Vector2i.zero, Vector2i.zero, 0, null, container.GetInventory(), destinationInventory);
			}
			destinationInventory.RemoveItem(switchItem);
		}
		InventoryBlock.Get(destinationInventory).BlockSlot(requestChestRemove.toPos);
		InventoryPreview.AddPackage(requestChestRemove);
		if (container.m_nview.IsOwner())
		{
			RequestChestRemoveResponse response = container.GetInventory().RequestItemRemove(requestChestRemove);
			InventoryHandler.RPC_RequestItemRemoveResponse(destinationInventory, response);
			return null;
		}
		GamePatches.InvokeRPC(container.m_nview, "MUC_RequestItemRemove", requestChestRemove);
		if (requestChestRemove.switchItem != null)
		{
			RequestRefund.Watch(requestChestRemove);
		}
		return requestChestRemove;
	}

	public static void MoveItemInChest(this Container container, ItemData item, Vector2i toPos, int dragAmount)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		RequestMove package = new RequestMove(item, toPos, dragAmount, container.GetInventory());
		InventoryPreview.AddPackage(package);
		GamePatches.InvokeRPC(container.m_nview, "MUC_RequestItemMove", package);
	}
}
