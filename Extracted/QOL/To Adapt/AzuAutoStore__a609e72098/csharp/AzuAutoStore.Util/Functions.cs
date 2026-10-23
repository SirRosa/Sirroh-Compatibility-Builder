using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;
using AzuAutoStore.Interfaces;
using AzuAutoStore.Patches;
using UnityEngine;

namespace AzuAutoStore.Util;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
public class Functions
{
	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
	private readonly struct NearbyContainer
	{
		internal readonly Container Container;

		internal readonly Vector3 Position;

		internal readonly float RangeSq;

		internal NearbyContainer(Container container, Vector3 position, float rangeSq)
		{
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			//IL_0009: Unknown result type (might be due to invalid IL or missing references)
			Container = container;
			Position = position;
			RangeSq = rangeSq;
		}
	}

	private static readonly Dictionary<string, float> RangeByPrefab = new Dictionary<string, float>();

	private static readonly List<NearbyContainer> Nearby = new List<NearbyContainer>();

	internal static readonly List<ItemDrop> AskedFor = new List<ItemDrop>();

	private static readonly Dictionary<Inventory, Inventory> PendingSends = new Dictionary<Inventory, Inventory>();

	public static void LogContainerStatus(Container container)
	{
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		try
		{
			object[] array = new object[4]
			{
				((Object)container).name,
				((Component)container).transform.position,
				container.m_nview.IsOwner() ? "owned" : "not owned",
				null
			};
			Inventory inventory = container.GetInventory();
			array[3] = ((inventory != null) ? inventory.NrOfItems() : 0);
			LogIfBuildDebug(string.Format("Container {0} at {1} is {2} and has {3} items.", array));
		}
		catch
		{
		}
	}

	internal static void ClearRangeCache()
	{
		RangeByPrefab.Clear();
	}

	internal static float GetContainerRange(Container container)
	{
		if (AzuAutoStorePlugin.yamlData == null)
		{
			AzuAutoStorePlugin.AzuAutoStoreLogger.LogError((object)"yamlData is null when trying to get the container range for a container. Make sure that your YAML file is not empty or to call DeserializeYamlFile() before using GetContainerRange.");
			return -1f;
		}
		if (container.GetInventory() == null)
		{
			return -1f;
		}
		string prefabName = MiscFunctions.GetPrefabName(((Object)((Component)container).transform.root).name);
		if (RangeByPrefab.TryGetValue(prefabName, out var value))
		{
			if (!float.IsNaN(value))
			{
				return value;
			}
			return AzuAutoStorePlugin.FallbackRange.Value;
		}
		if (AzuAutoStorePlugin.yamlData.TryGetValue(prefabName, out var value2))
		{
			if (!(value2 is Dictionary<object, object> dictionary))
			{
				AzuAutoStorePlugin.AzuAutoStoreLogger.LogError((object)("Unable to cast containerData for container '" + prefabName + "' to Dictionary<object, object>."));
				return -1f;
			}
			object obj = null;
			foreach (KeyValuePair<object, object> item in dictionary)
			{
				if (string.Equals(item.Key?.ToString(), "range", StringComparison.OrdinalIgnoreCase))
				{
					obj = item.Value;
					break;
				}
			}
			if (obj != null && float.TryParse(obj.ToString(), out var result))
			{
				RangeByPrefab[prefabName] = result;
				return result;
			}
		}
		RangeByPrefab[prefabName] = float.NaN;
		return AzuAutoStorePlugin.FallbackRange.Value;
	}

	internal static void BuildNearbyContainers()
	{
		//IL_0057: Unknown result type (might be due to invalid IL or missing references)
		Nearby.Clear();
		Boxes.PruneDestroyed();
		List<Container> containers = Boxes.Containers;
		for (int i = 0; i < containers.Count; i++)
		{
			Container val = containers[i];
			if (!((Object)(object)val.m_nview == (Object)null) && val.m_nview.IsValid())
			{
				float containerRange = GetContainerRange(val);
				if (!(containerRange < 0f))
				{
					Nearby.Add(new NearbyContainer(val, ((Component)val).transform.position, containerRange * containerRange));
				}
			}
		}
	}

	internal static void ClearNearbyContainers()
	{
		Nearby.Clear();
	}

