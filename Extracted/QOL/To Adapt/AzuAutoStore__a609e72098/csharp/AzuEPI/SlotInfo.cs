using System;
using System.Runtime.CompilerServices;
using JetBrains.Annotations;
using UnityEngine;

namespace AzuEPI;

[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(0)]
[_003C830637c6_002Dabe4_002D47bb_002D978f_002D1cefcab86d66_003ENullableContext(1)]
[PublicAPI]
internal class SlotInfo
{
	public string[] SlotNames { get; set; } = Array.Empty<string>();

	public string[] OriginalSlotNames { get; set; } = Array.Empty<string>();

	public Vector2[] SlotPositions { get; set; } = Array.Empty<Vector2>();

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 1, 2, 1, 2 })]
	[field: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 1, 2, 1, 2 })]
	public Func<Player, ItemData>[] GetItemFuncs
	{
		[return: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 1, 2, 1, 2 })]
		get;
		[param: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 1, 2, 1, 2 })]
		set;
	} = Array.Empty<Func<Player, ItemData>>();

	[_003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 1, 2, 1 })]
	[field: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 1, 2, 1 })]
	public Func<ItemData, bool>[] IsValidFuncs
	{
		[return: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 1, 2, 1 })]
		get;
		[param: _003C5e9c682e_002Ded7c_002D40ee_002D9786_002Daf07b2cb4707_003ENullable(new byte[] { 1, 2, 1 })]
		set;
	} = Array.Empty<Func<ItemData, bool>>();
}
