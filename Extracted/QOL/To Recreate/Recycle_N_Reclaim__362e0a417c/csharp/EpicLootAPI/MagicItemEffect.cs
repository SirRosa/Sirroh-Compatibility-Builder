using System;
using JetBrains.Annotations;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class MagicItemEffect
{
	public int Version = 1;

	public string EffectType = "";

	public float EffectValue;

	public MagicItemEffect(string type, float value = 1f)
	{
		EffectType = type;
		EffectValue = value;
	}

	public MagicItemEffect()
	{
	}
}