	private static bool SatLongEnoughToAskFor(ItemDrop itemDrop)
	{
		if ((Object)(object)ZNet.instance == (Object)null)
		{
			return false;
		}
		long num = itemDrop.m_nview.GetZDO().GetLong(ZDOVars.s_spawnTime, 0L);
		if (num > 0)
		{
			DateTime maxValue = DateTime.MaxValue;
			if (num <= maxValue.Ticks)
			{
				return (ZNet.instance.GetTime() - new DateTime(num)).TotalSeconds >= (double)Math.Max(15f, AzuAutoStorePlugin.IntervalSeconds.Value * 2f);
			}
		}
		return false;
	}

	private static bool AnyContainerWants(ItemDrop itemDrop)
	{
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_0082: Unknown result type (might be due to invalid IL or missing references)
		//IL_0087: Unknown result type (might be due to invalid IL or missing references)
		//IL_0088: Unknown result type (might be due to invalid IL or missing references)
		//IL_008d: Unknown result type (might be due to invalid IL or missing references)
		ItemData itemData = itemDrop.m_itemData;
		long playerID = Game.instance.GetPlayerProfile().GetPlayerID();
		Vector3 position = ((Component)itemDrop).transform.position;
		for (int i = 0; i < Nearby.Count; i++)
		{
			NearbyContainer nearbyContainer = Nearby[i];
			Container container = nearbyContainer.Container;
			if (!Object.op_Implicit((Object)(object)container) || !Object.op_Implicit((Object)(object)((Component)container).transform) || (Object)(object)container.m_nview == (Object)null || !container.m_nview.IsValid())
			{
				continue;
			}
			Vector3 val = nearbyContainer.Position - position;
			if (!(val.sqrMagnitude > nearbyContainer.RangeSq))
			{
				Inventory inventory = container.GetInventory();
				if (inventory != null && !container.m_nview.GetZDO().GetBool(ContainerAwakePatch.storingPausedHash, false) && (!AzuAutoStorePlugin.MustHaveExistingItemToPull.Value.IsOn() || inventory.HaveItem(itemData.m_shared.m_name, true)) && Boxes.CanItemBeStored(MiscFunctions.GetPrefabName(((Object)((Component)container).transform.root).name), ((Object)itemData.m_dropPrefab).name) && container.CheckAccess(playerID) && !container.IsInUse() && container.m_nview.GetZDO().GetInt(ZDOVars.s_inUse, 0) == 0 && container.m_nview.IsOwner() && InventoryMove.HowMuchFits(inventory, itemData) > 0)
				{
					return true;
				}
			}
		}
		return false;
	}

	internal static void CheckItemDropInstanceAndStore(ItemDrop itemDrop)
	{
		//IL_00ed: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f2: Unknown result type (might be due to invalid IL or missing references)
		//IL_0160: Unknown result type (might be due to invalid IL or missing references)
		//IL_0165: Unknown result type (might be due to invalid IL or missing references)
		//IL_0166: Unknown result type (might be due to invalid IL or missing references)
		//IL_016b: Unknown result type (might be due to invalid IL or missing references)
		if (Boxes.Containers == null || (Object)(object)itemDrop == (Object)null || (Object)(object)((Component)itemDrop).transform == (Object)null || AzuAutoStorePlugin.ChestsPickupFromGround.Value.IsOff())
		{
			return;
		}
		ZNetView nview = itemDrop.m_nview;
		Fish val = default;
		if (!Object.op_Implicit((Object)(object)nview) || !nview.IsValid() || !Object.op_Implicit((Object)(object)itemDrop.m_itemData.m_dropPrefab) || (itemDrop.m_itemData.m_dropPrefab.TryGetComponent<Fish>(ref val) && !val.IsOutOfWater() && !AzuAutoStorePlugin.FishSuction.Value.IsOn()) || nview.GetZDO() == null)
		{
			return;
		}
		if (!nview.IsOwner())
		{
			if (!nview.HasOwner() || !SatLongEnoughToAskFor(itemDrop) || !AnyContainerWants(itemDrop))
			{
				return;
			}
			try
			{
				nview.InvokeRPC("RPC_RequestOwn", Array.Empty<object>());
				if (!AskedFor.Contains(itemDrop))
				{
					AskedFor.Add(itemDrop);
				}
				return;
			}
			catch
			{
				return;
			}
		}
		bool flag = false;
		Vector3 position = ((Component)itemDrop).transform.position;
		for (int i = 0; i < Nearby.Count; i++)
		{
			NearbyContainer nearbyContainer = Nearby[i];
			Container container = nearbyContainer.Container;
			if (!Object.op_Implicit((Object)(object)container) || !Object.op_Implicit((Object)(object)((Component)container).transform) || container.GetInventory() == null || (Object)(object)container.m_nview == (Object)null || !container.m_nview.IsValid())
			{
				continue;
			}
			Vector3 val2 = nearbyContainer.Position - position;
			if (val2.sqrMagnitude > nearbyContainer.RangeSq || container.m_nview.GetZDO().GetBool(ContainerAwakePatch.storingPausedHash, false) || !container.m_nview.IsOwner() || container.IsInUse() || container.m_nview.GetZDO().GetInt(ZDOVars.s_inUse, 0) != 0)
			{
				continue;
			}
			LogDebug("Nearby item name: " + ((Object)itemDrop.m_itemData.m_dropPrefab).name);
			if (TryStore(container, ref itemDrop.m_itemData))
			{
				flag = true;
				if (itemDrop.m_itemData.m_stack <= 0)
				{
					break;
				}
			}
		}
		if (!flag)
		{
			return;
		}
		itemDrop.Save();
		if (itemDrop.m_itemData.m_stack <= 0)
		{
			if (!Object.op_Implicit((Object)(object)itemDrop.m_nview))
			{
				Object.DestroyImmediate((Object)(object)((Component)itemDrop).gameObject);
			}
			else
			{
				ZNetScene.instance.Destroy(((Component)itemDrop).gameObject);
			}
		}
	}

