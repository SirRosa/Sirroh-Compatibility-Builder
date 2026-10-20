using System;
using BepInEx.Configuration;
using UnityEngine;
using Zen.Lib;
using Zen.Lib.Config;
using ZenUI.Section;

namespace ZenUI;

internal static class Configs
{
	public static readonly ConfigEntry<bool> CameraRemoveLensDirt;

	public static readonly ConfigEntry<int> CameraLodBias;

	public static readonly ConfigEntry<FirstPersonMode> CameraFirstPerson;

	public static readonly ConfigEntry<RepositionShipControls> CameraZoomRepositionShipControls;

	public static readonly ConfigEntry<BiomeNoticeType> NoticeShowBiome;

	public static readonly ConfigEntry<bool> NoticeShowPieceRepair;

	public static readonly ConfigEntry<bool> EnableAmmoCount;

	public static readonly ConfigEntry<bool> AutoOpenSkillsPanel;

	public static readonly ConfigEntry<bool> NoSlideAnimation;

	public static readonly ConfigEntry<bool> ColoredFoodBars;

	public static readonly ConfigEntry<bool> ColoredFoodBySimpleMajority;

	public static readonly ConfigEntry<StringList> HideStatusEffects;

	public static readonly ConfigEntry<bool> ChatForceCase;

	public static readonly ConfigEntry<bool> ShowPieceHealthColor;

	public static readonly ConfigEntry<SystemClock.DisplayMode> ShowSystemClock;

	public static readonly ConfigEntry<bool> ThinScrollBars;

	public static readonly ConfigEntry<bool> RescaleContainerGrid;

	public static readonly ConfigEntry<bool> ShowShipHP;

	public static readonly ConfigEntry<bool> ShowShipSailIndicator;

	public static readonly ConfigEntry<KeyCode> TooltipDetailKey;

	public static readonly ConfigEntry<bool> TooltipShowHint;

	public static readonly ConfigEntry<TooltipStyle> TooltipDisplayMode;

	public static readonly ConfigEntry<int> TooltipDelay;

	public static readonly ConfigEntry<bool> TooltipShowTitleNorse;

	public static readonly ConfigEntry<bool> CraftPanelEnabled;

	public static readonly ConfigEntry<bool> CraftPanelTooltipReq;

	public static readonly ConfigEntry<bool> CraftPanelTooltipHover;

	public static readonly ConfigEntry<bool> CraftPanelSearch;

	public static readonly ConfigEntry<Vector2> CraftPanelSearchPosition;

	public static readonly ConfigEntry<bool> CraftPanelSearchResources;

	public static readonly ConfigEntry<bool> CraftPanelSearchArmorSets;

	public static readonly ConfigEntry<bool> CraftPanelSortCraftable;

	public static readonly ConfigEntry<bool> CraftPanelShowAnyKnownStation;

	public static readonly ConfigEntry<bool> CraftPanelHideUncraftableVariants;

	public static readonly ConfigEntry<float> CraftPanelUncraftableBrightness;

	public static readonly ConfigEntry<string> CraftPanelUncraftableSymbol;

	public static readonly ConfigEntry<Color> CraftPanelUncraftableSymbolColor;

	public static readonly ConfigEntry<UncraftableSymbolPosition> CraftPanelUncraftableSymbolPosition;

	public static readonly ConfigEntry<Vector2> CraftPanelInfoPosition;

	public static readonly ConfigEntry<float> CraftPanelScrollSensitivity;

	public static readonly ConfigEntry<bool> CraftPanelUntouchedItemIndicator;

	public static readonly ConfigEntry<Color> CraftPanelUntouchedItemIndicatorColor;

	private static readonly UIColor VanillaSelectGridActivatedColorBlue;

	private static readonly UIColor VanillaSelectMenuActivatedColorOrange;

	public static readonly ConfigEntry<Color> ItemActivatedColor;

	public static readonly ConfigEntry<Color> ItemActivatedHotbarColor;

	public static readonly ConfigEntry<int> InventoryRowsDefault;

