using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using EpicLootAPI;
using Jewelcrafting;
using Recycle_N_Reclaim.Managers;
using Recycle_N_Reclaim.YAMLStuff;
using UnityEngine;

namespace Recycle_N_Reclaim.GamePatches.Recycling;

[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
public static class Reclaimer
{
	[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)]
	private class Result
	{
		public int Amount { get; set; }

		public bool InitialRecipeHadZero { get; set; }

		public void Deconstruct(out int amount, out bool initialRecipeHadZero)
		{
			amount = Amount;
			initialRecipeHadZero = InitialRecipeHadZero;
		}
	}

	private static Dictionary<string, List<Recipe>> _recipeCache = new Dictionary<string, List<Recipe>>();

	internal static void BuildRecipeCache(ObjectDB instance)
	{
		_recipeCache.Clear();
		foreach (Recipe recipe in instance.m_recipes)
		{
			string text = recipe?.m_item?.m_itemData?.m_shared?.m_name;
			if (text != null)
			{
				if (!_recipeCache.TryGetValue(text, out var value))
				{
					value = new List<Recipe>();
					_recipeCache[text] = value;
				}
				value.Add(recipe);
			}
		}
		Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)$"Built recipe cache with {_recipeCache.Count} entries");
	}

	public static void RecycleInventoryForAllRecipes(Inventory inventory, string containerName, Player player)
	{
		List<ItemData> list = new List<ItemData>();
		list.AddRange(inventory.GetAllItems());
		List<RecyclingAnalysisContext> list2 = new List<RecyclingAnalysisContext>();
		for (int i = 0; i < list.Count; i++)
		{
			ItemData val = list[i];
			RecyclingAnalysisContext recyclingAnalysisContext = new RecyclingAnalysisContext(val);
			list2.Add(recyclingAnalysisContext);
			string prefabName = Utils.GetPrefabName(val.m_dropPrefab);
			Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)("containerName: " + containerName + ", prefabName: " + prefabName));
			if (!GroupUtils.IsPrefabExcludedInContainer(containerName, prefabName))
			{
				RecycleOneItemInInventory(recyclingAnalysisContext, inventory, player);
			}
			if (recyclingAnalysisContext.ShouldErrorDumpAnalysis || Recycle_N_ReclaimPlugin.DebugAlwaysDumpAnalysisContext.Value.IsOn())
			{
				recyclingAnalysisContext.Dump();
			}
		}
		StringBuilder stringBuilder = new StringBuilder();
		foreach (RecyclingAnalysisContext item in list2.Where([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (RecyclingAnalysisContext analysis) => analysis.RecyclingImpediments.Count > 0))
		{
			stringBuilder.AppendLine(Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_could_not_recycle", Recycle_N_ReclaimPlugin.Localize(item.Item.m_shared.m_name), item.RecyclingImpediments.Count.ToString()));
			foreach (string recyclingImpediment in item.RecyclingImpediments)
			{
				stringBuilder.AppendLine(recyclingImpediment);
			}
		}
		if (stringBuilder.Length != 0 && !Recycle_N_ReclaimPlugin.NotifyOnSalvagingImpediments.Value.IsOff())
		{
			MessageHud.instance.ShowMessage((MessageType)2, stringBuilder.ToString(), 0, (Sprite)null, false, true);
		}
	}

	public static List<RecyclingAnalysisContext> GetRecyclingAnalysisForInventory(Inventory inventory, Player player)
	{
		List<ItemData> list = new List<ItemData>();
		list.AddRange(inventory.GetAllItems());
		List<RecyclingAnalysisContext> list2 = new List<RecyclingAnalysisContext>();
		for (int i = 0; i < list.Count; i++)
		{
			RecyclingAnalysisContext recyclingAnalysisContext = new RecyclingAnalysisContext(list[i]);
			list2.Add(recyclingAnalysisContext);
			TryAnalyzeOneItem(recyclingAnalysisContext, inventory, player);
		}
		return list2;
	}

	private static void RecycleOneItemInInventory(RecyclingAnalysisContext analysisContext, Inventory inventory, Player player)
	{
		if (TryAnalyzeOneItem(analysisContext, inventory, player) && analysisContext.RecyclingImpediments.Count <= 0)
		{
			DoInventoryChanges(analysisContext, inventory, player);
		}
	}

	public static bool TryAnalyzeOneItem(RecyclingAnalysisContext analysisContext, Inventory inventory, Player player, bool fromContainer = false)
	{
		if (!TryFindRecipeForItem(analysisContext, player))
		{
			return false;
		}
		AnalyzeCraftingStationRequirements(analysisContext, player);
		AnalyzeMaterialYieldForItem(analysisContext);
		AnalyzeInventoryHasEnoughEmptySlots(analysisContext, inventory);
		AnalyzeItemDisplayImpediments(analysisContext, inventory, player);
		return true;
	}

	private static void AnalyzeCraftingStationRequirements(RecyclingAnalysisContext analysisContext, Player player)
	{
		if (Recycle_N_ReclaimPlugin.RequireExactCraftingStationForRecycling.Value.IsOff())
		{
			return;
		}
		CraftingStation craftingStation = analysisContext.Recipe.m_craftingStation;
		if (!((Object)(object)craftingStation == (Object)null))
		{
			CraftingStation currentCraftingStation = Player.m_localPlayer.GetCurrentCraftingStation();
			ItemData item = analysisContext.Item;
			if ((Object)(object)currentCraftingStation == (Object)null || currentCraftingStation.m_name != craftingStation.m_name || currentCraftingStation.GetLevel(true) < analysisContext.Item.m_quality)
			{
				analysisContext.RecyclingImpediments.Add(Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_recipe_requires", Recycle_N_ReclaimPlugin.Localize(craftingStation.m_name), item.m_quality.ToString()));
			}
		}
	}

	private static void AnalyzeItemDisplayImpediments(RecyclingAnalysisContext analysisContext, Inventory inventory, Player player)
	{
		if (((Humanoid)player).GetInventory() == inventory)
		{
			if (analysisContext.Item.m_equipped && Recycle_N_ReclaimPlugin.HideEquippedItemsInRecyclingTab.Value.IsOn())
			{
				analysisContext.DisplayImpediments.Add(Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_item_equipped"));
			}
			if (analysisContext.Item.m_gridPos.y == 0 && Recycle_N_ReclaimPlugin.IgnoreItemsOnHotbar.Value.IsOn())
			{
				analysisContext.DisplayImpediments.Add(Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_item_on_hotbar"));
			}
			if (analysisContext.Recipe.m_craftingStation?.m_name != null && Recycle_N_ReclaimPlugin.StationFilterEnabled.Value.IsOn() && Recycle_N_ReclaimPlugin.StationFilterList.Contains(Utils.GetPrefabName(((Component)((Component)analysisContext.Recipe.m_craftingStation).transform.root).gameObject)))
			{
				analysisContext.DisplayImpediments.Add(Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_item_from_station", Recycle_N_ReclaimPlugin.Localize(analysisContext.Recipe.m_craftingStation.m_name)));
			}
		}
	}

	public static void DoInventoryChanges(RecyclingAnalysisContext analysisContext, Inventory inventory, Player player, bool recordUndo = false)
	{
		Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)"Inventory changes requested");
		List<RecyclingAnalysisContext.ReclaimingYieldEntry> list = new List<RecyclingAnalysisContext.ReclaimingYieldEntry>();
		foreach (RecyclingAnalysisContext.ReclaimingYieldEntry entry in analysisContext.Entries)
		{
			if (entry.Amount == 0 && entry.InitialRecipeHadZero)
			{
				continue;
			}
			if ((Recycle_N_ReclaimPlugin.ApplyCraftedBy.Value.IsOn() ? inventory.AddItem(((Object)entry.Prefab).name, entry.Amount, entry.mQuality, entry.mVariant, player.GetPlayerID(), player.GetPlayerName(), false, false) : inventory.AddItem(((Object)entry.Prefab).name, entry.Amount, entry.mQuality, entry.mVariant, 0L, "", false, false)) != null)
			{
				Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)$"Added {entry.Amount} of {((Object)entry.Prefab).name}");
				list.Add(entry);
				continue;
			}
			if (entry.Amount < 1 && Recycle_N_ReclaimPlugin.PreventZeroResourceYields.Value.IsOff())
			{
				Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)"Adding item failed, but player disabled zero resource yields prevention, item loss expected.");
				continue;
			}
			Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogError((object)"Inventory refused to add item after valid analysis! Rolling back to prevent item loss.");
			foreach (RecyclingAnalysisContext.ReclaimingYieldEntry item in list)
			{
				inventory.RemoveItem(item.RecipeItemData.m_shared.m_name, item.Amount, -1, true);
			}
			analysisContext.ShouldErrorDumpAnalysis = true;
			analysisContext.RecyclingImpediments.Add(Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_inventory_couldnt_add", Recycle_N_ReclaimPlugin.Localize(((Object)entry.Prefab).name)));
			if (analysisContext.ShouldErrorDumpAnalysis || Recycle_N_ReclaimPlugin.DebugAlwaysDumpAnalysisContext.Value.IsOn())
			{
				analysisContext.Dump();
			}
			return;
		}
		if (inventory.RemoveItem(analysisContext.Item))
		{
			Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)("Removed item " + analysisContext.Item.m_shared.m_name));
			if (recordUndo)
			{
				RecycleUndoManager.Record(analysisContext.Item, analysisContext.Entries);
			}
			return;
		}
		Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogError((object)"Inventory refused to remove item after valid analysis! Check the error from the inventory for details. Will mark analysis for dumping.");
		analysisContext.ShouldErrorDumpAnalysis = true;
		analysisContext.RecyclingImpediments.Add(Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_inventory_couldnt_remove", Recycle_N_ReclaimPlugin.Localize(analysisContext.Item.m_shared.m_name)));
		if (analysisContext.ShouldErrorDumpAnalysis || Recycle_N_ReclaimPlugin.DebugAlwaysDumpAnalysisContext.Value.IsOn())
		{
			analysisContext.Dump();
		}
	}

	private static bool TryFindRecipeForItem(RecyclingAnalysisContext analysisContext, Player player)
	{
		ItemData item = analysisContext.Item;
		List<Recipe> list = (_recipeCache.TryGetValue(item.m_shared.m_name, out var value) ? value.Where([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (Recipe rec) => rec?.m_item?.m_itemData?.m_shared != null).ToList() : new List<Recipe>());
		if (list.Count == 0)
		{
			Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)("Could not find a recipe for " + item.m_shared.m_name));
			analysisContext.DisplayImpediments.Add(Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_couldnt_find_recipe", Recycle_N_ReclaimPlugin.Localize(item.m_shared.m_name)));
			analysisContext.Recipe = null;
			return false;
		}
		if (list.Count > 1)
		{
			List<Recipe> list2 = list.Where([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (Recipe r) => player.IsRecipeKnown(r.m_item.m_itemData.m_shared.m_name)).ToList();
			if (list2.Any())
			{
				list = list2;
			}
			list = list.OrderBy([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (Recipe r) => r.m_amount).Take(1).ToList();
		}
		analysisContext.Recipe = list.FirstOrDefault();
		if (!player.IsRecipeKnown(analysisContext.Recipe.m_item.m_itemData.m_shared.m_name) && Recycle_N_ReclaimPlugin.AllowRecyclingUnknownRecipes.Value.IsOff())
		{
			string item2 = Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_recipe_not_known", Recycle_N_ReclaimPlugin.Localize(item.m_shared.m_name));
			analysisContext.RecyclingImpediments.Add(item2);
		}
		return true;
	}

	private static void AnalyzeInventoryHasEnoughEmptySlots(RecyclingAnalysisContext analysisContext, Inventory inventory)
	{
		Dictionary<(string, float), int> dictionary = new Dictionary<(string, float), int>();
		int emptySlots = inventory.GetEmptySlots();
		int num = emptySlots;
		int num2 = 0;
		foreach (RecyclingAnalysisContext.ReclaimingYieldEntry entry in analysisContext.Entries)
		{
			if (entry.Amount != 0 || !entry.InitialRecipeHadZero)
			{
				ItemData itemData = entry.Prefab.GetComponent<ItemDrop>().m_itemData;
				(string, int) tuple = (itemData.m_shared.m_name, itemData.m_worldLevel);
				int maxStackSize = itemData.m_shared.m_maxStackSize;
				int num3 = inventory.FindFreeStackSpace(itemData.m_shared.m_name, (float)itemData.m_worldLevel);
				(string, int) tuple2 = tuple;
				dictionary.TryGetValue((tuple2.Item1, tuple2.Item2), out var value);
				int num4 = Math.Max(0, num3 - value);
				int num5 = Math.Max(0, entry.Amount - num4);
				if (num5 > 0)
				{
					int num6 = (int)Math.Ceiling((double)num5 / (double)maxStackSize);
					num2 += num6;
					num -= num6;
					tuple2 = tuple;
					dictionary[(tuple2.Item1, tuple2.Item2)] = value + num4;
				}
				else
				{
					tuple2 = tuple;
					dictionary[(tuple2.Item1, tuple2.Item2)] = value + entry.Amount;
				}
				if (num < 0)
				{
					string item = Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_not_enough_slots", num2.ToString(), emptySlots.ToString());
					analysisContext.RecyclingImpediments.Add(item);
					break;
				}
			}
		}
	}

	private static void AnalyzeMaterialYieldForItem(RecyclingAnalysisContext analysisContext)
	{
		ItemData item = analysisContext.Item;
		float recyclingRate = GroupUtils.GetRecycleRateOverride(((Object)(object)item.m_dropPrefab != (Object)null) ? Utils.GetPrefabName(((Object)item.m_dropPrefab).name) : "") ?? Recycle_N_ReclaimPlugin.RecyclingRate.Value;
		Recipe recipe = analysisContext.Recipe;
		double amountToCraftedRecipeAmountPercentage = (double)item.m_stack / (double)recipe.m_amount;
		Requirement[] resources = recipe.m_resources;
		foreach (Requirement val in resources)
		{
			if ((Object)(object)val.m_resItem == (Object)null)
			{
				continue;
			}
			ItemData itemData = val.m_resItem.m_itemData;
			if (itemData?.m_shared == null)
			{
				continue;
			}
			GameObject val2 = Utils.FindItemPrefab(itemData);
			if ((Object)(object)val2 == (Object)null)
			{
				Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogWarning((object)("Could not find a prefab for " + item.m_shared.m_name + "! Won't be able to spawn items. You might want to report this!"));
				analysisContext.RecyclingImpediments.Add(Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_coundnt_find_item", Recycle_N_ReclaimPlugin.Localize(item.m_shared.m_name), item.m_shared.m_name));
				continue;
			}
			var (num2, flag2) = CalculateFinalAmount(item, val, amountToCraftedRecipeAmountPercentage, recyclingRate);
			if (!GroupUtils.IsPrefabExcludedInReclaiming(Utils.GetPrefabName(val2)))
			{
				analysisContext.Entries.Add(new RecyclingAnalysisContext.ReclaimingYieldEntry(val2, itemData, num2, itemData.m_quality, itemData.m_variant, flag2));
			}
			if (Recycle_N_ReclaimPlugin.PreventZeroResourceYields.Value.IsOn() && num2 == 0 && !flag2)
			{
				analysisContext.RecyclingImpediments.Add(Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_recylce_yield_none", Recycle_N_ReclaimPlugin.Localize(val.m_resItem.m_itemData.m_shared.m_name)));
			}
		}
		if (!Recycle_N_ReclaimPlugin.returnEnchantedResourcesReclaiming.Value.IsOff() && (!Recycle_N_ReclaimPlugin.HasEpicLoot || CheckEpicLoot(analysisContext)) && API.IsLoaded())
		{
			CheckJewelCrafting(analysisContext);
		}
	}

	private static bool CheckEpicLoot(RecyclingAnalysisContext analysisContext)
	{
		ItemData item = analysisContext.Item;
		if (!item.IsMagicItem() || !item.TryGetRarity(out var rarity))
		{
			return true;
		}
		foreach (ItemAmount enchantCost in item.GetEnchantCosts(rarity))
		{
			GameObject itemPrefab = ObjectDB.instance.GetItemPrefab(enchantCost.Item);
			ItemData val = (((Object)(object)itemPrefab == (Object)null) ? null : itemPrefab.GetComponent<ItemDrop>()?.m_itemData);
			if (val != null)
			{
				Recipe recipe = ObjectDB.instance.GetRecipe(val);
				bool flag = Player.m_localPlayer.IsRecipeKnown(val.m_shared.m_name) || Recycle_N_ReclaimPlugin.AllowRecyclingUnknownRecipes.Value.IsOn();
				if ((!Player.m_localPlayer.m_knownMaterial.Contains(val.m_shared.m_name) && !Recycle_N_ReclaimPlugin.AllowRecyclingUnknownRecipes.Value.IsOn()) || ((Object)(object)recipe != (Object)null && !flag))
				{
					string text = Recycle_N_ReclaimPlugin.Localize(val.m_shared.m_name);
					analysisContext.RecyclingImpediments.Add(Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_recipe_not_known", text ?? val.m_shared.m_name));
					return false;
				}
				if (!GroupUtils.IsPrefabExcludedInReclaiming(Utils.GetPrefabName(itemPrefab)))
				{
					analysisContext.Entries.Add(new RecyclingAnalysisContext.ReclaimingYieldEntry(itemPrefab, val, ((Object)(object)recipe != (Object)null) ? recipe.m_amount : val.m_stack, val.m_quality, val.m_variant, initialRecipeHadZero: false));
				}
			}
		}
		return true;
	}

	private static void CheckJewelCrafting(RecyclingAnalysisContext recyclingAnalysisContext)
	{
		if (recyclingAnalysisContext?.Item == null)
		{
			return;
		}
		List<API.GemInfo> gems = API.GetGems(recyclingAnalysisContext.Item);
		if (gems == null || !gems.Any())
		{
			return;
		}
		foreach (KeyValuePair<ItemDrop, ItemData> item4 in (from itemDrop in gems.Where([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (API.GemInfo gem) => gem != null).Select((Func<API.GemInfo, ItemDrop>)([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (API.GemInfo gem) =>
			{
				ObjectDB instance2 = ObjectDB.instance;
				if (instance2 == null)
				{
					return (ItemDrop)null;
				}
				GameObject itemPrefab = instance2.GetItemPrefab(gem.gemPrefab);
				return (itemPrefab == null) ? null : itemPrefab.GetComponent<ItemDrop>();
			}))
			where (Object)(object)itemDrop != (Object)null
			select itemDrop).ToDictionary([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (ItemDrop itemDrop) => itemDrop, [_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (ItemDrop itemDrop) => itemDrop.m_itemData))
		{
			ObjectDB instance = ObjectDB.instance;
			Recipe val = ((instance != null) ? instance.GetRecipe(item4.Value) : null);
			bool flag = Player.m_localPlayer.IsRecipeKnown(item4.Value.m_shared.m_name) || Recycle_N_ReclaimPlugin.AllowRecyclingUnknownRecipes.Value.IsOn();
			if ((!Player.m_localPlayer.m_knownMaterial.Contains(item4.Value.m_shared.m_name) && !Recycle_N_ReclaimPlugin.AllowRecyclingUnknownRecipes.Value.IsOn()) || (!(((Object)(object)val == (Object)null) | flag) && !Recycle_N_ReclaimPlugin.AllowRecyclingUnknownRecipes.Value.IsOn()))
			{
				string text = Recycle_N_ReclaimPlugin.Localize(item4.Value.m_shared.m_name);
				string item = Recycle_N_ReclaimPlugin.Localize("$azumatt_recycle_n_reclaim_recipe_not_known", text ?? item4.Value.m_shared.m_name);
				recyclingAnalysisContext.RecyclingImpediments.Add(item);
				break;
			}
			if (!GroupUtils.IsPrefabExcludedInReclaiming(Utils.GetPrefabName(((Component)item4.Key).gameObject)))
			{
				if ((Object)(object)val != (Object)null)
				{
					RecyclingAnalysisContext.ReclaimingYieldEntry item2 = new RecyclingAnalysisContext.ReclaimingYieldEntry(((Component)item4.Key).gameObject, item4.Value, val.m_amount, item4.Value.m_quality, item4.Value.m_variant, initialRecipeHadZero: false);
					recyclingAnalysisContext.Entries.Add(item2);
				}
				else if (Object.op_Implicit((Object)(object)item4.Key))
				{
					RecyclingAnalysisContext.ReclaimingYieldEntry item3 = new RecyclingAnalysisContext.ReclaimingYieldEntry(((Component)item4.Key).gameObject, item4.Value, 1, item4.Value.m_quality, item4.Value.m_variant, initialRecipeHadZero: false);
					recyclingAnalysisContext.Entries.Add(item3);
				}
			}
		}
	}

	private static Result CalculateFinalAmount(ItemData itemData, Requirement resource, double amountToCraftedRecipeAmountPercentage, float recyclingRate)
	{
		Result result = new Result();
		int num = Utils.SpentQualityLevels(resource, itemData).Select((Func<int, int>)resource.GetAmount).Sum();
		if (num == 0)
		{
			result.Amount = 0;
			result.InitialRecipeHadZero = true;
			return result;
		}
		double num2 = (double)num * amountToCraftedRecipeAmountPercentage;
		double num3 = Math.Floor(num2 * (double)recyclingRate);
		result.Amount = (int)num3;
		if (num3 < 1.0 && itemData.m_shared.m_maxStackSize == 1 && Recycle_N_ReclaimPlugin.UnstackableItemsAlwaysReturnAtLeastOneResource.Value.IsOn())
		{
			result.Amount = 1;
		}
		if (Recycle_N_ReclaimPlugin.DebugAllowSpammyLogs.Value.IsOn())
		{
			Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogDebug((object)("Calculations report.\n = = = " + resource.m_resItem.m_itemData.m_shared.m_name + " - " + $"REA:{resource.m_amount} APLS: {num} IQ:{itemData.m_quality} " + $"STK:{itemData.m_stack}({itemData.m_shared.m_maxStackSize}) SC:{num2} " + $"ATCRAP:{amountToCraftedRecipeAmountPercentage} A:{num}, " + $"RA:{num3} FA:{result.Amount}"));
		}
		result.InitialRecipeHadZero = false;
		return result;
	}
}
