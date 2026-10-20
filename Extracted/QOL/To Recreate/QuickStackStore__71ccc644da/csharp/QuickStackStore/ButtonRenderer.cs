using System;
using System.Collections;
using System.Runtime.CompilerServices;
using BepInEx;
using BepInEx.Configuration;
using TMPro;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

namespace QuickStackStore;

internal class ButtonRenderer
{
	internal class MainButtonUpdate
	{
		[Serializable]
		[CompilerGenerated]
		private sealed class _003C_003Ec
		{
			public static readonly _003C_003Ec _003C_003E9 = new _003C_003Ec();

			public static UnityAction _003C_003E9__0_4;

			public static UnityAction _003C_003E9__0_5;

			public static UnityAction _003C_003E9__0_6;

			public static UnityAction _003C_003E9__0_7;

			public static UnityAction _003C_003E9__0_0;

			public static UnityAction _003C_003E9__0_1;

			public static UnityAction _003C_003E9__0_2;

			internal void _003CUpdateInventoryGuiButtons_003Eb__0_4()
			{
				SortModule.SortPlayerInv(((Humanoid)Player.m_localPlayer).m_inventory, UserConfig.GetPlayerConfig(Player.m_localPlayer.GetPlayerID()));
			}

			internal void _003CUpdateInventoryGuiButtons_003Eb__0_5()
			{
				RestockModule.DoRestock(Player.m_localPlayer);
			}

			internal void _003CUpdateInventoryGuiButtons_003Eb__0_6()
			{
				QuickStackModule.DoQuickStack(Player.m_localPlayer);
			}

			internal void _003CUpdateInventoryGuiButtons_003Eb__0_7()
			{
				FavoritingMode.ToggleFavoriteToggling();
			}

			internal void _003CUpdateInventoryGuiButtons_003Eb__0_0()
			{
				QuickStackModule.DoQuickStack(Player.m_localPlayer, onlyQuickStackToCurrentContainer: true);
			}

			internal void _003CUpdateInventoryGuiButtons_003Eb__0_1()
			{
				StoreTakeAllModule.StoreAllItemsInOrder(Player.m_localPlayer);
			}

			internal void _003CUpdateInventoryGuiButtons_003Eb__0_2()
			{
				RestockModule.DoRestock(Player.m_localPlayer, RestockOnlyFromCurrentContainerOverride: true);
			}
		}

