using System;
using JetBrains.Annotations;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class ItemAmount
{
	public string Item = "";

	public int Amount;

	public ItemAmount(string item, int amount = 1)
	{
		Item = item;
		Amount = amount;
	}

	public ItemAmount()
	{
	}
}
