using System;
using System.Runtime.CompilerServices;
using UnityEngine;

namespace AzuEPI.Core.Slots;

internal class Model
{
	[_003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(1)]
	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(0)]
	internal class Slot
	{
		public string Name;

		public string OriginalName;

		public Vector2 Position;

		public bool IsQuickSlot;

		public bool IsAPIAdded;

		public bool Occupied;

		[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(2)]
		public EquipmentSlot EquipmentSlot
		{
			[_003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(2)]
			get
			{
				return this as EquipmentSlot;
			}
		}
	}

	internal class EquipmentSlot : Slot
	{
		[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1, 2 })]
		public Func<Player, ItemData> Get;

		[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 2, 1 })]
		public Func<ItemData, bool> Valid;
	}
}
