using System;
using UnityEngine;

namespace AzuEPI.Core.Slots;

internal class Model
{
	internal class Slot
	{
		public string Name;

		public string OriginalName;

		public Vector2 Position;

		public bool IsQuickSlot;

		public bool IsAPIAdded;

		public bool Occupied;

		public EquipmentSlot? EquipmentSlot => this as EquipmentSlot;
	}

	internal class EquipmentSlot : Slot
	{
		public Func<Player, ItemData?>? Get;

		public Func<ItemData, bool>? Valid;
	}
}
