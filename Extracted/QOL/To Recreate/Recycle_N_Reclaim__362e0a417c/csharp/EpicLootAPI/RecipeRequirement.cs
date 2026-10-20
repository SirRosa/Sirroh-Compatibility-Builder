using System;
using JetBrains.Annotations;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class RecipeRequirement
{
	public string item;

	public int amount;

	public RecipeRequirement(string item, int amount = 1)
	{
		this.item = item;
		this.amount = amount;
	}
}
