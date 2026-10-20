using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using System.Runtime.CompilerServices;
using HarmonyLib;
using TMPro;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

namespace QuickStackStore;

internal class TrashModule
{
	[HarmonyPatch(typeof(InventoryGui))]
	internal static class TrashItemsPatches
	{
		internal static bool hasOpenedInventoryOnce;

		[HarmonyPriority(300)]
		[HarmonyPatch("Show")]
		[HarmonyPostfix]
		private static void Show_Postfix(InventoryGui __instance)
		{
			hasOpenedInventoryOnce = true;
			UpdateTrashCanUI(__instance);
		}

		internal static void UpdateTrashCanUI(InventoryGui __instance)
		{
			if (hasOpenedInventoryOnce && !((Object)(object)__instance != (Object)(object)InventoryGui.instance) && !((Object)(object)trashRoot != (Object)null) && !CompatibilitySupport.DisallowAllTrashCanFeatures() && !CompatibilitySupport.HasPlugin("randyknapp.mods.auga") && QSSConfig.GeneralConfig.OverrideButtonDisplay.Value != QSSConfig.OverrideButtonDisplay.DisableAllNewButtons && QSSConfig.TrashConfig.DisplayTrashCanUI.Value)
			{
				Transform transform = ((Component)__instance.m_player).transform;
				Transform val = transform.Find("Armor");
				trashRoot = Object.Instantiate<Transform>(val, transform);
				trashRoot.SetSiblingIndex(val.GetSiblingIndex() + 1);
				trashButton = ((Component)trashRoot).gameObject.AddComponent<TrashButton>();
			}
		}

		[HarmonyPatch("Hide")]
		[HarmonyPostfix]
		private static void Hide_Postfix()
		{
			OnChoice();
		}

		[HarmonyPatch("UpdateItemDrag")]
		[HarmonyPostfix]
		private static void UpdateItemDrag_Postfix(InventoryGui __instance, ItemData ___m_dragItem, Inventory ___m_dragInventory, int ___m_dragAmount)
		{
			//IL_01a3: Unknown result type (might be due to invalid IL or missing references)
			//IL_0239: Unknown result type (might be due to invalid IL or missing references)
			//IL_0243: Expected Obj, but got Unknown
			if ((Object)(object)dialog != (Object)null || clickState == ClickState.None)
			{
				return;
			}
			if (___m_dragItem == null)
			{
				if (clickState == ClickState.ClickedQuickTrash)
				{
					DoQuickTrash();
				}
				clickState = ClickState.None;
				return;
			}
			if (___m_dragInventory == null || !___m_dragInventory.ContainsItem(___m_dragItem))
			{
				clickState = ClickState.None;
				return;
			}
			Player localPlayer = Player.m_localPlayer;
			UserConfig playerConfig = UserConfig.GetPlayerConfig(localPlayer.GetPlayerID());
			if (clickState == ClickState.ClickedTrashFlagging)
			{
				if (!playerConfig.ToggleItemNameTrashFlagging(InventoryGui.instance.m_dragItem.m_shared))
				{
					((Character)localPlayer).Message((MessageType)2, LocalizationConfig.GetRelevantTranslation(LocalizationConfig.CantTrashFlagFavoritedItemWarning, "CantTrashFlagFavoritedItemWarning"), 0, (Sprite)null, false);
				}
				clickState = ClickState.None;
			}
			else
			{
				if (clickState != ClickState.ClickedTrash)
				{
					return;
				}
				if (((Humanoid)localPlayer).m_inventory == ___m_dragInventory && ___m_dragItem.m_gridPos.y == 0 && (QSSConfig.GeneralConfig.OverrideHotkeyBarBehavior.Value == QSSConfig.OverrideHotkeyBarBehavior.NeverAffectHotkeyBar || !QSSConfig.TrashConfig.TrashingCanAffectHotkeyBar.Value))
				{
					((Character)localPlayer).Message((MessageType)2, LocalizationConfig.GetRelevantTranslation(LocalizationConfig.CantTrashHotkeyBarItemWarning, "CantTrashHotkeyBarItemWarning"), 0, (Sprite)null, false);
					clickState = ClickState.None;
					return;
				}
				if ((((Humanoid)localPlayer).m_inventory == ___m_dragInventory && playerConfig.IsSlotFavorited(___m_dragItem.m_gridPos)) || playerConfig.IsItemNameFavorited(___m_dragItem.m_shared))
				{
					((Character)localPlayer).Message((MessageType)2, LocalizationConfig.GetRelevantTranslation(LocalizationConfig.CantTrashFavoritedItemWarning, "CantTrashFavoritedItemWarning"), 0, (Sprite)null, false);
					clickState = ClickState.None;
					return;
				}
				QSSConfig.ShowConfirmDialogOption value = QSSConfig.TrashConfig.ShowConfirmDialogForNormalItem.Value;
				if (value == QSSConfig.ShowConfirmDialogOption.Always || (value == QSSConfig.ShowConfirmDialogOption.WhenNotTrashFlagged && !playerConfig.IsItemNameConsideredTrashFlagged(___m_dragItem.m_shared)))
				{
					ShowConfirmDialog(___m_dragItem, ___m_dragAmount, () =>
					{
						TrashItem(__instance, ___m_dragInventory, ___m_dragItem, ___m_dragAmount);
					});
				}
				else
				{
					TrashItem(__instance, ___m_dragInventory, ___m_dragItem, ___m_dragAmount);
				}
				clickState = ClickState.None;
			}
		}
	}

