using System;
using System.Collections.Generic;
using System.ComponentModel;
using JetBrains.Annotations;
using Newtonsoft.Json;
using UnityEngine;

namespace EpicLootAPI;

internal static class EpicLoot
{
	[PublicAPI]
	public static class ChangeReason
	{
		public const string Enchant = "Enchant";

		public const string Augment = "Augment";

		public const string Disenchant = "Disenchant";

		public const string Rune = "Rune";

		public const string Temper = "Temper";

		public const string Socket = "Socket";

		public const string Unsocket = "Unsocket";

		public const string LootRoll = "LootRoll";

		public const string Transfer = "Transfer";

		public const string Unspecified = "Unspecified";
	}

	public static readonly Logger logger = new Logger();

	private static readonly Method API_GetTotalActiveMagicEffectValue = new Method("GetTotalActiveMagicEffectValue");

	private static readonly Method API_GetTotalActiveMagicEffectValueForWeapon = new Method("GetTotalActiveMagicEffectValueForWeapon");

	private static readonly Method API_HasActiveMagicEffect = new Method("HasActiveMagicEffect");

	private static readonly Method API_HasActiveMagicEffectOnWeapon = new Method("HasActiveMagicEffectOnWeapon");

	private static readonly Method API_GetTotalActiveSetEffectValue = new Method("GetTotalActiveSetEffectValue");

	private static readonly Method API_GetAllActiveMagicEffects = new Method("GetAllActiveMagicEffects");

	private static readonly Method API_GetAllSetMagicEffects = new Method("GetAllActiveSetMagicEffects");

	private static readonly Method API_GetPlayerTotalActiveMagicEffectValue = new Method("GetTotalPlayerActiveMagicEffectValue");

	private static readonly Method API_PlayerHasActiveMagicEffect = new Method("PlayerHasActiveMagicEffect");

	private static readonly Method API_HasLegendaryItem = new Method("HasLegendaryItem");

	private static readonly Method API_HasLegendarySet = new Method("HasLegendarySet");

	private static readonly Method API_RegisterAsset = new Method("RegisterAsset");

	private static readonly Method API_GetMagicItemJson = new Method("GetMagicItemJson");

	private static readonly Method API_RegisterMagicEffectRequirement = new Method("RegisterMagicEffectRequirement", typeof(string), typeof(Func<ItemData, object, string, bool, bool, bool, bool>));

	private static readonly Method API_AddMagicItemChangedListener = new Method("AddMagicItemChangedListener", typeof(Action<ItemData, string>));

	private static readonly Method API_RemoveMagicItemChangedListener = new Method("RemoveMagicItemChangedListener", typeof(Action<ItemData, string>));

	private static readonly Method API_AddLootGeneratedListener = new Method("AddLootGeneratedListener", typeof(Action<ItemData>));

	private static readonly Method API_RemoveLootGeneratedListener = new Method("RemoveLootGeneratedListener", typeof(Action<ItemData>));

	private static readonly Method API_AddBountyCompletedListener = new Method("AddBountyCompletedListener", typeof(Action<Player, string>));

	private static readonly Method API_RemoveBountyCompletedListener = new Method("RemoveBountyCompletedListener", typeof(Action<Player, string>));

	private static readonly Method API_TryMakeMagicItem = new Method("TryMakeMagicItem");

	private static readonly Method API_RollMagicItemJson = new Method("RollMagicItemJson");

	private static readonly Method API_ApplyMagicItemJson = new Method("ApplyMagicItemJson");

	private static readonly Method API_GetLuckFactor = new Method("GetLuckFactor");

	private static readonly Method API_RollEffectCountForRarity = new Method("RollEffectCountForRarity");

	private static readonly Method API_GetLegendaryIDs = new Method("GetLegendaryIDs");

	private static readonly Method API_GetLegendaryInfoJson = new Method("GetLegendaryInfoJson");

	private static readonly Method API_GetAvailableEffectTypes = new Method("GetAvailableEffectTypes");

	private static readonly Method API_AddLootTables = new Method("AddLootTables");

	private static readonly Method API_UpdateLootTables = new Method("UpdateLootTables");

	private static readonly Method API_RegisterInventoryProvider = new Method("RegisterInventoryProvider", typeof(string), typeof(Func<List<ItemData>>), typeof(Func<string, int>), typeof(Func<string, int, int>), typeof(Func<ItemData, int, int>));