	public static readonly ConfigEntry<bool> EnableTakeStacks;

	public static readonly ConfigEntry<bool> RemoveItemFromSmallestStack;

	public static readonly ConfigEntry<bool> StackingCombineExisting;

	public static readonly ConfigEntry<bool> StackingExcludeHotbar;

	public static readonly ConfigEntry<bool> StackingExcludeEquipable;

	public static readonly ConfigEntry<InventoryRules.DropStyle> DiscardStyle;

	public static readonly ConfigEntry<bool> AssignedGearSlots;

	public static readonly ConfigEntry<Color> ItemStackColorFull;

	public static readonly ConfigEntry<Color> ItemStackColorPartial;

	public static readonly ConfigEntry<bool> ItemStackColorApply;

	public static readonly ConfigEntry<InventoryStackAmountText.FormatStyle> ItemStackFormatStyle;

	public static readonly ConfigEntry<Color> DurabilityGood;

	public static readonly ConfigEntry<Color> DurabilityWorn;

	public static readonly ConfigEntry<Color> DurabilityAtRisk;

	public static readonly ConfigEntry<Color> DurabilityBroken;

	public static readonly ConfigEntry<bool> DurabilityColorApply;

	public static readonly ConfigEntry<bool> ShowQualityAsSymbols;

	public static readonly ConfigEntry<bool> Rotate90Degrees;

	public static readonly ConfigEntry<Color> ItemQualitySymbolColor;

	public static readonly ConfigEntry<string> ExtraQualityLevelSym;