		internal static void UpdateInventoryGuiButtons(InventoryGui __instance)
		{
			//IL_0147: Unknown result type (might be due to invalid IL or missing references)
			//IL_012b: Unknown result type (might be due to invalid IL or missing references)
			//IL_013b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0140: Unknown result type (might be due to invalid IL or missing references)
			//IL_0200: Unknown result type (might be due to invalid IL or missing references)
			//IL_0213: Unknown result type (might be due to invalid IL or missing references)
			//IL_0218: Unknown result type (might be due to invalid IL or missing references)
			//IL_021b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0220: Unknown result type (might be due to invalid IL or missing references)
			//IL_026a: Unknown result type (might be due to invalid IL or missing references)
			//IL_026f: Unknown result type (might be due to invalid IL or missing references)
			//IL_027d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0242: Unknown result type (might be due to invalid IL or missing references)
			//IL_025a: Unknown result type (might be due to invalid IL or missing references)
			//IL_025f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0264: Unknown result type (might be due to invalid IL or missing references)
			//IL_0298: Unknown result type (might be due to invalid IL or missing references)
			//IL_029d: Unknown result type (might be due to invalid IL or missing references)
			//IL_02a2: Unknown result type (might be due to invalid IL or missing references)
			//IL_02b5: Unknown result type (might be due to invalid IL or missing references)
			//IL_03f1: Unknown result type (might be due to invalid IL or missing references)
			//IL_03f6: Unknown result type (might be due to invalid IL or missing references)
			//IL_03fc: Expected Obj, but got Unknown
			//IL_0541: Unknown result type (might be due to invalid IL or missing references)
			//IL_0546: Unknown result type (might be due to invalid IL or missing references)
			//IL_054c: Expected Obj, but got Unknown
			//IL_0993: Unknown result type (might be due to invalid IL or missing references)
			//IL_0a3a: Unknown result type (might be due to invalid IL or missing references)
			//IL_09c4: Unknown result type (might be due to invalid IL or missing references)
			//IL_09c9: Unknown result type (might be due to invalid IL or missing references)
			//IL_09cf: Expected Obj, but got Unknown
			//IL_068a: Unknown result type (might be due to invalid IL or missing references)
			//IL_068f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0695: Expected Obj, but got Unknown
			//IL_0add: Unknown result type (might be due to invalid IL or missing references)
			//IL_0b01: Unknown result type (might be due to invalid IL or missing references)
			//IL_0b0b: Expected Obj, but got Unknown
			//IL_0a6b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0a70: Unknown result type (might be due to invalid IL or missing references)
			//IL_0a76: Expected Obj, but got Unknown
			//IL_08cc: Unknown result type (might be due to invalid IL or missing references)
			//IL_08f9: Unknown result type (might be due to invalid IL or missing references)
			//IL_0927: Unknown result type (might be due to invalid IL or missing references)
			//IL_092c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0932: Expected Obj, but got Unknown
			//IL_081a: Unknown result type (might be due to invalid IL or missing references)
			//IL_081f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0825: Expected Obj, but got Unknown
			if (!hasOpenedInventoryOnce || (Object)(object)__instance != (Object)(object)InventoryGui.instance)
			{
				return;
			}
			if (Object.op_Implicit((Object)(object)Player.m_localPlayer))
			{
				FavoritingMode.HasCurrentlyToggledFavoriting = false;
				QSSConfig.AutoSortBehavior value = QSSConfig.SortConfig.AutoSort.Value;
				if (value == QSSConfig.AutoSortBehavior.SortPlayerInventoryOnOpen || value == QSSConfig.AutoSortBehavior.Both)
				{
					SortModule.SortPlayerInv(((Humanoid)Player.m_localPlayer).m_inventory, UserConfig.GetPlayerConfig(Player.m_localPlayer.GetPlayerID()));
				}
				if (Object.op_Implicit((Object)(object)__instance.m_currentContainer) && (value == QSSConfig.AutoSortBehavior.SortContainerOnOpen || value == QSSConfig.AutoSortBehavior.Both))
				{
					SortModule.SortContainer(__instance.m_currentContainer);
				}
			}
			RectTransform val = default;
			if (!Object.op_Implicit((Object)(object)__instance.m_takeAllButton) || !((Component)__instance.m_takeAllButton).TryGetComponent<RectTransform>(ref val))
			{
				return;
			}
			ControllerButtonHintHelper.FixTakeAllButtonControllerHint(__instance);
			if (origButtonLength == -1f)
			{
				origButtonLength = val.sizeDelta.x;
				origButtonPosition = ((Transform)val).localPosition;
			}
			if (val.sizeDelta.x == origButtonLength)
			{
				val.SetSizeWithCurrentAnchors((Axis)0, origButtonLength * 0.9f);
			}
			int num = 0;
			bool value2 = QSSConfig.StoreTakeAllConfig.DisplayStoreAllButton.Value;
			QSSConfig.ShowTwoButtons value3 = QSSConfig.QuickStackConfig.DisplayQuickStackButtons.Value;
			QSSConfig.ShowTwoButtons value4 = QSSConfig.RestockConfig.DisplayRestockButtons.Value;
			QSSConfig.ShowTwoButtons value5 = QSSConfig.SortConfig.DisplaySortButtons.Value;
			if (QSSConfig.GeneralConfig.OverrideButtonDisplay.Value != QSSConfig.OverrideButtonDisplay.DisableAllNewButtons)
			{
				if (value2)
				{
					num++;
				}
				if (value3.ShouldSpawnContainerButton())
				{
					num++;
				}
				if (value4.ShouldSpawnContainerButton())
				{
					num++;
				}
				if (value5.ShouldSpawnContainerButton())
				{
					num++;
				}
			}
			float num2 = val.sizeDelta.y + 8f;
			Vector3 val2 = ((Transform)val).localPosition;
			if (((Transform)val).localPosition == origButtonPosition)
			{
				if (num <= 1)
				{
					val2 -= new Vector3(origButtonLength / 2f * 0.100000024f, 0f);
				}
				else
				{
					val2 = OppositePositionOfTakeAllButton();
					bool flag = !value3.ShouldSpawnContainerButton();
					val2 += new Vector3(origButtonLength - 1f, flag ? 0f : (0f - num2));
				}
				if (!CompatibilitySupport.ShouldBlockChangesToTakeAllButton())
				{
					((Transform)val).localPosition = val2;
				}
			}
			if (QSSConfig.GeneralConfig.OverrideButtonDisplay.Value == QSSConfig.OverrideButtonDisplay.DisableAllNewButtons)
			{
				return;
			}
			int num3 = 0;
			bool hasSpawnedCurrencyPocketUI = false;
			Transform val3;
			if (CompatibilitySupport.HasPlugin("Azumatt.CurrencyPocket"))
			{
				hasSpawnedCurrencyPocketUI = hasCompletedOpeningInventoryOnce;
				val3 = ((Component)__instance.m_player).transform.Find("CoinPocketUI");
			}
			else
			{
				val3 = ((Component)__instance.m_player).transform.Find("Weight");
			}
			CompatibilitySupport.RandyStatus randyStatus = CompatibilitySupport.HasRandyPlugin();
			if (value5.ShouldSpawnMiniInventoryButton())
			{
				bool flag2 = value5.ShouldShowMiniInventoryButton(__instance);
				if ((Object)(object)sortInventoryButton == (Object)null)
				{
					sortInventoryButton = CreateMiniButton(__instance, "sortInventoryButton", "Back");
					((Component)sortInventoryButton).gameObject.SetActive(flag2);
					if (flag2)
					{
						((MonoBehaviour)__instance).StartCoroutine(WaitAFrameToRepositionMiniButton(__instance, ((Component)sortInventoryButton).transform, val3, ++num3, randyStatus, hasSpawnedCurrencyPocketUI));
					}
					ButtonClickedEvent onClick = sortInventoryButton.onClick;
					UnityAction val4 = _003C_003Ec._003C_003E9__0_4;
					if (val4 == null)
					{
						UnityAction val5 = () =>
						{
							SortModule.SortPlayerInv(((Humanoid)Player.m_localPlayer).m_inventory, UserConfig.GetPlayerConfig(Player.m_localPlayer.GetPlayerID()));
						};
						_003C_003Ec._003C_003E9__0_4 = val5;
						val4 = val5;
					}
					((UnityEvent)onClick).AddListener(val4);
				}
				else
				{
					((Component)sortInventoryButton).gameObject.SetActive(flag2);
					if (flag2)
					{
						RepositionMiniButton(__instance, ((Component)sortInventoryButton).transform, val3, ++num3, randyStatus, hasSpawnedCurrencyPocketUI);
					}
				}
			}
			bool flag3 = CompatibilitySupport.AllowAreaStackingRestocking();
			if (flag3 && value4.ShouldSpawnMiniInventoryButton() && QSSConfig.RestockConfig.RestockFromNearbyRange.Value > 0f)
			{
				bool flag4 = value4.ShouldShowMiniInventoryButton(__instance) && (!Object.op_Implicit((Object)(object)__instance.m_currentContainer) || randyStatus != CompatibilitySupport.RandyStatus.EnabledWithQuickSlots);
				if ((Object)(object)restockAreaButton == (Object)null)
				{
					restockAreaButton = CreateMiniButton(__instance, "restockAreaButton", "DPadUp");
					((Component)restockAreaButton).gameObject.SetActive(flag4);
					if (flag4)
					{
						((MonoBehaviour)__instance).StartCoroutine(WaitAFrameToRepositionMiniButton(__instance, ((Component)restockAreaButton).transform, val3, ++num3, randyStatus, hasSpawnedCurrencyPocketUI));
					}
					ButtonClickedEvent onClick2 = restockAreaButton.onClick;
					UnityAction val6 = _003C_003Ec._003C_003E9__0_5;
					if (val6 == null)
					{
						UnityAction val7 = () =>
						{
							RestockModule.DoRestock(Player.m_localPlayer);
						};
						_003C_003Ec._003C_003E9__0_5 = val7;
						val6 = val7;
					}
					((UnityEvent)onClick2).AddListener(val6);
				}
				else
				{
					((Component)restockAreaButton).gameObject.SetActive(flag4);
					if (flag4)
					{
						RepositionMiniButton(__instance, ((Component)restockAreaButton).transform, val3, ++num3, randyStatus, hasSpawnedCurrencyPocketUI);
					}
				}
			}
			if (flag3 && value3.ShouldSpawnMiniInventoryButton() && QSSConfig.QuickStackConfig.QuickStackToNearbyRange.Value > 0f)
			{
				bool flag5 = value3.ShouldShowMiniInventoryButton(__instance) && (!Object.op_Implicit((Object)(object)__instance.m_currentContainer) || randyStatus != CompatibilitySupport.RandyStatus.EnabledWithQuickSlots);
				if ((Object)(object)quickStackAreaButton == (Object)null)
				{
					quickStackAreaButton = CreateMiniButton(__instance, "quickStackAreaButton", "DPadDown");
					((Component)quickStackAreaButton).gameObject.SetActive(flag5);
					if (flag5)
					{
						((MonoBehaviour)__instance).StartCoroutine(WaitAFrameToRepositionMiniButton(__instance, ((Component)quickStackAreaButton).transform, val3, ++num3, randyStatus, hasSpawnedCurrencyPocketUI));
					}
					ButtonClickedEvent onClick3 = quickStackAreaButton.onClick;
					UnityAction val8 = _003C_003Ec._003C_003E9__0_6;
					if (val8 == null)
					{
						UnityAction val9 = () =>
						{
							QuickStackModule.DoQuickStack(Player.m_localPlayer);
						};
						_003C_003Ec._003C_003E9__0_6 = val9;
						val8 = val9;
					}
					((UnityEvent)onClick3).AddListener(val8);
				}
				else
				{
					((Component)quickStackAreaButton).gameObject.SetActive(flag5);
					if (flag5)
					{
						RepositionMiniButton(__instance, ((Component)quickStackAreaButton).transform, val3, ++num3, randyStatus, hasSpawnedCurrencyPocketUI);
					}
				}
			}
			QSSConfig.FavoritingToggling value6 = QSSConfig.FavoriteConfig.DisplayFavoriteToggleButton.Value;
			if (value6 != QSSConfig.FavoritingToggling.Disabled)
			{
				int existingMiniButtons;
				Transform anchor;
				if (value6 == QSSConfig.FavoritingToggling.EnabledBottomButton || CompatibilitySupport.HasPlugin("Azumatt.CurrencyPocket"))
				{
					existingMiniButtons = ++num3;
					anchor = val3;
				}
				else
				{
					existingMiniButtons = -1;
					anchor = ((Component)__instance.m_player).transform.Find("Armor");
				}
				bool flag6 = !Object.op_Implicit((Object)(object)__instance.m_currentContainer) || randyStatus != CompatibilitySupport.RandyStatus.EnabledWithQuickSlots;
				if ((Object)(object)favoritingTogglingButton == (Object)null)
				{
					favoritingTogglingButton = CreateMiniButton(__instance, "favoritingTogglingButton", "DPadLeft");
					((Component)favoritingTogglingButton).gameObject.SetActive(flag6);
					favoritingTogglingButtonText = ((Component)((Component)favoritingTogglingButton).transform.Find("Text")).GetComponent<TextMeshProUGUI>();
					FavoritingMode.RefreshDisplay();
					if (flag6)
					{
						((MonoBehaviour)__instance).StartCoroutine(WaitAFrameToRepositionMiniButton(__instance, ((Component)favoritingTogglingButton).transform, anchor, existingMiniButtons, randyStatus, hasSpawnedCurrencyPocketUI));
					}
					ButtonClickedEvent onClick4 = favoritingTogglingButton.onClick;
					UnityAction val10 = _003C_003Ec._003C_003E9__0_7;
					if (val10 == null)
					{
						UnityAction val11 = () =>
						{
							FavoritingMode.ToggleFavoriteToggling();
						};
						_003C_003Ec._003C_003E9__0_7 = val11;
						val10 = val11;
					}
					((UnityEvent)onClick4).AddListener(val10);
				}
				else
				{
					((Component)favoritingTogglingButton).gameObject.SetActive(flag6);
					if (flag6)
					{
						RepositionMiniButton(__instance, ((Component)favoritingTogglingButton).transform, anchor, existingMiniButtons, randyStatus, hasSpawnedCurrencyPocketUI);
					}
				}
			}
			int num4 = 0;
			if (value3.ShouldSpawnContainerButton())
			{
				if ((Object)(object)quickStackToContainerButton == (Object)null)
				{
					quickStackToContainerButton = CreateBigButton(__instance, "quickStackToContainerButton", "DPadDown");
					if (CompatibilitySupport.ShouldBlockChangesToTakeAllButton() && randyStatus != CompatibilitySupport.RandyStatus.EnabledWithQuickSlots)
					{
						MoveButtonToIndex(ref quickStackToContainerButton, val2, 0f, num, 1);
					}
					else
					{
						bool forcePutAtOppositeOfTakeAll = randyStatus == CompatibilitySupport.RandyStatus.EnabledWithQuickSlots || CompatibilitySupport.HasPlugin("Azumatt.CurrencyPocket");
						MoveButtonToIndex(ref quickStackToContainerButton, val2, 0f - num2, num, 1, forcePutAtOppositeOfTakeAll);
					}
					ButtonClickedEvent onClick5 = quickStackToContainerButton.onClick;
					UnityAction val12 = _003C_003Ec._003C_003E9__0_0;
					if (val12 == null)
					{
						UnityAction val13 = () =>
						{
							QuickStackModule.DoQuickStack(Player.m_localPlayer, onlyQuickStackToCurrentContainer: true);
						};
						_003C_003Ec._003C_003E9__0_0 = val13;
						val12 = val13;
					}
					((UnityEvent)onClick5).AddListener(val12);
				}
				((Component)quickStackToContainerButton).gameObject.SetActive(value3.ShouldShowContainerButton(__instance));
			}
			if (value2)
			{
				if ((Object)(object)storeAllButton == (Object)null)
				{
					storeAllButton = CreateBigButton(__instance, "storeAllButton", "RStick");
					MoveButtonToIndex(ref storeAllButton, val2, num2, num, ++num4);
					ButtonClickedEvent onClick6 = storeAllButton.onClick;
					UnityAction val14 = _003C_003Ec._003C_003E9__0_1;
					if (val14 == null)
					{
						UnityAction val15 = () =>
						{
							StoreTakeAllModule.StoreAllItemsInOrder(Player.m_localPlayer);
						};
						_003C_003Ec._003C_003E9__0_1 = val15;
						val14 = val15;
					}
					((UnityEvent)onClick6).AddListener(val14);
				}
				((Component)storeAllButton).gameObject.SetActive((Object)(object)__instance.m_currentContainer != (Object)null);
			}
			if (value4.ShouldSpawnContainerButton())
			{
				if ((Object)(object)restockFromContainerButton == (Object)null)
				{
					restockFromContainerButton = CreateBigButton(__instance, "restockFromContainerButton", "DPadUp");
					MoveButtonToIndex(ref restockFromContainerButton, val2, num2, num, ++num4);
					ButtonClickedEvent onClick7 = restockFromContainerButton.onClick;
					UnityAction val16 = _003C_003Ec._003C_003E9__0_2;
					if (val16 == null)
					{
						UnityAction val17 = () =>
						{
							RestockModule.DoRestock(Player.m_localPlayer, RestockOnlyFromCurrentContainerOverride: true);
						};
						_003C_003Ec._003C_003E9__0_2 = val17;
						val16 = val17;
					}
					((UnityEvent)onClick7).AddListener(val16);
				}
				((Component)restockFromContainerButton).gameObject.SetActive(value4.ShouldShowContainerButton(__instance));
			}
			if (value5.ShouldSpawnContainerButton())
			{
				if ((Object)(object)sortContainerButton == (Object)null)
				{
					sortContainerButton = CreateBigButton(__instance, "sortContainerButton", "Back");
					MoveButtonToIndex(ref sortContainerButton, val2, num2, num, ++num4);
					((UnityEvent)sortContainerButton.onClick).AddListener((UnityAction)(() =>
					{
						SortModule.SortContainer(__instance.m_currentContainer);
					}));
				}
				((Component)sortContainerButton).gameObject.SetActive(value5.ShouldShowContainerButton(__instance));
			}
			if (!CompatibilitySupport.ShouldBlockChangesToTakeAllButton())
			{
				((Component)val).gameObject.SetActive((Object)(object)__instance.m_currentContainer != (Object)null);
			}
			RectTransform val18 = default;
			if (Object.op_Implicit((Object)(object)__instance.m_stackAllButton) && ((Component)__instance.m_stackAllButton).TryGetComponent<RectTransform>(ref val18))
			{
				bool active = randyStatus != CompatibilitySupport.RandyStatus.EnabledWithQuickSlots && !QSSConfig.QuickStackConfig.HideBaseGamePlaceStacksButton.Value;
				((Component)val18).gameObject.SetActive(active);
			}
			OnButtonTextTranslationSettingChanged(includeTrashButton: false);
		}
	}

