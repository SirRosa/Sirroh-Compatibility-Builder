using System;
using System.Collections.Generic;
using System.Linq;
using BepInEx;
using BepInEx.Configuration;
using HarmonyLib;
using ServerSync;
using UnityEngine;

namespace QuickStackStore;

internal class QSSConfig
{
	internal class GeneralConfig
	{
		public static ConfigEntry<ConfigTemplate> ConfigTemplate;

		public static ConfigEntry<OverrideButtonDisplay> OverrideButtonDisplay;

		public static ConfigEntry<OverrideKeybindBehavior> OverrideKeybindBehavior;

		public static ConfigEntry<OverrideHotkeyBarBehavior> OverrideHotkeyBarBehavior;

		public static ConfigEntry<bool> UseTopDownLogicForEverything;
	}

	internal class ControllerConfig
	{
		public static ConfigEntry<DPadUsage> ControllerDPadUsageInInventoryGrid;

		public static ConfigEntry<KeyboardShortcut> ControllerDPadUsageModifierKeybind;

		public static ConfigEntry<bool> RemoveControllerButtonHintFromTakeAllButton;

		public static ConfigEntry<bool> UseHardcodedControllerSupport;
	}

	internal class FavoriteConfig
	{
		public static ConfigEntry<Color> BorderColorFavoritedItem;

		public static ConfigEntry<Color> BorderColorFavoritedItemOnFavoritedSlot;

		public static ConfigEntry<Color> BorderColorFavoritedSlot;

		public static ConfigEntry<Color> BorderColorTrashFlaggedItem;

		public static ConfigEntry<Color> BorderColorTrashFlaggedItemOnFavoritedSlot;

		public static ConfigEntry<FavoritingToggling> DisplayFavoriteToggleButton;

		public static ConfigEntry<bool> DisplayTooltipHint;

		public static ConfigEntry<KeyboardShortcut> FavoritingModifierKeybind1;

		public static ConfigEntry<KeyboardShortcut> FavoritingModifierKeybind2;

		public static ConfigEntry<FavoriteToggleButtonStyle> FavoriteToggleButtonStyle;
	}

	internal class QuickStackRestockConfig
	{
		public static ConfigSync AreaStackRestockServerSync;

		public static ConfigEntry<bool> AllowAreaStackingInMultiplayerWithoutMUC;

		public static ConfigEntry<bool> AllowAreaStackingToNonPhysicalContainers;

		public static ConfigEntry<bool> AllowAreaStackingToPhysicalNonPlayerBuiltContainers;

		public static ConfigEntry<bool> SuppressContainerSoundAndVisuals;

		public static ConfigEntry<bool> ToggleAreaStackRestockConfigServerSync;
	}

	internal class QuickStackConfig
	{
		public static ConfigEntry<bool> ChangeHoldToStackFeatureToUseModdedQuickStackingLogic;

		public static ConfigEntry<ShowTwoButtons> DisplayQuickStackButtons;

		public static ConfigEntry<bool> HideBaseGamePlaceStacksButton;

		public static ConfigEntry<QuickStackBehavior> QuickStackHotkeyBehaviorWhenContainerOpen;

		public static ConfigEntry<bool> QuickStackIncludesHotkeyBar;

		public static ConfigEntry<KeyboardShortcut> QuickStackKeybind;

		public static ConfigEntry<float> QuickStackToNearbyRange;

		public static ConfigEntry<bool> QuickStackTrophiesIntoSameContainer;

		public static ConfigEntry<bool> ShowQuickStackResultMessage;
	}

	internal class RestockConfig
	{
		public static ConfigEntry<ShowTwoButtons> DisplayRestockButtons;

		public static ConfigEntry<float> RestockFromNearbyRange;

		public static ConfigEntry<RestockBehavior> RestockHotkeyBehaviorWhenContainerOpen;

		public static ConfigEntry<bool> RestockIncludesHotkeyBar;

		public static ConfigEntry<KeyboardShortcut> RestockKeybind;

		public static ConfigEntry<bool> RestockOnlyAmmoAndConsumables;

		public static ConfigEntry<bool> RestockOnlyFavoritedItems;

		public static ConfigEntry<int> RestockStackSizeLimitAmmo;

		public static ConfigEntry<int> RestockStackSizeLimitConsumables;

		public static ConfigEntry<int> RestockStackSizeLimitGeneral;

		public static ConfigEntry<bool> ShowRestockResultMessage;
	}

	internal class StoreTakeAllConfig
	{
		public static ConfigEntry<bool> ChestsUseImprovedTakeAllLogic;

		public static ConfigEntry<bool> DisplayStoreAllButton;

		public static ConfigEntry<bool> NeverMoveTakeAllButton;

		public static ConfigEntry<KeyboardShortcut> StoreAllKeybind;

		public static ConfigEntry<bool> StoreAllIncludesEquippedItems;

		public static ConfigEntry<bool> StoreAllIncludesHotkeyBar;

		public static ConfigEntry<KeyboardShortcut> TakeAllKeybind;
	}

	internal class SortConfig
	{
		public static ConfigEntry<AutoSortBehavior> AutoSort;

		public static ConfigEntry<ShowTwoButtons> DisplaySortButtons;

		public static ConfigEntry<bool> DisplaySortCriteriaInLabel;

		public static ConfigEntry<SortCriteriaEnum> SortCriteria;

		public static ConfigEntry<SortBehavior> SortHotkeyBehaviorWhenContainerOpen;

		public static ConfigEntry<bool> SortInAscendingOrder;

		public static ConfigEntry<bool> SortIncludesHotkeyBar;

		public static ConfigEntry<KeyboardShortcut> SortKeybind;

		public static ConfigEntry<bool> SortLeavesEmptyFavoritedSlotsEmpty;

		public static ConfigEntry<bool> SortMergesStacks;
	}

	internal class TrashConfig
	{
		public static ConfigEntry<bool> AlwaysConsiderTrophiesTrashFlagged;

		public static ConfigEntry<bool> DisplayTrashCanUI;

		public static ConfigEntry<bool> EnableQuickTrash;

		public static ConfigEntry<bool> PreventAutoPickupOfTrashFlaggedItems;

		public static ConfigEntry<KeyboardShortcut> QuickTrashKeybind;

		public static ConfigEntry<ShowConfirmDialogOption> ShowConfirmDialogForNormalItem;

		public static ConfigEntry<bool> ShowConfirmDialogForQuickTrash;

		public static ConfigEntry<bool> TrashingCanAffectHotkeyBar;

		public static ConfigEntry<KeyboardShortcut> TrashKeybind;

		public static ConfigEntry<Color> TrashLabelColor;
	}