	[HarmonyPatch(typeof(Player))]
	internal static class TrashItemPlayerPatches
	{
		[HarmonyPatch("AutoPickup")]
		[HarmonyTranspiler]
		private static IEnumerable<CodeInstruction> AutoPickupTranspiler(IEnumerable<CodeInstruction> instructions)
		{
			//IL_003a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Expected Obj, but got Unknown
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0074: Expected Obj, but got Unknown
			//IL_008d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0093: Expected Obj, but got Unknown
			//IL_00a6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ac: Expected Obj, but got Unknown
			FieldInfo autoPickupField = AccessTools.DeclaredField(typeof(ItemDrop), "m_autoPickup");
			MethodInfo methodInfo = AccessTools.DeclaredMethod(typeof(TrashItemPlayerPatches), "ShouldAutoPickup", (Type[])null, (Type[])null);
			return new CodeMatcher(instructions, (ILGenerator)null).MatchForward(false, new CodeMatch[1]
			{
				new CodeMatch((Func<CodeInstruction, bool>)((CodeInstruction i) => CodeInstructionExtensions.LoadsField(i, autoPickupField, false)), (string)null)
			}).InsertAndAdvance(new CodeInstruction[1]
			{
				new CodeInstruction(OpCodes.Dup, (object)null)
			}).Advance(1)
				.InsertAndAdvance(new CodeInstruction[1]
				{
					new CodeInstruction(OpCodes.Ldarg_0, (object)null)
				})
				.InsertAndAdvance(new CodeInstruction[1]
				{
					new CodeInstruction(OpCodes.Call, (object)methodInfo)
				})
				.Instructions();
		}

		public static bool ShouldAutoPickup(ItemDrop itemDrop, bool isAutoPickupable, Player player)
		{
			if (!Object.op_Implicit((Object)(object)itemDrop) || itemDrop.m_itemData == null || itemDrop.m_itemData.m_shared == null)
			{
				return isAutoPickupable;
			}
			if ((Object)(object)player == (Object)null || (Object)(object)player != (Object)(object)Player.m_localPlayer || !QSSConfig.TrashConfig.PreventAutoPickupOfTrashFlaggedItems.Value)
			{
				return isAutoPickupable;
			}
			if (!isAutoPickupable)
			{
				return isAutoPickupable;
			}
			UserConfig playerConfig = UserConfig.GetPlayerConfig(player.GetPlayerID());
			return !playerConfig.IsItemNameConsideredTrashFlagged(itemDrop.m_itemData.m_shared);
		}
	}

	public class TrashButton : MonoBehaviour
	{
		[Serializable]
		[CompilerGenerated]
		private sealed class _003C_003Ec
		{
			public static readonly _003C_003Ec _003C_003E9 = new _003C_003Ec();