	internal static bool hasOpenedInventoryOnce = false;

	internal static bool hasCompletedOpeningInventoryOnce = false;

	internal static float origButtonLength = -1f;

	internal static Vector3 origButtonPosition;

	internal static TextMeshProUGUI favoritingTogglingButtonText;

	internal static Button favoritingTogglingButton;

	internal static Button quickStackAreaButton;

	internal static Button sortInventoryButton;

	internal static Button restockAreaButton;

	internal static Button quickStackToContainerButton;

	internal static Button storeAllButton;

	internal static Button sortContainerButton;

	internal static Button restockFromContainerButton;

	private const float shrinkFactor = 0.9f;

	private const int vPadding = 8;

	private const int hAlign = 1;

	private const int miniButtonSize = 38;

	private const int miniButtonHPadding = 2;

	private const float normalMiniButtonVOffset = -56f;

	private const float lowerMiniButtonVOffset = -75f;

	private static void MoveButtonToIndex(ref Button buttonToMove, Vector3 startVector, float vOffset, int visibleExtraButtons, int buttonsBelowTakeAll, bool forcePutAtOppositeOfTakeAll = false)
	{
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0039: Unknown result type (might be due to invalid IL or missing references)
		//IL_0048: Unknown result type (might be due to invalid IL or missing references)
		//IL_004d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		if ((visibleExtraButtons == 1) | forcePutAtOppositeOfTakeAll)
		{
			((Component)buttonToMove).transform.localPosition = OppositePositionOfTakeAllButton();
			return;
		}
		((Component)buttonToMove).transform.localPosition = startVector;
		Transform transform = ((Component)buttonToMove).transform;
		transform.localPosition -= new Vector3(0f, (float)buttonsBelowTakeAll * vOffset);
	}

