using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using UnityEngine;

namespace QuickStackStore;

internal class QuickStackModule
{
	private static bool ShouldQuickStackItem(ItemData item, UserConfig playerConfig, int inventoryHeight, int inventoryWidth, bool includeHotbar)
	{
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		return item.m_shared.m_maxStackSize > 1 && ((item.m_gridPos.y > 0) | includeHotbar) && !playerConfig.IsItemNameOrSlotFavorited(item) && !CompatibilitySupport.IsEquipOrQuickSlot(inventoryHeight, inventoryWidth, item.m_gridPos);
	}

	private static bool ShouldAreaQuickStack(Container currentContainer)
	{
		return QSSConfig.QuickStackConfig.QuickStackToNearbyRange.Value > 0f && ((Object)(object)currentContainer == (Object)null || QSSConfig.QuickStackConfig.QuickStackHotkeyBehaviorWhenContainerOpen.Value != QSSConfig.QuickStackBehavior.QuickStackOnlyToCurrentContainer) && CompatibilitySupport.AllowAreaStackingRestocking();
	}

	internal static void DoQuickStack(Player player, bool onlyQuickStackToCurrentContainer = false, Container currentContainerOverride = null)
	{
		//IL_0143: Unknown result type (might be due to invalid IL or missing references)
		//IL_014a: Invalid comparison between Unknown and I4
		//IL_01f5: Unknown result type (might be due to invalid IL or missing references)
		if (((Character)player).IsTeleporting() || !Object.op_Implicit((Object)(object)InventoryGui.instance.m_container))
		{
			return;
		}
		InventoryGui.instance.SetupDragItem((ItemData)null, (Inventory)null, 0);
		UserConfig playerConfig = UserConfig.GetPlayerConfig(player.GetPlayerID());
		bool includeHotbar = QSSConfig.GeneralConfig.OverrideHotkeyBarBehavior.Value != QSSConfig.OverrideHotkeyBarBehavior.NeverAffectHotkeyBar && QSSConfig.QuickStackConfig.QuickStackIncludesHotkeyBar.Value;
		List<ItemData> list = ((Humanoid)player).m_inventory.m_inventory.Where((ItemData itm) => ShouldQuickStackItem(itm, playerConfig, ((Humanoid)player).m_inventory.GetHeight(), ((Humanoid)player).m_inventory.GetWidth(), includeHotbar)).ToList();
		if (list.Count == 0 && QSSConfig.QuickStackConfig.ShowQuickStackResultMessage.Value)
		{
			((Character)player).Message((MessageType)2, LocalizationConfig.GetRelevantTranslation(LocalizationConfig.QuickStackResultMessageNothing, "QuickStackResultMessageNothing"), 0, (Sprite)null, false);
			return;
		}
		list.Sort((ItemData a, ItemData b) =>
		{
			//IL_0002: Unknown result type (might be due to invalid IL or missing references)
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			return -1 * Helper.CompareSlotOrder(a.m_gridPos, b.m_gridPos);
		});
		List<ItemData> list2 = null;
		if (QSSConfig.QuickStackConfig.QuickStackTrophiesIntoSameContainer.Value)
		{
			list2 = new List<ItemData>();
			for (int num = list.Count - 1; num >= 0; num--)
			{
				ItemData val = list[num];
				if ((int)val.m_shared.m_itemType == 13)
				{
					list.RemoveAt(num);
					list2.Insert(0, val);
				}
			}
		}
		int num2 = 0;
		Container val2 = (Object.op_Implicit((Object)(object)currentContainerOverride) ? currentContainerOverride : InventoryGui.instance.m_currentContainer);
		if ((Object)(object)val2 != (Object)null)
		{
			num2 = QuickStackIntoThisContainer(list2, list, ((Humanoid)player).m_inventory, val2.m_inventory);
		}
		if (onlyQuickStackToCurrentContainer || !ShouldAreaQuickStack(val2))
		{
			ReportQuickStackResult(player, num2);
			return;
		}
		List<Container> list3 = ContainerFinder.FindContainersInRange(((Component)player).transform.position, QSSConfig.QuickStackConfig.QuickStackToNearbyRange.Value);
		Stopwatch stopwatch = new Stopwatch();
		stopwatch.Start();
		if (list3.Count > 0)
		{
			num2 += QuickStackIntoMultipleContainers(list2, list, player, list3);
		}
		stopwatch.Stop();
		Helper.Log($"Quick stacking time: {stopwatch.Elapsed}", QSSConfig.DebugSeverity.AlsoSpeedTests);
		ReportQuickStackResult(player, num2);
	}