			public static UnityAction _003C_003E9__2_0;

			internal void _003CAwake_003Eb__2_0()
			{
				TrashOrTrashFlagItem();
			}
		}

		protected RectTransform rectTransform;

		protected GameObject buttonGo;

		protected void Awake()
		{
			//IL_0031: Unknown result type (might be due to invalid IL or missing references)
			//IL_0040: Unknown result type (might be due to invalid IL or missing references)
			//IL_0045: Unknown result type (might be due to invalid IL or missing references)
			//IL_00fe: Unknown result type (might be due to invalid IL or missing references)
			//IL_0110: Unknown result type (might be due to invalid IL or missing references)
			//IL_011f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0124: Unknown result type (might be due to invalid IL or missing references)
			//IL_015c: Unknown result type (might be due to invalid IL or missing references)
			//IL_0166: Expected Obj, but got Unknown
			//IL_019a: Unknown result type (might be due to invalid IL or missing references)
			//IL_01b5: Unknown result type (might be due to invalid IL or missing references)
			//IL_0225: Unknown result type (might be due to invalid IL or missing references)
			//IL_0287: Unknown result type (might be due to invalid IL or missing references)
			//IL_02a3: Unknown result type (might be due to invalid IL or missing references)
			//IL_01e8: Unknown result type (might be due to invalid IL or missing references)
			//IL_01ed: Unknown result type (might be due to invalid IL or missing references)
			//IL_01f3: Expected Obj, but got Unknown
			if ((Object)(object)InventoryGui.instance == (Object)null)
			{
				return;
			}
			Transform transform = ((Component)InventoryGui.instance.m_player).transform;
			RectTransform component = ((Component)this).GetComponent<RectTransform>();
			component.anchoredPosition -= new Vector2(0f, 78f);
			Transform val = ((Component)this).transform.Find("ac_text");
			Transform val2 = ((Component)this).transform.Find("armor_icon");
			if (!Object.op_Implicit((Object)(object)val) || !Object.op_Implicit((Object)(object)val2))
			{
				if (!Object.op_Implicit((Object)(object)val))
				{
					Helper.LogO("ac_text not found!");
				}
				if (!Object.op_Implicit((Object)(object)val2))
				{
					Helper.LogO("armor_icon not found!");
				}
				Helper.LogO("If you are using Better UI Reforged, this happens the moment you edit the config to reenable the trash can UI while already ingame. A simple log out to main menu and log back in will fix this, don't worry about it. If not, please report this on the mod page or on github.");
				return;
			}
			((TMP_Text)((Component)val).GetComponent<TextMeshProUGUI>()).text = LocalizationConfig.GetRelevantTranslation(LocalizationConfig.TrashLabel, "TrashLabel");
			((Graphic)((Component)val).GetComponent<TextMeshProUGUI>()).color = QSSConfig.TrashConfig.TrashLabelColor.Value;
			RectTransform component2 = ((Component)val).GetComponent<RectTransform>();
			component2.sizeDelta -= new Vector2(9f, 0f);
			((Component)val2).GetComponent<Image>().sprite = trashSprite;
			((Object)((Component)((Component)this).transform).gameObject).name = "Trash";
			buttonGo = new GameObject("ButtonCanvas");
			rectTransform = buttonGo.AddComponent<RectTransform>();
			((Component)rectTransform).transform.SetParent(((Component)((Component)this).transform).transform, true);
			rectTransform.anchoredPosition = Vector2.zero;
			rectTransform.sizeDelta = new Vector2(70f, 74f);
			Button val3 = buttonGo.AddComponent<Button>();
			ButtonClickedEvent onClick = val3.onClick;
			UnityAction val4 = _003C_003Ec._003C_003E9__2_0;
			if (val4 == null)
			{
				UnityAction val5 = () =>
				{
					TrashOrTrashFlagItem();
				};
				_003C_003Ec._003C_003E9__2_0 = val5;
				val4 = val5;
			}
			((UnityEvent)onClick).AddListener(val4);
			ControllerButtonHintHelper.AddControllerTooltipToTrashCan(val3, val2);
			Image val6 = buttonGo.AddComponent<Image>();
			((Graphic)val6).color = new Color(0f, 0f, 0f, 0f);
			Transform val7 = transform.Find("selected_frame");
			GameObject val8 = Object.Instantiate<GameObject>(((Component)val7.GetChild(0)).gameObject, ((Component)this).transform);
			val8.GetComponent<Image>().sprite = bgSprite;
			val8.transform.SetAsFirstSibling();
			val8.GetComponent<RectTransform>().sizeDelta = new Vector2(-8f, 22f);
			val8.GetComponent<RectTransform>().anchoredPosition = new Vector2(6f, 7.5f);
			((Component)this).gameObject.AddComponent<TrashFrameHandler>().frame = val8;
		}
	}

