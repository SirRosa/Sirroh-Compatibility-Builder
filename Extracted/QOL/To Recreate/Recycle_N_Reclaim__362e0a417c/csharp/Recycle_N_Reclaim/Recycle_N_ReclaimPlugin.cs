using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using Auga;
using BepInEx;
using BepInEx.Configuration;
using BepInEx.Logging;
using EpicLootAPI;
using HarmonyLib;
using JetBrains.Annotations;
using LocalizationManager;
using Recycle_N_Reclaim.GamePatches.MarkAsTrash;
using Recycle_N_Reclaim.GamePatches.Recycling;
using Recycle_N_Reclaim.GamePatches.UI;
using Recycle_N_Reclaim.YAMLStuff;
using ServerSync;
using UnityEngine;

namespace Recycle_N_Reclaim;

[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
[BepInPlugin("Azumatt.Recycle_N_Reclaim", "Recycle_N_Reclaim", "1.4.5")]
[BepInDependency(/*Could not decode attribute arguments.*/)]
[BepInDependency(/*Could not decode attribute arguments.*/)]
public class Recycle_N_ReclaimPlugin : BaseUnityPlugin
{
	[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)]
	public enum Toggle
	{
		On = 1,
		Off = 0
	}

	[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
	private class ConfigurationManagerAttributes
	{
		[UsedImplicitly]
		public int? Order;

		[UsedImplicitly]
		public bool? Browsable;

		[UsedImplicitly]
		public string Category;

		[UsedImplicitly]
		public Action<ConfigEntryBase> CustomDrawer;
	}

	[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
	private class AcceptableShortcuts : AcceptableValueBase
	{
		public AcceptableShortcuts()
			: base(typeof(KeyboardShortcut))
		{
		}

		public override object Clamp(object value)
		{
			return value;
		}

		public override bool IsValid(object value)
		{
			return true;
		}

		public override string ToDescriptionString()
		{
			return "# Acceptable values: " + string.Join(", ", UnityInput.Current.SupportedKeyCodes);
		}
	}

	internal const string ModName = "Recycle_N_Reclaim";

	internal const string ModVersion = "1.4.5";

	internal const string Author = "Azumatt";

	private const string ModGUID = "Azumatt.Recycle_N_Reclaim";

	private static string ConfigFileName = "Azumatt.Recycle_N_Reclaim.cfg";

	private static string ConfigFileFullPath = Paths.ConfigPath + Path.DirectorySeparatorChar + ConfigFileName;

	internal static string ConnectionError = "";

	public static bool HasAuga;

	public static bool HasEpicLoot;

	private ContainerRecyclingButtonHolder _containerRecyclingButton;

	private readonly Harmony _harmony = new Harmony("Azumatt.Recycle_N_Reclaim");

	public static readonly ManualLogSource Recycle_N_ReclaimLogger = Logger.CreateLogSource("Recycle_N_Reclaim");

	internal static readonly ConfigSync ConfigSyncVar = new ConfigSync("Azumatt.Recycle_N_Reclaim")
	{
		DisplayName = "Recycle_N_Reclaim",
		CurrentVersion = "1.4.5",
		MinimumRequiredVersion = "1.4.5"
	};

	internal static readonly string yamlFileName = "Azumatt.Recycle_N_Reclaim_ExcludeLists.yml";

	internal static readonly string yamlPath = Paths.ConfigPath + Path.DirectorySeparatorChar + yamlFileName;

	internal static readonly CustomSyncedValue<string> RNRExcludeListData = new CustomSyncedValue<string>(ConfigSyncVar, "RNR_YamlData", "");

	internal static Root yamlData = new Root();

	internal static Dictionary<string, HashSet<string>> predefinedGroups = new Dictionary<string, HashSet<string>>();

	private static ConfigEntry<Toggle> _serverConfigLocked = null;

	public static ConfigEntry<Toggle> ApplyCraftedBy = null;

	public static ConfigEntry<KeyboardShortcut> hotKey = null;

	public static ConfigEntry<Toggle> discardInvEnabled = null;

	public static ConfigEntry<Toggle> lockToAdmin = null;

	public static ConfigEntry<Toggle> returnUnknownResources = null;

	public static ConfigEntry<Toggle> returnEnchantedResources = null;

	public static ConfigEntry<float> returnResources = null;

	private ConfigEntry<string> _stationFilterListString;

	public static List<string> StationFilterList = new List<string>();

	public static ConfigEntry<float> RecipeListScrollSpeedMultiplier = null;

	public static ConfigEntry<Toggle> StationFilterEnabled = null;

	public static ConfigEntry<Toggle> EnableExperimentalCraftingTabUI = null;

	public static ConfigEntry<Toggle> NotifyOnSalvagingImpediments = null;

	public static ConfigEntry<Toggle> PreventZeroResourceYields = null;

	public static ConfigEntry<Toggle> UnstackableItemsAlwaysReturnAtLeastOneResource = null;

	public static ConfigEntry<float> RecyclingRate = null;

	public static ConfigEntry<Toggle> ContainerRecyclingEnabled = null;

	public static ConfigEntry<Toggle> IgnoreItemsOnHotbar = null;

	public static ConfigEntry<Vector3> ContainerRecyclingButtonPositionJsonString = null;

	public static ConfigEntry<Toggle> AllowRecyclingUnknownRecipes = null;

	public static ConfigEntry<Toggle> DebugAlwaysDumpAnalysisContext = null;

	public static ConfigEntry<Toggle> DebugAllowSpammyLogs = null;

	public static ConfigEntry<Toggle> HideEquippedItemsInRecyclingTab = null;

	public static ConfigEntry<Toggle> RequireExactCraftingStationForRecycling = null;

	public static ConfigEntry<Toggle> returnEnchantedResourcesReclaiming = null;

	public static ConfigEntry<Color> BorderColorTrashedItem = null;

	public static ConfigEntry<Color> BorderColorTrashedSlot = null;

	public static ConfigEntry<bool> DisplayTooltipHint = null;

	public static ConfigEntry<bool> ShowRecycleYieldInTooltip = null;

	public static ConfigEntry<KeyboardShortcut> UndoRecycleKeybind = null;

	public static ConfigEntry<float> UndoRecycleGracePeriodSeconds = null;

	public static ConfigEntry<KeyboardShortcut> TrashingModifierKeybind1 = null;

	public static ConfigEntry<KeyboardShortcut> TrashingKeybind = null;

	public static ConfigEntry<string> TrashedSlotTooltip = null;

	public static StationRecyclingTabHolder RecyclingTabButtonHolder { get; private set; }

	private ConfigEntry<string> StationFilterListString
	{
		get
		{
			return _stationFilterListString;
		}
		set
		{
			_stationFilterListString = value;
			value.SettingChanged += [_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (object sender, EventArgs args) =>
			{
				SplitNewValueAndSetProperty();
			};
			SplitNewValueAndSetProperty();
			void SplitNewValueAndSetProperty()
			{
				StationFilterList = (from entry in value.Value.Split(',')
					select entry.Trim()).ToList();
			}
		}
	}

	public void Awake()
	{
		//IL_007b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0086: Expected Obj, but got Unknown
		//IL_00b3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00be: Expected Obj, but got Unknown
		//IL_00d1: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f0: Expected Obj, but got Unknown
		//IL_0186: Unknown result type (might be due to invalid IL or missing references)
		//IL_01dc: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ff: Unknown result type (might be due to invalid IL or missing references)
		//IL_0326: Unknown result type (might be due to invalid IL or missing references)
		//IL_039e: Unknown result type (might be due to invalid IL or missing references)
		Localizer.Load();
		_serverConfigLocked = config("1 - General", "Lock Configuration", Toggle.On, "If on, the configuration is locked and can be changed by server admins only.");
		ConfigSyncVar.AddLockingConfigEntry<Toggle>(_serverConfigLocked);
		ApplyCraftedBy = config("1 - General", "Apply Crafted By", Toggle.On, "If on, the player will be the 'crafter' of each recycled item. If off, these values are empty");
		string text = "2 - Inventory Recycle";
		discardInvEnabled = config(text, "Enabled", Toggle.On, new ConfigDescription("If on, you'll be able to discard things inside of the player inventory.", (AcceptableValueBase)null, new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Order = 2
			}
		}));
		lockToAdmin = config(text, "Lock to Admin", Toggle.On, new ConfigDescription("If on, only admin's can use this feature.", (AcceptableValueBase)null, new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Order = 1
			}
		}));
		hotKey = config<KeyboardShortcut>(text, "DiscardHotkey(s)", new KeyboardShortcut((KeyCode)127, Array.Empty<KeyCode>()), new ConfigDescription("The hotkey to discard an item or regain resources. Must be enabled", (AcceptableValueBase)(object)new AcceptableShortcuts(), Array.Empty<object>()), synchronizedSetting: false);
		returnUnknownResources = config(text, "ReturnUnknownResources", Toggle.Off, "If on, discarding an item in the inventory will return resources if recipe is unknown");
		returnEnchantedResources = config(text, "ReturnEnchantedResources", Toggle.On, "If on and Epic Loot or Jewelcrafting is installed, discarding an item in the inventory will return resources for Epic Loot enchantments or Jewelcrafting gems");
		returnResources = config(text, "ReturnResources", 1f, "Fraction of resources to return (0.0 - 1.0). This setting is forced to be between 0 and 1. Any higher or lower values will be set to 0 or 1 respectively.");
		returnResources.SettingChanged += [_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (object sender, EventArgs args) =>
		{
			if (returnResources.Value > 1f)
			{
				returnResources.Value = 1f;
			}
			if (returnResources.Value < 0f)
			{
				returnResources.Value = 0f;
			}
		};
		string text2 = "While this & right click are held, hovering over items marks them for trashing. Releasing this will cancel trashing for all items.";
		BorderColorTrashedSlot = config<Color>(text, "BorderColorTrashedItem", new Color(1f, 0f, 0f), "Color of the border for slots containing Trashed items.", synchronizedSetting: false);
		DisplayTooltipHint = config(text, "DisplayTooltipHint", value: true, "Whether to add additional info the item tooltip of a Trashed or trash flagged item.", synchronizedSetting: false);
		ShowRecycleYieldInTooltip = config(text, "ShowRecycleYieldInTooltip", value: false, "If on, hovering an item will show what it would yield if recycled.", synchronizedSetting: false);
		TrashingKeybind = config<KeyboardShortcut>(text, "TrashingKeybind", new KeyboardShortcut((KeyCode)325, Array.Empty<KeyCode>()), "Key(s) that when pressed while holding your modifier key will trash all items marked as trash. Default setting is middle mouse click", synchronizedSetting: false);
		TrashingModifierKeybind1 = config<KeyboardShortcut>(text, "TrashingModifierKeybind1", new KeyboardShortcut((KeyCode)120, Array.Empty<KeyCode>()), text2 + ".", synchronizedSetting: false);
		TrashedSlotTooltip = config(text, "TrashedSlotTooltip", "Slot is Trashed and will be a part of the bulk delete", string.Empty, synchronizedSetting: false);
		RecyclingRate = config("3 - Reclaiming", "RecyclingRate", 0.5f, "Rate at which the resources are recycled. Value must be between 0 and 1.\nThe mod always rolls *down*, so if you were supposed to get 2.5 items, you would only receive 2. If the recycling rate is 0.5 (50%), the player will receive half of the resources they would usually need to craft the item, assuming a single item in a stack and the item is of quality level 1. If the item is of higher quality, the resulting yield would be higher as well.");
		RecyclingRate.SettingChanged += [_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (object sender, EventArgs args) =>
		{
			if (RecyclingRate.Value > 1f)
			{
				RecyclingRate.Value = 1f;
			}
			if (RecyclingRate.Value < 0f)
			{
				RecyclingRate.Value = 0f;
			}
		};
		UnstackableItemsAlwaysReturnAtLeastOneResource = config("3 - Reclaiming", "UnstackableItemsAlwaysReturnAtLeastOneResource", Toggle.On, "If enabled and recycling a specific _unstackable_ item would yield 0 of a material,\ninstead you will receive 1. If disabled, you get nothing.");
		RequireExactCraftingStationForRecycling = config("3 - Reclaiming", "RequireExactCraftingStationForRecycling", Toggle.On, "If enabled, recycling will also check for the required crafting station type and level.\nIf disabled, will ignore all crafting station requirements altogether.\nEnabled by default, to keep things close to how Valheim operates.");
		returnEnchantedResourcesReclaiming = config("3 - Reclaiming", "ReturnEnchantedResources", Toggle.On, "If on and Epic Loot or Jewelcrafting is installed, discarding an item in the inventory will return resources for Epic Loot enchantments or Jewelcrafting gems");
		PreventZeroResourceYields = config("3 - Reclaiming", "PreventZeroResourceYields", Toggle.On, "If enabled and recycling an item that would yield 0 of any material,\ninstead you will receive 1. If disabled, you get nothing.");
		AllowRecyclingUnknownRecipes = config("3 - Reclaiming", "AllowRecyclingUnknownRecipes", Toggle.Off, "If enabled, it will allow you to recycle items that you do not know the recipe for yet.\nDisabled by default as this can be cheaty, but sometimes required due to people losing progress.");
		UndoRecycleKeybind = config<KeyboardShortcut>("3 - Reclaiming", "UndoRecycleKeybind", new KeyboardShortcut((KeyCode)122, new KeyCode[1] { (KeyCode)306 }), "Keybind to undo the last reclaim from the Reclaim tab. Only works within the grace period.", synchronizedSetting: false);
		UndoRecycleGracePeriodSeconds = config("3 - Reclaiming", "UndoRecycleGracePeriodSeconds", 20f, "Number of seconds after a reclaim during which it can be undone. Set to 0 to disable undo entirely.");
		UndoRecycleGracePeriodSeconds.SettingChanged += [_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (object sender, EventArgs args) =>
		{
			if (UndoRecycleGracePeriodSeconds.Value < 0f)
			{
				UndoRecycleGracePeriodSeconds.Value = 0f;
			}
		};
		ContainerRecyclingButtonPositionJsonString = config<Vector3>("4 - UI", "ContainerButtonPosition", new Vector3(496f, -374f, -1f), "The last saved recycling button position stored in JSON");
		ContainerRecyclingEnabled = config("4 - UI", "ContainerRecyclingEnabled", Toggle.On, "If enabled, the mod will display the container recycling button");
		NotifyOnSalvagingImpediments = config("4 - UI", "NotifyOnSalvagingImpediments", Toggle.On, "If enabled and recycling a specific item runs into any issues, the mod will print a message\nin the center of the screen (native Valheim notification). At the time of implementation,\nthis happens in the following cases:\n - not enough free slots in the inventory to place the resulting resources\n - player does not know the recipe for the item\n - if enabled, cases when `PreventZeroResourceYields` kicks in and prevent the crafting");
		EnableExperimentalCraftingTabUI = config("4 - UI", "EnableExperimentalCraftingTabUI", Toggle.On, "If enabled, will display the experimental work in progress crafting tab UI\nEnabled by default.");
		HideEquippedItemsInRecyclingTab = config("4 - UI", "HideRecipesForEquippedItems", Toggle.On, "If enabled, it will hide equipped items in the crafting tab.\nThis does not make the item recyclable and only influences whether or not it's shown.\nEnabled by default.");
		IgnoreItemsOnHotbar = config("4 - UI", "IgnoreItemsOnHotbar", Toggle.On, "If enabled, it will hide hotbar items in the crafting tab.\nEnabled by default.");
		RecipeListScrollSpeedMultiplier = config("4 - UI", "RecipeListScrollSpeedMultiplier", 10f, "Multiplies how far the mouse wheel scrolls the crafting/reclaim recipe list.\nNewer Unity reports much smaller wheel deltas, which turned vanilla's 40 into a crawl.\n10 is the default. Set it to 1 for vanilla speed, or up to 20 if it still crawls (Linux\nand Proton are the worst for this).", synchronizedSetting: false);
		RecipeListScrollSpeedMultiplier.SettingChanged += [_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (object _, EventArgs _) =>
		{
			RecipeListScroll.Apply();
		};
		StationFilterEnabled = config("4 - UI", "StationFilterEnabled", Toggle.On, "If enabled, will filter all recycling recipes based on the crafting station\nused to produce said item. Main purpose of this is to prevent showing food\nas a recyclable item, but can be extended further if needed.\nEnabled by default");
		StationFilterListString = config("4 - UI", "StationFilterList", "piece_cauldron", "Comma separated list of crafting stations (by their \"prefab name\")\nrecipes from which should be ignored in regards to recycling.\nMain purpose of this is to prevent showing food as a recyclable item,\nbut can be extended further if needed.\n\nFull list of stations used in recipes as of 0.216.9:\n- identifier: `forge` in game name: Forge\n- identifier: `blackforge` in game name: Black Forge\n- identifier: `piece_workbench` in game name: Workbench\n- identifier: `piece_cauldron` in game name: Cauldron\n- identifier: `piece_stonecutter` in game name: Stonecutter\n- identifier: `piece_artisanstation` in game name: Artisan table\n- identifier: `piece_magetable` in game name: Galdr table\n");
		DebugAlwaysDumpAnalysisContext = config("zDebug", "DebugAlwaysDumpAnalysisContext", Toggle.Off, "If enabled will dump a complete detailed recycling report every time. This is taxing in terms\nof performance and should only be used when debugging issues. ");
		DebugAllowSpammyLogs = config("zDebug", "DebugAllowSpammyLogs", Toggle.Off, "If enabled, will spam recycling checks to the console.\nVERY. VERY. SPAMMY. Influences performance. ");
		if (!File.Exists(yamlPath))
		{
			YAMLUtils.WriteConfigFileFromResource(yamlPath);
		}
		RNRExcludeListData.ValueChanged += OnValChangedUpdate;
		RNRExcludeListData.AssignLocalValue(File.ReadAllText(yamlPath));
		Assembly executingAssembly = Assembly.GetExecutingAssembly();
		_harmony.PatchAll(executingAssembly);
		SetupWatcher();
	}

	private void Start()
	{
		InventoryGridUpdateGuiPatch.border = loadSprite("trashingborder.png");
		AutoDoc();
		HasAuga = API.IsLoaded();
		HasEpicLoot = EpicLoot.IsLoaded();
		_containerRecyclingButton = ((Component)this).gameObject.AddComponent<ContainerRecyclingButtonHolder>();
		_containerRecyclingButton.OnRecycleAllTriggered += ContainerRecyclingTriggered;
		RecyclingTabButtonHolder = ((Component)this).gameObject.AddComponent<StationRecyclingTabHolder>();
		if (HasEpicLoot)
		{
			Recycle_N_ReclaimLogger.LogDebug((object)("Epic Loot " + EpicLoot.GetPluginVersion() + " found, providing compatibility"));
		}
	}

	internal static Sprite loadSprite(string name)
	{
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		Texture2D val = loadTexture(name);
		if ((Object)(object)val != (Object)null)
		{
			return Sprite.Create(val, new Rect(0f, 0f, (float)((Texture)val).width, (float)((Texture)val).height), Vector2.zero);
		}
		return null;
	}

	private static Texture2D loadTexture(string name)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Expected Obj, but got Unknown
		//IL_001f: Expected Obj, but got Unknown
		Texture2D val = new Texture2D(0, 0);
		ImageConversion.LoadImage(val, ReadEmbeddedFileBytes("Assets." + name));
		return val;
	}

	private static byte[] ReadEmbeddedFileBytes(string name)
	{
		using MemoryStream memoryStream = new MemoryStream();
		Assembly.GetExecutingAssembly().GetManifestResourceStream(Assembly.GetExecutingAssembly().GetName().Name + "." + name).CopyTo(memoryStream);
		return memoryStream.ToArray();
	}

	private void AutoDoc()
	{
	}

	private void OnDestroy()
	{
		((BaseUnityPlugin)this).Config.Save();
	}

	private void SetupWatcher()
	{
		FileSystemWatcher fileSystemWatcher = new FileSystemWatcher(Paths.ConfigPath, ConfigFileName);
		fileSystemWatcher.Changed += ReadConfigValues;
		fileSystemWatcher.Created += ReadConfigValues;
		fileSystemWatcher.Renamed += ReadConfigValues;
		fileSystemWatcher.IncludeSubdirectories = true;
		fileSystemWatcher.SynchronizingObject = ThreadingHelper.SynchronizingObject;
		fileSystemWatcher.EnableRaisingEvents = true;
		FileSystemWatcher fileSystemWatcher2 = new FileSystemWatcher(Paths.ConfigPath, yamlFileName);
		fileSystemWatcher2.Changed += ReadYamlFiles;
		fileSystemWatcher2.Created += ReadYamlFiles;
		fileSystemWatcher2.Renamed += ReadYamlFiles;
		fileSystemWatcher2.IncludeSubdirectories = true;
		fileSystemWatcher2.SynchronizingObject = ThreadingHelper.SynchronizingObject;
		fileSystemWatcher2.EnableRaisingEvents = true;
	}

	private void ReadConfigValues(object sender, FileSystemEventArgs e)
	{
		if (!File.Exists(ConfigFileFullPath))
		{
			return;
		}
		try
		{
			Recycle_N_ReclaimLogger.LogDebug((object)"ReadConfigValues called");
			((BaseUnityPlugin)this).Config.Reload();
		}
		catch
		{
			Recycle_N_ReclaimLogger.LogError((object)("There was an issue loading your " + ConfigFileName));
			Recycle_N_ReclaimLogger.LogError((object)"Please check your config entries for spelling and format!");
		}
	}

	private void ReadYamlFiles(object sender, FileSystemEventArgs e)
	{
		if (!File.Exists(yamlPath))
		{
			return;
		}
		try
		{
			Recycle_N_ReclaimLogger.LogDebug((object)"ReadConfigValues called");
			RNRExcludeListData.AssignLocalValue(File.ReadAllText(yamlPath));
		}
		catch
		{
			Recycle_N_ReclaimLogger.LogError((object)("There was an issue loading your " + yamlFileName));
			Recycle_N_ReclaimLogger.LogError((object)"Please check your entries for spelling and format!");
		}
	}

	private static void OnValChangedUpdate()
	{
		Recycle_N_ReclaimLogger.LogDebug((object)"OnValChanged called");
		try
		{
			YAMLUtils.ReadYaml(RNRExcludeListData.Value);
		}
		catch (Exception arg)
		{
			Recycle_N_ReclaimLogger.LogError((object)$"Failed to deserialize {yamlFileName}: {arg}");
		}
	}

	public static string Localize(string text)
	{
		return Localization.instance.Localize(text);
	}

	public static string Localize(string text, params string[] words)
	{
		return Localization.instance.Localize(text, words);
	}

	private void ContainerRecyclingTriggered()
	{
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_002a: Expected Obj, but got Unknown
		Player localPlayer = Player.m_localPlayer;
		Container val = (Container)AccessTools.Field(typeof(InventoryGui), "m_currentContainer").GetValue(InventoryGui.instance);
		if (!((Object)(object)val == (Object)null))
		{
			Recycle_N_ReclaimLogger.LogDebug((object)("Player " + localPlayer.GetPlayerName() + " triggered recycling"));
			Reclaimer.RecycleInventoryForAllRecipes(val.GetInventory(), GroupUtils.GetPrefabName(((Object)((Component)val).transform).name), localPlayer);
		}
	}

	private ConfigEntry<T> config<[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(2)] T>(string group, string name, T value, ConfigDescription description, bool synchronizedSetting = true)
	{
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0030: Expected Obj, but got Unknown
		ConfigDescription val = new ConfigDescription(description.Description + (synchronizedSetting ? " [Synced with Server]" : " [Not Synced with Server]"), description.AcceptableValues, description.Tags);
		ConfigEntry<T> val2 = ((BaseUnityPlugin)this).Config.Bind<T>(group, name, value, val);
		ConfigSyncVar.AddConfigEntry<T>(val2).SynchronizedConfig = synchronizedSetting;
		return val2;
	}

	private ConfigEntry<T> config<[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(2)] T>(string group, string name, T value, string description, bool synchronizedSetting = true)
	{
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Expected Obj, but got Unknown
		return config(group, name, value, new ConfigDescription(description, (AcceptableValueBase)null, Array.Empty<object>()), synchronizedSetting);
	}

	public Recycle_N_ReclaimPlugin()
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Expected Obj, but got Unknown
	}
}