	private static readonly Method API_UnregisterInventoryProvider = new Method("UnregisterInventoryProvider");

	private static readonly Method API_RegisterEquipmentProvider = new Method("RegisterEquipmentProvider", typeof(string), typeof(Func<Player, List<ItemData>>));

	private static readonly Method API_UnregisterEquipmentProvider = new Method("UnregisterEquipmentProvider");

	private static readonly Method API_RegisterSacrificeFilter = new Method("RegisterSacrificeFilter", typeof(string), typeof(Func<ItemData, bool>));

	private static readonly Method API_UnregisterSacrificeFilter = new Method("UnregisterSacrificeFilter");

	private static readonly Method API_InvalidatePlayerEffectCache = new Method("InvalidatePlayerEffectCache");

	private static readonly Method API_GetRegisteredProviders = new Method("GetRegisteredProviders");

	private static readonly Method API_GetApiVersion = new Method("GetApiVersion");

	private static readonly Method API_GetPluginVersion = new Method("GetPluginVersion");

	private static readonly Method API_HasEndpoint = new Method("HasEndpoint");

	private static readonly Method API_IsMagicItem = new Method("IsMagicItem");

	private static readonly Method API_TryGetRarity = new Method("TryGetRarity");

	private static readonly Method API_GetRarityCount = new Method("GetRarityCount");

	private static readonly Method API_GetRarityColorByIndex = new Method("GetRarityColorByIndex");

	private static readonly Method API_GetRarityDisplayNameByIndex = new Method("GetRarityDisplayNameByIndex");

	private static readonly Method API_GetItemRarityColor = new Method("GetItemRarityColor");

	private static readonly Method API_IsEpicLootItem = new Method("IsEpicLootItem");

	private static readonly Method API_IsShardStone = new Method("IsShardStone");

	private static readonly Method API_IsRunestone = new Method("IsRunestone");

	private static readonly Method API_IsMagicCraftingMaterial = new Method("IsMagicCraftingMaterial");

	private static readonly Method API_IsUnidentified = new Method("IsUnidentified");

	private static readonly Method API_CanBeMagicItem = new Method("CanBeMagicItem");

	private static readonly Method API_ItemHasMagicEffect = new Method("ItemHasMagicEffect");

	private static readonly Method API_GetAllMagicEffectTypes = new Method("GetAllMagicEffectTypes");

	private static readonly Method API_GetEnchantCostsJson = new Method("GetEnchantCostsJson");

	private static readonly Method API_GetSacrificeProductsJson = new Method("GetSacrificeProductsJson");

	private static readonly Method API_GetItemDisplayName = new Method("GetItemDisplayName");

	private static readonly Method API_GetItemDecoratedName = new Method("GetItemDecoratedName", typeof(ItemData), typeof(string));

	private static readonly Method API_ApplyMagicItemBackground = new Method("ApplyMagicItemBackground", typeof(GameObject), typeof(GameObject), typeof(ItemData), typeof(bool));

	private static readonly Method API_ApplyMagicItemBackgroundToIcon = new Method("ApplyMagicItemBackgroundToIcon", typeof(GameObject), typeof(ItemData));

	[PublicAPI]
	[Description("Send all your custom conversions, effects, item definitions, etc... to Epic Loot")]
	public static void RegisterAll()
	{
		MaterialConversion.RegisterAll();
		MagicItemEffectDefinition.RegisterAll();
		AbilityDefinition.RegisterAll();
		CustomRecipe.RegisterAll();
		Sacrifice.RegisterAll();
		TreasureMap.RegisterAll();
		SecretStashItem.RegisterAll();
		LegendaryInfo.RegisterAll();
		LegendarySetInfo.RegisterAll();
		BountyTarget.RegisterAll();
		AbilityProxyDefinition.RegisterAll();
	}

	[PublicAPI]
	[Description("Register asset into EpicLoot in order to target them in your definitions")]
	public static bool RegisterAsset(string name, object asset)
	{
		bool flag = (bool)(API_RegisterAsset.Invoke(name, asset)[0] ?? ((object)false));
		logger.LogDebug($"Registered asset: {name}, {flag}");
		return flag;
	}