	private static int QuickStackIntoThisContainer(List<ItemData> trophies, List<ItemData> nonTrophies, Inventory playerInventory, Inventory container, bool callPlayerInvChanged = true)
	{
		//IL_0081: Unknown result type (might be due to invalid IL or missing references)
		//IL_0088: Invalid comparison between Unknown and I4
		int num = 0;
		Helper.Log($"Starting quick stack: inventory count: {playerInventory.m_inventory.Count}, container count: {container.m_inventory.Count}", QSSConfig.DebugSeverity.Everything);
		if (QSSConfig.QuickStackConfig.QuickStackTrophiesIntoSameContainer.Value && trophies != null && trophies.Count > 0)
		{
			for (int num2 = container.m_inventory.Count - 1; num2 >= 0; num2--)
			{
				ItemData val = container.m_inventory[num2];
				if ((int)val.m_shared.m_itemType == 13)
				{
					for (int num3 = trophies.Count - 1; num3 >= 0; num3--)
					{
						ItemData val2 = trophies[num3];
						if (container.AddItem(val2))
						{
							playerInventory.RemoveItem(val2);
							trophies.RemoveAt(num3);
							num++;
						}
					}
					break;
				}
			}
		}
		if (nonTrophies != null && nonTrophies.Count > 0)
		{
			if (container.m_inventory.Count == 0)
			{
				if (CompatibilitySupport.TryGetRestrictedContainer(container.m_name, out var allowedItem))
				{
					num = GetQuickStackCountIntoThisContainer(nonTrophies, playerInventory, container, num, allowedItem, checkDropPrefabName: true);
				}
			}
			else
			{
				for (int num4 = container.m_inventory.Count - 1; num4 >= 0; num4--)
				{
					string name = container.m_inventory[num4].m_shared.m_name;
					num = GetQuickStackCountIntoThisContainer(nonTrophies, playerInventory, container, num, name, checkDropPrefabName: false);
				}
			}
		}
		Helper.Log($"Finished quick stack: Removed {num} stacks (remember that these merge with non full stacks in the container first). Inventory count: {playerInventory.m_inventory.Count}, container count: {container.m_inventory.Count}", QSSConfig.DebugSeverity.Everything);
		if (callPlayerInvChanged)
		{
			playerInventory.Changed(false, false);
		}
		return num;
	}

	private static int GetQuickStackCountIntoThisContainer(List<ItemData> nonTrophies, Inventory playerInventory, Inventory container, int movedStackCount, string containerItemName, bool checkDropPrefabName)
	{
		for (int num = nonTrophies.Count - 1; num >= 0; num--)
		{
			ItemData val = nonTrophies[num];
			bool flag = ((!checkDropPrefabName || !Object.op_Implicit((Object)(object)val.m_dropPrefab)) ? (containerItemName == val.m_shared.m_name) : (containerItemName == ((Object)val.m_dropPrefab).name));
			if (flag && container.AddItem(val))
			{
				playerInventory.RemoveItem(val);
				nonTrophies.RemoveAt(num);
				movedStackCount++;
			}
		}
		return movedStackCount;
	}

	private static int QuickStackIntoMultipleContainers(List<ItemData> trophies, List<ItemData> nonTrophies, Player player, List<Container> containers)
	{
		int num = 0;
		bool isSinglePlayer = AreaStackRestockHelper.IsTrueSingleplayer();
		foreach (Container container in containers)
		{
			if (AreaStackRestockHelper.ShouldAffectNonOwnerContainer(container, player.GetPlayerID(), isSinglePlayer))
			{
				if (CompatibilitySupport.HasPlugin("com.maxsch.valheim.MultiUserChest"))
				{
					num += QuickStackIntoThisContainer(trophies, nonTrophies, ((Humanoid)player).m_inventory, container.m_inventory, callPlayerInvChanged: false);
					continue;
				}
				container.m_nview.ClaimOwnership();
				AreaStackRestockHelper.SetNonMUCContainerInUse(container, isInUse: true);
				num += QuickStackIntoThisContainer(trophies, nonTrophies, ((Humanoid)player).m_inventory, container.m_inventory, callPlayerInvChanged: false);
				AreaStackRestockHelper.SetNonMUCContainerInUse(container, isInUse: false);
			}
		}
		((Humanoid)player).m_inventory.Changed(false, false);
		return num;
	}

	public static void ReportQuickStackResult(Player player, int movedCount)
	{
		if (QSSConfig.QuickStackConfig.ShowQuickStackResultMessage.Value)
		{
			((Character)player).Message((MessageType)2, movedCount switch
			{
				0 => LocalizationConfig.GetRelevantTranslation(LocalizationConfig.QuickStackResultMessageNone, "QuickStackResultMessageNone"), 
				1 => LocalizationConfig.GetRelevantTranslation(LocalizationConfig.QuickStackResultMessageOne, "QuickStackResultMessageOne"), 
				_ => string.Format(LocalizationConfig.GetRelevantTranslation(LocalizationConfig.QuickStackResultMessageMore, "QuickStackResultMessageMore"), movedCount), 
			}, 0, (Sprite)null, false);
		}
	}
}
