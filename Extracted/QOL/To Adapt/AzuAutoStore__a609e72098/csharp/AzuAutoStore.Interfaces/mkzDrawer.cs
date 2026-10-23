using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs;
using AzuAutoStore.Patches.Favoriting;
using AzuAutoStore.Util;
using AzuExtendedPlayerInventory;
using UnityEngine;

namespace AzuAutoStore.Interfaces;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public sealed class mkzDrawer(MkzItemDrawers_API.Drawer _drawer) : IContainer
{
	public GameObject gameObject => _drawer.gameObject;

	public ZNetView m_nview => _drawer.m_nview;

	private static bool CantStoreFavorite(ItemData item, UserConfig playerConfig)
	{
		return playerConfig.IsItemNameOrSlotFavorited(item);
	}

	internal static void LogDebug(string s)
	{
		AzuAutoStorePlugin.AzuAutoStoreLogger.LogDebug((object)s);
	}

	public bool IsOwner()
	{
		return true;
	}

	public static mkzDrawer Create(MkzItemDrawers_API.Drawer d)
	{
		return new mkzDrawer(d);
	}

	public int TryStore()
	{
		if (!Object.op_Implicit((Object)(object)Player.m_localPlayer))
		{
			return 0;
		}
		List<ItemData> allItems = ((Humanoid)Player.m_localPlayer).GetInventory().GetAllItems();
		int num = 0;
		for (int num2 = allItems.Count - 1; num2 >= 0; num2--)
		{
			ItemData item = allItems[num2];
			if (item != null && !item.m_equipped)
			{
				int x = item.m_gridPos.x;
				if ((x < 0 || x > 8 || item.m_gridPos.y != 0 || !AzuAutoStorePlugin.PlayerIgnoreHotbar.Value.IsOn()) && (!API.IsLoaded() || !API.GetQuickSlotsItems().Any([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemData q) =>
				{
					//IL_0001: Unknown result type (might be due to invalid IL or missing references)
					//IL_000c: Unknown result type (might be due to invalid IL or missing references)
					return q.m_gridPos == item.m_gridPos;
				})) && !CantStoreFavorite(item, UserConfig.GetPlayerConfig(Player.m_localPlayer.GetPlayerID())))
				{
					string text = (Object.op_Implicit((Object)(object)item.m_dropPrefab) ? ((Object)item.m_dropPrefab).name : null);
					if (!string.IsNullOrEmpty(text) && Boxes.CanItemBeStored(MiscFunctions.GetPrefabName(((Object)_drawer.gameObject).name), text) && (!AzuAutoStorePlugin.MustHaveExistingItemToPull.Value.IsOn() || string.Equals(_drawer.Prefab, text)) && _drawer.Accepts(text))
					{
						int stack = item.m_stack;
						if (stack > 0)
						{
							_drawer.Add(text, stack);
							num += stack;
						}
					}
				}
			}
		}
		if (num > 0 && !Boxes.ContainersToPing.Contains(this))
		{
			Boxes.ContainersToPing.Add(this);
		}
		return 0;
	}

	public int TryStoreThisItem(ItemData singleItemData = null, Inventory playerInventory = null)
	{
		if (!Object.op_Implicit((Object)(object)Player.m_localPlayer) || singleItemData == null)
		{
			return 0;
		}
		ItemData item = singleItemData;
		if (item.m_equipped)
		{
			return 0;
		}
		int x = item.m_gridPos.x;
		if (x >= 0 && x <= 8 && item.m_gridPos.y == 0 && AzuAutoStorePlugin.PlayerIgnoreHotbar.Value.IsOn())
		{
			return 0;
		}
		if (API.IsLoaded() && API.GetQuickSlotsItems().Any([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (ItemData q) =>
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_000c: Unknown result type (might be due to invalid IL or missing references)
			return q.m_gridPos == item.m_gridPos;
		}))
		{
			return 0;
		}
		if (CantStoreFavorite(item, UserConfig.GetPlayerConfig(Player.m_localPlayer.GetPlayerID())))
		{
			return 0;
		}
		string text = (Object.op_Implicit((Object)(object)item.m_dropPrefab) ? ((Object)item.m_dropPrefab).name : null);
		if (string.IsNullOrEmpty(text))
		{
			return 0;
		}
		if (!Boxes.CanItemBeStored(MiscFunctions.GetPrefabName(((Object)_drawer.gameObject).name), text))
		{
			return 0;
		}
		if (AzuAutoStorePlugin.MustHaveExistingItemToPull.Value.IsOn() && !string.Equals(_drawer.Prefab, text))
		{
			((Character)Player.m_localPlayer).Message((MessageType)2, "<color=red>" + item.m_shared.m_name + " [" + text + "] is not in nearby drawers</color>", 0, (Sprite)null, false);
			return 0;
		}
		if (!_drawer.Accepts(text))
		{
			return 0;
		}
		int stack = item.m_stack;
		if (stack <= 0)
		{
			return 0;
		}
		_drawer.Add(text, stack);
		if (!Boxes.ContainersToPing.Contains(this))
		{
			Boxes.ContainersToPing.Add(this);
		}
		return 0;
	}
}