	[PublicAPI]
	public static bool RegisterMagicEffectRequirement(string externalRequirement, Func<ItemData, object, string, bool, bool, bool, bool> requirement)
	{
		bool flag = (bool)(API_RegisterMagicEffectRequirement.Invoke(externalRequirement, requirement)[0] ?? ((object)false));
		logger.LogDebug($"Registered magic effect requirement: {externalRequirement}, {flag}");
		return flag;
	}

	[PublicAPI]
	public static bool HasLegendaryItem(this Player player, string legendaryItemID)
	{
		bool flag = (bool)(API_HasLegendaryItem.Invoke(player, legendaryItemID)[0] ?? ((object)false));
		logger.LogDebug($"Has legendary item: {legendaryItemID}, {flag} ");
		return flag;
	}

	[PublicAPI]
	public static bool HasLegendarySet(this Player player, string legendarySetID, out int count)
	{
		count = 0;
		object[] array = API_HasLegendarySet.Invoke(player, legendarySetID, count);
		count = (int)(array[3] ?? ((object)0));
		bool flag = (bool)(array[0] ?? ((object)false));
		logger.LogDebug($"Has legendary set: {legendarySetID}, {flag}, count: {count}");
		return flag;
	}

	[PublicAPI]
	public static bool HasActiveMagicEffectOnWeapon(Player player, ItemData item, string effectType, out float effectValue)
	{
		effectValue = 0f;
		object[] array = API_HasActiveMagicEffectOnWeapon.Invoke(player, item, effectType, effectValue);
		effectValue = (float)(array[4] ?? ((object)0f));
		bool flag = (bool)(array[0] ?? ((object)false));
		logger.LogDebug($"Has magic effect on weapon: {effectType}, {flag}, value: {effectValue}");
		return flag;
	}

	[PublicAPI]
	public static float GetTotalActiveMagicEffectValue(Player player, ItemData item, string effectType, float scale = 1f)
	{
		float num = (float)(API_GetTotalActiveMagicEffectValue.Invoke(player, item, effectType, scale)[0] ?? ((object)0f));
		logger.LogDebug($"Total magic effect value: {effectType}, amount: {num}");
		return num;
	}

	[PublicAPI]
	public static float GetTotalActiveMagicEffectValueForWeapon(Player player, ItemData item, string effectType, float scale = 1f)
	{
		float num = (float)(API_GetTotalActiveMagicEffectValueForWeapon.Invoke(player, item, effectType, scale)[0] ?? ((object)0f));
		logger.LogDebug($"Total effect on weapon: {effectType}, amount: {num}");
		return num;
	}

	[PublicAPI]
	public static bool HasActiveMagicEffect(Player player, string effectType, ItemData item, out float effectValue)
	{
		effectValue = 0f;
		object[] array = API_HasActiveMagicEffect.Invoke(player, effectType, item, effectValue);
		effectValue = (float)(array[4] ?? ((object)0f));
		bool flag = (bool)(array[0] ?? ((object)false));
		logger.LogDebug($"Has active effect: {effectType}, {flag}, value: {effectValue}");
		return flag;
	}

	[PublicAPI]
	public static float GetTotalActiveSetEffectValue(Player player, string effectType, float scale = 1f)
	{
		float num = (float)(API_GetTotalActiveSetEffectValue.Invoke(player, effectType, scale)[0] ?? ((object)0f));
		logger.LogDebug($"Total effect value: {effectType}, amount: {num}");
		return num;
	}

	[PublicAPI]
	public static List<MagicItemEffect> GetAllActiveMagicEffects(this Player player, string effectType = null)
	{
		List<string> list = (List<string>)(API_GetAllActiveMagicEffects.Invoke(player, effectType)[0] ?? new List<string>());
		if (list.Count <= 0)
		{
			return new List<MagicItemEffect>();
		}
		List<MagicItemEffect> list2 = new List<MagicItemEffect>();
		list2.DeserializeList(list);
		return list2;
	}

	[PublicAPI]
	public static List<MagicItemEffect> GetAllActiveSetMagicEffects(this Player player, string effectType = null)
	{
		List<string> list = (List<string>)(API_GetAllSetMagicEffects.Invoke(player, effectType)[0] ?? new List<string>());
		if (list.Count <= 0)
		{
			return new List<MagicItemEffect>();
		}
		List<MagicItemEffect> list2 = new List<MagicItemEffect>();
		list2.DeserializeList(list);
		return list2;
	}