	internal static bool TryStore(Container nearbyContainer, ref ItemData item, bool fromPlayer = false, bool singleItemData = false)
	{
		bool flag = false;
		LogIfBuildDebug("Checking container " + ((nearbyContainer != null) ? ((Object)nearbyContainer).name : null));
		if (!Object.op_Implicit((Object)(object)nearbyContainer) || !MiscFunctions.CheckItemSharedIntegrity(item))
		{
			return false;
		}
		Inventory inventory = nearbyContainer.GetInventory();
		if (inventory == null)
		{
			return false;
		}
		if (AzuAutoStorePlugin.MustHaveExistingItemToPull.Value.IsOn() && !inventory.HaveItem(item.m_shared.m_name, true))
		{
			if (singleItemData)
			{
				GameObject dropPrefab = item.m_dropPrefab;
				LogDebug("Skipping " + ((dropPrefab != null) ? ((Object)dropPrefab).name : null) + " because it is not in the container");
				Player localPlayer = Player.m_localPlayer;
				string[] array = new string[5]
				{
					"<color=red>",
					item.m_shared.m_name,
					" [",
					null,
					null
				};
				GameObject dropPrefab2 = item.m_dropPrefab;
				array[3] = ((dropPrefab2 != null) ? ((Object)dropPrefab2).name : null);
				array[4] = "] is not in nearby containers</color>";
				((Character)localPlayer).Message((MessageType)2, string.Concat(array), 0, (Sprite)null, false);
			}
			return false;
		}
		string prefabName = MiscFunctions.GetPrefabName(((Object)((Component)nearbyContainer).transform.root).name);
		GameObject dropPrefab3 = item.m_dropPrefab;
		if (!Boxes.CanItemBeStored(prefabName, ((dropPrefab3 != null) ? ((Object)dropPrefab3).name : null) ?? ""))
		{
			if (singleItemData)
			{
				Player localPlayer2 = Player.m_localPlayer;
				string[] array2 = new string[5]
				{
					"<color=red>",
					item.m_shared.m_name,
					" [",
					null,
					null
				};
				GameObject dropPrefab4 = item.m_dropPrefab;
				array2[3] = ((dropPrefab4 != null) ? ((Object)dropPrefab4).name : null);
				array2[4] = "] cannot be stored based on configuration settings</color>";
				((Character)localPlayer2).Message((MessageType)2, string.Concat(array2), 0, (Sprite)null, false);
			}
			LogDebug(item.m_shared.m_name + " cannot be stored based on configuration setting");
			return false;
		}
		if (!nearbyContainer.CheckAccess(Game.instance.GetPlayerProfile().GetPlayerID()))
		{
			LogDebug("Cannot store items in " + ((Object)nearbyContainer).name + " because the player does not have access.");
			return false;
		}
		int num;
		if (nearbyContainer.m_nview.IsOwner())
		{
			num = InventoryMove.MoveStack(inventory, item);
		}
		else
		{
			num = TryStoreToOtherOwner(nearbyContainer, item);
			if (num <= 0)
			{
				LogDebug("Cannot store items in " + ((Object)nearbyContainer).name + ": not the owner and nothing to route the write through.");
				return false;
			}
		}
		flag = num > 0;
		if (!flag)
		{
			return flag;
		}
		if (!fromPlayer)
		{
			PingContainer(((Component)nearbyContainer).gameObject);
		}
		return flag;
	}

