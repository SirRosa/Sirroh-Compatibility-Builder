using System;
using System.Collections.Generic;
using HarmonyLib;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Zen;
using Zen.Lib;
using Zen.Lib.Events;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class ItemIcon
{
	private const float ItemQualitySymbolSizeDots = 14f;

	private const float ItemQualitySymbolSizeEtc = 12f;

	private const float ItemQualityLineSpacing = -35f;

	private const float ItemQualityCharacterSpacing = 8f;

	private static Color _itemEquippedColorOriginal = Color.clear;

	private const int MaxDots = 4;

	private const char Dot = '*';

	private static char _maxQualitySymbol;

	private static string[] _itemQualitySymbols = CreateQualityStars(out _maxQualitySymbol);

	internal static void Setup()
	{
		Configs.ExtraQualityLevelSym.SettingChanged += OnQualitySymLevelChanged;
		HotkeyBarUI.UpdateElement += UpdateHotkeyBarElement;
		InventoryUI.UpdateGridElement += UpdateGridElement;
	}

	private static void OnQualitySymLevelChanged(object? sender, EventArgs e)
	{
		Logging<Plugin>.Message("Refreshing the item quality symbols");
		_itemQualitySymbols = CreateQualityStars(out _maxQualitySymbol);
	}

	private static string[] CreateQualityStars(out char maxQualitySym)
	{
		string text = "*" + Configs.ExtraQualityLevelSym.Value;
		maxQualitySym = text[text.Length - 1];
		List<string> list = new List<string> { string.Empty };
		string text2 = text;
		for (int i = 0; i < text2.Length; i++)
		{
			char c = text2[i];
			for (int j = 0; j < 4; j++)
			{
				list.Add(c + new string('*', j));
			}
		}
		foreach (var item in list.WithIndex())
		{
			Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(2, 2, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendFormatted(item.Index, "D2");
				msg.AppendLiteral(": ");
				msg.AppendFormatted(item.Item);
			}
			Logging<Plugin>.Info(msg);
		}
		Logging<Plugin>.Message($"Max item quality level: {list.Count - 1} (overflow is allowed)");
		return list.ToArray();
	}

	internal static void UpdateItemIcon(GuiBar? durability, Image icon, Image? equipped, Color equipColor)
	{
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		//IL_003f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_004c: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ab: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fa: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ce: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c2: Unknown result type (might be due to invalid IL or missing references)
		//IL_0113: Unknown result type (might be due to invalid IL or missing references)
		//IL_013d: Unknown result type (might be due to invalid IL or missing references)
		//IL_012c: Unknown result type (might be due to invalid IL or missing references)
		if (Object.op_Implicit((Object)(object)equipped))
		{
			if (_itemEquippedColorOriginal == Color.clear)
			{
				_itemEquippedColorOriginal = ((Graphic)equipped).color;
			}
			if (equipColor != Color.clear)
			{
				((Graphic)equipped).color = equipColor;
			}
			else if (_itemEquippedColorOriginal != Color.clear)
			{
				((Graphic)equipped).color = _itemEquippedColorOriginal;
			}
		}
		if (!Object.op_Implicit((Object)(object)durability) || !Configs.DurabilityColorApply.Value)
		{
			return;
		}
		float smoothValue = durability.GetSmoothValue();
		if (!Object.op_Implicit((Object)(object)durability.m_barImage) && Object.op_Implicit((Object)(object)durability.m_bar))
		{
			durability.m_barImage = ((Component)durability.m_bar).GetComponent<Image>();
		}
		if (smoothValue >= 1f)
		{
			if (durability.GetColor() == Color.red)
			{
				durability.SetColor(Configs.DurabilityBroken.Value);
			}
			else if (durability.GetColor() != Color.clear)
			{
				((Component)durability).gameObject.SetActive(false);
			}
		}
		else if (smoothValue >= 0.75f)
		{
			durability.SetColor(Configs.DurabilityGood.Value);
		}
		else if (smoothValue >= 0.5f)
		{
			durability.SetColor(Configs.DurabilityWorn.Value);
		}
		else if (smoothValue > 0f)
		{
			durability.SetColor(Configs.DurabilityAtRisk.Value);
		}
		else
		{
			durability.SetColor(Configs.DurabilityBroken.Value);
		}
	}

	private static void UpdateItemQuality(TMP_Text uiElement, int quality)
	{
		//IL_0076: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00da: Unknown result type (might be due to invalid IL or missing references)
		//IL_0136: Unknown result type (might be due to invalid IL or missing references)
		//IL_0150: Unknown result type (might be due to invalid IL or missing references)
		//IL_018d: Unknown result type (might be due to invalid IL or missing references)
		//IL_01af: Unknown result type (might be due to invalid IL or missing references)
		if (!Configs.ShowQualityAsSymbols.Value)
		{
			return;
		}
		((Behaviour)uiElement).enabled = quality >= 0;
		if (!((Behaviour)uiElement).enabled)
		{
			return;
		}
		string text = $"{quality}{_maxQualitySymbol}";
		string text2 = ((quality < _itemQualitySymbols.Length) ? _itemQualitySymbols[quality] : text);
		if (!(uiElement.text == text2))
		{
			uiElement.text = text2;
			uiElement.textWrappingMode = (TextWrappingModes)3;
			((Graphic)uiElement).color = Configs.ItemQualitySymbolColor.Value;
			uiElement.lineSpacing = -35f;
			uiElement.characterSpacing = 8f;
			uiElement.rectTransform.pivot = new Vector2(1f, 1f);
			uiElement.rectTransform.anchorMin = new Vector2(1f, 1f);
			uiElement.rectTransform.anchorMax = new Vector2(1f, 1f);
			if (!Configs.Rotate90Degrees.Value || !Configs.ShowQualityAsSymbols.Value || quality >= _itemQualitySymbols.Length)
			{
				uiElement.fontSize = 14f;
				uiElement.isRightToLeftText = quality < _itemQualitySymbols.Length;
				((Transform)uiElement.rectTransform).localRotation = Quaternion.Euler(0f, 0f, 0f);
				uiElement.rectTransform.anchoredPosition = new Vector2(-4f, 2f);
			}
			else
			{
				uiElement.isRightToLeftText = false;
				uiElement.fontSize = ((quality <= 4) ? 14f : 12f);
				((Transform)uiElement.rectTransform).localRotation = Quaternion.Euler(0f, 0f, -90f);
				uiElement.rectTransform.anchoredPosition = new Vector2(1f, 0f - uiElement.preferredWidth - 4f);
			}
		}
	}

	private static void UpdateItemIconAndQuality(this InventoryElement element, ItemData item, InventoryGrid grid)
	{
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		if (!(grid is CraftingPanelGrid))
		{
			int quality = ((item.m_quality < 2 || ((Object)grid).name == "EquipmentSlotGrid") ? (-1) : item.m_quality);
			UpdateItemIcon(element.m_durability, element.m_icon, element.m_equiped, Configs.ItemActivatedColor.Value);
			UpdateItemQuality(element.m_quality, quality);
		}
	}

	private static void UpdateFoodForkColor(this InventoryElement element, ItemData itemData)
	{
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		if (((Behaviour)element.m_food).enabled && Configs.ColoredFoodBySimpleMajority.Value)
		{
			((Graphic)element.m_food).color = itemData.GetFoodForkColor();
		}
	}

	internal static Color GetFoodForkColor(this ItemData itemData)
	{
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		//IL_003b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		//IL_0049: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		InventoryGrid playerGrid = InventoryGui.instance.m_playerGrid;
		return itemData.GetFoodType() switch
		{
			FoodPanel.FoodType.Health => playerGrid.m_foodHealthColor, 
			FoodPanel.FoodType.Stamina => playerGrid.m_foodStaminaColor, 
			FoodPanel.FoodType.Eitr => playerGrid.m_foodEitrColor, 
			_ => Color.white, 
		};
	}

	private static void UpdateGridElement(InventoryGrid grid, InventoryElement element, ItemData? itemData)
	{
		if (itemData != null)
		{
			element.UpdateItemIconAndQuality(itemData, grid);
			element.UpdateFoodForkColor(itemData);
		}
	}

	private static void UpdateHotkeyBarElement(HotkeyBar bar, ElementData element, ItemData? item)
	{
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		if (element.m_used && item != null)
		{
			Image component = element.m_equiped.GetComponent<Image>();
			UpdateItemIcon(element.m_durability, element.m_icon, component, Configs.ItemActivatedHotbarColor.Value);
		}
	}

	static ItemIcon()
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
	}
}
