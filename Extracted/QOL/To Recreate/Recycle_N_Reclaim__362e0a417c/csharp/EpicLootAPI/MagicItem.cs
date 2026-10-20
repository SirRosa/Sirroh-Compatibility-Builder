using System;
using System.Collections.Generic;
using JetBrains.Annotations;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class MagicItem
{
	public int Version = 3;

	public ItemRarity Rarity;

	public List<MagicItemEffect> Effects = new List<MagicItemEffect>();

	public string TypeNameOverride = "";

	public int AugmentedEffectIndex = -1;

	public List<int> AugmentedEffectIndices = new List<int>();

	public List<int> TemperedEffectIndices = new List<int>();

	public string DisplayName = "";

	public string LegendaryID = "";

	public string SetID = "";

	public bool IsUnidentified;

	public int SocketCount;

	public List<SocketedEffect> Sockets = new List<SocketedEffect>();
}