	private static Vector3 OppositePositionOfTakeAllButton()
	{
		//IL_0013: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		float num = origButtonLength / 2f * 0.100000024f;
		return origButtonPosition + new Vector3(440f + num, 0f);
	}

	public static string SortCriteriaToShortHumanReadableString(QSSConfig.SortCriteriaEnum sortingCriteria)
	{
		return sortingCriteria switch
		{
			QSSConfig.SortCriteriaEnum.InternalName => LocalizationConfig.GetRelevantTranslation(LocalizationConfig.SortByInternalNameLabel, "SortByInternalNameLabel"), 
			QSSConfig.SortCriteriaEnum.TranslatedName => LocalizationConfig.GetRelevantTranslation(LocalizationConfig.SortByTranslatedNameLabel, "SortByTranslatedNameLabel"), 
			QSSConfig.SortCriteriaEnum.Value => LocalizationConfig.GetRelevantTranslation(LocalizationConfig.SortByValueLabel, "SortByValueLabel"), 
			QSSConfig.SortCriteriaEnum.Weight => LocalizationConfig.GetRelevantTranslation(LocalizationConfig.SortByWeightLabel, "SortByWeightLabel"), 
			QSSConfig.SortCriteriaEnum.Type => LocalizationConfig.GetRelevantTranslation(LocalizationConfig.SortByTypeLabel, "SortByTypeLabel"), 
			_ => "invalid", 
		};
	}

