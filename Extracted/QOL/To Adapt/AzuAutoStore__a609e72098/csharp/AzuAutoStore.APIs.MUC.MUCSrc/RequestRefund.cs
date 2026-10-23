using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC.MUCSrc.Data;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;
using AzuAutoStore.Util;
using BepInEx;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public static class RequestRefund
{
	private const float RefundTimeout = 30f;

	private const float RememberFor = 600f;

	private static readonly WaitForSeconds RefundDelay = new WaitForSeconds(30f);

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 1, 0, 1 })]
	private static readonly Dictionary<int, (IRequest request, float at)> Refunded = new Dictionary<int, (IRequest, float)>();

	private static readonly List<int> Expired = new List<int>();

	public static void Watch(IRequest request)
	{
		if (request != null && Object.op_Implicit((Object)(object)ZNet.instance))
		{
			((MonoBehaviour)ThreadingHelper.Instance).StartCoroutine(RefundIfUnanswered(request, ZNet.instance));
		}
	}

	private static IEnumerator RefundIfUnanswered(IRequest request, ZNet session)
	{
		yield return RefundDelay;
		if (!PackageHandler.GetPackage<IRequest>(request.RequestID, out var package) || package != request || (Object)(object)ZNet.instance != (Object)(object)session)
		{
			yield break;
		}
		Inventory val = RefundTarget(request);
		if (val == null)
		{
			yield break;
		}
		PackageHandler.RemovePackage(request.RequestID);
		DropExpired();
		Refunded[request.RequestID] = (request, Time.time);
		if (!(request is RequestChestAdd requestChestAdd))
		{
			if (request is RequestChestRemove requestChestRemove)
			{
				InventoryBlock.Get(requestChestRemove.TargetInventory).ReleaseSlot(requestChestRemove.toPos);
				Give(val, requestChestRemove.switchItem, requestChestRemove.toPos);
				Log.LogWarning($"No answer from the chest owner after {30f}s, gave back {requestChestRemove.switchItem.m_stack} {requestChestRemove.switchItem.m_shared.m_name}");
			}
		}
		else
		{
			InventoryBlock.Get(requestChestAdd.SourceInventory).ReleaseSlot(requestChestAdd.dragItem.m_gridPos);
			Give(val, requestChestAdd.dragItem, requestChestAdd.dragItem.m_gridPos);
			Log.LogWarning($"No answer from the chest owner after {30f}s, gave back {requestChestAdd.dragItem.m_stack} {requestChestAdd.dragItem.m_shared.m_name}");
		}
	}

	public static bool HandleLateAdd(RequestChestAddResponse response)
	{
		//IL_005e: Unknown result type (might be due to invalid IL or missing references)
		if (!TryTake(response.SourceID, out var request))
		{
			return false;
		}
		Inventory val = RefundTarget(request);
		if (!(request is RequestChestAdd requestChestAdd) || val == null)
		{
			return true;
		}
		if (response.Amount > 0)
		{
			TakeBack(val, requestChestAdd.dragItem, response.Amount);
		}
		if (response.Amount >= requestChestAdd.dragItem.m_stack)
		{
			Give(val, response.switchItem, new Vector2i(-1, -1));
		}
		return true;
	}

	public static bool HandleLateRemove(RequestChestRemoveResponse response)
	{
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		if (!TryTake(response.SourceID, out var request))
		{
			return false;
		}
		Inventory val = RefundTarget(request);
		if (!(request is RequestChestRemove requestChestRemove) || val == null || !response.Success)
		{
			return true;
		}
		Give(val, response.responseItem, new Vector2i(-1, -1));
		if (requestChestRemove.switchItem != null)
		{
			TakeBack(val, requestChestRemove.switchItem, requestChestRemove.switchItem.m_stack);
		}
		return true;
	}

	private static Inventory RefundTarget(IRequest request)
	{
		Inventory val = ((request is RequestChestAdd) ? request.SourceInventory : request.TargetInventory);
		InventoryOwner owner = InventoryOwner.GetOwner(val);
		if (owner != null && owner.IsValid() && owner.ZNetView.IsOwner())
		{
			return val;
		}
		if (!Object.op_Implicit((Object)(object)Player.m_localPlayer))
		{
			return null;
		}
		return ((Humanoid)Player.m_localPlayer).GetInventory();
	}

	private static void Give(Inventory inventory, ItemData item, Vector2i pos)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		if (item == null || item.m_stack <= 0)
		{
			return;
		}
		ItemData val = item.Clone();
		if (pos.x < 0 || pos.y < 0 || !inventory.AddItemToInventory(val, val.m_stack, pos))
		{
			InventoryMove.MoveStack(inventory, val);
			if (val.m_stack > 0 && Object.op_Implicit((Object)(object)Player.m_localPlayer))
			{
				InventoryHandler.DropItem(val, val.m_stack);
			}
		}
	}

	private static void TakeBack(Inventory inventory, ItemData item, int amount)
	{
		string name = item.m_shared.m_name;
		int num = inventory.CountItems(name, item.m_quality, true);
		inventory.RemoveItem(name, Mathf.Min(num, amount), item.m_quality, true);
		if (num < amount)
		{
			Log.LogWarning($"Late chest answer: wanted to take back {amount} {name} after refunding, only found {num}");
		}
	}

	private static bool TryTake(int id, out IRequest request)
	{
		DropExpired();
		if (Refunded.TryGetValue(id, out (IRequest, float) value))
		{
			Refunded.Remove(id);
			(request, _) = value;
			return true;
		}
		request = null;
		return false;
	}

	private static void DropExpired()
	{
		if (Refunded.Count == 0)
		{
			return;
		}
		Expired.Clear();
		foreach (KeyValuePair<int, (IRequest, float)> item in Refunded)
		{
			if (Time.time - item.Value.Item2 >= 600f)
			{
				Expired.Add(item.Key);
			}
		}
		for (int i = 0; i < Expired.Count; i++)
		{
			Refunded.Remove(Expired[i]);
		}
		Expired.Clear();
	}

	static RequestRefund()
	{
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_000f: Expected Obj, but got Unknown
	}
}
