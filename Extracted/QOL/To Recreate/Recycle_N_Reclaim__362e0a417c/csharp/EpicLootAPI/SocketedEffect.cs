using System;
using JetBrains.Annotations;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class SocketedEffect
{
	public int Version = 2;

	public MagicItemEffect? Effect;

	public string SourcePrefab = "";

	public ItemRarity SourceRarity;

	public ShardType ShardType = ShardType.None;

	public float StackMultiplier = 1f;

	public SocketedEffect()
	{
	}

	public SocketedEffect(MagicItemEffect effect, string sourcePrefab, ItemRarity sourceRarity)
	{
		Effect = effect;
		SourcePrefab = sourcePrefab;
		SourceRarity = sourceRarity;
	}
}