	private static Button CreateAbstractButton(InventoryGui instance, string name, string joyHint, Transform parent)
	{
		UIGamePad component = ((Component)instance.m_takeAllButton).GetComponent<UIGamePad>();
		bool enabled = ((Behaviour)component).enabled;
		((Behaviour)component).enabled = false;
		Button val = Object.Instantiate<Button>(instance.m_takeAllButton, parent);
		((Behaviour)component).enabled = enabled;
		((Object)val).name = name;
		((UnityEventBase)val.onClick).RemoveAllListeners();
		((MonoBehaviour)instance).StartCoroutine(ControllerButtonHintHelper.WaitAFrameToSetupControllerHint(val, joyHint));
		return val;
	}

	private static Button CreateBigButton(InventoryGui instance, string name, string joyHint)
	{
		return CreateAbstractButton(instance, name, joyHint, ((Component)instance.m_takeAllButton).transform.parent);
	}

	private static Button CreateMiniButton(InventoryGui instance, string name, string joyHint)
	{
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Expected Obj, but got Unknown
		Button val = CreateAbstractButton(instance, name, joyHint, ((Component)instance.m_player).transform);
		RectTransform val2 = (RectTransform)((Component)val).transform;
		val2.SetSizeWithCurrentAnchors((Axis)0, 38f);
		val2.SetSizeWithCurrentAnchors((Axis)1, 38f);
		return val;
	}

