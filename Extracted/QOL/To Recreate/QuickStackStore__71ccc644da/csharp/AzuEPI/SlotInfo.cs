using System;
using JetBrains.Annotations;
using UnityEngine;

namespace AzuEPI;

[PublicAPI]
internal class SlotInfo
{
	public string[] SlotNames { get; set; } = Array.Empty<string>();

	public string[] OriginalSlotNames { get; set; } = Array.Empty<string>();

	public Vector2[] SlotPositions { get; set; } = Array.Empty<Vector2>();

	public Func<Player, ItemData?>?[] GetItemFuncs { get; set; } = Array.Empty<Func<Player, ItemData>>();

	public Func<ItemData, bool>?[] IsValidFuncs { get; set; } = Array.Empty<Func<ItemData, bool>>();
}
