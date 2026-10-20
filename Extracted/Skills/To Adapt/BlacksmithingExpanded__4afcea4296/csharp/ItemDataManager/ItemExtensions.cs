using System;
using System.Collections.Generic;
using System.Reflection;
using System.Runtime.CompilerServices;
using BepInEx.Bootstrap;
using JetBrains.Annotations;
using UnityEngine;

namespace ItemDataManager;

[PublicAPI]
public static class ItemExtensions
{
	private const string className = "ItemDataManager.ItemExtensions";

	internal static readonly ConditionalWeakTable<ItemData, ItemInfo> itemInfo = new ConditionalWeakTable<ItemData, ItemInfo>();

	private static readonly ConditionalWeakTable<ItemData, Dictionary<string, ForeignItemInfo?>> foreignItemInfo = new ConditionalWeakTable<ItemData, Dictionary<string, ForeignItemInfo>>();

	public static ItemInfo Data(this ItemData item)
	{
		if (itemInfo.TryGetValue(item, out var value))
		{
			return value;
		}
		itemInfo.Add(item, value = new ItemInfo(item));
		return value;
	}

	public static ForeignItemInfo? Data(this ItemData item, string mod)
	{
		Dictionary<string, ForeignItemInfo> orCreateValue = ItemExtensions.foreignItemInfo.GetOrCreateValue(item);
		if (orCreateValue.TryGetValue(mod, out var value))
		{
			return value;
		}
		if (!Chainloader.PluginInfos.TryGetValue(mod, out var value2))
		{
			return null;
		}
		object obj = ((object)value2.Instance).GetType().Assembly.GetType("ItemDataManager.ItemExtensions")?.GetMethod("Data", BindingFlags.Static | BindingFlags.Public, null, new Type[1] { typeof(ItemData) }, Array.Empty<ParameterModifier>())?.Invoke(null, new object[1] { item });
		if (obj != null)
		{
			return orCreateValue[mod] = new ForeignItemInfo(item, obj);
		}
		Debug.LogWarning((object)("Mod " + mod + " has an ItemDataManager.ItemExtensions class, but no Data(ItemDrop.ItemData) method could be called on it."));
		return orCreateValue[mod] = null;
	}
}