	private static void RepositionMiniButton(InventoryGui instance, Transform button, Transform anchor, int existingMiniButtons, CompatibilitySupport.RandyStatus randyStatus, bool hasSpawnedCurrencyPocketUI)
	{
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		//IL_003f: Unknown result type (might be due to invalid IL or missing references)
		//IL_006f: Unknown result type (might be due to invalid IL or missing references)
		//IL_007b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0080: Unknown result type (might be due to invalid IL or missing references)
		//IL_010c: Unknown result type (might be due to invalid IL or missing references)
		//IL_011a: Unknown result type (might be due to invalid IL or missing references)
		//IL_011f: Unknown result type (might be due to invalid IL or missing references)
		float num = ((CompatibilitySupport.HasPlugin("Azumatt.CurrencyPocket") && !hasSpawnedCurrencyPocketUI) ? 45f : 0f);
		if (existingMiniButtons == -1)
		{
			button.localPosition = anchor.localPosition + new Vector3(1f, 70f + num);
			return;
		}
		float num2 = 40 * (existingMiniButtons - 1);
		if (randyStatus == CompatibilitySupport.RandyStatus.EnabledWithQuickSlots)
		{
			float num3 = 0f - num2 + -56f + num;
			button.localPosition = anchor.localPosition + new Vector3(1f, num3);
			return;
		}
		float num4;
		if (CompatibilitySupport.HasPlugin("Azumatt.CurrencyPocket"))
		{
			num4 = -54f + num;
		}
		else
		{
			bool flag = CompatibilitySupport.HasPluginThatRequiresMiniButtonVMove() && ((Object)(object)((Transform)instance.m_player).Find("AzuEquipmentBkg") != (Object)null || (Object)(object)((Transform)instance.m_player).Find("EquipmentBkg") != (Object)null);
			num4 = ((flag | (randyStatus == CompatibilitySupport.RandyStatus.EnabledWithoutQuickSlots)) ? (-75f) : (-56f));
		}
		button.localPosition = anchor.localPosition + new Vector3(1f + num2, num4);
	}