	private static void DeserializeList<T>(this List<T> output, List<string> input)
	{
		foreach (string item in input)
		{
			try
			{
				T val = JsonConvert.DeserializeObject<T>(item);
				if (val != null)
				{
					output.Add(val);
				}
			}
			catch
			{
				logger.LogWarning("Failed to parse " + typeof(T).Name);
			}
		}
	}

	[PublicAPI]
	public static float GetTotalActiveMagicEffectValue(this Player player, string effectType, float scale = 1f, ItemData ignoreThisItem = null)
	{
		float num = (float)(API_GetPlayerTotalActiveMagicEffectValue.Invoke(player, effectType, scale, ignoreThisItem)[0] ?? ((object)0f));
		logger.LogDebug($"Total magic effect: {effectType}, value: {num}");
		return num;
	}

	[PublicAPI]
	public static bool HasActiveMagicEffect(this Player player, string effectType, out float effectValue, float scale = 1f, ItemData ignoreThisItem = null)
	{
		effectValue = 0f;
		object[] array = API_PlayerHasActiveMagicEffect.Invoke(player, effectType, effectValue, scale, ignoreThisItem);
		effectValue = (float)(array[3] ?? ((object)0f));
		bool flag = (bool)(array[0] ?? ((object)false));
		logger.LogDebug($"Has active magic effect: {effectType}, value: {flag}");
		return flag;
	}

	[PublicAPI]
	public static MagicItem GetMagicItem(this ItemData itemData)
	{
		string text = (string)(API_GetMagicItemJson.Invoke(itemData)[0] ?? "");
		if (string.IsNullOrEmpty(text))
		{
			return null;
		}
		return JsonConvert.DeserializeObject<MagicItem>(text);
	}

