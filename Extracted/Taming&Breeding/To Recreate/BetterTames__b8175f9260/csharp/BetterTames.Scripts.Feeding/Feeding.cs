using System;
using System.Collections.Generic;
using HarmonyLib;
using UnityEngine;

namespace BetterTames.Scripts.Feeding;

public static class Feeding
{
	private static readonly FieldRef<MonsterAI, List<ItemDrop>> ConsumeItems = AccessTools.FieldRefAccess<MonsterAI, List<ItemDrop>>("m_consumeItems");

	private static readonly FieldRef<MonsterAI, Action<ItemDrop>> OnConsumedItem = AccessTools.FieldRefAccess<MonsterAI, Action<ItemDrop>>("m_onConsumedItem");

	private static readonly FieldRef<BaseAI, ZSyncAnimation> Animator = AccessTools.FieldRefAccess<BaseAI, ZSyncAnimation>("m_animator");

	private static readonly FieldRef<Humanoid, EffectList> ConsumeEffects = AccessTools.FieldRefAccess<Humanoid, EffectList>("m_consumeItemEffects");

	private static readonly Func<Container, Inventory> GetInventory = AccessTools.MethodDelegate<Func<Container, Inventory>>(AccessTools.Method(typeof(Container), "GetInventory", (Type[])null, (Type[])null), (object)null, true);

	private static readonly List<Container> Chests = new List<Container>();

	public static void Register(Container container)
	{
		if (!Chests.Contains(container))
		{
			Chests.Add(container);
		}
	}

	public static void TryEatFromChest(MonsterAI monsterAI)
	{
		//IL_0094: Unknown result type (might be due to invalid IL or missing references)
		//IL_0099: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ed: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f2: Unknown result type (might be due to invalid IL or missing references)
		//IL_0195: Unknown result type (might be due to invalid IL or missing references)
		//IL_0197: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a5: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ab: Unknown result type (might be due to invalid IL or missing references)
		Character val = default;
		Tameable val2 = default;
		if (!((Component)monsterAI).TryGetComponent<Character>(ref val) || !((Component)monsterAI).TryGetComponent<Tameable>(ref val2) || !(val.IsTamed() ? Plugin.tamesEatFromChests.Value : Plugin.wildEatFromChests.Value))
		{
			return;
		}
		ZNetView component = ((Component)monsterAI).GetComponent<ZNetView>();
		if ((Object)(object)component == (Object)null || !component.IsValid() || !component.IsOwner())
		{
			return;
		}
		List<ItemDrop> list = ConsumeItems.Invoke(monsterAI);
		if (list == null || list.Count == 0)
		{
			return;
		}
		Vector3 position = ((Component)val).transform.position;
		float value = Plugin.chestRange.Value;
		for (int num = Chests.Count - 1; num >= 0; num--)
		{
			Container val3 = Chests[num];
			ZNetView chestView;
			if ((Object)(object)val3 == (Object)null)
			{
				Chests.RemoveAt(num);
			}
			else if (!(Vector3.Distance(((Component)val3).transform.position, position) > value) && IsPlayerChest(val3, out chestView) && chestView.IsOwner())
			{
				Inventory val4 = GetInventory(val3);
				if (val4 != null && FindFood(val4, list, out ItemData food, out ItemDrop foodPrefab))
				{
					val4.RemoveItem(food, 1);
					ZSyncAnimation obj = Animator.Invoke((BaseAI)(object)monsterAI);
					if (obj != null)
					{
						obj.SetTrigger("consume");
					}
					Humanoid val5 = (Humanoid)(object)((val is Humanoid) ? val : null);
					if (val5 != null)
					{
						EffectList obj2 = ConsumeEffects.Invoke(val5);
						if (obj2 != null)
						{
							obj2.Create(position, Quaternion.identity, (Transform)null, 1f, -1, default(ZDOID));
						}
					}
					OnConsumedItem.Invoke(monsterAI)?.Invoke(foodPrefab);
					break;
				}
			}
		}
	}

	private static bool IsPlayerChest(Container chest, out ZNetView chestView)
	{
		chestView = ((Component)chest).GetComponent<ZNetView>();
		if ((Object)(object)chestView != (Object)null && chestView.IsValid())
		{
			return chestView.GetZDO().GetLong(ZDOVars.s_creator, 0L) != 0;
		}
		return false;
	}

	private static bool FindFood(Inventory inventory, List<ItemDrop> consumeItems, out ItemData food, out ItemDrop foodPrefab)
	{
		food = null;
		foodPrefab = null;
		foreach (ItemData allItem in inventory.GetAllItems())
		{
			ItemDrop val = Match(allItem, consumeItems);
			if ((Object)(object)val == (Object)null)
			{
				if (Plugin.chestRequireOnlyFood.Value)
				{
					return false;
				}
			}
			else if (food == null)
			{
				food = allItem;
				foodPrefab = val;
				if (!Plugin.chestRequireOnlyFood.Value)
				{
					return true;
				}
			}
		}
		return food != null;
	}

	private static ItemDrop? Match(ItemData item, List<ItemDrop> consumeItems)
	{
		foreach (ItemDrop consumeItem in consumeItems)
		{
			if (consumeItem.m_itemData.m_shared.m_name == item.m_shared.m_name)
			{
				return consumeItem;
			}
		}
		return null;
	}
}