	private enum ClickState
	{
		None,
		ClickedTrash,
		ClickedTrashFlagging,
		ClickedQuickTrash
	}

	private static ClickState clickState;

	public static Sprite trashSprite;

	public static Sprite bgSprite;

	public static GameObject dialog;

	public static Transform trashRoot;

	public static TrashButton trashButton;

	private static void DoQuickTrash()
	{
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0036: Expected Obj, but got Unknown
		if (QSSConfig.TrashConfig.ShowConfirmDialogForQuickTrash.Value)
		{
			ShowBaseConfirmDialog(null, LocalizationConfig.GetRelevantTranslation(LocalizationConfig.QuickTrashConfirmation, "QuickTrashConfirmation"), string.Empty, QuickTrash);
		}
		else
		{
			QuickTrash();
		}
	}

	private static void QuickTrash()
	{
		//IL_0074: Unknown result type (might be due to invalid IL or missing references)
		Player localPlayer = Player.m_localPlayer;
		UserConfig playerConfig = UserConfig.GetPlayerConfig(localPlayer.GetPlayerID());
		int num = 0;
		List<ItemData> inventory = ((Humanoid)localPlayer).m_inventory.m_inventory;
		for (int num2 = inventory.Count - 1; num2 >= 0; num2--)
		{
			ItemData val = inventory[num2];
			if ((val.m_gridPos.y != 0 || (QSSConfig.GeneralConfig.OverrideHotkeyBarBehavior.Value != QSSConfig.OverrideHotkeyBarBehavior.NeverAffectHotkeyBar && QSSConfig.TrashConfig.TrashingCanAffectHotkeyBar.Value)) && !playerConfig.IsSlotFavorited(val.m_gridPos) && playerConfig.IsItemNameConsideredTrashFlagged(val.m_shared))
			{
				num++;
				((Humanoid)localPlayer).RemoveEquipAction(val);
				((Humanoid)localPlayer).UnequipItem(val, false);
				((Humanoid)localPlayer).m_inventory.RemoveItem(val);
			}
		}
		InventoryGui.instance.SetupDragItem((ItemData)null, (Inventory)null, 0);
		InventoryGui.instance.UpdateCraftingPanel(false);
		Helper.Log($"Quick trashed {num} item/s from player inventory");
		((Humanoid)localPlayer).m_inventory.Changed(false, false);
	}

	private static void TrashItem(InventoryGui __instance, Inventory ___m_dragInventory, ItemData ___m_dragItem, int ___m_dragAmount)
	{
		if (___m_dragAmount == ___m_dragItem.m_stack)
		{
			((Humanoid)Player.m_localPlayer).RemoveEquipAction(___m_dragItem);
			((Humanoid)Player.m_localPlayer).UnequipItem(___m_dragItem, false);
			___m_dragInventory.RemoveItem(___m_dragItem);
		}
		else
		{
			___m_dragInventory.RemoveItem(___m_dragItem, ___m_dragAmount);
		}
		__instance.SetupDragItem((ItemData)null, (Inventory)null, 0);
		__instance.UpdateCraftingPanel(false);
	}

	private static void ShowConfirmDialog(ItemData item, int itemAmount, UnityAction onConfirm)
	{
		ShowBaseConfirmDialog(item.GetIcon(), Localization.instance.Localize(item.m_shared.m_name), $"{itemAmount}/{item.m_shared.m_maxStackSize}", onConfirm);
	}

