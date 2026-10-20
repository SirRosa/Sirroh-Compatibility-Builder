using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using AzuEPI.Core.Slots;
using JetBrains.Annotations;

namespace AzuEPI;

[PublicAPI]
internal class API
{
	public delegate void SlotAddedHandler(string slotName);

	public delegate void SlotRemovedHandler(string slotName);

	internal static HashSet<Model.EquipmentSlot?> CustomSlots { get; } = new HashSet<Model.EquipmentSlot>();

	public static event Action<Hud>? OnHudAwake;

	public static event Action<Hud>? OnHudAwakeComplete;

	public static event Action<Hud>? OnHudUpdate;

	public static event Action<Hud>? OnHudUpdateComplete;

	public static event Action? OnBeforeQuickSlotsAdded;

	public static event Action? OnQuickSlotsAdded;

	public static event SlotAddedHandler? SlotAdded;

	public static event SlotRemovedHandler? SlotRemoved;

	public static event Action<string>? OnRegisterVisualPrefab;

	public static bool IsLoaded()
	{
		return false;
	}

	public static ItemType GetFakeItemType()
	{
		return (ItemType)0;
	}

	public static bool AddSlot(string slotName, Func<Player, ItemData?> getItem, Func<ItemData, bool> isValid, int index = -1)
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

	public static bool AddSlot(string slotName, Func<ItemData, bool> isValid, int index = -1, IEnumerable<string>? prefabNamesForVisuals = null)
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

	public static void RegisterVisualPrefabs(string slotName, params (string prefabName, string visualName)[] pairs)
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

	public static bool TryGetEquippedItem(int slotIndex, out ItemData? item)
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