	private static Inventory PendingView(Inventory target)
	{
		if (PendingSends.TryGetValue(target, out var value))
		{
			return value;
		}
		value = InventoryHelper.CopyInventory(target);
		PendingSends[target] = value;
		return value;
	}

	internal static void ClearPendingSends()
	{
		PendingSends.Clear();
	}

	internal static int TryStoreToOtherOwner(Container container, ItemData item)
	{
		if (!MUCCompat.CanRouteToOtherOwner)
		{
			return 0;
		}
		if (!container.m_nview.HasOwner())
		{
			return 0;
		}
		if (!Object.op_Implicit((Object)(object)Player.m_localPlayer))
		{
			return 0;
		}
		Inventory inventory = ((Humanoid)Player.m_localPlayer).GetInventory();
		if (inventory == null || !inventory.ContainsItem(item))
		{
			return 0;
		}
		Inventory inventory2 = container.GetInventory();
		if (inventory2 == null)
		{
			return 0;
		}
		Inventory target = PendingView(inventory2);
		int num = InventoryMove.HowMuchFits(target, item);
		if (num <= 0)
		{
			return 0;
		}
		int stack = item.m_stack;
		inventory2.AddItem(item, num, -1, -1, false);
		int num2;
		if (!inventory.ContainsItem(item))
		{
			item.m_stack = 0;
			num2 = stack;
		}
		else
		{
			num2 = stack - item.m_stack;
		}
		if (num2 > 0)
		{
			ItemData val = item.Clone();
			val.m_stack = num2;
			InventoryMove.MoveStack(target, val);
		}
		return num2;
	}

	internal static bool SharesRootZDO(Container container)
	{
		return Object.op_Implicit((Object)(object)container.m_rootObjectOverride);
	}

	internal static bool IsContainerBeingUsed(Container container)
	{
		if (!container.m_nview.IsValid())
		{
			return false;
		}
		if (container.m_nview.IsOwner())
		{
			return container.IsInUse();
		}
		return container.m_nview.GetZDO().GetInt(ZDOVars.s_inUse, 0) != 0;
	}

	internal static void TryStore()
	{
		if (!Object.op_Implicit((Object)(object)Player.m_localPlayer))
		{
			return;
		}
		LogDebug("Trying to store items from player inventory");
		Boxes.ContainersToPing.Clear();
		ClearPendingSends();
		int num = 0;
		foreach (IContainer nearbyContainer in Boxes.GetNearbyContainers<Player>(Player.m_localPlayer, AzuAutoStorePlugin.PlayerRange.Value))
		{
			num += StoreToContainer(nearbyContainer, null, null);
		}
		StoreSuccess(num);
	}

