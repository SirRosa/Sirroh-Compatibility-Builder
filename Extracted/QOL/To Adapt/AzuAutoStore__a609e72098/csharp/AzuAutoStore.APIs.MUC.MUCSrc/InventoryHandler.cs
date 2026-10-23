using System;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Data;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public static class InventoryHandler
{
	public static void RPC_RequestItemAddResponse(long sender, ZDOID containerId, ZPackage package)
	{
		RequestChestAddResponse requestChestAddResponse = new RequestChestAddResponse(package);
		if (!RequestRefund.HandleLateAdd(requestChestAddResponse))
		{
			HandleRPC(requestChestAddResponse, (RequestChestAddResponse p) => GetSourceInventory(p.SourceID), RPC_RequestItemAddResponse);
		}
	}

	public static void RPC_RequestItemRemoveResponse(long sender, ZDOID containerId, ZPackage package)
	{
		RequestChestRemoveResponse requestChestRemoveResponse = new RequestChestRemoveResponse(package);
		if (!RequestRefund.HandleLateRemove(requestChestRemoveResponse))
		{
			HandleRPC(requestChestRemoveResponse, (RequestChestRemoveResponse p) => GetTargetInventory(p.SourceID), RPC_RequestItemRemoveResponse);
		}
	}

	public static void RPC_RequestDropResponse(long sender, ZDOID containerId, ZPackage package)
	{
		HandleRPC(new RequestDropResponse(package), RPC_RequestDropResponse);
	}

	public static void RPC_RequestItemConsumeResponse(long sender, ZDOID containerId, ZPackage package)
	{
		HandleRPC(new RequestConsumeResponse(package), RPC_RequestItemConsumeResponse);
	}

	public static void RPC_RequestItemMoveResponse(long sender, ZDOID containerId, ZPackage package)
	{
		HandleRPC(new RequestMoveResponse(package), RPC_RequestItemMoveResponse);
	}

	private static void HandleRPC<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)] T>(T package, Func<T, Inventory> inventory, Container container, Action<Inventory, Container, T> handle) where T : IPackage
	{
		CallRPC(handle.Method.Name, package, () =>
		{
			handle(inventory(package), container, package);
		});
	}

	private static void HandleRPC<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)] T>(T package, Func<T, Inventory> inventory, Action<Inventory, T> handle) where T : IPackage
	{
		CallRPC(handle.Method.Name, package, () =>
		{
			handle(inventory(package), package);
		});
	}

	private static void HandleRPC<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)] T>(T package, Action<T> handle) where T : IPackage
	{
		CallRPC(handle.Method.Name, package, () =>
		{
			handle(package);
		});
	}

	private static void CallRPC(string timerName, IPackage package, Action action)
	{
		action?.Invoke();
	}

	public static void RPC_RequestItemRemoveResponse(Inventory inventory, RequestChestRemoveResponse response)
	{
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_003e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0055: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fc: Expected Obj, but got Unknown
		//IL_0061: Unknown result type (might be due to invalid IL or missing references)
		//IL_0077: Unknown result type (might be due to invalid IL or missing references)
		//IL_008a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0090: Unknown result type (might be due to invalid IL or missing references)
		Vector2i val = PackageHandler.GetPackage<RequestChestRemove>(response.SourceID)?.toPos ?? new Vector2i(-1, -1);
		if (inventory == null)
		{
			Player localPlayer = Player.m_localPlayer;
			inventory = ((localPlayer != null) ? ((Humanoid)localPlayer).GetInventory() : null);
		}
		if (inventory == null)
		{
			return;
		}
		InventoryBlock.Get(inventory).ReleaseSlot(val);
		InventoryPreview.RemovePackage(response);
		if (response.Success && val.x >= 0 && val.y >= 0)
		{
			if (!inventory.AddItemToInventory(response.responseItem, response.Amount, val))
			{
				int num = response.Amount;
				ItemData itemAt = inventory.GetItemAt(val.x, val.y);
				if (itemAt != null && InventoryHelper.CanStack(response.responseItem, itemAt))
				{
					int maxStackSize = itemAt.m_shared.m_maxStackSize;
					int stack = itemAt.m_stack;
					int num2 = maxStackSize - stack;
					itemAt.m_stack += num2;
					num -= num2;
				}
				DropItem(response.responseItem, num);
			}
		}
		else if (response.responseItem != null)
		{
			Inventory val2 = new Inventory("tmp", (Sprite)null, 1, 1);
			val2.AddItem(response.responseItem);
			inventory.MoveItemToThis(val2, response.responseItem);
			ItemData itemAt2 = val2.GetItemAt(0, 0);
			if (itemAt2 != null)
			{
				DropItem(itemAt2, itemAt2.m_stack);
			}
		}
		UpdateGUIAfterPlayerMove(GetTargetInventory(response.SourceID));
	}

	private static void RPC_RequestDropResponse(RequestDropResponse response)
	{
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		DropItem(response.responseItem, response.responseItem?.m_stack ?? 0);
		UpdateGUIAfterPlayerMove(response.sender);
	}

	private static void UpdateGUIAfterPlayerMove(ZDOID sender)
	{
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		if (Object.op_Implicit((Object)(object)InventoryGui.instance) && Object.op_Implicit((Object)(object)Player.m_localPlayer) && sender == ((Character)Player.m_localPlayer).GetZDOID())
		{
			InventoryGui.instance.UpdateCraftingPanel(false);
		}
	}

	private static void UpdateGUIAfterPlayerMove(Inventory inventory)
	{
		if (Object.op_Implicit((Object)(object)InventoryGui.instance) && Object.op_Implicit((Object)(object)Player.m_localPlayer) && ((Humanoid)Player.m_localPlayer).GetInventory().GetInventories().Contains(inventory))
		{
			InventoryGui.instance.UpdateCraftingPanel(false);
		}
	}

	public static void DropItem(ItemData item, int amount)
	{
		if (amount > 0 && item != null)
		{
			DropItem(Player.m_localPlayer, item, amount);
		}
	}

	private static void DropItem(Player player, ItemData item, int amount)
	{
		//IL_000a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		//IL_0015: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0026: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		//IL_0047: Unknown result type (might be due to invalid IL or missing references)
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		//IL_0072: Unknown result type (might be due to invalid IL or missing references)
		//IL_0077: Unknown result type (might be due to invalid IL or missing references)
		//IL_0085: Unknown result type (might be due to invalid IL or missing references)
		//IL_008b: Unknown result type (might be due to invalid IL or missing references)
		Transform transform = ((Component)player).transform;
		ItemDrop val = ItemDrop.DropItem(item, amount, transform.position + transform.forward + transform.up, transform.rotation);
		val.OnPlayerDrop();
		((Component)val).GetComponent<Rigidbody>().velocity = (transform.forward + Vector3.up) * 5f;
		((Character)player).m_zanim.SetTrigger("interact");
		((Humanoid)player).m_dropEffects.Create(transform.position, Quaternion.identity, (Transform)null, 1f, -1, default(ZDOID));
		ItemData itemData = val.m_itemData;
		((Character)player).Message((MessageType)1, "$msg_dropped " + itemData.m_shared.m_name, itemData.m_stack, itemData.GetIcon(), false);
	}

	public static void RPC_RequestItemAddResponse(Inventory inventory, RequestChestAddResponse response)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		Vector2i inventoryPos = response.inventoryPos;
		ItemData switchItem = response.switchItem;
		if (inventory == null)
		{
			Player localPlayer = Player.m_localPlayer;
			inventory = ((localPlayer != null) ? ((Humanoid)localPlayer).GetInventory() : null);
		}
		if (inventory != null)
		{
			InventoryBlock.Get(inventory).ReleaseSlot(inventoryPos);
			InventoryPreview.RemovePackage(response);
			if (switchItem != null && !inventory.AddItemToInventory(switchItem, switchItem.m_stack, inventoryPos))
			{
				DropItem(switchItem, switchItem.m_stack);
			}
			UpdateGUIAfterPlayerMove(GetSourceInventory(response.SourceID));
		}
	}

	public static void RPC_RequestItemConsumeResponse(RequestConsumeResponse response)
	{
		Player localPlayer = Player.m_localPlayer;
		InventoryBlock.Get(((Humanoid)localPlayer).GetInventory()).BlockConsume = false;
		if (response.item != null && ((Humanoid)localPlayer).CanConsumeItem(response.item, false))
		{
			if (Object.op_Implicit((Object)(object)response.item.m_shared.m_consumeStatusEffect))
			{
				((Character)localPlayer).m_seman.AddStatusEffect(response.item.m_shared.m_consumeStatusEffect, true, 0, 0f, (short)(-1));
			}
			if ((double)response.item.m_shared.m_food > 0.0)
			{
				localPlayer.EatFood(response.item);
			}
		}
	}

	public static void RPC_RequestItemMoveResponse(RequestMoveResponse response)
	{
		InventoryPreview.RemovePackage(response);
	}

	internal static Inventory GetSourceInventory(int id)
	{
		return PackageHandler.GetPackage<IRequest>(id)?.SourceInventory;
	}

	internal static Inventory GetTargetInventory(int id)
	{
		return PackageHandler.GetPackage<IRequest>(id)?.TargetInventory;
	}
}
