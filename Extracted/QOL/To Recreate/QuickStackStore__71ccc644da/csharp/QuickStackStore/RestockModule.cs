using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using UnityEngine;

namespace QuickStackStore;

internal class RestockModule
{
	private static bool ShouldRestockItem(ItemData item, UserConfig playerConfig, int inventoryHeight, int inventoryWidth, bool includeHotbar)
	{
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_005d: Invalid comparison between Unknown and I4
		//IL_007b: Unknown result type (might be due to invalid IL or missing references)
		//IL_005f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0061: Invalid comparison between Unknown and I4
		int configBasedMaxStackSize = GetConfigBasedMaxStackSize(item.m_shared);
		ItemType itemType = item.m_shared.m_itemType;
		return configBasedMaxStackSize > 1 && configBasedMaxStackSize > item.m_stack && (item.m_customData == null || item.m_customData.Count == 0) && ((item.m_gridPos.y > 0) | includeHotbar) && (!QSSConfig.RestockConfig.RestockOnlyAmmoAndConsumables.Value || (int)itemType == 9 || (int)itemType == 2) && (!QSSConfig.RestockConfig.RestockOnlyFavoritedItems.Value || playerConfig.IsItemNameOrSlotFavorited(item)) && !CompatibilitySupport.IsEquipSlot(inventoryHeight, inventoryWidth, item.m_gridPos);
	}

