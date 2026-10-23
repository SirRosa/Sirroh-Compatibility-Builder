using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using JetBrains.Annotations;
using UnityEngine;

namespace Backpacks;

[PublicAPI]
[_003Cc022682b_002D83ab_002D49b3_002D8219_002D142fcecb6471_003ENullableContext(1)]
[_003Cbfd2a42b_002D08e3_002D4dca_002Db590_002Da8bbce16f5dc_003ENullable(0)]
internal static class API
{
	[_003Cbfd2a42b_002D08e3_002D4dca_002Db590_002Da8bbce16f5dc_003ENullable(new byte[] { 2, 1 })]
	[field: _003Cbfd2a42b_002D08e3_002D4dca_002Db590_002Da8bbce16f5dc_003ENullable(new byte[] { 2, 1 })]
	public static event Action<Player> EquippedBackpackUpdate;

	public static bool IsLoaded()
	{
		return false;
	}

	public static int CountItemsInBackpacks(Inventory inventory, string name, bool onlyRemoveable = true)
	{
		return 0;
	}

	public static bool IsItemInBackpacks(Inventory inventory, string name)
	{
		return CountItemsInBackpacks(inventory, name) > 0;
	}

	public static bool AddItemToBackpack(ItemData backpack, ItemData item)
	{
		return false;
	}

	public static bool DeleteItemsFromBackpacks(Inventory inventory, string name, int count = 1)
	{
		return false;
	}

	public static List<GameObject> GetBackpackVisual(Player player)
	{
		return new List<GameObject>();
	}

	[_003Cc022682b_002D83ab_002D49b3_002D8219_002D142fcecb6471_003ENullableContext(2)]
	public static ItemData GetEquippedBackpack()
	{
		return null;
	}

	[_003Cc022682b_002D83ab_002D49b3_002D8219_002D142fcecb6471_003ENullableContext(2)]
	public static Inventory GetEquippedBackpackInventory()
	{
		return null;
	}

	public static List<Inventory> GetAllBackpackInventories(Inventory inventory)
	{
		return new List<Inventory>();
	}
}