	[PublicAPI]
	public static bool AddMagicItemChangedListener(Action<ItemData, string> listener)
	{
		return (bool)(API_AddMagicItemChangedListener.Invoke(listener)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool RemoveMagicItemChangedListener(Action<ItemData, string> listener)
	{
		return (bool)(API_RemoveMagicItemChangedListener.Invoke(listener)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool AddLootGeneratedListener(Action<ItemData> listener)
	{
		return (bool)(API_AddLootGeneratedListener.Invoke(listener)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool RemoveLootGeneratedListener(Action<ItemData> listener)
	{
		return (bool)(API_RemoveLootGeneratedListener.Invoke(listener)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool AddBountyCompletedListener(Action<Player, string> listener)
	{
		return (bool)(API_AddBountyCompletedListener.Invoke(listener)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool RemoveBountyCompletedListener(Action<Player, string> listener)
	{
		return (bool)(API_RemoveBountyCompletedListener.Invoke(listener)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool TryMakeMagicItem(this ItemData item, ItemRarity rarity, float luck = 0f, string? legendaryID = null)
	{
		bool flag = (bool)(API_TryMakeMagicItem.Invoke(item, (int)rarity, luck, legendaryID ?? "")[0] ?? ((object)false));
		logger.LogDebug($"Made magic item: {item?.m_shared?.m_name}, {rarity}, {flag}");
		return flag;
	}

	[PublicAPI]
	public static MagicItem? RollMagicItem(ItemRarity rarity, ItemData item, float luck = 0f)
	{
		string text = (string)(API_RollMagicItemJson.Invoke((int)rarity, item, luck)[0] ?? "");
		if (string.IsNullOrEmpty(text))
		{
			return null;
		}
		try
		{
			return JsonConvert.DeserializeObject<MagicItem>(text);
		}
		catch
		{
			logger.LogWarning("Failed to parse rolled magic item");
			return null;
		}
	}

	[PublicAPI]
	public static bool ApplyMagicItem(this ItemData item, MagicItem magicItem)
	{
		if (magicItem == null)
		{
			return false;
		}
		string text = JsonConvert.SerializeObject((object)magicItem);
		return (bool)(API_ApplyMagicItemJson.Invoke(item, text)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static float GetLuckFactor(Vector3 position)
	{
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		return (float)(API_GetLuckFactor.Invoke(position)[0] ?? ((object)0f));
	}

	[PublicAPI]
	public static int RollEffectCountForRarity(ItemRarity rarity)
	{
		return (int)(API_RollEffectCountForRarity.Invoke((int)rarity)[0] ?? ((object)0));
	}

	[PublicAPI]
	public static List<string> GetLegendaryIDs(ItemRarity rarity)
	{
		return (List<string>)(API_GetLegendaryIDs.Invoke((int)rarity)[0] ?? new List<string>());
	}

	[PublicAPI]
	public static LegendaryInfo? GetLegendaryInfo(string legendaryID)
	{
		string text = (string)(API_GetLegendaryInfoJson.Invoke(legendaryID)[0] ?? "");
		if (string.IsNullOrEmpty(text))
		{
			return null;
		}
		try
		{
			return JsonConvert.DeserializeObject<LegendaryInfo>(text);
		}
		catch
		{
			logger.LogWarning("Failed to parse legendary info for " + legendaryID);
			return null;
		}
	}

	[PublicAPI]
	public static List<string> GetAvailableEffectTypes(this ItemData item, ItemRarity rarity, MagicItem? magicItem = null)
	{
		string text = ((magicItem == null) ? "" : JsonConvert.SerializeObject((object)magicItem));
		return (List<string>)(API_GetAvailableEffectTypes.Invoke(item, text, (int)rarity)[0] ?? new List<string>());
	}

	[PublicAPI]
	public static bool AddLootTables(string json)
	{
		if (!(API_AddLootTables.Invoke(json)[0] is string value))
		{
			return false;
		}
		RunTimeRegistry.Register(json, value);
		logger.LogDebug("Registered external loot tables");
		return true;
	}

	[PublicAPI]
	public static bool UpdateLootTables(string originalJson, string json)
	{
		if (!RunTimeRegistry.TryGetValue(originalJson, out string value))
		{
			return false;
		}
		return (bool)(API_UpdateLootTables.Invoke(value, json)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool RegisterInventoryProvider(string id, Func<List<ItemData>> getItems, Func<string, int> countItem, Func<string, int, int> removeItem, Func<ItemData, int, int> removeExactItem)
	{
		bool flag = (bool)(API_RegisterInventoryProvider.Invoke(id, getItems, countItem, removeItem, removeExactItem)[0] ?? ((object)false));
		logger.LogDebug($"Registered inventory provider: {id}, {flag}");
		return flag;
	}

	[PublicAPI]
	public static bool UnregisterInventoryProvider(string id)
	{
		return (bool)(API_UnregisterInventoryProvider.Invoke(id)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool RegisterEquipmentProvider(string id, Func<Player, List<ItemData>> getExtraEquipped)
	{
		bool flag = (bool)(API_RegisterEquipmentProvider.Invoke(id, getExtraEquipped)[0] ?? ((object)false));
		logger.LogDebug($"Registered equipment provider: {id}, {flag}");
		return flag;
	}

	[PublicAPI]
	public static bool UnregisterEquipmentProvider(string id)
	{
		return (bool)(API_UnregisterEquipmentProvider.Invoke(id)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static void InvalidatePlayerEffectCache(this Player player)
	{
		API_InvalidatePlayerEffectCache.Invoke(player);
	}

	[PublicAPI]
	public static bool RegisterSacrificeFilter(string id, Func<ItemData, bool> canSacrifice)
	{
		bool flag = (bool)(API_RegisterSacrificeFilter.Invoke(id, canSacrifice)[0] ?? ((object)false));
		logger.LogDebug($"Registered sacrifice filter: {id}, {flag}");
		return flag;
	}

	[PublicAPI]
	public static bool UnregisterSacrificeFilter(string id)
	{
		return (bool)(API_UnregisterSacrificeFilter.Invoke(id)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static Dictionary<string, List<string>> GetRegisteredProviders()
	{
		return (Dictionary<string, List<string>>)(API_GetRegisteredProviders.Invoke()[0] ?? new Dictionary<string, List<string>>());
	}

	[PublicAPI]
	public static int GetApiVersion()
	{
		return (int)(API_GetApiVersion.Invoke()[0] ?? ((object)0));
	}

	[PublicAPI]
	public static bool IsLoaded()
	{
		return GetApiVersion() > 0;
	}

	[PublicAPI]
	public static string GetPluginVersion()
	{
		return (string)(API_GetPluginVersion.Invoke()[0] ?? "");
	}

	[PublicAPI]
	public static bool HasEndpoint(string name)
	{
		return (bool)(API_HasEndpoint.Invoke(name)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool IsMagicItem(this ItemData item)
	{
		return (bool)(API_IsMagicItem.Invoke(item)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool TryGetRarity(this ItemData item, out ItemRarity rarity)
	{
		rarity = ItemRarity.Magic;
		int num = 0;
		object[] array = API_TryGetRarity.Invoke(item, num);
		if ((bool)(array[0] ?? ((object)false)))
		{
			rarity = (ItemRarity)(int)(array[2] ?? ((object)0));
			return true;
		}
		return false;
	}

	[PublicAPI]
	public static string GetDisplayName(this ItemData item)
	{
		return (string)(API_GetItemDisplayName.Invoke(item)[0] ?? "");
	}

	[PublicAPI]
	public static string GetDecoratedName(this ItemData item, string colorOverride = null)
	{
		return (string)(API_GetItemDecoratedName.Invoke(item, colorOverride)[0] ?? "");
	}

	[PublicAPI]
	public static int GetRarityCount()
	{
		return (int)(API_GetRarityCount.Invoke()[0] ?? ((object)0));
	}

	[PublicAPI]
	public static string GetRarityColor(ItemRarity rarity)
	{
		return (string)(API_GetRarityColorByIndex.Invoke((int)rarity)[0] ?? "#FFFFFF");
	}

	[PublicAPI]
	public static string GetRarityDisplayName(ItemRarity rarity)
	{
		return (string)(API_GetRarityDisplayNameByIndex.Invoke((int)rarity)[0] ?? "");
	}

	[PublicAPI]
	public static string GetItemRarityColor(this ItemData item)
	{
		return (string)(API_GetItemRarityColor.Invoke(item)[0] ?? "#FFFFFF");
	}

	[PublicAPI]
	public static bool IsEpicLootItem(this ItemData item)
	{
		return (bool)(API_IsEpicLootItem.Invoke(item)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool IsShardStone(this ItemData item)
	{
		return (bool)(API_IsShardStone.Invoke(item)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool IsRunestone(this ItemData item)
	{
		return (bool)(API_IsRunestone.Invoke(item)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool IsMagicCraftingMaterial(this ItemData item)
	{
		return (bool)(API_IsMagicCraftingMaterial.Invoke(item)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool IsUnidentified(this ItemData item)
	{
		return (bool)(API_IsUnidentified.Invoke(item)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool CanBeMagicItem(this ItemData item)
	{
		return (bool)(API_CanBeMagicItem.Invoke(item)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool HasMagicEffect(this ItemData item, string effectType, bool includeSocketed = true)
	{
		return (bool)(API_ItemHasMagicEffect.Invoke(item, effectType, includeSocketed)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static List<string> GetAllMagicEffectTypes()
	{
		return (List<string>)(API_GetAllMagicEffectTypes.Invoke()[0] ?? new List<string>());
	}

	[PublicAPI]
	public static List<ItemAmount> GetEnchantCosts(this ItemData item, ItemRarity rarity)
	{
		return DeserializeAmounts((string)(API_GetEnchantCostsJson.Invoke(item, (int)rarity)[0] ?? "[]"));
	}

	[PublicAPI]
	public static List<ItemAmount> GetSacrificeProducts(this ItemData item)
	{
		return DeserializeAmounts((string)(API_GetSacrificeProductsJson.Invoke(item)[0] ?? "[]"));
	}

	private static List<ItemAmount> DeserializeAmounts(string json)
	{
		try
		{
			return JsonConvert.DeserializeObject<List<ItemAmount>>(json) ?? new List<ItemAmount>();
		}
		catch
		{
			logger.LogWarning("Failed to parse item amount list");
			return new List<ItemAmount>();
		}
	}

	[PublicAPI]
	public static bool ApplyMagicItemBackground(GameObject slotRoot, GameObject equippedOverlay, ItemData item, bool inventoryGrid)
	{
		return (bool)(API_ApplyMagicItemBackground.Invoke(slotRoot, equippedOverlay, item, inventoryGrid)[0] ?? ((object)false));
	}

	[PublicAPI]
	public static bool ApplyMagicItemBackgroundToIcon(GameObject iconObject, ItemData item)
	{
		return (bool)(API_ApplyMagicItemBackgroundToIcon.Invoke(iconObject, item)[0] ?? ((object)false));
	}
}
