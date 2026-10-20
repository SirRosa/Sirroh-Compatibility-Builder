using System;
using System.Collections.Generic;
using JetBrains.Annotations;
using Newtonsoft.Json;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
[Obsolete("Epic Loot removed recipes.json in 0.13.0 and no longer ships a recipe config, so this no longer has anywhere to register into. Add recipes with Jotunn's ItemManager instead.")]
internal class CustomRecipe
{
	public string name = "";

	public string item = "";

	public int amount;

	public string craftingStation = "";

	public int minStationLevel = 1;

	public bool enabled = true;

	public string repairStation = "";

	public List<RecipeRequirement> resources = new List<RecipeRequirement>();

	internal static readonly List<CustomRecipe> Recipes = new List<CustomRecipe>();

	internal static readonly Method API_AddRecipe = new Method("AddRecipe");

	public CustomRecipe(string name, string item, CraftingTable craftingTable, int amount = 1)
	{
		this.name = name;
		this.item = item;
		this.amount = amount;
		craftingStation = craftingTable.GetInternalName();
		Recipes.Add(this);
	}

	public CustomRecipe()
	{
	}

	[Obsolete("Epic Loot removed recipes.json in 0.13.0 and no longer ships a recipe config, so this no longer has anywhere to register into. Add recipes with Jotunn's ItemManager instead.")]
	[PublicAPI]
	public static void RegisterAll()
	{
		foreach (CustomRecipe item in new List<CustomRecipe>(Recipes))
		{
			item.Register();
		}
	}

	[Obsolete("Epic Loot removed recipes.json in 0.13.0 and no longer ships a recipe config, so this no longer has anywhere to register into. Add recipes with Jotunn's ItemManager instead.")]
	public bool Register()
	{
		string text = JsonConvert.SerializeObject((object)this);
		if (!(API_AddRecipe.Invoke(text)[0] is string value))
		{
			return false;
		}
		RunTimeRegistry.Register(this, value);
		Recipes.Remove(this);
		EpicLoot.logger.LogDebug("Registered recipe: " + name);
		return true;
	}
}
