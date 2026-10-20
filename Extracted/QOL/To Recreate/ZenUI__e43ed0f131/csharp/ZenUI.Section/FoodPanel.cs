using System;
using System.Collections.Generic;
using BepInEx.Bootstrap;
using HarmonyLib;
using UnityEngine;
using UnityEngine.UI;
using Zen;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class FoodPanel
{
	internal enum FoodType
	{
		Default,
		Health,
		Stamina,
		Eitr
	}

	private static readonly List<(Image Background, Image? Border)> FoodPanelUIs = new List<(Image, Image)>();

	private static readonly Color DefaultColor;

	private static readonly Color DefaultColorAuga;

	private static readonly Color HealthColor;

	private static readonly Color HealthColorAuga;

	private static readonly Color StaminaColor;

	private static readonly Color StaminaColorAuga;

	private static readonly Color EitrColor;

	private static readonly Color EitrColorAuga;

	private static bool _isAugaLite;

	internal static FoodType GetFoodType(this ItemData foodItem)
	{
		SharedData shared = foodItem.m_shared;
		float food = shared.m_food;
		float foodStamina = shared.m_foodStamina;
		float foodEitr = shared.m_foodEitr;
		float num = (Configs.ColoredFoodBySimpleMajority.Value ? 1f : 2f);
		if (food < foodEitr / num && foodStamina < foodEitr / num)
		{
			return FoodType.Eitr;
		}
		if (foodStamina < food / num)
		{
			return FoodType.Health;
		}
		if (food < foodStamina / num)
		{
			return FoodType.Stamina;
		}
		return FoodType.Default;
	}

	private static void SetFoodPanelColor(List<Food> foods, int index)
	{
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_005f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0064: Unknown result type (might be due to invalid IL or missing references)
		//IL_0070: Unknown result type (might be due to invalid IL or missing references)
		//IL_0075: Unknown result type (might be due to invalid IL or missing references)
		//IL_0081: Unknown result type (might be due to invalid IL or missing references)
		//IL_0086: Unknown result type (might be due to invalid IL or missing references)
		//IL_0092: Unknown result type (might be due to invalid IL or missing references)
		//IL_0097: Unknown result type (might be due to invalid IL or missing references)
		(Image, Image) ui = FoodPanelUIs[index];
		if (!Configs.ColoredFoodBars.Value || index > foods.Count - 1)
		{
			ApplyColor(ui, DefaultColor, DefaultColorAuga);
			return;
		}
		switch (foods[index].m_item.GetFoodType())
		{
		case FoodType.Default:
			ApplyColor(ui, DefaultColor, DefaultColorAuga);
			break;
		case FoodType.Health:
			ApplyColor(ui, HealthColor, HealthColorAuga);
			break;
		case FoodType.Stamina:
			ApplyColor(ui, StaminaColor, StaminaColorAuga);
			break;
		case FoodType.Eitr:
			ApplyColor(ui, EitrColor, EitrColorAuga);
			break;
		default:
			throw new ArgumentOutOfRangeException("foodType");
		}
	}

	private static void ApplyColor((Image Background, Image? Border) ui, Color background, Color border)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		((Graphic)ui.Background).color = background;
		if (_isAugaLite)
		{
			((Graphic)ui.Border).color = border;
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Game), "Start")]
	internal static void Game_Start()
	{
		//IL_0049: Unknown result type (might be due to invalid IL or missing references)
		//IL_004f: Expected Obj, but got Unknown
		_isAugaLite = Chainloader.PluginInfos.ContainsKey("ZenDragon.AugaLite");
		bool shouldAppend;
		if (_isAugaLite)
		{
			Logging<Plugin>.Info("AugaLite detected");
			{
				foreach (Transform item in Hud.instance.m_rootObject.transform)
				{
					Transform val = item;
					if (((Object)val).name.StartsWith("FoodPanel"))
					{
						Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(46, 1, out shouldAppend);
						if (shouldAppend)
						{
							msg.AppendLiteral("Get reference to ");
							msg.AppendFormatted(((Object)val).name);
							msg.AppendLiteral(" background and border images");
						}
						Logging<Plugin>.Info(msg);
						Image component = ((Component)val.Find("IconBG")).GetComponent<Image>();
						Image component2 = ((Component)val.Find("IconBG/Countdown")).GetComponent<Image>();
						FoodPanelUIs.Add((component, component2));
					}
				}
				return;
			}
		}
		Image[] foodIcons = Hud.instance.m_foodIcons;
		foreach (Image val2 in foodIcons)
		{
			Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(43, 1, out shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Get reference to ");
				msg.AppendFormatted(((Object)val2).name);
				msg.AppendLiteral(" parent image (background)");
			}
			Logging<Plugin>.Info(msg);
			Image component3 = ((Component)((Component)val2).transform.parent).GetComponent<Image>();
			FoodPanelUIs.Add((component3, null));
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Hud), "UpdateFood")]
	private static void Hud_UpdateFood(Hud __instance, Player player)
	{
		if (FoodPanelUIs.Count != 0)
		{
			List<Food> foods = player.GetFoods();
			for (int i = 0; i < FoodPanelUIs.Count; i++)
			{
				SetFoodPanelColor(foods, i);
			}
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Game), "OnDestroy")]
	private static void Game_OnDestroy()
	{
		Logging<Plugin>.Info("FoodPanel: OnDestroy called, clearing references to UI elements");
		FoodPanelUIs.Clear();
	}

	static FoodPanel()
	{
		//IL_000a: Unknown result type (might be due to invalid IL or missing references)
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0036: Unknown result type (might be due to invalid IL or missing references)
		//IL_003b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0054: Unknown result type (might be due to invalid IL or missing references)
		//IL_0059: Unknown result type (might be due to invalid IL or missing references)
		//IL_0072: Unknown result type (might be due to invalid IL or missing references)
		//IL_0077: Unknown result type (might be due to invalid IL or missing references)
		//IL_0090: Unknown result type (might be due to invalid IL or missing references)
		//IL_0095: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ae: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cc: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d1: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ea: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ef: Unknown result type (might be due to invalid IL or missing references)
		Color black = Color.black;
		black.a = 0.5f;
		DefaultColor = black;
		DefaultColorAuga = new Color(0.44f, 0.4f, 0.34f, 1f);
		HealthColor = new Color(1f, 0.5f, 0.5f, 0.4f);
		HealthColorAuga = new Color(0.6784f, 0.0863f, 0.0863f, 0.5f);
		StaminaColor = new Color(1f, 1f, 0.5f, 0.2f);
		StaminaColorAuga = new Color(0.9176f, 0.6588f, 0f, 0.5f);
		EitrColor = new Color(0.6f, 0.6f, 1f, 0.5f);
		EitrColorAuga = new Color(0.6118f, 0.3529f, 0.8118f, 0.5f);
	}
}