	private static void ShowBaseConfirmDialog(Sprite potentialIcon, string name, string amountText, UnityAction onConfirm)
	{
		//IL_007e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0088: Expected Obj, but got Unknown
		//IL_00c6: Unknown result type (might be due to invalid IL or missing references)
		//IL_0104: Unknown result type (might be due to invalid IL or missing references)
		//IL_010e: Expected Obj, but got Unknown
		if (!((Object)(object)InventoryGui.instance == (Object)null) && !((Object)(object)dialog != (Object)null))
		{
			dialog = Object.Instantiate<GameObject>(((Component)InventoryGui.instance.m_splitDialog).gameObject, ((Component)InventoryGui.instance).transform);
			Button component = ((Component)dialog.transform.Find("win_bkg/Button_ok")).GetComponent<Button>();
			((UnityEventBase)component.onClick).RemoveAllListeners();
			((UnityEvent)component.onClick).AddListener((UnityAction)OnChoice);
			((UnityEvent)component.onClick).AddListener(onConfirm);
			((TMP_Text)((Component)component).GetComponentInChildren<TextMeshProUGUI>()).text = LocalizationConfig.GetRelevantTranslation(LocalizationConfig.TrashConfirmationOkayButton, "TrashConfirmationOkayButton");
			((Graphic)((Component)component).GetComponentInChildren<TextMeshProUGUI>()).color = new Color(1f, 0.2f, 0.1f);
			Button component2 = ((Component)dialog.transform.Find("win_bkg/Button_cancel")).GetComponent<Button>();
			((UnityEventBase)component2.onClick).RemoveAllListeners();
			((UnityEvent)component2.onClick).AddListener((UnityAction)OnChoice);
			((Component)dialog.transform.Find("win_bkg/Slider")).gameObject.SetActive(false);
			TextMeshProUGUI component3 = ((Component)dialog.transform.Find("win_bkg/Text")).GetComponent<TextMeshProUGUI>();
			((TMP_Text)component3).text = name;
			Image component4 = ((Component)dialog.transform.Find("win_bkg/Icon_bkg/Icon")).GetComponent<Image>();
			if (Object.op_Implicit((Object)(object)potentialIcon))
			{
				component4.sprite = potentialIcon;
			}
			else
			{
				component4.sprite = trashSprite;
			}
			TextMeshProUGUI component5 = ((Component)dialog.transform.Find("win_bkg/amount")).GetComponent<TextMeshProUGUI>();
			dialog.gameObject.SetActive(true);
			((TMP_Text)component5).text = amountText;
		}
	}

	private static void OnChoice()
	{
		clickState = ClickState.None;
		if ((Object)(object)dialog != (Object)null)
		{
			Object.Destroy((Object)(object)dialog);
			dialog = null;
		}
	}

	public static void TrashOrTrashFlagItem(bool usedFromHotkey = false)
	{
		if (CompatibilitySupport.DisallowAllTrashCanFeatures())
		{
			return;
		}
		Helper.Log("Trash Item called!");
		if (clickState != ClickState.None || (Object)(object)InventoryGui.instance == (Object)null)
		{
			return;
		}
		if ((Object)(object)InventoryGui.instance.m_dragGo != (Object)null)
		{
			if (FavoritingMode.IsInFavoritingMode())
			{
				clickState = ClickState.ClickedTrashFlagging;
			}
			else
			{
				clickState = ClickState.ClickedTrash;
			}
		}
		else if (!usedFromHotkey && QSSConfig.TrashConfig.EnableQuickTrash.Value && !FavoritingMode.IsInFavoritingMode())
		{
			clickState = ClickState.ClickedQuickTrash;
		}
	}

	public static void AttemptQuickTrash()
	{
		if (!CompatibilitySupport.DisallowAllTrashCanFeatures())
		{
			Helper.Log("Quick Trash Item called!");
			if (clickState == ClickState.None && !((Object)(object)InventoryGui.instance == (Object)null) && !((Object)(object)InventoryGui.instance.m_dragGo != (Object)null) && QSSConfig.TrashConfig.EnableQuickTrash.Value && !FavoritingMode.IsInFavoritingMode())
			{
				clickState = ClickState.ClickedQuickTrash;
			}
		}
	}
}