	internal class DebugConfig
	{
		public static ConfigEntry<DebugLevel> ShowDebugLogs;

		public static ConfigEntry<DebugSeverity> DebugSeverity;

		public static ConfigEntry<ResetFavoritingData> ResetAllFavoritingData;
	}

	public enum OverrideButtonDisplay
	{
		DisableAllNewButtons,
		UseIndividualConfigOptions
	}

	public enum OverrideKeybindBehavior
	{
		DisableAllNewHotkeys,
		UseIndividualConfigOptions
	}

	public enum OverrideHotkeyBarBehavior
	{
		NeverAffectHotkeyBar,
		UseIndividualConfigOptions
	}

	public enum ShowConfirmDialogOption
	{
		Never,
		WhenNotTrashFlagged,
		Always
	}

	public enum ShowTwoButtons
	{
		Both,
		OnlyInventoryButton,
		OnlyContainerButton,
		BothButDependingOnContext,
		Disabled
	}

	public enum QuickStackBehavior
	{
		QuickStackOnlyToCurrentContainer,
		QuickStackToBoth
	}

	public enum RestockBehavior
	{
		RestockOnlyFromCurrentContainer,
		RestockFromBoth
	}

	public enum SortBehavior
	{
		OnlySortContainer,
		SortBoth
	}

	public enum SortCriteriaEnum
	{
		InternalName,
		TranslatedName,
		Value,
		Weight,
		Type
	}

	public enum AutoSortBehavior
	{
		Never,
		SortContainerOnOpen,
		SortPlayerInventoryOnOpen,
		Both
	}

	internal enum DebugLevel
	{
		Disabled,
		Log,
		Warning
	}

	internal enum DebugSeverity
	{
		Normal,
		AlsoSpeedTests,
		Everything
	}

	internal enum ResetFavoritingData
	{
		No,
		YesDeleteAllMyFavoritingData
	}

	internal enum FavoritingToggling
	{
		Disabled,
		EnabledTopButton,
		EnabledBottomButton
	}

	internal enum FavoriteToggleButtonStyle
	{
		DefaultTextStar,
		TextStarInItemFavoriteColor
	}

	internal enum DPadUsage
	{
		InventorySlotMovement,
		Keybinds,
		KeybindsWhileHoldingModifierKey
	}

	internal enum ConfigTemplate
	{
		NotCurrentlyLoadingTemplate,
		BasicControllerKeybinds,
		CustomControllerKeybinds,
		MouseAndKeyboardWithButtons,
		MouseAndKeyboardWithHotkeys,
		GoldensChoice,
		ResetToDefault
	}

	public static ConfigFile Config;

	internal static readonly List<ConfigEntryBase> keyBinds = new List<ConfigEntryBase>();

	internal static void LoadConfig(BaseUnityPlugin plugin)
	{
		Config = plugin.Config;
		Config.SaveOnConfigSet = false;
		LoadConfigInternal(plugin);
		Config.Save();
		Config.SaveOnConfigSet = true;
	}