	static Configs()
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		//IL_0571: Unknown result type (might be due to invalid IL or missing references)
		//IL_05b3: Unknown result type (might be due to invalid IL or missing references)
		//IL_05e6: Unknown result type (might be due to invalid IL or missing references)
		//IL_0619: Unknown result type (might be due to invalid IL or missing references)
		//IL_061e: Unknown result type (might be due to invalid IL or missing references)
		//IL_063d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0642: Unknown result type (might be due to invalid IL or missing references)
		//IL_064f: Unknown result type (might be due to invalid IL or missing references)
		//IL_066a: Unknown result type (might be due to invalid IL or missing references)
		//IL_066f: Unknown result type (might be due to invalid IL or missing references)
		//IL_067c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0697: Unknown result type (might be due to invalid IL or missing references)
		//IL_069c: Unknown result type (might be due to invalid IL or missing references)
		//IL_06a9: Unknown result type (might be due to invalid IL or missing references)
		//IL_06c4: Unknown result type (might be due to invalid IL or missing references)
		//IL_06e8: Unknown result type (might be due to invalid IL or missing references)
		//IL_06ed: Unknown result type (might be due to invalid IL or missing references)
		//IL_06fa: Unknown result type (might be due to invalid IL or missing references)
		//IL_082c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0864: Unknown result type (might be due to invalid IL or missing references)
		//IL_08e4: Unknown result type (might be due to invalid IL or missing references)
		//IL_0967: Unknown result type (might be due to invalid IL or missing references)
		VanillaSelectGridActivatedColorBlue = new Color(0.376f, 0.66f, 0.897f, 0.761f);
		VanillaSelectMenuActivatedColorOrange = new Color(0.7574f, 0.5042f, 0.1838f, 1f);
		NoticeShowBiome = Config.Define(isAdmin: true, "Notifications", "Show Biome Notification", BiomeNoticeType.PlayerSpawn | BiomeNoticeType.Teleport | BiomeNoticeType.Discovery, $"Show the biome notification on key events.  (Vanilla: {BiomeNoticeType.Discovery})\r\nPlayer spawn, After teleport, First discovery");
		NoticeShowPieceRepair = Config.Define(isAdmin: false, "Notifications", "Show Piece Repair Notifications", defaultValue: false, "Show the notifications when a piece is repaired via the hammer. (Vanilla: true)");
		HideStatusEffects = Config.Define(isAdmin: true, "General", "Hide Status Effects", new StringList { "$se_windrun_name", "$item_beltstrength", "$item_demister" }, "Hide status effect icons from the UI.\r\nSome status effect icons are redundant and noisy and you don't need to see all of them all the time.\r\nDoes not change the internal application of the status effect. It just hides the icon from the UI.\r\nComma separated list of status effect names.  This is usually the translation string name prefixed with $\r\nhttps://valheim-modding.github.io/Jotunn/data/localization/translations/English.html");
		EnableAmmoCount = Config.Define(isAdmin: true, "General", "Enable Ammo Count", defaultValue: true, "When true an icon and count appears on the hotbar with ammo type and count.\r\n[logout required]");
		AutoOpenSkillsPanel = Config.Define(isAdmin: false, "General", "Auto Open Skills Panel", defaultValue: false, "Automatically open the skills panel when the inventory is opened. (vanilla: false)\r\n[logout required]");
		NoSlideAnimation = Config.Define(isAdmin: true, "General", "No Slide Animation", defaultValue: true, "Disable the panel slide animation when opening/closing your inventory. (vanilla: false)\r\nDisabled by default because it draws faster without the sliding animation, and looks better imo.\r\nOn slower hardware the slide animation can appear a bit choppy every time you open/close your inventory.\r\n[logout may be required for changes to take effect]");
		ColoredFoodBars = Config.Define(isAdmin: false, "General", "Colored Food Bars", defaultValue: true, "Colored food bars. (vanilla: false)\r\nTint the background of the food you ate based on the main property of the food: Health = red, stamina = yellow, blue = eitr");
		ColoredFoodBySimpleMajority = Config.Define(isAdmin: true, "General", "Colored Food By Simple Majority", defaultValue: true, "Color the food by a simple majority of whichever type is largest: health, stamina, eitr\r\nVanilla uses a system of majortiy over half which can be misleading when the food type values are close together.\r\n[Vanilla: false]");
		ShowPieceHealthColor = Config.Define(isAdmin: false, "General", "Colored Piece Health Bar", defaultValue: true, "Show the piece health bar as a color gradient: Green > Yellow > Red\r\n(Vanilla: false)");
		ShowPieceHealthColor.SettingChanged += (object _, EventArgs _) =>
		{
			PieceHealthColor.ResetColor();
		};
		ChatForceCase = Config.Define(isAdmin: true, "General", "Chat Force Case", defaultValue: false, "When enabled forces all shouts to be uppercase and all whispers to be lowercase. (vanilla: true)\r\nWhen disabled displays the text as it was written.");
		ShowShipHP = Config.Define(isAdmin: true, "General", "Show Ship HP", defaultValue: true, "The Captain always sees the ship's HP bar next to the wheel.\r\nNOTE: If you are using ZenCombat with DamageText visibility reduced then this is helpful to have enabled.");
		ShowShipSailIndicator = Config.Define(isAdmin: false, "General", "Show Ship Sail Indicator", defaultValue: false, "Show the ship sail indicator.\r\nIf this is disabled the rudder icon will still display.");
		ShowSystemClock = Config.Define(isAdmin: false, "General", "Show System Clock", SystemClock.DisplayMode.SystemMenu, "Show the system clock local time in the bottom right corner so you don't stay up all night or miss an important meeting.\r\nBy default it displays only when you open the system menu (press esc / gamepad start button), you can change it to always display or never display.");
		ThinScrollBars = Config.Define(isAdmin: true, "General", "Thin Scroll Bars", defaultValue: true, "Use subtle scrollbars to cleanup the UI on the Build Menu and Containers so that they are more visually pleasing.\r\nNothing major, just a little bit of refinement to make it look better.  No functional changes.\r\n[logout required for changes to take effect]");
		RescaleContainerGrid = Config.Define(isAdmin: true, "General", "Rescale Container Grid", defaultValue: true, "Rescale the container grid to fit the contents of the Grausten Chest and Wardrobe so that no scrollbar is needed.\r\n[" + ((ConfigEntryBase)NoSlideAnimation).Definition.Key + " must be true for this to work]\r\n[logout required for changes to take effect]");
		CameraFirstPerson = Config.Define(isAdmin: true, "Camera", "First Person Camera", FirstPersonMode.ZoomToEnable, "Set the mode for first person camera to be enabled.\r\n(Vanilla: Disabled)");
		CameraFirstPerson.SettingChanged += (object _, EventArgs _) =>
		{
			CameraRules.SetFirstPersonMode(CameraFirstPerson.Value);
		};
		CameraZoomRepositionShipControls = Config.Define(isAdmin: false, "Camera", "Zoom Reposition Ship Controls", RepositionShipControls.NearCamera, "Set the zoom level that will trigger repositioning the ship controls to the edge of the screen.");
		CameraRemoveLensDirt = Config.Define(isAdmin: true, "Camera", "Remove Lens Dirt", defaultValue: true, "Remove the lens dirt from the camera.\r\n[logout for changes to take effect]");
		CameraLodBias = Config.Define(isAdmin: false, "Camera", "LOD Bias", 5, Config.AcceptRange(0, 10), "Set the LOD Bias for the camera on startup. (Vanilla: 2) (Vanilla max: 5)\r\nHigher values render objects farther away.  Lower this if you have a slow computer.\r\nSet to 0 to disable this config and use vanilla or other mods to set this value instead.");
		CameraLodBias.SettingChanged += (object _, EventArgs _) =>
		{
			CameraRules.SetLodBias(CameraLodBias.Value);
		};
		TooltipShowTitleNorse = Config.Define(isAdmin: false, "Tooltips", "Show Title Font Norse", defaultValue: true, "Style the title font with Norse Bold to match the rest of the UI.\r\n[game restart required for changes to take effect]");
		TooltipDelay = Config.Define(isAdmin: false, "Tooltips", "Display Delay", -1, Config.AcceptRange(-1, 10), "How long of a delay before the tooltip should appear? (Vanilla: 5)\r\nLower numbers are faster. 0 is instant.\r\nSet to -1 to disable this config.");
		TooltipDetailKey = Config.Define<KeyCode>(isAdmin: false, "Tooltips", "Show Details Key", (KeyCode)308, "Hide the visual clutter for item tooltips behind a keypress.\r\nMost of the time you do not need to see the full details with every mouse hover.\r\nFull details are shown when this key is held down.\r\nGamepad: This is always Button-Y and can not be changed.");
		TooltipShowHint = Config.Define(isAdmin: false, "Tooltips", "Show Details Key Hint", defaultValue: true, "Show or hide the " + ((ConfigEntryBase)TooltipDetailKey).Definition.Key + " hint on the lower right portion of the tooltip.");
		TooltipDisplayMode = Config.Define(isAdmin: false, "Tooltips", "Display Style", TooltipStyle.Iconic, string.Format("Most of the time you are already familiar with what an item is after viewing it a few times.\r\nToo much information can clutter the UI and make it hard to find important information.\r\nMost of the time you only need to know the summary info at a glance:\r\n- {0}: Only essential text and total stack weight. No extra numbers or icons.\r\n- {1}: All of {2} plus additional icons for attack, defense, magic, food, etc.\r\n- {3}: Full data with every hover. Vanilla's raw data dump.\r\nYou can switch to {4} at any time by holding the {5}.\r\n(Vanilla: {6})", new object[7]
		{
			TooltipStyle.Abstract,
			TooltipStyle.Iconic,
			TooltipStyle.Abstract,
			TooltipStyle.Detailed,
			TooltipStyle.Detailed,
			((ConfigEntryBase)TooltipDetailKey).Definition.Key,
			TooltipStyle.Detailed
		}));
		EnableTakeStacks = Config.Define(isAdmin: false, "Inventory", "Enable Take Stacks", defaultValue: true, "When enabled the Take All button changes behavior to three states instead of one. (Vanilla: false)\r\nThe state changes based on the condition of the inventory:\r\n- Take stacks: Unfilled stacks in the player's inventory are filled (example: refill ammo). (ignores weight).\r\n- Take weight: If there are no stacks that can be filled, the button will take items up to max weight.\r\n- Take all: Press again, items are moved to inventory via vanilla behavior (ignores weight).");
		DiscardStyle = Config.Define(isAdmin: false, "Inventory", "Drop Style", InventoryRules.DropStyle.CameraDirection, "When dropping items on the ground throw them towards the camera instead of\r\nthe vanilla method of chucking them in the direction the character is facing");
		RemoveItemFromSmallestStack = Config.Define(isAdmin: false, "Inventory", "Use From Smallest Stack First", defaultValue: true, "When items are automatically removed from your inventory, such as when fueling a fireplace or crafting,\r\nalways draw from the smallest stacks first");
		StackingCombineExisting = Config.Define(isAdmin: false, "Inventory", "Stacking - Combine Existing", defaultValue: true, "When stacking items into a container the existing items are combined into as few slots as possible. (Vanilla: false)");
		StackingExcludeHotbar = Config.Define(isAdmin: false, "Inventory", "Stacking - Exclude Hotbar", defaultValue: true, "When stacking items into a container any items on the hotbar are skipped. (Vanilla: false)");
		StackingExcludeEquipable = Config.Define(isAdmin: false, "Inventory", "Stacking - Exclude Equipable", defaultValue: true, "When stacking items into a container any equipable items are skipped. (Vanilla: false)");
		ItemStackColorApply = Config.Define(isAdmin: false, "Inventory", "Show Full Stack Colored", defaultValue: true, "Show full stacks as a different colored text");
		ItemStackFormatStyle = Config.Define(isAdmin: false, "Inventory", "Show Full Stack Style", InventoryStackAmountText.FormatStyle.HideMaxWhenFull, "How should full stacks be displayed?\r\n- Vanilla: X/Y\r\n- HideMaxWhenFull: X only when full, otherwise X/Y\r\n- HideMaxAlways: X only\r\nYou can also press " + ((ConfigEntryBase)TooltipDetailKey).Definition.Section + "." + ((ConfigEntryBase)TooltipDetailKey).Definition.Key + " to view the full stack.");
		DurabilityColorApply = Config.Define(isAdmin: false, "Inventory", "Show Durability Bar Colors", defaultValue: true, "Show item durability bars with colors based on the durability level");
		InventoryRowsDefault = Config.Define(isAdmin: true, "Inventory", "Inventory Rows Default", -1, Config.AcceptRange(-1, 6), "CAUTION: This applies to all players on the server when installed on the server and client.\r\nNumber of inventory rows that a player starts the game with.\r\nSet to -1 to disable this config. (Vanilla: 3 + hotbar)\r\nThere are merchant items you can buy to expand your inventory size through progression.\r\nThis setting has no effect if the player key \"invrows\" is already set.\r\nYou must remove it before login or this config will not work: \"removekeyplayer invrows num\"\r\nVanilla also has a console command to adjust size locally: inventorysize\r\nServer admin can adjust other player's keys via the \"relay\" command in Zen.ModLib\r\n[logout required for changes to take effect]");
		AssignedGearSlots = Config.Define(isAdmin: false, "Inventory Equip", "Assigned Gear Slots", defaultValue: true, "When gear is equipped it always moves to the same pre-configured slot (Vanilla: false)");
		InventoryEquip.InitConfigs("Inventory Equip");
		ItemActivatedColor = Config.Define<Color>(false, "Item Colors", "Activated Color", (Color)VanillaSelectMenuActivatedColorOrange, $"Background color when the item is activated (equipped / selected)\r\nVanilla blue color: {VanillaSelectGridActivatedColorBlue}\r\nVanilla orange color: {VanillaSelectMenuActivatedColorOrange}");
		ItemActivatedHotbarColor = Config.Define<Color>(isAdmin: false, "Item Colors", "Activated Color - Hotbar", new Color(0.35f, 0.35f, 0.35f, 0.55f), $"Background color when the item is activated on the hotbar.\r\nVanilla blue color: {VanillaSelectGridActivatedColorBlue}\r\nVanilla orange color: {VanillaSelectMenuActivatedColorOrange}");
		ItemStackColorFull = Config.Define<Color>(isAdmin: false, "Item Colors", "Item Stack Color - Full", UIColor.ValheimYellow.Color, "The color of the item stack when the item stack is full. (vanilla: white)");
		ItemStackColorPartial = Config.Define<Color>(isAdmin: false, "Item Colors", "Item Stack Color - Partial", Color32.op_Implicit(new Color32((byte)221, (byte)221, (byte)221, byte.MaxValue)), "The color of the item stack when the item stack is incomplete. (vanilla: white)");
		Color green = Color.green;
		green.a = 0.2f;
		DurabilityGood = Config.Define<Color>(isAdmin: false, "Item Colors", "Durability 1 - Good", green, "Durability bar color when durability is good");
		green = Color.yellow;
		green.a = 0.5f;
		DurabilityWorn = Config.Define<Color>(isAdmin: false, "Item Colors", "Durability 2 - Worn", green, "Durability bar color when durability is worn");
		green = Color.red;
		green.a = 0.7f;
		DurabilityAtRisk = Config.Define<Color>(isAdmin: false, "Item Colors", "Durability 3 - At Risk", green, "Durability bar color when durability is at risk of breaking");
		DurabilityBroken = Config.Define<Color>(isAdmin: false, "Item Colors", "Durability 4 - Broken", Color.gray, "Durability bar color when item is broken");
		green = UIColor.LightYellow.Color;
		green.a = 0.6f;
		ItemQualitySymbolColor = Config.Define<Color>(isAdmin: false, "Item Colors", "Symbol Color", green, "Color of the item quality symbols");
		ShowQualityAsSymbols = Config.Define(isAdmin: true, "Item Quality Symbols", "Show Quality As Symbols", defaultValue: true, "Item quality is shown as symbols instead of numbers on the inventory grid.");
		Rotate90Degrees = Config.Define(isAdmin: true, "Item Quality Symbols", "Rotate Symbols 90 Degrees", defaultValue: false, "The quality symbols are rotated 90 degrees to display them vertically instead of horizontally. This is only used if Show Quality As Symbols is enabled.");
		ExtraQualityLevelSym = Config.Define(isAdmin: true, "Item Quality Symbols", "Extra Level Symbols", "★", "The sequence of symbols used to display the quality level. The first symbol is always the dots and can not be changed.\r\nEach symbol adds 4 levels. Preconfigured with 1 symobl so 8 levels supported: Vanilla 4 + 1 symbol x 4 more levels.\r\nSo if you wanted to add 8 more levels for a total of 12 levels (4 + 8), you would add 2 more symbols to the end of the sequence.\r\nHere are some extra symbols you can try.  Not all unicode works, These are known to work: ★✽◈⚡▲\r\nExample: ★▲ would be 4 vanilla levels + 4 more levels for ★ + 4 more levels for ▲\r\nNOTE: If your item level exceeds this value it will be displayed as a number instead of a symbol.");
		CraftPanelEnabled = Config.Define(isAdmin: false, "Crafting Panel", "Enable Panel", defaultValue: true, "Replace the vanilla crafting panel with a visual icon style with sorting and grouping. (vanilla: false)\r\n[logout required for changes to take effect]");
		CraftPanelTooltipHover = Config.Define(isAdmin: false, "Crafting Panel", "Tooltip - Show Hover Item", defaultValue: true, "When using a mouse enable tooltips when hovering over an item in the crafting panel grid.");
		CraftPanelTooltipReq = Config.Define(isAdmin: false, "Crafting Panel", "Tooltip - Show Requirements", defaultValue: true, "Enable full tooltips on the item requirements. (vanilla: false)\r\n[logout required for changes to take effect]");
		CraftPanelSortCraftable = Config.Define(isAdmin: false, "Crafting Panel", "Sort Craftable Together", defaultValue: true, "Show all craftable items together sorted to the top of the list.\r\n[close/open your UI for changes to take effect]");
		CraftPanelHideUncraftableVariants = Config.Define(isAdmin: false, "Crafting Panel", "Hide Uncraftable Variants", defaultValue: true, "Enabled: Variants will only be shown when the item can be crafted. This reduces clutter by hiding variants for items that can not be crafted.\r\nDisabled: Variants will always be shown, even if the item can not be crafted.");
		CraftPanelShowAnyKnownStation = Config.Define(isAdmin: true, "Crafting Panel", "Show Any Known Station", defaultValue: true, "When not at a crafting station show all known items from any known station.\r\nThis lets you easily recall the recipe of an item which aids in locating the resources.\r\nIf you have ZenSign installed then you can middle-click the recipe ingredient and find the\r\nresources in nearby containers.\r\nNOTE: You can not craft the item without being at the correct station.\r\nThe required station is displayed at the top of the panel.");
		CraftPanelUntouchedItemIndicator = Config.Define(isAdmin: false, "Crafting Panel", "Untouched Item Indicator", defaultValue: true, "Show an indicator on the items that you have never crafted or held in your inventory.\r\n[close/open your UI for changes to take effect]");
		CraftPanelUntouchedItemIndicatorColor = Config.Define<Color>(isAdmin: false, "Crafting Panel", "Untouched Item Indicator Color", UIColor.ValheimTooltipTitle.Color, "Set the color for " + ((ConfigEntryBase)CraftPanelUntouchedItemIndicator).Definition.Key + "\r\n[close/open your UI for changes to take effect]");
		CraftPanelInfoPosition = Config.Define<Vector2>(isAdmin: false, "Crafting Panel", "Adjust Info Position", Vector2.zero, "Item info position offset. Positive X is right, positive Y is up.\r\nUse this to compensate for mods that add extra long tooltip information.\r\n[logout required for changes to take effect]");
		CraftPanelUncraftableBrightness = Config.Define(isAdmin: false, "Crafting Panel", "Uncraftable Brightness", 0f, Config.AcceptRange(0f, 1f), "Uncraftable items are displayed with this level of brightness.\r\nWhen set to 0 then black & white is used instead of the item color.");
		CraftPanelUncraftableSymbol = Config.Define(isAdmin: false, "Crafting Panel", "Uncraftable Symbol", "X", "Display this symbol over items that can not be crafted\r\nSome people have different visual distinction prefernces.");
		CraftPanelUncraftableSymbolColor = Config.Define<Color>(isAdmin: false, "Crafting Panel", "Uncraftable Symbol Color", new Color(0.667f, 0.2f, 0f, 0.8f), "The color of the symbol over uncraftable items.");
		CraftPanelUncraftableSymbolPosition = Config.Define(isAdmin: false, "Crafting Panel", "Uncraftable Symbol Position", UncraftableSymbolPosition.None, "Position of the uncraftable symbol.");
		CraftPanelScrollSensitivity = Config.Define(isAdmin: false, "Crafting Panel", "Scroll Sensitivity", 1f, Config.AcceptRange(0.01f, 5f), "Scroll wheel sensitivity in the crafting panel.\r\n[logout required for changes to take effect]");
		CraftPanelSearch = Config.Define(isAdmin: false, "Crafting Panel - Search", "Enable", defaultValue: true, "Enable the crafting panel search filter text box, does not function without panel enabled.\r\n[logout required for changes to take effect]");
		CraftPanelSearchPosition = Config.Define<Vector2>(isAdmin: false, "Crafting Panel - Search", "Adjust Position", Vector2.zero, "Adjust the search filter's text box position. Positive X is right, positive Y is up.");
		CraftPanelSearchResources = Config.Define(isAdmin: false, "Crafting Panel - Search", "Search Resource Requirements", defaultValue: true, "When searching the crafting panel, also search the recipe's resource requirements for matching items.");
		CraftPanelSearchArmorSets = Config.Define(isAdmin: false, "Crafting Panel - Search", "Search Armor Sets", defaultValue: true, "When searching the crafting panel, also search the gear set names for matching items.");
		CraftingPanel.InitExplicitGroupConfigs();
	}
}
