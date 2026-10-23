using System.Collections.Generic;
using System.Runtime.CompilerServices;
using UnityEngine;

namespace AzuAutoStore.APIs.MUC.MUCSrc;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public class InventoryBlock
{
	private static readonly ConditionalWeakTable<Inventory, InventoryBlock> Inventories = new ConditionalWeakTable<Inventory, InventoryBlock>();

	private const float BlockTimeout = 30f;

	private bool blockConsume;

	private float blockConsumeAt;

	private readonly Dictionary<Vector2i, float> blockedAt = new Dictionary<Vector2i, float>();

	private readonly List<Vector2i> expired = new List<Vector2i>();

	private static readonly ConditionalWeakTable<Inventory, InventoryBlock>.CreateValueCallback CreateBlock = (Inventory _) => new InventoryBlock();

	public bool BlockConsume
	{
		get
		{
			if (blockConsume)
			{
				return Time.time - blockConsumeAt < 30f;
			}
			return false;
		}
		set
		{
			blockConsume = value;
			blockConsumeAt = Time.time;
		}
	}

	public bool BlockAllSlots { get; set; }

	public Dictionary<Vector2i, int> BlockedSlots { get; } = new Dictionary<Vector2i, int>();

	public static InventoryBlock Get(Inventory inventory)
	{
		return Inventories.GetValue(inventory, CreateBlock);
	}

	public void BlockSlot(Vector2i slot)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0027: Unknown result type (might be due to invalid IL or missing references)
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		if (CanBlockSlot(slot))
		{
			if (BlockedSlots.ContainsKey(slot))
			{
				BlockedSlots[slot]++;
			}
			else
			{
				BlockedSlots[slot] = 1;
			}
			blockedAt[slot] = Time.time;
		}
	}

	public void ReleaseSlot(Vector2i slot)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		//IL_0046: Unknown result type (might be due to invalid IL or missing references)
		//IL_0053: Unknown result type (might be due to invalid IL or missing references)
		if (CanBlockSlot(slot) && BlockedSlots.ContainsKey(slot))
		{
			BlockedSlots[slot]--;
			if (BlockedSlots[slot] <= 0)
			{
				BlockedSlots.Remove(slot);
				blockedAt.Remove(slot);
			}
		}
	}

	public void ReleaseBlockedSlots()
	{
		BlockedSlots.Clear();
		blockedAt.Clear();
		expired.Clear();
		BlockAllSlots = false;
		BlockConsume = false;
	}

	public bool IsSlotBlocked(Vector2i slot)
	{
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		//IL_003e: Unknown result type (might be due to invalid IL or missing references)
		if (BlockConsume || BlockAllSlots)
		{
			return true;
		}
		if (!BlockedSlots.ContainsKey(slot))
		{
			return false;
		}
		if (HasExpired(slot))
		{
			BlockedSlots.Remove(slot);
			blockedAt.Remove(slot);
			return false;
		}
		return true;
	}

	public bool IsAnySlotBlocked()
	{
		if (BlockConsume || BlockAllSlots)
		{
			return true;
		}
		DropExpired();
		return BlockedSlots.Count > 0;
	}

	private bool HasExpired(Vector2i slot)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		if (blockedAt.TryGetValue(slot, out var value))
		{
			return Time.time - value >= 30f;
		}
		return true;
	}

	private void DropExpired()
	{
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_0046: Unknown result type (might be due to invalid IL or missing references)
		//IL_007a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0092: Unknown result type (might be due to invalid IL or missing references)
		if (BlockedSlots.Count == 0)
		{
			return;
		}
		expired.Clear();
		foreach (KeyValuePair<Vector2i, int> blockedSlot in BlockedSlots)
		{
			if (HasExpired(blockedSlot.Key))
			{
				expired.Add(blockedSlot.Key);
			}
		}
		for (int i = 0; i < expired.Count; i++)
		{
			BlockedSlots.Remove(expired[i]);
			blockedAt.Remove(expired[i]);
		}
		expired.Clear();
	}

	private static bool CanBlockSlot(Vector2i slot)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0009: Unknown result type (might be due to invalid IL or missing references)
		if (slot.x >= 0)
		{
			return slot.y >= 0;
		}
		return false;
	}
}