	internal static void TryStoreThisItem(ItemData itemData, Inventory m_inventory)
	{
		if (!Object.op_Implicit((Object)(object)Player.m_localPlayer) || m_inventory != ((Humanoid)Player.m_localPlayer).GetInventory())
		{
			return;
		}
		LogDebug("Trying to store " + itemData.m_shared.m_name);
		Boxes.ContainersToPing.Clear();
		ClearPendingSends();
		int num = 0;
		foreach (IContainer nearbyContainer in Boxes.GetNearbyContainers<Player>(Player.m_localPlayer, AzuAutoStorePlugin.PlayerRange.Value))
		{
			num += StoreToContainer(nearbyContainer, itemData, m_inventory);
		}
		StoreSuccess(num);
	}

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(2)]
	private static int StoreToContainer([_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(1)] IContainer container, ItemData singleItem, Inventory inv)
	{
		//IL_0132: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d5: Unknown result type (might be due to invalid IL or missing references)
		if (!(container is VanillaContainers vanillaContainers))
		{
			if (singleItem != null)
			{
				return container.TryStoreThisItem(singleItem, inv);
			}
			return container.TryStore();
		}
		if (!vanillaContainers.m_nview.IsValid())
		{
			return 0;
		}
		ZDO val = null;
		if (!MUCCompat.CanRouteToOtherOwner)
		{
			Container component = vanillaContainers.gameObject.GetComponent<Container>();
			if ((Object)(object)component != (Object)null && IsContainerBeingUsed(component))
			{
				LogDebug("Skipping " + ((Object)vanillaContainers.gameObject).name + ": container is in use.");
				return 0;
			}
			Container component2 = vanillaContainers.gameObject.GetComponent<Container>();
			if (!vanillaContainers.IsOwner())
			{
				if ((Object)(object)component2 != (Object)null && SharesRootZDO(component2))
				{
					return 0;
				}
				vanillaContainers.m_nview.ClaimOwnership();
			}
			val = vanillaContainers.m_nview.GetZDO();
			if (val != null)
			{
				val.Set(ZDOVars.s_inUse, 1, false);
			}
			if (val != null)
			{
				ZDOMan.instance.ForceSendZDO(ZNet.GetUID(), val.m_uid);
			}
		}
		int result = 0;
		try
		{
			result = ((singleItem == null) ? vanillaContainers.TryStore() : vanillaContainers.TryStoreThisItem(singleItem, inv));
		}
		catch (Exception arg)
		{
			LogError($"Error while storing to {((Object)vanillaContainers.gameObject).name}: {arg}");
		}
		finally
		{
			if (val != null)
			{
				val.Set(ZDOVars.s_inUse, 0, false);
				ZDOMan.instance.ForceSendZDO(ZNet.GetUID(), val.m_uid);
			}
		}
		return result;
	}

	internal static void StoreSuccess(int total)
	{
		//IL_0085: Unknown result type (might be due to invalid IL or missing references)
		//IL_008a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0098: Unknown result type (might be due to invalid IL or missing references)
		//IL_009e: Unknown result type (might be due to invalid IL or missing references)
		try
		{
			if (total <= 0)
			{
				return;
			}
			((Character)Player.m_localPlayer).Message((MessageType)2, $"Stored {total} items from your inventory into nearby containers", 0, (Sprite)null, false);
			foreach (IContainer item in Boxes.ContainersToPing)
			{
				PingContainer(item.gameObject);
				try
				{
					if (Object.op_Implicit((Object)(object)InventoryGui.instance) && (Object)(object)item.gameObject.GetComponent<Container>() != (Object)(object)InventoryGui.instance.m_currentContainer)
					{
						InventoryGui.instance.m_moveItemEffects.Create(item.gameObject.transform.position, Quaternion.identity, (Transform)null, 1f, -1, default(ZDOID));
					}
				}
				catch (Exception arg)
				{
					AzuAutoStorePlugin.AzuAutoStoreLogger.LogError((object)$"Error while playing move effect for container {((Object)item.gameObject).name}: {arg}");
				}
			}
		}
		finally
		{
			Boxes.ContainersToPing.Clear();
			ClearPendingSends();
		}
	}

	internal static void PingContainer(GameObject container)
	{
		if (!((Object)(object)container == (Object)null))
		{
			if (AzuAutoStorePlugin.PingContainers.Value.IsOn() && (Object)(object)container.GetComponent<ChestPingEffect>() == (Object)null)
			{
				container.AddComponent<ChestPingEffect>();
			}
			if (AzuAutoStorePlugin.HighlightContainers.Value.IsOn() && (Object)(object)container.GetComponent<HighLightChest>() == (Object)null)
			{
				container.AddComponent<HighLightChest>();
			}
		}
	}

	internal static void LogDebug(string data)
	{
		AzuAutoStorePlugin.AzuAutoStoreLogger.LogDebug((object)data);
	}

	internal static void LogIfBuildDebug(string data)
	{
	}

	internal static void LogError(string data)
	{
		AzuAutoStorePlugin.AzuAutoStoreLogger.LogError((object)data);
	}

	internal static void LogInfo(string data)
	{
		AzuAutoStorePlugin.AzuAutoStoreLogger.LogInfo((object)data);
	}

	internal static void LogWarning(string data)
	{
		AzuAutoStorePlugin.AzuAutoStoreLogger.LogWarning((object)data);
	}
}