	private static int GetConfigBasedMaxStackSize(SharedData shared)
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Invalid comparison between Unknown and I4
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Invalid comparison between Unknown and I4
		int num = shared.m_maxStackSize;
		int num2 = 0;
		if ((int)shared.m_itemType == 9)
		{
			num2 = QSSConfig.RestockConfig.RestockStackSizeLimitAmmo.Value;
		}
		else if ((int)shared.m_itemType == 2)
		{
			num2 = QSSConfig.RestockConfig.RestockStackSizeLimitConsumables.Value;
		}
		if (num2 <= 0)
		{
			num2 = QSSConfig.RestockConfig.RestockStackSizeLimitGeneral.Value;
		}
		if (num2 > 0)
		{
			num = Math.Min(num, num2);
		}
		return num;
	}

	private static bool ShouldAreaRestock(Container currentContainer)
	{
		return QSSConfig.RestockConfig.RestockFromNearbyRange.Value > 0f && ((Object)(object)currentContainer == (Object)null || QSSConfig.RestockConfig.RestockHotkeyBehaviorWhenContainerOpen.Value != QSSConfig.RestockBehavior.RestockOnlyFromCurrentContainer) && CompatibilitySupport.AllowAreaStackingRestocking();
	}

	internal static void DoRestock(Player player, bool RestockOnlyFromCurrentContainerOverride = false)
	{
		//IL_01af: Unknown result type (might be due to invalid IL or missing references)
		if (((Character)player).IsTeleporting() || !Object.op_Implicit((Object)(object)InventoryGui.instance.m_container))
		{
			return;
		}
		InventoryGui.instance.SetupDragItem((ItemData)null, (Inventory)null, 0);
		UserConfig playerConfig = UserConfig.GetPlayerConfig(player.GetPlayerID());
		bool includeHotbar = QSSConfig.GeneralConfig.OverrideHotkeyBarBehavior.Value != QSSConfig.OverrideHotkeyBarBehavior.NeverAffectHotkeyBar && QSSConfig.RestockConfig.RestockIncludesHotkeyBar.Value;
		List<RestockData> list = (from itemData in ((Humanoid)player).m_inventory.m_inventory
			where ShouldRestockItem(itemData, playerConfig, ((Humanoid)player).m_inventory.GetHeight(), ((Humanoid)player).m_inventory.GetWidth(), includeHotbar)
			select new RestockData(itemData, itemData.m_stack, GetConfigBasedMaxStackSize(itemData.m_shared))).ToList();
		int count = list.Count;
		if (count == 0 && QSSConfig.RestockConfig.ShowRestockResultMessage.Value)
		{
			((Character)player).Message((MessageType)2, LocalizationConfig.GetRelevantTranslation(LocalizationConfig.RestockResultMessageNothing, "RestockResultMessageNothing"), 0, (Sprite)null, false);
			return;
		}
		list.Sort((RestockData a, RestockData b) =>
		{
			//IL_0007: Unknown result type (might be due to invalid IL or missing references)
			//IL_0012: Unknown result type (might be due to invalid IL or missing references)
			return -1 * Helper.CompareSlotOrder(a.itemData.m_gridPos, b.itemData.m_gridPos);
		});
		int num = 0;
		HashSet<Vector2i> hashSet = new HashSet<Vector2i>();
		Container currentContainer = InventoryGui.instance.m_currentContainer;
		if ((Object)(object)currentContainer != (Object)null)
		{
			num = RestockFromThisContainer(list, ((Humanoid)player).m_inventory, currentContainer.m_inventory, hashSet);
		}
		if (RestockOnlyFromCurrentContainerOverride || !ShouldAreaRestock(currentContainer))
		{
			ReportRestockResult(player, num, hashSet.Count, count);
			return;
		}
		List<Container> list2 = ContainerFinder.FindContainersInRange(((Component)player).transform.position, QSSConfig.RestockConfig.RestockFromNearbyRange.Value);
		Stopwatch stopwatch = new Stopwatch();
		stopwatch.Start();
		if (list2.Count > 0)
		{
			num += RestockFromMultipleContainers(list, player, list2, hashSet);
		}
		stopwatch.Stop();
		Helper.Log($"Restocking time: {stopwatch.Elapsed}", QSSConfig.DebugSeverity.AlsoSpeedTests);
		ReportRestockResult(player, num, hashSet.Count, count);
	}

	private static int RestockFromThisContainer(List<RestockData> itemsToRestock, Inventory playerInventory, Inventory container, HashSet<Vector2i> partiallyFilledStacks, bool callPlayerInvChanged = true)
	{
		//IL_010d: Unknown result type (might be due to invalid IL or missing references)
		if (itemsToRestock != null && itemsToRestock.Count <= 0)
		{
			return 0;
		}
		int num = 0;
		for (int num2 = itemsToRestock.Count - 1; num2 >= 0; num2--)
		{
			RestockData restockData = itemsToRestock[num2];
			for (int num3 = container.m_inventory.Count - 1; num3 >= 0; num3--)
			{
				ItemData val = container.m_inventory[num3];
				if ((val.m_customData == null || val.m_customData.Count <= 0) && !(val.m_shared.m_name != restockData.itemData.m_shared.m_name) && val.m_quality == restockData.itemData.m_quality)
				{
					int num4 = Math.Min(restockData.maximumWantedStackSize - restockData.potentialCurrentStackSize, val.m_stack);
					if (num4 > 0)
					{
						restockData.potentialCurrentStackSize += num4;
						partiallyFilledStacks.Add(restockData.itemData.m_gridPos);
						playerInventory.MoveItemToThis(container, val, num4, restockData.itemData.m_gridPos.x, restockData.itemData.m_gridPos.y);
					}
					if (restockData.potentialCurrentStackSize == restockData.maximumWantedStackSize)
					{
						itemsToRestock.RemoveAt(num2);
						num++;
						break;
					}
				}
			}
		}
		if (callPlayerInvChanged)
		{
			playerInventory.Changed(false, false);
		}
		return num;
	}

	private static int RestockFromMultipleContainers(List<RestockData> itemsToRestock, Player player, List<Container> containers, HashSet<Vector2i> partialRestockCounter)
	{
		int num = 0;
		bool isSinglePlayer = AreaStackRestockHelper.IsTrueSingleplayer();
		foreach (Container container in containers)
		{
			if (AreaStackRestockHelper.ShouldAffectNonOwnerContainer(container, player.GetPlayerID(), isSinglePlayer))
			{
				if (CompatibilitySupport.HasPlugin("com.maxsch.valheim.MultiUserChest"))
				{
					num += RestockFromThisContainer(itemsToRestock, ((Humanoid)player).m_inventory, container.m_inventory, partialRestockCounter, callPlayerInvChanged: false);
					continue;
				}
				container.m_nview.ClaimOwnership();
				AreaStackRestockHelper.SetNonMUCContainerInUse(container, isInUse: true);
				num += RestockFromThisContainer(itemsToRestock, ((Humanoid)player).m_inventory, container.m_inventory, partialRestockCounter, callPlayerInvChanged: false);
				AreaStackRestockHelper.SetNonMUCContainerInUse(container, isInUse: false);
			}
		}
		((Humanoid)player).m_inventory.Changed(false, false);
		return num;
	}

	public static void ReportRestockResult(Player player, int movedCount, int partiallyFilledCount, int totalCount)
	{
		if (QSSConfig.RestockConfig.ShowRestockResultMessage.Value)
		{
			string text;
			if (movedCount == 0 && partiallyFilledCount == 0)
			{
				text = string.Format(LocalizationConfig.GetRelevantTranslation(LocalizationConfig.RestockResultMessageNone, "RestockResultMessageNone"), totalCount);
			}
			else if (movedCount < totalCount)
			{
				text = string.Format(LocalizationConfig.GetRelevantTranslation(LocalizationConfig.RestockResultMessagePartial, "RestockResultMessagePartial"), partiallyFilledCount, totalCount);
			}
			else if (movedCount == totalCount)
			{
				text = string.Format(LocalizationConfig.GetRelevantTranslation(LocalizationConfig.RestockResultMessageFull, "RestockResultMessageFull"), totalCount);
			}
			else
			{
				text = $"Invalid restock: Restocked more items than we originally had ({movedCount}/{totalCount})";
				Helper.LogO(text);
			}
			((Character)player).Message((MessageType)2, text, 0, (Sprite)null, false);
		}
	}
}
