using System;
using System.Collections.Generic;
using System.Reflection;
using System.Runtime.CompilerServices;
using BepInEx.Bootstrap;
using JetBrains.Annotations;
using UnityEngine;

namespace ItemDataManager;

[PublicAPI]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public static class _003C35e5ab3c_002D7099_002D45c6_002Dac00_002Db53ba5a87838_003EItemExtensions
{
	private const string className = "ItemDataManager.ItemExtensions";

	internal static readonly ConditionalWeakTable<ItemData, _003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo> itemInfo = new ConditionalWeakTable<ItemData, _003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo>();

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 1, 1, 1, 1, 2 })]
	private static readonly ConditionalWeakTable<ItemData, Dictionary<string, _003C3679b648_002D5ca3_002D43b3_002Da105_002D7e87d198b67d_003EForeignItemInfo>> foreignItemInfo = new ConditionalWeakTable<ItemData, Dictionary<string, _003C3679b648_002D5ca3_002D43b3_002Da105_002D7e87d198b67d_003EForeignItemInfo>>();

	public static _003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo Data(this ItemData item)
	{
		if (itemInfo.TryGetValue(item, out var value))
		{
			return value;
		}
		itemInfo.Add(item, value = new _003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo(item));
		return value;
	}

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	public static _003C3679b648_002D5ca3_002D43b3_002Da105_002D7e87d198b67d_003EForeignItemInfo Data(this ItemData item, string mod)
	{
		Dictionary<string, _003C3679b648_002D5ca3_002D43b3_002Da105_002D7e87d198b67d_003EForeignItemInfo> orCreateValue = foreignItemInfo.GetOrCreateValue(item);
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
			return orCreateValue[mod] = new _003C3679b648_002D5ca3_002D43b3_002Da105_002D7e87d198b67d_003EForeignItemInfo(item, obj);
		}
		Debug.LogWarning((object)("Mod " + mod + " has an ItemDataManager.ItemExtensions class, but no Data(ItemDrop.ItemData) method could be called on it."));
		return orCreateValue[mod] = null;
	}
}
