using System;
using System.Collections.Generic;
using UnityEngine;
using Zen.Compatibility;

namespace Zen.Lib;

public static class ItemDataExt
{
	private const string KeyTooltipExtra = "Zen_Tooltip";

	public static bool TryGetRecipe(this ItemDrop itemDrop, out Recipe recipe)
	{
		return itemDrop.m_itemData.TryGetRecipe(out recipe);
	}

	public static bool TryGetRecipe(this ItemData item, out Recipe recipe)
	{
		return Object.op_Implicit((Object)(object)(recipe = ObjectDB.instance.GetRecipe(item)));
	}

	public static ItemType GetItemType(this ItemData? item)
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		return (ItemType)(((_003F?)item?.m_shared.m_itemType) ?? 0);
	}

	public static bool IsEquipped(this ItemData? item)
	{
		return item?.m_equipped ?? false;
	}

	public static bool IsItemType(this ItemData? item, ItemType type)
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		if (item == null)
		{
			return false;
		}
		return item.m_shared.m_itemType == type;
	}

	public static bool IsTowerShield(this ItemData? item)
	{
		if (item != null && item.IsShield())
		{
			return item.m_shared.m_timedBlockBonus <= 0f;
		}
		return false;
	}

	public static bool IsShield(this ItemData? item)
	{
		return item?.IsItemType((ItemType)5) ?? false;
	}

	public static bool IsArmor(this ItemData? item, bool includeTrinket = false)
	{
		if ((item == null || !item.IsItemType((ItemType)7)) && !item.IsItemType((ItemType)6) && !item.IsItemType((ItemType)11) && !item.IsItemType((ItemType)17))
		{
			if (includeTrinket)
			{
				return item.IsItemType((ItemType)24);
			}
			return false;
		}
		return true;
	}

	public static bool IsTorch(this ItemData? itemData)
	{
		return itemData?.IsItemType((ItemType)15) ?? false;
	}

	public static bool IsStackable(this ItemData item)
	{
		return item.m_shared.m_maxStackSize > 1;
	}

	public static bool IsStackable(this ItemDrop item)
	{
		return item.m_itemData.m_shared.m_maxStackSize > 1;
	}

	public static string GetPrefabName(this ItemDrop itemDrop)
	{
		return Utils.GetPrefabName(((Object)itemDrop).name);
	}

	public static string GetPrefabName(this ItemData item)
	{
		return ((Object)item.GetPrefab()).name;
	}

	public static GameObject GetPrefab(this ItemData item)
	{
		if (Object.op_Implicit((Object)(object)item.m_dropPrefab))
		{
			return item.m_dropPrefab;
		}
		GameObject result = default;
		if (ObjectDB.instance.TryGetItemPrefab(item.m_shared, ref result))
		{
			return result;
		}
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(105, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Item does not have dropPrefab or sharedData index, fallback to using the item name to locate the prefab: ");
			msg.AppendFormatted(item.GetName());
		}
		Logging<ModLib>.Info(msg);
		if (SanitizeData.TryGetItemDropFromItemName(item.GetName(), out ItemDrop itemDrop))
		{
			return ((Component)itemDrop).gameObject;
		}
		throw new Exception("Unable to locate item prefab. Missing dropPrefab and sharedData index for " + item.GetName());
	}

	public static ItemDrop GetPrefabItemDrop(this ItemData item)
	{
		return GlobalStatic.GetPrefab<ItemDrop>(item.GetPrefabName(), true);
	}

	public static string GetName(this ItemData item)
	{
		return item.m_shared.m_name ?? string.Empty;
	}

	public static string GetName(this ItemDrop item)
	{
		return item.m_itemData.m_shared.m_name ?? string.Empty;
	}

	public static Sprite GetIcon(this ItemData item, int variant)
	{
		return item.m_shared.m_icons[variant];
	}

	public static Sprite GetIcon(this ItemDrop item)
	{
		return item.m_itemData.GetIcon();
	}

	public static Sprite GetIcon(this ItemDrop item, int variant)
	{
		return item.m_itemData.GetIcon(variant);
	}

	public static int GetPrefabHash(this ItemData? item)
	{
		if (item == null)
		{
			return 0;
		}
		return StringExtensionMethods.GetStableHashCode(item.GetPrefabName());
	}

	public static int GetPrefabHash(this ItemDrop? itemDrop)
	{
		if (!Object.op_Implicit((Object)(object)itemDrop))
		{
			return 0;
		}
		return StringExtensionMethods.GetStableHashCode(Utils.GetPrefabName(((Object)itemDrop).name));
	}

	public static bool IsEqual(this ItemData item, ItemData other)
	{
		if (!(item.GetPrefabName() == other.GetPrefabName()) || !(item.GetName() == other.GetName()) || item.m_variant != other.m_variant || item.m_quality != other.m_quality || !Mathf.Approximately(item.m_durability, other.m_durability))
		{
			return false;
		}
		foreach (KeyValuePair<string, string> customDatum in item.m_customData)
		{
			if (!other.m_customData.TryGetValue(customDatum.Key, out var value))
			{
				return false;
			}
			if (value != customDatum.Value)
			{
				return false;
			}
		}
		return true;
	}

	public static void SetTooltipExtra(this ItemData item, string? text)
	{
		if (string.IsNullOrEmpty(text))
		{
			item.m_customData.Remove("Zen_Tooltip");
		}
		else
		{
			item.m_customData["Zen_Tooltip"] = text;
		}
	}

	public static string GetTooltipExtra(this ItemData item)
	{
		if (!item.m_customData.TryGetValue("Zen_Tooltip", out var value))
		{
			return string.Empty;
		}
		return value;
	}

	public static string GetTooltipCrafting(this ItemData item, int stackOverride = -1, bool appending = false)
	{
		if (stackOverride == -1)
		{
			stackOverride = item.GetCraftAmount();
		}
		return ItemData.GetTooltip(item, item.m_quality, true, (float)Game.m_worldLevel, stackOverride, appending);
	}

	public static int GetCraftAmount(this ItemData item)
	{
		InventoryGui instance = InventoryGui.instance;
		int num = ((!instance.IsMulticraftPressed()) ? 1 : instance.m_multiCraftAmount);
		return item.m_stack * num;
	}
}
