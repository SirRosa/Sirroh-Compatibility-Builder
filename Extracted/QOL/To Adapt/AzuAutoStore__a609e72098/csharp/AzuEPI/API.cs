using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using AzuEPI.Core.Slots;
using JetBrains.Annotations;

namespace AzuEPI;

[_003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(1)]
[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(0)]
[PublicAPI]
internal class API
{
	[_003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(0)]
	public delegate void SlotAddedHandler(string slotName);

	[_003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(0)]
	public delegate void SlotRemovedHandler(string slotName);

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 1, 2 })]
	[field: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 1, 2 })]
	internal static HashSet<Model.EquipmentSlot> CustomSlots
	{
		[return: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 1, 2 })]
		get;
	} = new HashSet<Model.EquipmentSlot>();

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
	[field: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
	public static event Action<Hud> OnHudAwake;

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
	[field: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
	public static event Action<Hud> OnHudAwakeComplete;

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
	[field: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
	public static event Action<Hud> OnHudUpdate;

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
	[field: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
	public static event Action<Hud> OnHudUpdateComplete;

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(2)]
	[method: _003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(2)]
	[field: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(2)]
	public static event Action OnBeforeQuickSlotsAdded;

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(2)]
	[method: _003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(2)]
	[field: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(2)]
	public static event Action OnQuickSlotsAdded;

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(2)]
	[method: _003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(2)]
	[field: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(2)]
	public static event SlotAddedHandler SlotAdded;

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(2)]
	[method: _003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(2)]
	[field: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(2)]
	public static event SlotRemovedHandler SlotRemoved;

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
	[field: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
	public static event Action<string> OnRegisterVisualPrefab;

	public static bool IsLoaded()
	{
		return false;
	}

	public static ItemType GetFakeItemType()
	{
		return (ItemType)0;
	}

	public static bool AddSlot(string slotName, [_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 1, 1, 2 })] Func<Player, ItemData> getItem, Func<ItemData, bool> isValid, int index = -1)
	{
		return false;
	}

	public static bool AddSlot(string slotName, string prefabName, int index = -1)
	{
		return false;
	}

	public static bool AddSlot(string slotName, IEnumerable<string> prefabNames, int index = -1)
	{
		return false;
	}

	public static bool AddSlot(string slotName, Func<ItemData, bool> isValid, int index = -1, [_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })] IEnumerable<string> prefabNamesForVisuals = null)
	{
		return false;
	}

	public static bool AddQuickSlot(string slotName, bool showName = false, int index = -1)
	{
		return false;
	}

	public static bool RemoveSlot(string slotName)
	{
		return false;
	}

	public static SlotInfo GetSlots()
	{
		return BuildSlotInfo((Model.Slot _) => true);
	}

	public static SlotInfo GetQuickSlots()
	{
		return BuildSlotInfo((Model.Slot s) => s.IsQuickSlot);
	}

	public static SlotInfo GetEquipmentSlots()
	{
		return BuildSlotInfo((Model.Slot s) => !s.IsQuickSlot && s.EquipmentSlot != null);
	}

	private static SlotInfo BuildSlotInfo(Func<Model.Slot, bool> filter)
	{
		return new SlotInfo();
	}

	public static List<ItemData> GetQuickSlotsItems()
	{
		return new List<ItemData>();
	}

	public static int GetAddedRows(int width)
	{
		return 0;
	}

	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	public static int GetFullHeight(int width)
	{
		return 0;
	}

	public static void RegisterVisualPrefabs(string slotName, [_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 1, 0, 1, 1 })] params (string prefabName, string visualName)[] pairs)
	{
	}

	public static int GetSlotCount()
	{
		return 0;
	}

	public static bool TryGetSlotIndexByName(string slotName, out int index, bool allowLocalized = true)
	{
		index = -1;
		return false;
	}

	public static bool TryGetSlotDescriptor(int index, out SlotDescriptor desc)
	{
		desc = default;
		return false;
	}

	public static int GetSlotGridLinearIndex(Inventory inv, int slotIndex)
	{
		return -1;
	}

	public static Vector2i GetSlotGridPos(Inventory inv, int slotIndex)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		return new Vector2i(-1, -1);
	}

	public static bool TryGetSlotIndexAtGridPos(Inventory inv, Vector2i gridPos, out int slotIndex)
	{
		slotIndex = -1;
		return false;
	}

	public static bool IsEquipmentCell(Inventory inv, int x, int y, out int slotIndex)
	{
		slotIndex = -1;
		return false;
	}

	public static bool IsQuickCell(Inventory inv, int x, int y, out int slotIndex)
	{
		slotIndex = -1;
		return false;
	}

	public static bool TryGetSlotSnapshot(Inventory inv, int slotIndex, out SlotSnapshot snapshot)
	{
		snapshot = default;
		return false;
	}

	public static IEnumerable<SlotDescriptor> EnumerateSlots()
	{
		yield break;
	}

	public static IEnumerable<SlotSnapshot> GetAllSlotSnapshots(Inventory inv)
	{
		yield break;
	}

	public static IEnumerable<SlotSnapshot> GetQuickSlotSnapshots(Inventory inv)
	{
		yield break;
	}

	public static IEnumerable<SlotSnapshot> GetEquipmentSlotSnapshots(Inventory inv)
	{
		yield break;
	}

	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	public static bool TryGetSlotIndexByItem(Player player, ItemData item, out int slotIndex)
	{
		slotIndex = -1;
		return false;
	}

	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	public static bool TryGetSlotIndexByItem(ItemData item, out int slotIndex)
	{
		slotIndex = -1;
		return false;
	}

	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	public static bool TryGetSlotDescriptorByItem(Player player, ItemData item, out SlotDescriptor desc)
	{
		desc = default;
		return false;
	}

	public static bool SlotValidates(int slotIndex, ItemData item)
	{
		return false;
	}

	[_003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(2)]
	public static bool TryGetEquippedItem(int slotIndex, out ItemData item)
	{
		item = null;
		return false;
	}

	public static bool TryGetSlotDescriptorByName(string slotName, out SlotDescriptor desc, bool allowLocalized = true)
	{
		desc = default;
		if (!TryGetSlotIndexByName(slotName, out var index, allowLocalized))
		{
			return false;
		}
		return TryGetSlotDescriptor(index, out desc);
	}
}
