using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using BepInEx.Configuration;
using HarmonyLib;
using UnityEngine;
using Zen;
using Zen.Lib;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class InventoryRules
{
	public enum DropStyle
	{
		Vanilla,
		CameraDirection
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(Inventory), "StackAll")]
	[HarmonyPriority(100)]
	private static IEnumerable<CodeInstruction> Inventory_StackAll_Transpile(IEnumerable<CodeInstruction> codes)
	{
		MethodInfo methodInfo = AccessTools.Method(typeof(Inventory), "GetAllItems", Array.Empty<Type>(), (Type[])null);
		Func<Inventory, List<ItemData>> func = GetAllItemsIntercept;
		return Transpilers.MethodReplacer(codes, (MethodBase)methodInfo, (MethodBase)func.Method);
		static List<ItemData> GetAllItemsIntercept(Inventory inventory)
		{
			if (!Object.op_Implicit((Object)(object)Player.m_localPlayer) || ((Humanoid)Player.m_localPlayer).GetInventory() != inventory)
			{
				return inventory.GetAllItems();
			}
			int hotbarRow = ((!Configs.StackingExcludeHotbar.Value) ? (-1) : 0);
			bool excludeEquip = Configs.StackingExcludeEquipable.Value;
			return inventory.GetAllItems().Where(ExcludeHotbar).Where(ExcludeEquipable)
				.ToList();
			bool ExcludeEquipable(ItemData item)
			{
				if (excludeEquip)
				{
					return !item.IsEquipable();
				}
				return true;
			}
			bool ExcludeHotbar(ItemData item)
			{
				return item.m_gridPos.y > hotbarRow;
			}
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Inventory), "StackAll")]
	private static void Inventory_StackAll_Prefix(Inventory __instance)
	{
		if (Configs.StackingCombineExisting.Value)
		{
			__instance.CombineStacks();
		}
	}

	public static void CombineStacks(this Inventory inventory)
	{
		List<ItemData> allItems = (from item in inventory.GetAllItems()
			orderby item.m_gridPos.y descending, item.m_gridPos.x
			select item).ToList();
		foreach (var (current, startIndex) in allItems.WithIndex())
		{
			FillItem(current, startIndex);
		}
		inventory.GetAllItems().RemoveAll((ItemData item) => item.m_shared.m_maxStackSize > 1 && item.m_stack == 0);
		void FillItem(ItemData val, int num2)
		{
			if (val.m_shared.m_maxStackSize > 1)
			{
				int num = num2 + 1;
				while (val.m_stack < val.m_shared.m_maxStackSize)
				{
					ItemData val2 = FindNextStack(val, num);
					if (val2 == null)
					{
						break;
					}
					int num3 = Math.Min(val.m_shared.m_maxStackSize - val.m_stack, val2.m_stack);
					val.m_stack += num3;
					val2.m_stack -= num3;
					num++;
				}
			}
		}
		ItemData? FindNextStack(ItemData searchItem, int num)
		{
			for (int i = num; i < allItems.Count; i++)
			{
				ItemData val = allItems[i];
				if (val.m_shared.m_name == searchItem.m_shared.m_name && val.m_quality == searchItem.m_quality && val.m_worldLevel == searchItem.m_worldLevel && val.m_stack > 0)
				{
					return val;
				}
			}
			return null;
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Inventory), "RemoveItem", new Type[]
	{
		typeof(string),
		typeof(int),
		typeof(int),
		typeof(bool)
	})]
	private static void Inventory_RemoveItem(Inventory __instance)
	{
		if (Configs.RemoveItemFromSmallestStack.Value)
		{
			__instance.m_inventory.Sort((ItemData item1, ItemData item2) => item1.m_stack - item2.m_stack);
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Humanoid), "DropItem")]
	private static void Humanoid_DropItem(Humanoid __instance)
	{
		//IL_0039: Unknown result type (might be due to invalid IL or missing references)
		//IL_003e: Unknown result type (might be due to invalid IL or missing references)
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0053: Unknown result type (might be due to invalid IL or missing references)
		Player val = (Player)(object)((__instance is Player) ? __instance : null);
		if (!((Object)(object)val != (Object)(object)Player.m_localPlayer))
		{
			switch (Configs.DiscardStyle.Value)
			{
			case DropStyle.CameraDirection:
			{
				Transform transform = ((Component)val).transform;
				Vector3 forward = ((Component)GameCamera.instance).transform.forward;
				forward.y = 0f;
				transform.forward = forward;
				((Character)val).SetLookDir(transform.forward, 0f);
				val.FaceLookDirection();
				break;
			}
			default:
				throw new ArgumentOutOfRangeException();
			case DropStyle.Vanilla:
				break;
			}
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Game), "SpawnPlayer")]
	private static void Game_SpawnPlayer(Game __instance, Player __result)
	{
		if (__instance.m_playerProfile.m_firstSpawn)
		{
			Logging<Plugin>.Info("Init new players to have config defined starting gear");
			((Humanoid)__result).UnequipAllItems();
			((Humanoid)__result).GetInventory().RemoveAll();
			((Humanoid)__result).GiveDefaultItems();
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Player), "OnSpawned")]
	private static void Player_OnSpawned(Player __instance)
	{
		int value = Configs.InventoryRowsDefault.Value;
		if (value != -1)
		{
			if (__instance.HaveUniqueKeyValueAny("invrows"))
			{
				Logging<Plugin>.Message("Ignoring config " + ((ConfigEntryBase)Configs.InventoryRowsDefault).Definition.Key + ", key already exists: invrows");
				return;
			}
			Logging<Plugin>.Message($"Set default inventory rows: {value}");
			__instance.AddUniqueKeyValue("invrows", value + 1);
		}
	}
}