	private static void LoadConfigInternal(BaseUnityPlugin plugin)
	{
		//IL_0137: Unknown result type (might be due to invalid IL or missing references)
		//IL_0144: Expected Obj, but got Unknown
		//IL_0165: Unknown result type (might be due to invalid IL or missing references)
		//IL_0172: Expected Obj, but got Unknown
		//IL_0193: Unknown result type (might be due to invalid IL or missing references)
		//IL_01a0: Expected Obj, but got Unknown
		//IL_0208: Unknown result type (might be due to invalid IL or missing references)
		//IL_02b0: Unknown result type (might be due to invalid IL or missing references)
		//IL_0308: Unknown result type (might be due to invalid IL or missing references)
		//IL_0336: Unknown result type (might be due to invalid IL or missing references)
		//IL_0364: Unknown result type (might be due to invalid IL or missing references)
		//IL_0389: Unknown result type (might be due to invalid IL or missing references)
		//IL_03e6: Unknown result type (might be due to invalid IL or missing references)
		//IL_03f3: Expected Obj, but got Unknown
		//IL_043e: Unknown result type (might be due to invalid IL or missing references)
		//IL_046e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0714: Unknown result type (might be due to invalid IL or missing references)
		//IL_0882: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a0f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0a81: Unknown result type (might be due to invalid IL or missing references)
		//IL_0ba9: Unknown result type (might be due to invalid IL or missing references)
		//IL_0ccc: Unknown result type (might be due to invalid IL or missing references)
		//IL_0d83: Unknown result type (might be due to invalid IL or missing references)
		//IL_0dd3: Unknown result type (might be due to invalid IL or missing references)
		if (Config == null)
		{
			Helper.LogO("Internal config load was called without its wrapper. This is slower but still works.");
			Config = plugin.Config;
		}
		string text = "overridden by OverrideButtonDisplay";
		string text2 = "overridden by OverrideKeybindBehavior";
		string text3 = "overridden by OverrideHotkeyBarBehavior";
		string text4 = "What to do when the hotkey is pressed while you have a container open.";
		string text5 = "Which of the two buttons to display (" + text + "). Selecting BothButDependingOnContext will hide the mini button while a container is open. The hotkey works independently.";
		string description = "How close the searched through containers have to be.";
		string text6 = "disallowing quick stacking, storing, sorting and trashing";
		string text7 = "While holding this, left clicking on items or right clicking on slots favorites them, " + text6 + ", or trash flags them if you are hovering an item on the trash can.";
		string format = "Allows to set a custom stack size limit for {0} items in case you don't want them to restock to their maximum stack size. Use zero or negative numbers disable this.";
		string text8 = "0 - General";
		GeneralConfig.ConfigTemplate = Config.Bind<ConfigTemplate>(text8, "ConfigTemplate", ConfigTemplate.NotCurrentlyLoadingTemplate, "Immediately or at the next startup, resets the config and applies the selected config template. Does not change any custom keybinds!");
		GeneralConfig.ConfigTemplate.SettingChanged += ConfigTemplate_SettingChanged;
		GeneralConfig.OverrideButtonDisplay = Config.Bind<OverrideButtonDisplay>(text8, "OverrideButtonDisplay", OverrideButtonDisplay.UseIndividualConfigOptions, "Override to disable all new UI elements no matter the current individual setting of each of them.");
		GeneralConfig.OverrideButtonDisplay.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonRelevantSettingChanged(plugin, includeTrashButton: true);
		};
		GeneralConfig.OverrideHotkeyBarBehavior = Config.Bind<OverrideHotkeyBarBehavior>(text8, "OverrideHotkeyBarBehavior", OverrideHotkeyBarBehavior.NeverAffectHotkeyBar, "Override to never affect the hotkey bar with any feature no matter the individual setting of each of them. Recommended to turn off if you are actually using favoriting.");
		GeneralConfig.OverrideKeybindBehavior = Config.Bind<OverrideKeybindBehavior>(text8, "OverrideKeybindBehavior", OverrideKeybindBehavior.UseIndividualConfigOptions, "Override to disable all new keybinds no matter the current individual setting of each of them.");
		bool oldValue = false;
		if (TryGetOldConfigValue(new ConfigDefinition(text8, "DisableAllNewButtons"), ref oldValue))
		{
			GeneralConfig.OverrideButtonDisplay.Value = ((!oldValue) ? OverrideButtonDisplay.UseIndividualConfigOptions : OverrideButtonDisplay.DisableAllNewButtons);
		}
		if (TryGetOldConfigValue(new ConfigDefinition(text8, "DisableAllNewKeybinds"), ref oldValue))
		{
			GeneralConfig.OverrideKeybindBehavior.Value = ((!oldValue) ? OverrideKeybindBehavior.UseIndividualConfigOptions : OverrideKeybindBehavior.DisableAllNewHotkeys);
		}
		if (TryGetOldConfigValue(new ConfigDefinition(text8, "NeverAffectHotkeyBar"), ref oldValue))
		{
			GeneralConfig.OverrideHotkeyBarBehavior.Value = ((!oldValue) ? OverrideHotkeyBarBehavior.UseIndividualConfigOptions : OverrideHotkeyBarBehavior.NeverAffectHotkeyBar);
		}
		GeneralConfig.UseTopDownLogicForEverything = Config.Bind<bool>(text8, "UseTopDownLogicForEverything", false, "Whether to always put items into the top first row (affects the entire game) rather than top or bottom first depending on the item type (base game uses top first only for weapons and tools, bottom first for the rest). Recommended to keep off.");
		text8 = "0.1 - Controller General";
		ControllerConfig.ControllerDPadUsageInInventoryGrid = Config.Bind<DPadUsage>(text8, "ControllerDPadUsageInInventoryGrid", DPadUsage.Keybinds, "In the base game the DPad and the left stick are both used for slot movement inside the inventory grid. This allows you to exclude the DPad from this to get more keys for keybinds.");
		ControllerConfig.ControllerDPadUsageModifierKeybind = Config.Bind<KeyboardShortcut>(text8, "ControllerDPadUsageModifierKeybind", new KeyboardShortcut((KeyCode)0, Array.Empty<KeyCode>()), string.Format("When {0} is set to {1}, then holding this prevents slot movement in the inventory grid with the DPad.", "ControllerDPadUsageInInventoryGrid", DPadUsage.KeybindsWhileHoldingModifierKey));
		ControllerConfig.RemoveControllerButtonHintFromTakeAllButton = Config.Bind<bool>(text8, "RemoveControllerButtonHintFromTakeAllButton", false, "Remove the button hint from the 'Take All' button while using a controller for consistency. Especially useful when using the new keybind TakeAllKeybind.");
		ControllerConfig.RemoveControllerButtonHintFromTakeAllButton.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonRelevantSettingChanged(plugin);
		};
		ControllerConfig.UseHardcodedControllerSupport = Config.Bind<bool>(text8, "UseHardcodedControllerSupport", true, "Whether to enable the hardcoded controller bindings including UI hints while a controller is used. This disables custom hotkeys.");
		ControllerConfig.UseHardcodedControllerSupport.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonRelevantSettingChanged(plugin);
		};
		text8 = "1 - Favoriting";
		FavoriteConfig.BorderColorFavoritedItem = Config.Bind<Color>(text8, "BorderColorFavoritedItem", new Color(1f, 0.8482759f, 0f), "Color of the border for slots containing favorited items.");
		FavoriteConfig.BorderColorFavoritedItem.SettingChanged += (object a, EventArgs b) =>
		{
			FavoritingMode.RefreshDisplay();
		};
		FavoriteConfig.BorderColorFavoritedItemOnFavoritedSlot = Config.Bind<Color>(text8, "BorderColorFavoritedItemOnFavoritedSlot", new Color(0.5f, 0.67413795f, 0.5f), "Color of the border of a favorited slot that also contains a favorited item.");
		FavoriteConfig.BorderColorFavoritedSlot = Config.Bind<Color>(text8, "BorderColorFavoritedSlot", new Color(0f, 0.5f, 1f), "Color of the border for favorited slots.");
		FavoriteConfig.BorderColorTrashFlaggedItem = Config.Bind<Color>(text8, "BorderColorTrashFlaggedItem", new Color(0.5f, 0f, 0f), ConfigurationManagerAttributes.HiddenTrashingDisplay("Color of the border for slots containing trash flagged items."));
		FavoriteConfig.BorderColorTrashFlaggedItemOnFavoritedSlot = Config.Bind<Color>(text8, "BorderColorTrashFlaggedItemOnFavoritedSlot", Color.black, ConfigurationManagerAttributes.HiddenTrashingDisplay("Color of the border of a favorited slot that also contains a trash flagged item."));
		FavoriteConfig.DisplayFavoriteToggleButton = Config.Bind<FavoritingToggling>(text8, "DisplayFavoriteToggleButton", FavoritingToggling.EnabledTopButton, "Whether to display a button to toggle favoriting mode on or off, allowing to favorite without holding any hotkey (" + text + "). This can also be used to trash flag. The hotkeys work independently.");
		FavoriteConfig.DisplayFavoriteToggleButton.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonRelevantSettingChanged(plugin);
		};
		if (TryGetOldConfigValue(new ConfigDefinition(text8, "FavoritingModifierToggles"), ref oldValue))
		{
			FavoriteConfig.DisplayFavoriteToggleButton.Value = (oldValue ? FavoritingToggling.EnabledTopButton : FavoritingToggling.Disabled);
		}
		FavoriteConfig.DisplayTooltipHint = Config.Bind<bool>(text8, "DisplayTooltipHint", true, "Whether to add additional info the item tooltip of a favorited or trash flagged item.");
		FavoriteConfig.FavoritingModifierKeybind1 = Config.Bind<KeyboardShortcut>(text8, "FavoritingModifierKeybind1", new KeyboardShortcut((KeyCode)308, Array.Empty<KeyCode>()), text7 + " Identical to FavoritingModifierKeybind2.");
		FavoriteConfig.FavoritingModifierKeybind2 = Config.Bind<KeyboardShortcut>(text8, "FavoritingModifierKeybind2", new KeyboardShortcut((KeyCode)307, Array.Empty<KeyCode>()), text7 + " Identical to FavoritingModifierKeybind1.");
		KeyCodeBackwardsCompatibility(FavoriteConfig.FavoritingModifierKeybind1, text8, "FavoritingModifierKey1");
		KeyCodeBackwardsCompatibility(FavoriteConfig.FavoritingModifierKeybind2, text8, "FavoritingModifierKey2");
		FavoriteConfig.FavoriteToggleButtonStyle = Config.Bind<FavoriteToggleButtonStyle>(text8, "FavoriteToggleButtonStyle", FavoriteToggleButtonStyle.TextStarInItemFavoriteColor, "The style of the favorite toggling button enabled with DisplayFavoriteToggleButton.");
		FavoriteConfig.FavoriteToggleButtonStyle.SettingChanged += (object a, EventArgs b) =>
		{
			FavoritingMode.RefreshDisplay();
		};
		text8 = "2 - Quick Stacking and Restocking";
		string category = "2.0 - Area Quick Stacking and Restocking";
		QuickStackRestockConfig.AreaStackRestockServerSync = new ConfigSync("goldenrevolver.quick_stack_store")
		{
			DisplayName = "Quick Stack - Store - Sort - Trash - Restock",
			CurrentVersion = "1.4.16",
			MinimumRequiredVersion = "1.4.16",
			ModRequired = false
		};
		QuickStackRestockConfig.AllowAreaStackingInMultiplayerWithoutMUC = Config.BindSynced(QuickStackRestockConfig.AreaStackRestockServerSync, text8, "AllowAreaStackingInMultiplayerWithoutMUC", value: false, ConfigurationManagerAttributes.MUCSettingDisplay("AllowAreaStackingInMultiplayer", category, "Whether you can use area quick stacking and area restocking in multiplayer while 'Multi User Chest' is not installed. While this is almost always safe, it can fail because no actual network requests are getting sent. Ship containers are inherently especially vulnerable and are therefore excluded."));
		QuickStackRestockConfig.AllowAreaStackingInMultiplayerWithoutMUC.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonRelevantSettingChanged(plugin);
		};
		QuickStackRestockConfig.AllowAreaStackingToNonPhysicalContainers = Config.BindSynced(QuickStackRestockConfig.AreaStackRestockServerSync, text8, "AllowAreaStackingToNonPhysicalContainers", value: true, ConfigurationManagerAttributes.CustomCategoryWithDescription(category, "Allow stacking to or restocking from containers without a physical piece object in the world, like backpacks."));
		QuickStackRestockConfig.AllowAreaStackingToPhysicalNonPlayerBuiltContainers = Config.BindSynced(QuickStackRestockConfig.AreaStackRestockServerSync, text8, "AllowAreaStackingToPhysicalNonPlayerBuiltContainers", value: false, ConfigurationManagerAttributes.CustomCategoryWithDescription(category, "Allow stacking to or restocking from containers like dungeon chests or probably some modded containers."));
		QuickStackRestockConfig.SuppressContainerSoundAndVisuals = Config.BindSynced(QuickStackRestockConfig.AreaStackRestockServerSync, text8, "SuppressContainerSoundAndVisuals", value: true, ConfigurationManagerAttributes.CustomCategoryWithDescription(category, "Whether when a feature checks multiple containers in an area, they actually play opening sounds and visuals. Disable if the suppression causes incompatibilities."));
		QuickStackRestockConfig.ToggleAreaStackRestockConfigServerSync = Config.BindSyncLocker(QuickStackRestockConfig.AreaStackRestockServerSync, text8, "ToggleAreaStackRestockConfigServerSync", value: true, ConfigurationManagerAttributes.CustomCategoryWithDescription(category, "Whether the config settings about area quick stacking and area restocking (including range) of the host/ server get applied to all other users using this mod. Does nothing if the host/ server does not have this mod installed."));
		text8 = "2.1 - Quick Stacking";
		QuickStackConfig.ChangeHoldToStackFeatureToUseModdedQuickStackingLogic = Config.Bind<bool>(text8, "ChangeHoldToStackFeatureToUseModdedQuickStackingLogic", true, "Whether to override the behavior when holding open on a container that you are hovering on with the modded quick stacking behavior. Does not override the behavior of the default 'Place Stacks' button, if it's still enabled.");
		QuickStackConfig.DisplayQuickStackButtons = Config.Bind<ShowTwoButtons>(text8, "DisplayQuickStackButtons", ShowTwoButtons.BothButDependingOnContext, text5);
		QuickStackConfig.DisplayQuickStackButtons.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonRelevantSettingChanged(plugin);
		};
		QuickStackConfig.HideBaseGamePlaceStacksButton = Config.Bind<bool>(text8, "HideBaseGamePlaceStacksButton", true, ConfigurationManagerAttributes.ForceEnabledDisplay(() => CompatibilitySupport.HasRandyPlugin() == CompatibilitySupport.RandyStatus.EnabledWithQuickSlots, "Whether to hide the 'Place Stacks' button that uses the base game quick stacking logic. Modded buttons are moved automatically based on this setting. Force enabled when using 'Randy's Equipment and Quick Slot' mod."));
		QuickStackConfig.HideBaseGamePlaceStacksButton.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonRelevantSettingChanged(plugin);
		};
		QuickStackConfig.QuickStackHotkeyBehaviorWhenContainerOpen = Config.Bind<QuickStackBehavior>(text8, "QuickStackHotkeyBehaviorWhenContainerOpen", QuickStackBehavior.QuickStackOnlyToCurrentContainer, text4);
		QuickStackConfig.QuickStackIncludesHotkeyBar = Config.Bind<bool>(text8, "QuickStackIncludesHotkeyBar", true, "Whether to also quick stack items from the hotkey bar (" + text3 + ").");
		QuickStackConfig.QuickStackKeybind = Config.Bind<KeyboardShortcut>(text8, "QuickStackKeybind", new KeyboardShortcut((KeyCode)112, Array.Empty<KeyCode>()), "The hotkey to start quick stacking to the current or nearby containers (depending on QuickStackHotkeyBehaviorWhenContainerOpen, " + text2 + ").");
		KeyCodeBackwardsCompatibility(QuickStackConfig.QuickStackKeybind, text8, "QuickStackKey");
		QuickStackConfig.QuickStackToNearbyRange = Config.BindSynced(QuickStackRestockConfig.AreaStackRestockServerSync, text8, "QuickStackToNearbyRange", 10f, ConfigurationManagerAttributes.CustomCategoryWithDescription(category, description));
		QuickStackConfig.QuickStackToNearbyRange.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonRelevantSettingChanged(plugin);
		};
		QuickStackConfig.QuickStackTrophiesIntoSameContainer = Config.Bind<bool>(text8, "QuickStackTrophiesIntoSameContainer", false, "Whether to put all types of trophies in the container if any trophy is found in that container.");
		QuickStackConfig.ShowQuickStackResultMessage = Config.Bind<bool>(text8, "ShowQuickStackResultMessage", true, "Whether to show the central screen report message after quick stacking.");
		text8 = "2.2 - Quick Restocking";
		RestockConfig.DisplayRestockButtons = Config.Bind<ShowTwoButtons>(text8, "DisplayRestockButtons", ShowTwoButtons.BothButDependingOnContext, text5);
		RestockConfig.DisplayRestockButtons.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonRelevantSettingChanged(plugin);
		};
		RestockConfig.RestockFromNearbyRange = Config.BindSynced(QuickStackRestockConfig.AreaStackRestockServerSync, text8, "RestockFromNearbyRange", 10f, ConfigurationManagerAttributes.CustomCategoryWithDescription(category, description));
		RestockConfig.RestockFromNearbyRange.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonRelevantSettingChanged(plugin);
		};
		RestockConfig.RestockHotkeyBehaviorWhenContainerOpen = Config.Bind<RestockBehavior>(text8, "RestockHotkeyBehaviorWhenContainerOpen", RestockBehavior.RestockOnlyFromCurrentContainer, text4);
		RestockConfig.RestockIncludesHotkeyBar = Config.Bind<bool>(text8, "RestockIncludesHotkeyBar", true, "Whether to also try to restock items currently in the hotkey bar (" + text3 + ").");
		RestockConfig.RestockKeybind = Config.Bind<KeyboardShortcut>(text8, "RestockKeybind", new KeyboardShortcut((KeyCode)108, Array.Empty<KeyCode>()), "The hotkey to start restocking from the current or nearby containers (depending on RestockHotkeyBehaviorWhenContainerOpen, " + text2 + ").");
		KeyCodeBackwardsCompatibility(RestockConfig.RestockKeybind, text8, "RestockKey");
		RestockConfig.RestockOnlyAmmoAndConsumables = Config.Bind<bool>(text8, "RestockOnlyAmmoAndConsumables", true, "Whether restocking should only restock ammo and consumable or every stackable item (like materials). Also affected by RestockOnlyFavoritedItems.");
		RestockConfig.RestockOnlyFavoritedItems = Config.Bind<bool>(text8, "RestockOnlyFavoritedItems", false, "Whether restocking should only restock favorited items or items on favorited slots or every stackable item. Also affected by RestockOnlyAmmoAndConsumables.");
		RestockConfig.RestockStackSizeLimitAmmo = Config.Bind<int>(text8, "RestockStackSizeLimitAmmo", 0, string.Format(format, "ammo"));
		RestockConfig.RestockStackSizeLimitConsumables = Config.Bind<int>(text8, "RestockStackSizeLimitConsumables", 0, string.Format(format, "consumable"));
		RestockConfig.RestockStackSizeLimitGeneral = Config.Bind<int>(text8, "RestockStackSizeLimitGeneral", 0, string.Format(format, "all") + " The stack size limits for ammo or consumables from their respective config setting (RestockStackSizeLimitAmmo and RestockStackSizeLimitConsumables) take priority if they are also enabled.");
		RestockConfig.ShowRestockResultMessage = Config.Bind<bool>(text8, "ShowRestockResultMessage", true, "Whether to show the central screen report message after restocking.");
		text8 = "3 - Store and Take All";
		StoreTakeAllConfig.ChestsUseImprovedTakeAllLogic = Config.Bind<bool>(text8, "ChestsUseImprovedTakeAllLogic", true, "Whether to use the improved logic for 'Take All' for non tomb stones. Disable if needed for compatibility.");
		StoreTakeAllConfig.DisplayStoreAllButton = Config.Bind<bool>(text8, "DisplayStoreAllButton", true, "Whether to display the 'Store All' button in containers (" + text + ").");
		StoreTakeAllConfig.DisplayStoreAllButton.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonRelevantSettingChanged(plugin);
		};
		StoreTakeAllConfig.NeverMoveTakeAllButton = Config.Bind<bool>(text8, "NeverMoveTakeAllButton", false, ConfigurationManagerAttributes.ForceEnabledDisplay(CompatibilitySupport.ShouldBlockChangesToTakeAllButtonDueToPlugin, "Disallows my mod from moving the 'Take All' button. Enable for compatibility with other mods (when certain mods are detected, this setting is force enabled). If it was already moved, then you need to log out and back in (since I don't even allow to reset the position, since I don't know if that position is valid with your installed mods)."));
		StoreTakeAllConfig.StoreAllKeybind = Config.Bind<KeyboardShortcut>(text8, "StoreAllKeybind", new KeyboardShortcut((KeyCode)0, Array.Empty<KeyCode>()), "The hotkey to use 'Store All' on the currently opened container (" + text2 + ").");
		StoreTakeAllConfig.StoreAllIncludesEquippedItems = Config.Bind<bool>(text8, "StoreAllIncludesEquippedItems", false, "Whether to also unequip and store non favorited equipped items or exclude them.");
		StoreTakeAllConfig.StoreAllIncludesHotkeyBar = Config.Bind<bool>(text8, "StoreAllIncludesHotkeyBar", true, "Whether to also store all non favorited items from the hotkey bar (" + text3 + ").");
		StoreTakeAllConfig.TakeAllKeybind = Config.Bind<KeyboardShortcut>(text8, "TakeAllKeybind", new KeyboardShortcut((KeyCode)0, Array.Empty<KeyCode>()), "The hotkey to use 'Take All' on the currently opened container (" + text2 + ").");
		text8 = "4 - Sorting";
		SortConfig.AutoSort = Config.Bind<AutoSortBehavior>(text8, "AutoSort", AutoSortBehavior.Never, "Automatically let the mod sort the player inventory every time you open it, as well as every container you open. This respects your other sorting config options.");
		SortConfig.DisplaySortButtons = Config.Bind<ShowTwoButtons>(text8, "DisplaySortButtons", ShowTwoButtons.Both, text5);
		SortConfig.DisplaySortButtons.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonRelevantSettingChanged(plugin);
		};
		SortConfig.DisplaySortCriteriaInLabel = Config.Bind<bool>(text8, "DisplaySortCriteriaInLabel", false, "Whether to display the current sort criteria in the inventory sort button as a reminder. The author thinks the button is a bit too small for it to look good.");
		SortConfig.DisplaySortCriteriaInLabel.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonRelevantSettingChanged(plugin);
		};
		SortConfig.SortCriteria = Config.Bind<SortCriteriaEnum>(text8, "SortCriteria", SortCriteriaEnum.Type, "The sort criteria the sort button uses. Ties are broken by internal name, quality and stack size.");
		SortConfig.SortHotkeyBehaviorWhenContainerOpen = Config.Bind<SortBehavior>(text8, "SortHotkeyBehaviorWhenContainerOpen", SortBehavior.OnlySortContainer, text4);
		SortConfig.SortInAscendingOrder = Config.Bind<bool>(text8, "SortInAscendingOrder", true, "Whether the current first sort criteria should be used in ascending or descending order.");
		SortConfig.SortIncludesHotkeyBar = Config.Bind<bool>(text8, "SortIncludesHotkeyBar", true, "Whether to also sort non favorited items from the hotkey bar (" + text3 + ").");
		SortConfig.SortKeybind = Config.Bind<KeyboardShortcut>(text8, "SortKeybind", new KeyboardShortcut((KeyCode)111, Array.Empty<KeyCode>()), "The hotkey to sort the inventory or the current container or both (depending on SortHotkeyBehaviorWhenContainerOpen, " + text2 + ").");
		KeyCodeBackwardsCompatibility(SortConfig.SortKeybind, text8, "SortKey");
		SortConfig.SortLeavesEmptyFavoritedSlotsEmpty = Config.Bind<bool>(text8, "SortLeavesEmptyFavoritedSlotsEmpty", true, "Whether sort treats empty favorited slots as occupied and leaves them empty, so you don't accidentally put items on them.");
		SortConfig.SortMergesStacks = Config.Bind<bool>(text8, "SortMergesStacks", true, "Whether to merge stacks after sorting or keep them as separate non full stacks.");
		text8 = "5 - Trashing";
		TrashConfig.AlwaysConsiderTrophiesTrashFlagged = Config.Bind<bool>(text8, "AlwaysConsiderTrophiesTrashFlagged", false, ConfigurationManagerAttributes.HiddenTrashingDisplay("Whether to always consider trophies as trash flagged, allowing for immediate trashing or to be affected by quick trashing."));
		TrashConfig.DisplayTrashCanUI = Config.Bind<bool>(text8, "DisplayTrashCanUI", true, ConfigurationManagerAttributes.TrashingCategoryHideNotificationDisplay("Whether to display the trash can UI element (" + text + "). Hotkeys work independently."));
		TrashConfig.DisplayTrashCanUI.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonRelevantSettingChanged(plugin, includeTrashButton: true);
		};
		TrashConfig.EnableQuickTrash = Config.Bind<bool>(text8, "EnableQuickTrash", true, ConfigurationManagerAttributes.HiddenTrashingDisplay("Whether quick trashing can be called with the hotkey or be clicking on the trash can while not holding anything."));
		TrashConfig.PreventAutoPickupOfTrashFlaggedItems = Config.Bind<bool>(text8, "PreventAutoPickupOfTrashFlaggedItems", false, ConfigurationManagerAttributes.HiddenTrashingDisplay("Whether a trash flagged item should additionally no longer be automatically picked up in the world by walking near it. It can still be manually picked up by using the interact button."));
		TrashConfig.QuickTrashKeybind = Config.Bind<KeyboardShortcut>(text8, "QuickTrashKeybind", new KeyboardShortcut((KeyCode)0, Array.Empty<KeyCode>()), ConfigurationManagerAttributes.HiddenTrashingDisplay("The hotkey to perform a quick trash on the player inventory, deleting all trash flagged items (" + text2 + ")."));
		KeyCodeBackwardsCompatibility(TrashConfig.QuickTrashKeybind, text8, "QuickTrashHotkey");
		TrashConfig.ShowConfirmDialogForNormalItem = Config.Bind<ShowConfirmDialogOption>(text8, "ShowConfirmDialogForNormalItem", ShowConfirmDialogOption.WhenNotTrashFlagged, ConfigurationManagerAttributes.HiddenTrashingDisplay("When to show a confirmation dialog while doing a non quick trash."));
		TrashConfig.ShowConfirmDialogForQuickTrash = Config.Bind<bool>(text8, "ShowConfirmDialogForQuickTrash", true, ConfigurationManagerAttributes.HiddenTrashingDisplay("Whether to show a confirmation dialog while doing a quick trash."));
		TrashConfig.TrashingCanAffectHotkeyBar = Config.Bind<bool>(text8, "TrashingCanAffectHotkeyBar", true, ConfigurationManagerAttributes.HiddenTrashingDisplay("Whether trashing and quick trashing can trash items that are currently in the hotkey bar (" + text3 + ")."));
		TrashConfig.TrashKeybind = Config.Bind<KeyboardShortcut>(text8, "TrashKeybind", new KeyboardShortcut((KeyCode)127, Array.Empty<KeyCode>()), ConfigurationManagerAttributes.HiddenTrashingDisplay("The hotkey to trash the currently held item (" + text2 + ")."));
		KeyCodeBackwardsCompatibility(TrashConfig.TrashKeybind, text8, "TrashHotkey");
		TrashConfig.TrashLabelColor = Config.Bind<Color>(text8, "TrashLabelColor", new Color(1f, 0.8482759f, 0f), ConfigurationManagerAttributes.HiddenTrashingDisplay("The color of the text below the trash can in the player inventory."));
		text8 = "8 - Debugging";
		DebugConfig.ShowDebugLogs = Config.Bind<DebugLevel>(text8, "ShowDebugLogs", DebugLevel.Disabled, "Enable debug logs into the console. Optionally set it to print as warnings, so the yellow color is easier to spot. Some important prints ignore this setting.");
		DebugConfig.ResetAllFavoritingData = Config.Bind<ResetFavoritingData>(text8, "ResetAllFavoritingData", ResetFavoritingData.No, "This deletes all the favoriting of your items and slots, as well as trash flagging, the next time the mod checks for it (either on loading a character or on config change while ingame), and then resets this config back to 'No'.");
		DebugConfig.ResetAllFavoritingData.SettingChanged -= ResetAllFavoritingData_SettingChanged;
		DebugConfig.ResetAllFavoritingData.SettingChanged += ResetAllFavoritingData_SettingChanged;
		DebugConfig.DebugSeverity = Config.Bind<DebugSeverity>(text8, "DebugSeverity", DebugSeverity.Normal, $"Filters which kind of debug messages are shown when {DebugConfig.ShowDebugLogs} is not disabled. Only use {DebugSeverity.Everything} for testing.");
		text8 = "9 - Localization";
		LocalizationConfig.TrashLabel = Config.Bind<string>(text8, "TrashLabel", string.Empty, string.Empty);
		LocalizationConfig.TrashLabel.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonTextTranslationSettingChanged();
		};
		LocalizationConfig.QuickStackLabel = Config.Bind<string>(text8, "QuickStackLabel", string.Empty, string.Empty);
		LocalizationConfig.QuickStackLabel.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonTextTranslationSettingChanged();
		};
		LocalizationConfig.StoreAllLabel = Config.Bind<string>(text8, "StoreAllLabel", string.Empty, string.Empty);
		LocalizationConfig.StoreAllLabel.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonTextTranslationSettingChanged();
		};
		LocalizationConfig.TakeAllLabel = Config.Bind<string>(text8, "TakeAllLabel", string.Empty, string.Empty);
		LocalizationConfig.TakeAllLabel.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonTextTranslationSettingChanged();
		};
		LocalizationConfig.RestockLabel = Config.Bind<string>(text8, "RestockLabel", string.Empty, string.Empty);
		LocalizationConfig.RestockLabel.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonTextTranslationSettingChanged();
		};
		LocalizationConfig.SortLabel = Config.Bind<string>(text8, "SortLabel", string.Empty, string.Empty);
		LocalizationConfig.SortLabel.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonTextTranslationSettingChanged();
		};
		LocalizationConfig.QuickStackLabelCharacter = Config.Bind<string>(text8, "QuickStackLabelCharacter", string.Empty, string.Empty);
		LocalizationConfig.QuickStackLabelCharacter.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonTextTranslationSettingChanged();
		};
		LocalizationConfig.SortLabelCharacter = Config.Bind<string>(text8, "SortLabelCharacter", string.Empty, string.Empty);
		LocalizationConfig.SortLabelCharacter.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonTextTranslationSettingChanged();
		};
		LocalizationConfig.RestockLabelCharacter = Config.Bind<string>(text8, "RestockLabelCharacter", string.Empty, string.Empty);
		LocalizationConfig.RestockLabelCharacter.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonTextTranslationSettingChanged();
		};
		LocalizationConfig.SortByInternalNameLabel = Config.Bind<string>(text8, "SortByInternalNameLabel", string.Empty, string.Empty);
		LocalizationConfig.SortByInternalNameLabel.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonTextTranslationSettingChanged();
		};
		LocalizationConfig.SortByTranslatedNameLabel = Config.Bind<string>(text8, "SortByTranslatedNameLabel", string.Empty, string.Empty);
		LocalizationConfig.SortByTranslatedNameLabel.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonTextTranslationSettingChanged();
		};
		LocalizationConfig.SortByValueLabel = Config.Bind<string>(text8, "SortByValueLabel", string.Empty, string.Empty);
		LocalizationConfig.SortByValueLabel.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonTextTranslationSettingChanged();
		};
		LocalizationConfig.SortByWeightLabel = Config.Bind<string>(text8, "SortByWeightLabel", string.Empty, string.Empty);
		LocalizationConfig.SortByWeightLabel.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonTextTranslationSettingChanged();
		};
		LocalizationConfig.SortByTypeLabel = Config.Bind<string>(text8, "SortByTypeLabel", string.Empty, string.Empty);
		LocalizationConfig.SortByTypeLabel.SettingChanged += (object a, EventArgs b) =>
		{
			ButtonRenderer.OnButtonTextTranslationSettingChanged();
		};
		LocalizationConfig.QuickStackResultMessageNothing = Config.Bind<string>(text8, "QuickStackResultMessageNothing", string.Empty, string.Empty);
		LocalizationConfig.QuickStackResultMessageNone = Config.Bind<string>(text8, "QuickStackResultMessageNone", string.Empty, string.Empty);
		LocalizationConfig.QuickStackResultMessageOne = Config.Bind<string>(text8, "QuickStackResultMessageOne", string.Empty, string.Empty);
		LocalizationConfig.QuickStackResultMessageMore = Config.Bind<string>(text8, "QuickStackResultMessageMore", string.Empty, string.Empty);
		LocalizationConfig.RestockResultMessageNothing = Config.Bind<string>(text8, "RestockResultMessageNothing", string.Empty, string.Empty);
		LocalizationConfig.RestockResultMessageNone = Config.Bind<string>(text8, "RestockResultMessageNone", string.Empty, string.Empty);
		LocalizationConfig.RestockResultMessagePartial = Config.Bind<string>(text8, "RestockResultMessagePartial", string.Empty, string.Empty);
		LocalizationConfig.RestockResultMessageFull = Config.Bind<string>(text8, "RestockResultMessageFull", string.Empty, string.Empty);
		LocalizationConfig.TrashConfirmationOkayButton = Config.Bind<string>(text8, "TrashConfirmationOkayButton", string.Empty, string.Empty);
		LocalizationConfig.QuickTrashConfirmation = Config.Bind<string>(text8, "QuickTrashConfirmation", string.Empty, string.Empty);
		LocalizationConfig.CantTrashFavoritedItemWarning = Config.Bind<string>(text8, "CantTrashFavoritedItemWarning", string.Empty, string.Empty);
		LocalizationConfig.CantTrashHotkeyBarItemWarning = Config.Bind<string>(text8, "CantTrashHotkeyBarItemWarning", string.Empty, string.Empty);
		LocalizationConfig.CantTrashFlagFavoritedItemWarning = Config.Bind<string>(text8, "CantTrashFlagFavoritedItemWarning", string.Empty, string.Empty);
		LocalizationConfig.CantFavoriteTrashFlaggedItemWarning = Config.Bind<string>(text8, "CantFavoriteTrashFlaggedItemWarning", string.Empty, string.Empty);
		LocalizationConfig.FavoritedItemTooltip = Config.Bind<string>(text8, "FavoritedItemTooltip", string.Empty, string.Empty);
		LocalizationConfig.TrashFlaggedItemTooltip = Config.Bind<string>(text8, "TrashFlaggedItemTooltip", string.Empty, string.Empty);
		keyBinds.Clear();
		keyBinds.Add((ConfigEntryBase)(object)ControllerConfig.ControllerDPadUsageModifierKeybind);
		keyBinds.Add((ConfigEntryBase)(object)FavoriteConfig.FavoritingModifierKeybind1);
		keyBinds.Add((ConfigEntryBase)(object)FavoriteConfig.FavoritingModifierKeybind2);
		keyBinds.Add((ConfigEntryBase)(object)QuickStackConfig.QuickStackKeybind);
		keyBinds.Add((ConfigEntryBase)(object)TrashConfig.QuickTrashKeybind);
		keyBinds.Add((ConfigEntryBase)(object)RestockConfig.RestockKeybind);
		keyBinds.Add((ConfigEntryBase)(object)SortConfig.SortKeybind);
		keyBinds.Add((ConfigEntryBase)(object)StoreTakeAllConfig.StoreAllKeybind);
		keyBinds.Add((ConfigEntryBase)(object)StoreTakeAllConfig.TakeAllKeybind);
		keyBinds.Add((ConfigEntryBase)(object)TrashConfig.TrashKeybind);
	}

	internal static void ConfigTemplate_SettingChanged(object sender, EventArgs e)
	{
		GeneralConfig.ConfigTemplate.SettingChanged -= ConfigTemplate_SettingChanged;
		ApplyTemplate(GeneralConfig.ConfigTemplate.Value);
		GeneralConfig.ConfigTemplate.Value = ConfigTemplate.NotCurrentlyLoadingTemplate;
		GeneralConfig.ConfigTemplate.SettingChanged += ConfigTemplate_SettingChanged;
	}

	internal static void ApplyTemplate(ConfigTemplate template)
	{
		if (GeneralConfig.ConfigTemplate.Value == ConfigTemplate.NotCurrentlyLoadingTemplate)
		{
			return;
		}
		HashSet<string> hashSet = new HashSet<string>(keyBinds.Select((ConfigEntryBase a) => a.Definition.Key));
		foreach (KeyValuePair<ConfigDefinition, ConfigEntryBase> item in Config)
		{
			if (!hashSet.Contains(item.Key.Key))
			{
				item.Value.BoxedValue = item.Value.DefaultValue;
			}
		}
		switch (template)
		{
		case ConfigTemplate.BasicControllerKeybinds:
			GeneralConfig.OverrideKeybindBehavior.Value = OverrideKeybindBehavior.DisableAllNewHotkeys;
			ControllerConfig.UseHardcodedControllerSupport.Value = true;
			ControllerConfig.ControllerDPadUsageInInventoryGrid.Value = DPadUsage.Keybinds;
			ControllerConfig.RemoveControllerButtonHintFromTakeAllButton.Value = false;
			break;
		case ConfigTemplate.CustomControllerKeybinds:
			GeneralConfig.OverrideKeybindBehavior.Value = OverrideKeybindBehavior.UseIndividualConfigOptions;
			FavoriteConfig.DisplayFavoriteToggleButton.Value = FavoritingToggling.Disabled;
			ControllerConfig.UseHardcodedControllerSupport.Value = false;
			ControllerConfig.ControllerDPadUsageInInventoryGrid.Value = DPadUsage.InventorySlotMovement;
			ControllerConfig.RemoveControllerButtonHintFromTakeAllButton.Value = true;
			break;
		case ConfigTemplate.MouseAndKeyboardWithButtons:
			GeneralConfig.OverrideKeybindBehavior.Value = OverrideKeybindBehavior.DisableAllNewHotkeys;
			break;
		case ConfigTemplate.MouseAndKeyboardWithHotkeys:
			GeneralConfig.OverrideButtonDisplay.Value = OverrideButtonDisplay.DisableAllNewButtons;
			GeneralConfig.OverrideKeybindBehavior.Value = OverrideKeybindBehavior.UseIndividualConfigOptions;
			break;
		case ConfigTemplate.GoldensChoice:
			GeneralConfig.OverrideKeybindBehavior.Value = OverrideKeybindBehavior.DisableAllNewHotkeys;
			GeneralConfig.OverrideButtonDisplay.Value = OverrideButtonDisplay.UseIndividualConfigOptions;
			GeneralConfig.OverrideHotkeyBarBehavior.Value = OverrideHotkeyBarBehavior.UseIndividualConfigOptions;
			QuickStackRestockConfig.AllowAreaStackingInMultiplayerWithoutMUC.Value = true;
			RestockConfig.RestockOnlyAmmoAndConsumables.Value = false;
			RestockConfig.RestockOnlyFavoritedItems.Value = true;
			break;
		}
		Config.Save();
	}

	internal static void ResetAllFavoritingData_SettingChanged(object sender, EventArgs e)
	{
		ConfigEntry<ResetFavoritingData> resetAllFavoritingData = DebugConfig.ResetAllFavoritingData;
		if (resetAllFavoritingData != null && resetAllFavoritingData.Value == ResetFavoritingData.YesDeleteAllMyFavoritingData)
		{
			DebugConfig.ResetAllFavoritingData.SettingChanged -= ResetAllFavoritingData_SettingChanged;
			DebugConfig.ResetAllFavoritingData.Value = ResetFavoritingData.No;
			DebugConfig.ResetAllFavoritingData.SettingChanged += ResetAllFavoritingData_SettingChanged;
			if ((Object)(object)Player.m_localPlayer != (Object)null)
			{
				UserConfig playerConfig = UserConfig.GetPlayerConfig(Player.m_localPlayer.GetPlayerID());
				playerConfig.ResetAllFavoriting();
			}
		}
	}

	public static bool TryGetOldConfigValue<T>(ConfigDefinition configDefinition, ref T oldValue, bool removeIfFound = true)
	{
		if (!TomlTypeConverter.CanConvert(typeof(T)))
		{
			throw new ArgumentException(string.Format("Type {0} is not supported by the config system. Supported types: {1}", typeof(T), string.Join(", ", (from x in TomlTypeConverter.GetSupportedTypes()
				select x.Name).ToArray())));
		}
		try
		{
			object obj = AccessTools.FieldRefAccess<ConfigFile, object>("_ioLock").Invoke(Config);
			Dictionary<ConfigDefinition, string> dictionary = (Dictionary<ConfigDefinition, string>)AccessTools.PropertyGetter(typeof(ConfigFile), "OrphanedEntries").Invoke(Config, new object[0]);
			lock (obj)
			{
				if (dictionary.TryGetValue(configDefinition, out var value))
				{
					oldValue = (T)TomlTypeConverter.ConvertToValue(value, typeof(T));
					if (removeIfFound)
					{
						dictionary.Remove(configDefinition);
					}
					return true;
				}
			}
		}
		catch (Exception ex)
		{
			Helper.LogO("Error getting orphaned entry: " + ex.StackTrace);
		}
		return false;
	}

	public static void KeyCodeBackwardsCompatibility(ConfigEntry<KeyboardShortcut> configEntry, string sectionName, string oldEntry)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_0012: Expected Obj, but got Unknown
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		KeyCode oldValue = (KeyCode)0;
		if (TryGetOldConfigValue(new ConfigDefinition(sectionName, oldEntry), ref oldValue))
		{
			configEntry.Value = new KeyboardShortcut(oldValue, Array.Empty<KeyCode>());
		}
	}
}