	internal static IEnumerator WaitAFrameToRepositionMiniButton(InventoryGui instance, Transform button, Transform anchor, int existingMiniButtons, CompatibilitySupport.RandyStatus randyStatus, bool hasSpawnedCurrencyPocketUI)
	{
		yield return null;
		RepositionMiniButton(instance, button, anchor, existingMiniButtons, randyStatus, hasSpawnedCurrencyPocketUI);
	}

	internal static IEnumerator WaitAFrameToUpdateUIElements(InventoryGui instance, bool includeTrashButton)
	{
		yield return null;
		if (!((Object)(object)instance == (Object)null))
		{
			MainButtonUpdate.UpdateInventoryGuiButtons(instance);
			if (includeTrashButton)
			{
				TrashModule.TrashItemsPatches.UpdateTrashCanUI(instance);
			}
		}
	}

	internal static void OnButtonRelevantSettingChanged(BaseUnityPlugin plugin, bool includeTrashButton = false)
	{
		//IL_005b: Unknown result type (might be due to invalid IL or missing references)
		if (!hasOpenedInventoryOnce || !TrashModule.TrashItemsPatches.hasOpenedInventoryOnce)
		{
			return;
		}
		if ((Object)(object)InventoryGui.instance != (Object)null)
		{
			Button takeAllButton = InventoryGui.instance.m_takeAllButton;
			if ((Object)(object)takeAllButton != (Object)null && !CompatibilitySupport.ShouldBlockChangesToTakeAllButton())
			{
				((Component)takeAllButton).transform.localPosition = origButtonPosition;
			}
		}
		Button[] array = new Button[8] { storeAllButton, quickStackToContainerButton, sortContainerButton, restockFromContainerButton, sortInventoryButton, quickStackAreaButton, restockAreaButton, favoritingTogglingButton };
		Button[] array2 = array;
		foreach (Button val in array2)
		{
			if ((Object)(object)val != (Object)null)
			{
				Object.Destroy((Object)(object)((Component)val).gameObject);
			}
		}
		favoritingTogglingButtonText = null;
		if (includeTrashButton && (Object)(object)TrashModule.trashRoot != (Object)null)
		{
			Object.Destroy((Object)(object)((Component)TrashModule.trashRoot).gameObject);
		}
		((MonoBehaviour)plugin).StartCoroutine(WaitAFrameToUpdateUIElements(InventoryGui.instance, includeTrashButton));
	}

