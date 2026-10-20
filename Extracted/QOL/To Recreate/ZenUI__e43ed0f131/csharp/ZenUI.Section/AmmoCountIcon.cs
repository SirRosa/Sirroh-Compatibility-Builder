using System;
using System.Collections.Generic;
using BepInEx;
using HarmonyLib;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using Zen;
using Zen.Lib;
using Zen.Lib.Events;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class AmmoCountIcon
{
	private class ElementExtraData(TMP_Text ammoText, Image ammoIcon, Image baitIcon)
	{
		public ItemData? Item;

		private void ShowAmmo(bool isVisible)
		{
			if (((Component)ammoText).gameObject.activeSelf != isVisible)
			{
				((Component)ammoText).gameObject.SetActive(isVisible);
			}
			if (((Component)ammoIcon).gameObject.activeSelf != isVisible)
			{
				((Component)ammoIcon).gameObject.SetActive(isVisible);
			}
		}

		private void ShowBait(bool isVisible)
		{
			if (((Component)baitIcon).gameObject.activeSelf != isVisible)
			{
				((Component)baitIcon).gameObject.SetActive(isVisible);
			}
		}

		public void UpdateState(ElementData elementData)
		{
			if (Item == null || !Configs.EnableAmmoCount.Value)
			{
				ShowAmmo(isVisible: false);
				ShowBait(isVisible: false);
				return;
			}
			ItemData currentAmmo = GetCurrentAmmo();
			Sprite val = ((currentAmmo != null) ? currentAmmo.GetIcon() : null);
			if (Object.op_Implicit((Object)(object)val))
			{
				int num = ((currentAmmo != null) ? ((Humanoid)Player.m_localPlayer).GetInventory().CountItems(currentAmmo.m_shared.m_name, -1, true) : 0);
				if (num > 0)
				{
					ShowAmmo(isVisible: true);
					ammoText.SetText(num.ToString());
					if ((Object)(object)ammoIcon.overrideSprite != (Object)(object)val)
					{
						ammoIcon.overrideSprite = val;
					}
				}
				else
				{
					ShowAmmo(isVisible: false);
				}
			}
			else
			{
				ShowAmmo(isVisible: false);
			}
			ItemData currentBait = GetCurrentBait();
			Sprite val2 = ((currentBait != null) ? currentBait.GetIcon() : null);
			if (Object.op_Implicit((Object)(object)val2))
			{
				ShowBait(isVisible: true);
				if ((Object)(object)baitIcon.overrideSprite != (Object)(object)val2)
				{
					baitIcon.overrideSprite = val2;
				}
				int num2 = ((currentBait != null) ? ((Humanoid)Player.m_localPlayer).GetInventory().CountItems(currentBait.m_shared.m_name, -1, true) : 0);
				if (num2 > 0)
				{
					if (!((Component)elementData.m_amount).gameObject.activeSelf)
					{
						((Component)elementData.m_amount).gameObject.SetActive(true);
					}
					elementData.m_amount.SetText(num2.ToString());
				}
				else if (((Component)elementData.m_amount).gameObject.activeSelf)
				{
					((Component)elementData.m_amount).gameObject.SetActive(false);
				}
			}
			else
			{
				ShowBait(isVisible: false);
			}
		}

		private ItemData? GetCurrentAmmo()
		{
			if (!Player.m_localPlayer.IsReady())
			{
				return null;
			}
			if (Item == null || Utility.IsNullOrWhiteSpace(Item.m_shared.m_ammoType) || IsBaitAmmo() || IsAmmo())
			{
				return null;
			}
			ItemData ammoItem = ((Humanoid)Player.m_localPlayer).GetAmmoItem();
			if (ammoItem == null || ammoItem.m_shared.m_ammoType != Item.m_shared.m_ammoType || !((Humanoid)Player.m_localPlayer).GetInventory().ContainsItem(ammoItem))
			{
				ammoItem = ((Humanoid)Player.m_localPlayer).GetInventory().GetAmmoItem(Item.m_shared.m_ammoType, (string)null);
			}
			return ammoItem;
		}

		private ItemData? GetCurrentBait()
		{
			if (Item == null || Utility.IsNullOrWhiteSpace(Item.m_shared.m_ammoType) || !IsBaitAmmo() || IsAmmo())
			{
				return null;
			}
			ItemData ammoItem = ((Humanoid)Player.m_localPlayer).GetAmmoItem();
			if (ammoItem == null || ammoItem.m_shared.m_ammoType != Item.m_shared.m_ammoType || !((Humanoid)Player.m_localPlayer).GetInventory().ContainsItem(ammoItem))
			{
				ammoItem = ((Humanoid)Player.m_localPlayer).GetInventory().GetAmmoItem(Item.m_shared.m_ammoType, (string)null);
			}
			return ammoItem;
		}

		private bool IsAmmo()
		{
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0030: Unknown result type (might be due to invalid IL or missing references)
			//IL_0035: Unknown result type (might be due to invalid IL or missing references)
			//IL_0036: Unknown result type (might be due to invalid IL or missing references)
			//IL_0038: Invalid comparison between Unknown and I4
			//IL_003a: Unknown result type (might be due to invalid IL or missing references)
			//IL_003d: Invalid comparison between Unknown and I4
			//IL_003f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Invalid comparison between Unknown and I4
			ItemType? val = Item?.m_shared.m_itemType;
			if (val.HasValue)
			{
				ItemType valueOrDefault = val.GetValueOrDefault();
				if ((int)valueOrDefault == 2 || (int)valueOrDefault == 9 || (int)valueOrDefault == 23)
				{
					return true;
				}
			}
			return false;
		}

		private bool IsBaitAmmo()
		{
			return Item?.m_shared.m_ammoType == "$item_fishingbait";
		}
	}

	private static readonly Vector2 AmmoCountPosition;

	private const int AmmoCountFontSize = 14;

	private const HorizontalAlignmentOptions AmmoCountAlignment = (HorizontalAlignmentOptions)2;

	private static readonly Vector2 AmmoIconPosition;

	private static readonly Vector2 AmmoIconSize;

	private const string ObjectAmmoName = "ZenUI_AmmoAmount";

	private const string ObjectIconName = "ZenUI_AmmoIcon";

	private const string ObjectBaitName = "ZenUI_AmmoBait";

	private static readonly Dictionary<HotkeyBar, Dictionary<ElementData, ElementExtraData>> ElementExtraDatas;

	static AmmoCountIcon()
	{
		//IL_000a: Unknown result type (might be due to invalid IL or missing references)
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		AmmoCountPosition = new Vector2(0f, 86f);
		AmmoIconPosition = new Vector2(0f, 40f);
		AmmoIconSize = new Vector2(-10f, -10f);
		ElementExtraDatas = new Dictionary<HotkeyBar, Dictionary<ElementData, ElementExtraData>>();
		HotkeyBarUI.ClearElements += HotkeyBarClear;
		HotkeyBarUI.UpdateElement += UpdateAmmoAndIcon;
	}

	internal static void Init()
	{
		ElementExtraDatas.Clear();
	}

	private static void AddCustomElementsToHotkeyPrefab(HotkeyBar bar)
	{
		if (Configs.EnableAmmoCount.Value)
		{
			Logging<Plugin>.Info("Adding Custom Elements");
			GameObject elementPrefab = bar.m_elementPrefab;
			if (!Object.op_Implicit((Object)(object)elementPrefab))
			{
				throw new NullReferenceException("HotkeyBar.m_elementPrefab is null, this should never happen");
			}
			int num = elementPrefab.transform.Find("icon").GetSiblingIndex() + 1;
			Transform val = elementPrefab.transform.Find("ZenUI_AmmoAmount");
			GameObject val2 = ((val != null) ? ((Component)val).gameObject : null);
			if ((Object)(object)val2 == (Object)null)
			{
				GameObject gameObject = ((Component)elementPrefab.transform.Find("amount")).gameObject;
				val2 = Object.Instantiate<GameObject>(gameObject);
				((Object)val2).name = "ZenUI_AmmoAmount";
				val2.transform.SetSiblingIndex(num);
				val2.SetActive(false);
				val2.transform.SetParent(elementPrefab.transform, false);
				num++;
				FillFields(gameObject.transform, val2.transform);
			}
			Transform val3 = elementPrefab.transform.Find("ZenUI_AmmoIcon");
			GameObject val4 = ((val3 != null) ? ((Component)val3).gameObject : null);
			if ((Object)(object)val4 == (Object)null)
			{
				GameObject gameObject2 = ((Component)elementPrefab.transform.Find("icon")).gameObject;
				val4 = Object.Instantiate<GameObject>(gameObject2);
				((Object)val4).name = "ZenUI_AmmoIcon";
				val4.transform.SetSiblingIndex(num);
				val4.SetActive(false);
				val4.transform.SetParent(elementPrefab.transform);
				num++;
				FillFields(gameObject2.transform, val4.transform);
			}
			Transform val5 = elementPrefab.transform.Find("ZenUI_AmmoBait");
			GameObject val6 = ((val5 != null) ? ((Component)val5).gameObject : null);
			if ((Object)(object)val6 == (Object)null)
			{
				GameObject gameObject3 = ((Component)elementPrefab.transform.Find("icon")).gameObject;
				val6 = Object.Instantiate<GameObject>(gameObject3);
				((Object)val6).name = "ZenUI_AmmoBait";
				val6.transform.SetSiblingIndex(num);
				val6.SetActive(false);
				val6.transform.SetParent(elementPrefab.transform);
				FillFields(gameObject3.transform, val6.transform);
			}
			SetupVisibility(val2, val4, val6);
			Logging<Plugin>.Info("Added custom elements to hotkey bar");
		}
		static void FillFields(Transform source, Transform destination)
		{
			//IL_0001: Unknown result type (might be due to invalid IL or missing references)
			//IL_0007: Expected Obj, but got Unknown
			//IL_0008: Unknown result type (might be due to invalid IL or missing references)
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			//IL_000f: Unknown result type (might be due to invalid IL or missing references)
			//IL_001a: Unknown result type (might be due to invalid IL or missing references)
			RectTransform val7 = (RectTransform)source;
			RectTransform val8 = (RectTransform)destination;
			val8.anchoredPosition = val7.anchoredPosition;
			val8.sizeDelta = val7.sizeDelta;
		}
		static void SetupVisibility(GameObject ammoCount, GameObject ammoIcon, GameObject ammoBait)
		{
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0032: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			//IL_0038: Unknown result type (might be due to invalid IL or missing references)
			//IL_0042: Unknown result type (might be due to invalid IL or missing references)
			//IL_0052: Unknown result type (might be due to invalid IL or missing references)
			//IL_0057: Unknown result type (might be due to invalid IL or missing references)
			//IL_0062: Unknown result type (might be due to invalid IL or missing references)
			//IL_0076: Unknown result type (might be due to invalid IL or missing references)
			((RectTransform)ammoCount.transform).anchoredPosition = AmmoCountPosition;
			TMP_Text component = ammoCount.GetComponent<TMP_Text>();
			component.fontSize = 14f;
			component.horizontalAlignment = (HorizontalAlignmentOptions)2;
			RectTransform val7 = (RectTransform)ammoIcon.transform;
			val7.anchoredPosition = AmmoIconPosition;
			val7.sizeDelta = AmmoIconSize;
			RectTransform val8 = (RectTransform)ammoBait.transform;
			val8.anchorMin = new Vector2(0.5f, 0f);
			val8.anchorMax = new Vector2(1f, 0.5f);
		}
	}

	private static Dictionary<ElementData, ElementExtraData> GetElementExtras(this HotkeyBar hotkeyBar)
	{
		if (!ElementExtraDatas.TryGetValue(hotkeyBar, out Dictionary<ElementData, ElementExtraData> value))
		{
			return ElementExtraDatas[hotkeyBar] = new Dictionary<ElementData, ElementExtraData>();
		}
		return value;
	}

	private static void HotkeyBarClear(HotkeyBar hotkeyBar)
	{
		hotkeyBar.GetElementExtras().Clear();
	}

	private static void UpdateAmmoAndIcon(HotkeyBar hotkeyBar, ElementData elementData, ItemData? itemData)
	{
		if (!Configs.EnableAmmoCount.Value)
		{
			return;
		}
		Dictionary<ElementData, ElementExtraData> elementExtras = hotkeyBar.GetElementExtras();
		if (!elementExtras.TryGetValue(elementData, out var value))
		{
			value = (elementExtras[elementData] = new ElementExtraData(((Component)elementData.m_go.transform.Find("ZenUI_AmmoAmount")).GetComponent<TMP_Text>(), ((Component)elementData.m_go.transform.Find("ZenUI_AmmoIcon")).GetComponent<Image>(), ((Component)elementData.m_go.transform.Find("ZenUI_AmmoBait")).GetComponent<Image>()));
		}
		if (!elementData.m_used || itemData == null)
		{
			value.Item = null;
		}
		else
		{
			value.Item = itemData;
			if ((Object)(object)itemData.GetIcon() != (Object)(object)elementData.m_icon.sprite)
			{
				value.Item = null;
			}
		}
		value.UpdateState(elementData);
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(HotkeyBar), "OnEnable")]
	private static void HotkeyBar_OnEnable(HotkeyBar __instance)
	{
		if (Configs.EnableAmmoCount.Value)
		{
			AddCustomElementsToHotkeyPrefab(__instance);
		}
	}
}
