using System.Linq;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs;
using AzuAutoStore.Patches.Favoriting;
using AzuAutoStore.Util;
using AzuExtendedPlayerInventory;
using UnityEngine;

namespace AzuAutoStore.Interfaces;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
internal sealed class BowsBeforeHoesQuiver(ItemData quiverItem, Inventory inventory) : IContainer
{
	public GameObject gameObject => ((Component)Player.m_localPlayer).gameObject;

	public ZNetView m_nview => ((Character)Player.m_localPlayer).m_nview;

	public int TryStore()
	{
		if (!Object.op_Implicit((Object)(object)Player.m_localPlayer))
		{
			return 0;
		}
		int num = 0;
		Inventory val = ((Humanoid)Player.m_localPlayer).GetInventory();
		ItemData[] array = val.GetAllItems().ToArray();
		foreach (ItemData item in array)
		{
			num += TryStoreItem(item, val);
		}
		return num;
	}

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(2)]
	public int TryStoreThisItem(ItemData item = null, Inventory playerInventory = null)
	{
		if (!Object.op_Implicit((Object)(object)Player.m_localPlayer) || item == null)
		{
			return 0;
		}
		return TryStoreItem(item, playerInventory ?? ((Humanoid)Player.m_localPlayer).GetInventory());
	}

	private int TryStoreItem(ItemData item, Inventory playerInventory)
	{
		if (item.m_equipped || !MiscFunctions.CheckItemSharedIntegrity(item))
		{
			return 0;
		}
		int x = item.m_gridPos.x;
		if (x >= 0 && x <= 8 && item.m_gridPos.y == 0 && AzuAutoStorePlugin.PlayerIgnoreHotbar.Value.IsOn())
		{
			return 0;
		}
		if (API.IsLoaded() && API.GetQuickSlotsItems().Any([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemData quickItem) =>
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			return quickItem.m_gridPos == item.m_gridPos;
		}))
		{
			return 0;
		}
		if (BackpackContainer.CantStoreFavorite(item, UserConfig.GetPlayerConfig(Player.m_localPlayer.GetPlayerID())))
		{
			return 0;
		}
		if (AzuAutoStorePlugin.MustHaveExistingItemToPull.Value.IsOn() && !inventory.HaveItem(item.m_shared.m_name, true))
		{
			return 0;
		}
		if (!Boxes.CanItemBeStored(MiscFunctions.GetPrefabName(((Object)quiverItem.m_dropPrefab).name), ((Object)item.m_dropPrefab).name))
		{
			return 0;
		}
		int stack = item.m_stack;
		while (item.m_stack > 0)
		{
			ItemData val = item.Clone();
			val.m_stack = 1;
			if (!BowsBeforeHoesCompat.CanAdd(quiverItem, val) || !BowsBeforeHoesCompat.Add(quiverItem, val))
			{
				break;
			}
			ItemData val2 = item;
			val2.m_stack--;
		}
		int num = stack - item.m_stack;
		if (num == 0)
		{
			return 0;
		}
		if (item.m_stack == 0)
		{
			playerInventory.RemoveItem(item);
		}
		else
		{
			playerInventory.Changed(false, false);
		}
		if (!Boxes.ContainersToPing.Contains(this))
		{
			Boxes.ContainersToPing.Add(this);
		}
		return num;
	}

	public bool IsOwner()
	{
		return true;
	}
}
