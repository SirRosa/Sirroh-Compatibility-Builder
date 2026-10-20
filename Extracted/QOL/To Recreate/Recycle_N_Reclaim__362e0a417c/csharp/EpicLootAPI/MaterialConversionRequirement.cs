using System;
using JetBrains.Annotations;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class MaterialConversionRequirement
{
	public string Item = "";

	public int Amount;

	public MaterialConversionRequirement(string item, int amount = 1)
	{
		Item = item;
		Amount = amount;
	}

	public MaterialConversionRequirement()
	{
	}
}