	private static void UpdateButtonTextTranslation(Button button, ConfigEntry<string> overrideConfig, string configName)
	{
		if ((Object)(object)button != (Object)null)
		{
			TextMeshProUGUI componentInChildren = ((Component)button).GetComponentInChildren<TextMeshProUGUI>();
			if ((Object)(object)componentInChildren != (Object)null)
			{
				((TMP_Text)componentInChildren).text = LocalizationConfig.GetRelevantTranslation(overrideConfig, configName);
			}
		}
	}

	internal static void OnButtonTextTranslationSettingChanged(bool includeTrashButton = true)
	{
		if ((Object)(object)InventoryGui.instance != (Object)null)
		{
			Button takeAllButton = InventoryGui.instance.m_takeAllButton;
			if ((Object)(object)takeAllButton != (Object)null)
			{
				TextMeshProUGUI componentInChildren = ((Component)takeAllButton).GetComponentInChildren<TextMeshProUGUI>();
				if ((Object)(object)componentInChildren != (Object)null)
				{
					((TMP_Text)componentInChildren).text = ((!Utility.IsNullOrWhiteSpace(LocalizationConfig.TakeAllLabel.Value)) ? LocalizationConfig.TakeAllLabel.Value : Localization.instance.Translate("inventory_takeall"));
				}
			}
		}
		UpdateButtonTextTranslation(storeAllButton, LocalizationConfig.StoreAllLabel, "StoreAllLabel");
		UpdateButtonTextTranslation(quickStackToContainerButton, LocalizationConfig.QuickStackLabel, "QuickStackLabel");
		UpdateButtonTextTranslation(restockFromContainerButton, LocalizationConfig.RestockLabel, "RestockLabel");
		UpdateButtonTextTranslation(sortInventoryButton, LocalizationConfig.SortLabelCharacter, "SortLabelCharacter");
		UpdateButtonTextTranslation(quickStackAreaButton, LocalizationConfig.QuickStackLabelCharacter, "QuickStackLabelCharacter");
		UpdateButtonTextTranslation(restockAreaButton, LocalizationConfig.RestockLabelCharacter, "RestockLabelCharacter");
		if ((Object)(object)sortContainerButton != (Object)null)
		{
			TextMeshProUGUI componentInChildren2 = ((Component)sortContainerButton).GetComponentInChildren<TextMeshProUGUI>();
			if ((Object)(object)componentInChildren2 != (Object)null)
			{
				string text = LocalizationConfig.GetRelevantTranslation(LocalizationConfig.SortLabel, "SortLabel");
				if (QSSConfig.SortConfig.DisplaySortCriteriaInLabel.Value)
				{
					text = text + " (" + SortCriteriaToShortHumanReadableString(QSSConfig.SortConfig.SortCriteria.Value) + ")";
				}
				((TMP_Text)componentInChildren2).text = text;
			}
		}
		if (includeTrashButton && (Object)(object)TrashModule.trashButton != (Object)null)
		{
			TextMeshProUGUI componentInChildren3 = ((Component)TrashModule.trashButton).GetComponentInChildren<TextMeshProUGUI>();
			if ((Object)(object)componentInChildren3 != (Object)null)
			{
				((TMP_Text)componentInChildren3).text = LocalizationConfig.GetRelevantTranslation(LocalizationConfig.TrashLabel, "TrashLabel");
			}
		}
	}
}
