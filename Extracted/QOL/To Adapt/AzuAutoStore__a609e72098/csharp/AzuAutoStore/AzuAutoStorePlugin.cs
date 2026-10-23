using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Runtime.CompilerServices;
using AzuAutoStore.APIs.MUC;
using AzuAutoStore.APIs.MUC.MUCSrc.Helper;
using AzuAutoStore.APIs.MUC.MUCSrc.Patches.Compatibility;
using AzuAutoStore.Patches.Favoriting;
using AzuAutoStore.Util;
using BepInEx;
using BepInEx.Bootstrap;
using BepInEx.Configuration;
using BepInEx.Logging;
using HarmonyLib;
using JetBrains.Annotations;
using ServerSync;
using UnityEngine;

namespace AzuAutoStore;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[BepInDependency(/*Could not decode attribute arguments.*/)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[BepInDependency(/*Could not decode attribute arguments.*/)]
[BepInDependency(/*Could not decode attribute arguments.*/)]
[BepInPlugin("Azumatt.AzuAutoStore", "AzuAutoStore", "3.1.7")]
public class AzuAutoStorePlugin : BaseUnityPlugin
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)]
	public enum Toggle
	{
		Off,
		On
	}

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)]
	private class ConfigurationManagerAttributes
	{
		[UsedImplicitly]
		public int? Order;

		[UsedImplicitly]
		public bool? Browsable;

		[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(1)]
		[UsedImplicitly]
		public string Category;

		[UsedImplicitly]
		[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 2, 1 })]
		public Action<ConfigEntryBase> CustomDrawer;
	}

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
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

	internal const string ModName = "AzuAutoStore";

	internal const string ModVersion = "3.1.7";

	internal const string Author = "Azumatt";

	internal const string ModGUID = "Azumatt.AzuAutoStore";

	internal const string KgGuid = "kg.ItemDrawers";

	internal const string BackpacksGuid = "org.bepinex.plugins.backpacks";

	private const string ConfigFileName = "Azumatt.AzuAutoStore.cfg";

	private static readonly string ConfigFileFullPath;

	internal static string ConnectionError;

	private readonly Harmony _harmony = new Harmony("Azumatt.AzuAutoStore");

	public static readonly ManualLogSource AzuAutoStoreLogger;

	private static readonly ConfigSync ConfigSync;

	internal static bool BackpacksIsLoaded;

	internal static readonly string yamlFileName;

	internal static readonly string yamlPath;

	internal static readonly CustomSyncedValue<string> AzuAutoStoreContainerData;

	internal static readonly CustomSyncedValue<string> CraftyContainerGroupsData;

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 2, 1, 1 })]
	internal static Dictionary<string, object> yamlData;

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 1, 2, 1, 2 })]
	internal static Dictionary<string, HashSet<string>> groups;

	internal static AzuAutoStorePlugin self;

	private static ConfigEntry<Toggle> _serverConfigLocked;

	internal static ConfigEntry<Toggle> DontStoreToBackpacks;

	internal static ConfigEntry<Toggle> ChestsPickupFromGround;

	internal static ConfigEntry<Toggle> MustHaveExistingItemToPull;

	internal static ConfigEntry<KeyboardShortcut> SingleItemShortcut;

	private static ConfigEntry<KeyboardShortcut> _storeShortcut;

	private static ConfigEntry<KeyboardShortcut> _pauseShortcut;

	internal static ConfigEntry<int> SecondsToWaitBeforeStoring;

	internal static ConfigEntry<float> IntervalSeconds;

	internal static ConfigEntry<Toggle> FishSuction;

	internal static ConfigEntry<float> PlayerRange;

	internal static ConfigEntry<float> FallbackRange;

	internal static ConfigEntry<Toggle> PlayerIgnoreHotbar;

	internal static ConfigEntry<Toggle> PlayerIgnoreQuickSlots;

	internal static ConfigEntry<string> PingVfxString;

	internal static ConfigEntry<Toggle> HighlightContainers;

	internal static ConfigEntry<Toggle> PingContainers;

	public static ConfigEntry<Color> BorderColorFavoritedItem;

	public static ConfigEntry<Color> BorderColorFavoritedItemOnFavoritedSlot;

	public static ConfigEntry<Color> BorderColorFavoritedSlot;

	public static ConfigEntry<bool> DisplayTooltipHint;

	public static ConfigEntry<KeyboardShortcut> FavoritingModifierKeybind1;

	public static ConfigEntry<KeyboardShortcut> FavoritingModifierKeybind2;

	public static ConfigEntry<KeyboardShortcut> SearchModifierKeybind;

	public static ConfigEntry<string> FavoritedItemTooltip;

	public static ConfigEntry<string> FavoritedSlotTooltip;

	public static ConfigEntry<string> ItemOnFavoritedSlotTooltip;

	public void Awake()
	{
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_003e: Expected Obj, but got Unknown
		//IL_0080: Unknown result type (might be due to invalid IL or missing references)
		//IL_008b: Expected Obj, but got Unknown
		//IL_00bc: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c7: Expected Obj, but got Unknown
		//IL_00f8: Unknown result type (might be due to invalid IL or missing references)
		//IL_0103: Expected Obj, but got Unknown
		//IL_0146: Unknown result type (might be due to invalid IL or missing references)
		//IL_0151: Expected Obj, but got Unknown
		//IL_0186: Unknown result type (might be due to invalid IL or missing references)
		//IL_0191: Expected Obj, but got Unknown
		//IL_01c2: Unknown result type (might be due to invalid IL or missing references)
		//IL_01cd: Expected Obj, but got Unknown
		//IL_01fe: Unknown result type (might be due to invalid IL or missing references)
		//IL_0209: Expected Obj, but got Unknown
		//IL_023e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0249: Expected Obj, but got Unknown
		//IL_027a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0285: Expected Obj, but got Unknown
		//IL_02b6: Unknown result type (might be due to invalid IL or missing references)
		//IL_02c1: Expected Obj, but got Unknown
		//IL_02e5: Unknown result type (might be due to invalid IL or missing references)
		//IL_02f0: Expected Obj, but got Unknown
		//IL_0310: Unknown result type (might be due to invalid IL or missing references)
		//IL_031b: Expected Obj, but got Unknown
		//IL_0337: Unknown result type (might be due to invalid IL or missing references)
		//IL_0342: Expected Obj, but got Unknown
		//IL_035c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0385: Unknown result type (might be due to invalid IL or missing references)
		//IL_0390: Expected Obj, but got Unknown
		//IL_03a7: Unknown result type (might be due to invalid IL or missing references)
		//IL_03d0: Unknown result type (might be due to invalid IL or missing references)
		//IL_03db: Expected Obj, but got Unknown
		//IL_03fb: Unknown result type (might be due to invalid IL or missing references)
		//IL_040f: Unknown result type (might be due to invalid IL or missing references)
		//IL_041a: Expected Obj, but got Unknown
		//IL_0431: Unknown result type (might be due to invalid IL or missing references)
		//IL_0445: Unknown result type (might be due to invalid IL or missing references)
		//IL_0450: Expected Obj, but got Unknown
		//IL_0477: Unknown result type (might be due to invalid IL or missing references)
		//IL_04cb: Unknown result type (might be due to invalid IL or missing references)
		//IL_04f6: Unknown result type (might be due to invalid IL or missing references)
		//IL_0531: Unknown result type (might be due to invalid IL or missing references)
		//IL_055a: Unknown result type (might be due to invalid IL or missing references)
		self = this;
		_serverConfigLocked = config("1 - General", "Lock Configuration", Toggle.On, new ConfigDescription("If on, the configuration is locked and can be changed by server admins only.", (AcceptableValueBase)null, new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Order = 10
			}
		}));
		ConfigSync.AddLockingConfigEntry<Toggle>(_serverConfigLocked);
		DontStoreToBackpacks = config("1 - General", "Dont Store to Backpacks", Toggle.Off, new ConfigDescription("If on, items will not be stored in backpacks or quivers.", (AcceptableValueBase)null, new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Order = 9
			}
		}));
		ChestsPickupFromGround = config("1 - General", "Chests Pickup From Ground", Toggle.On, new ConfigDescription("If on, chests will pick up items from the ground if they are in range. If off, chests will not begin their periodic checks for items nearby. Reloading zone or logging out might be required.", (AcceptableValueBase)null, new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Order = 8
			}
		}));
		MustHaveExistingItemToPull = config("1 - General", "Must Have Existing Item To Pull", Toggle.On, new ConfigDescription("If on, the chest must already have the item in its inventory to pull it from the world or player into the chest.", (AcceptableValueBase)null, new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Order = 7
			}
		}));
		PlayerRange = config("1 - General", "Player Range", 5f, new ConfigDescription("The maximum distance from the player to store items in chests when the Store Shortcut is pressed. Follows storage rules for allowed items.", (AcceptableValueBase)(object)new AcceptableValueRange<float>(1f, 100f), new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Order = 6
			}
		}));
		FallbackRange = config("1 - General", "Fallback Range", 10f, new ConfigDescription("The range to use if the container has no range set in the yml file. This will be the fallback range for all containers.", (AcceptableValueBase)null, new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Order = 5
			}
		}));
		PlayerIgnoreHotbar = config("1 - General", "Player Ignore Hotbar", Toggle.On, new ConfigDescription("If on, the player's hotbar will not be stored when the Store Shortcut is pressed.", (AcceptableValueBase)null, new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Order = 4
			}
		}), synchronizedSetting: false);
		PlayerIgnoreQuickSlots = config("1 - General", "Player Ignore Quick Slots", Toggle.Off, new ConfigDescription("If on, the player's quick slots will not be stored when the Store Shortcut is pressed. (Requires Quick Slots mod, turn on only if you need it!)", (AcceptableValueBase)null, new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Order = 3
			}
		}), synchronizedSetting: false);
		PingVfxString = TextEntryConfig("1 - General", "Ping VFX", "vfx_Potion_health_medium", new ConfigDescription("The VFX to play when a chest is pinged. Leave blank to disable and only highlight the chest. (Full prefab list: https://valheim-modding.github.io/Jotunn/data/prefabs/prefab-list.html)", (AcceptableValueBase)null, new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Order = 2
			}
		}));
		HighlightContainers = config("1 - General", "Highlight Containers", Toggle.On, new ConfigDescription("If on, the containers will be highlighted when something is stored in them. If off, the containers will not be highlighted if something is stored in them.", (AcceptableValueBase)null, new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Order = 1
			}
		}), synchronizedSetting: false);
		PingContainers = config("1 - General", "Ping Containers", Toggle.On, new ConfigDescription("If on, the containers will be pinged with the Ping VFX when something is stored in them. If off, the containers will not be pinged if something is stored in them.", (AcceptableValueBase)null, new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Order = 0
			}
		}), synchronizedSetting: false);
		SecondsToWaitBeforeStoring = config("1 - General", "Seconds To Wait Before Storing", 10, new ConfigDescription("The number of seconds to wait before storing items into chests nearby automatically after you have pressed your hotkey to pause.", (AcceptableValueBase)(object)new AcceptableValueRange<int>(0, 60), Array.Empty<object>()));
		IntervalSeconds = config("1 - General", "IntervalSeconds", 10f, new ConfigDescription("The number of seconds that must pass before the chest will do an automatic check for items nearby, WARNING: Reducing this will decrease performance!", (AcceptableValueBase)null, Array.Empty<object>()));
		FishSuction = config("1.5 - Fish", "Fish Suction", Toggle.Off, new ConfigDescription("Allow auto-storing fish that are still in water (boat 'netting'). Off = require fish to be out of the water; On = ignore IsOutOfWater() check.", (AcceptableValueBase)null, Array.Empty<object>()));
		SingleItemShortcut = config<KeyboardShortcut>("2 - Shortcuts", "Store Single Item Shortcut", new KeyboardShortcut((KeyCode)325, Array.Empty<KeyCode>()), new ConfigDescription("Keyboard shortcut/Hotkey to store a single item that you click from your inventory into nearby containers.", (AcceptableValueBase)(object)new AcceptableShortcuts(), new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Order = 2
			}
		}), synchronizedSetting: false);
		_storeShortcut = config<KeyboardShortcut>("2 - Shortcuts", "Store Shortcut", new KeyboardShortcut((KeyCode)46, Array.Empty<KeyCode>()), new ConfigDescription("Keyboard shortcut/Hotkey to store your inventory into nearby containers.", (AcceptableValueBase)(object)new AcceptableShortcuts(), new object[1]
		{
			new ConfigurationManagerAttributes
			{
				Order = 1
			}
		}), synchronizedSetting: false);
		_pauseShortcut = config<KeyboardShortcut>("2 - Shortcuts", "Pause Shortcut", new KeyboardShortcut((KeyCode)46, new KeyCode[1] { (KeyCode)304 }), new ConfigDescription("Keyboard shortcut/Hotkey to temporarily stop storing items into chests nearby automatically. Does not override the player hotkey store.", (AcceptableValueBase)(object)new AcceptableShortcuts(), Array.Empty<object>()), synchronizedSetting: false);
		SearchModifierKeybind = config<KeyboardShortcut>("2 - Shortcuts", "SearchModifierKeybind", new KeyboardShortcut((KeyCode)121, Array.Empty<KeyCode>()), new ConfigDescription("While holding this, you can search nearby chests for the prefab you clicked in your inventory.", (AcceptableValueBase)(object)new AcceptableShortcuts(), Array.Empty<object>()), synchronizedSetting: false);
		string text = "3 - Favoriting";
		string text2 = "While holding this, left clicking on items or right clicking on slots favorites them, disallowing storing";
		BorderColorFavoritedItem = config<Color>(text, "BorderColorFavoritedItem", new Color(1f, 0.8482759f, 0f), "Color of the border for slots containing favorited items.", synchronizedSetting: false);
		BorderColorFavoritedItem.SettingChanged += [_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (object a, EventArgs b) =>
		{
			FavoritingMode.RefreshDisplay();
		};
		BorderColorFavoritedItemOnFavoritedSlot = config<Color>(text, "BorderColorFavoritedItemOnFavoritedSlot", new Color(0.5f, 0.67413795f, 0.5f), "Color of the border of a favorited slot that also contains a favorited item.", synchronizedSetting: false);
		BorderColorFavoritedSlot = config<Color>(text, "BorderColorFavoritedSlot", new Color(0f, 0.5f, 1f), "Color of the border for favorited slots.", synchronizedSetting: false);
		DisplayTooltipHint = config(text, "DisplayTooltipHint", value: true, "Whether to add additional info the item tooltip of a favorited or trash flagged item.", synchronizedSetting: false);
		FavoritingModifierKeybind1 = config<KeyboardShortcut>(text, "FavoritingModifierKeybind1", new KeyboardShortcut((KeyCode)122, Array.Empty<KeyCode>()), text2 + " Identical to FavoritingModifierKeybind2.", synchronizedSetting: false);
		FavoritingModifierKeybind2 = config<KeyboardShortcut>(text, "FavoritingModifierKeybind2", new KeyboardShortcut((KeyCode)122, Array.Empty<KeyCode>()), text2 + " Identical to FavoritingModifierKeybind1.", synchronizedSetting: false);
		FavoritedItemTooltip = config(text, "FavoritedItemTooltip", "Item is favorited and won't be stored", string.Empty, synchronizedSetting: false);
		FavoritedSlotTooltip = config(text, "FavoritedSlotTooltip", "Slot is favorited and won't be stored", string.Empty, synchronizedSetting: false);
		ItemOnFavoritedSlotTooltip = config(text, "ItemOnFavoritedSlotTooltip", "Item & Slot are favorited and won't be stored", string.Empty, synchronizedSetting: false);
		if (!File.Exists(yamlPath))
		{
			WriteConfigFileFromResource(yamlPath);
		}
		AzuAutoStoreContainerData.ValueChanged += OnValChangedUpdate;
		AzuAutoStoreContainerData.AssignLocalValue(File.ReadAllText(yamlPath));
		AutoDoc();
		Assembly executingAssembly = Assembly.GetExecutingAssembly();
		_harmony.PatchAll(executingAssembly);
		SetupWatcher();
	}

	public void Start()
	{
		BorderRenderer.Border = loadSprite("border.png");
		if (Chainloader.PluginInfos.ContainsKey("org.bepinex.plugins.backpacks"))
		{
			BackpacksIsLoaded = true;
		}
		Log.Init(AzuAutoStoreLogger);
		if (!MUCCompat.DoNotPatch && Chainloader.PluginInfos.ContainsKey("mkz.itemdrawers"))
		{
			try
			{
				_harmony.PatchAll(typeof(ItemDrawerCompat));
			}
			catch (Exception ex)
			{
				AzuAutoStoreLogger.LogWarning((object)("Couldn't apply the ItemDrawers compatibility patches: " + ex.Message));
			}
		}
	}

	private void AutoDoc()
	{
	}

	private static void WriteConfigFileFromResource(string configFilePath)
	{
		Assembly executingAssembly = Assembly.GetExecutingAssembly();
		string text = "AzuAutoStore.Example.yml";
		using Stream stream = executingAssembly.GetManifestResourceStream(text);
		if (stream == null)
		{
			throw new FileNotFoundException("Resource '" + text + "' not found in the assembly.");
		}
		using StreamReader streamReader = new StreamReader(stream);
		string contents = streamReader.ReadToEnd();
		File.WriteAllText(configFilePath, contents);
	}

	private void Update()
	{
		//IL_0012: Unknown result type (might be due to invalid IL or missing references)
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		//IL_003c: Unknown result type (might be due to invalid IL or missing references)
		if (!Object.op_Implicit((Object)(object)Player.m_localPlayer))
		{
			return;
		}
		KeyboardShortcut value = _storeShortcut.Value;
		if (value.IsDown() && ((Character)Player.m_localPlayer).TakeInput())
		{
			Functions.TryStore();
		}
		value = _pauseShortcut.Value;
		if (!value.IsDown() || !((Character)Player.m_localPlayer).TakeInput())
		{
			return;
		}
		Boxes.StoringPaused = !Boxes.StoringPaused;
		foreach (Container container in Boxes.Containers)
		{
			if (container.m_nview.IsValid())
			{
				container.m_nview.InvokeRPC("RequestPause", new object[1] { Boxes.StoringPaused });
			}
		}
	}

	private void OnDestroy()
	{
		((BaseUnityPlugin)this).Config.Save();
	}

	private void SetupWatcher()
	{
		FileSystemWatcher fileSystemWatcher = new FileSystemWatcher(Paths.ConfigPath, "Azumatt.AzuAutoStore.cfg");
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
			Functions.LogDebug("ReadConfigValues called");
			((BaseUnityPlugin)this).Config.Reload();
		}
		catch
		{
			Functions.LogError("There was an issue loading your Azumatt.AzuAutoStore.cfg");
			Functions.LogError("Please check your config entries for spelling and format!");
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
			AzuAutoStoreLogger.LogDebug((object)"ReadConfigValues called");
			AzuAutoStoreContainerData.AssignLocalValue(File.ReadAllText(yamlPath));
		}
		catch
		{
			AzuAutoStoreLogger.LogError((object)("There was an issue loading your " + yamlFileName));
			AzuAutoStoreLogger.LogError((object)"Please check your entries for spelling and format!");
		}
	}

	private static void OnValChangedUpdate()
	{
		AzuAutoStoreLogger.LogDebug((object)"OnValChanged called");
		try
		{
			YamlUtils.ReadYaml(AzuAutoStoreContainerData.Value);
			YamlUtils.ParseGroups();
			Functions.ClearRangeCache();
		}
		catch (Exception arg)
		{
			AzuAutoStoreLogger.LogError((object)$"Failed to deserialize {yamlFileName}: {arg}");
		}
	}

	private static byte[] ReadEmbeddedFileBytes(string name)
	{
		using MemoryStream memoryStream = new MemoryStream();
		Assembly.GetExecutingAssembly().GetManifestResourceStream(Assembly.GetExecutingAssembly().GetName().Name + "." + name).CopyTo(memoryStream);
		return memoryStream.ToArray();
	}

	private static Texture2D loadTexture(string name)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Expected Obj, but got Unknown
		//IL_001f: Expected Obj, but got Unknown
		Texture2D val = new Texture2D(0, 0);
		ImageConversion.LoadImage(val, ReadEmbeddedFileBytes("assets." + name));
		return val;
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

	private ConfigEntry<T> config<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)] T>(string group, string name, T value, ConfigDescription description, bool synchronizedSetting = true)
	{
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0030: Expected Obj, but got Unknown
		ConfigDescription val = new ConfigDescription(description.Description + (synchronizedSetting ? " [Synced with Server]" : " [Not Synced with Server]"), description.AcceptableValues, description.Tags);
		ConfigEntry<T> val2 = ((BaseUnityPlugin)this).Config.Bind<T>(group, name, value, val);
		ConfigSync.AddConfigEntry<T>(val2).SynchronizedConfig = synchronizedSetting;
		return val2;
	}

	private ConfigEntry<T> config<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)] T>(string group, string name, T value, string description, bool synchronizedSetting = true)
	{
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Expected Obj, but got Unknown
		return config(group, name, value, new ConfigDescription(description, (AcceptableValueBase)null, Array.Empty<object>()), synchronizedSetting);
	}

	private ConfigEntry<T> TextEntryConfig<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)] T>(string group, string name, T value, ConfigDescription description, bool synchronizedSetting = true)
	{
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0030: Expected Obj, but got Unknown
		ConfigDescription val = new ConfigDescription(description.Description + (synchronizedSetting ? " [Synced with Server]" : " [Not Synced with Server]"), description.AcceptableValues, description.Tags);
		ConfigEntry<T> val2 = ((BaseUnityPlugin)this).Config.Bind<T>(group, name, value, val);
		ConfigSync.AddConfigEntry<T>(val2).SynchronizedConfig = synchronizedSetting;
		return val2;
	}

	private ConfigEntry<T> TextEntryConfig<[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)] T>(string group, string name, T value, string desc, bool synchronizedSetting = true)
	{
		//IL_0038: Unknown result type (might be due to invalid IL or missing references)
		//IL_0044: Expected Obj, but got Unknown
		ConfigurationManagerAttributes configurationManagerAttributes = new ConfigurationManagerAttributes
		{
			CustomDrawer = ConfigExtensions.TextAreaDrawer
		};
		return TextEntryConfig(group, name, value, new ConfigDescription(desc, (AcceptableValueBase)null, new object[1] { configurationManagerAttributes }), synchronizedSetting);
	}

	public AzuAutoStorePlugin()
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0010: Expected Obj, but got Unknown
	}

	static AzuAutoStorePlugin()
	{
		string configPath = Paths.ConfigPath;
		char directorySeparatorChar = Path.DirectorySeparatorChar;
		ConfigFileFullPath = configPath + directorySeparatorChar + "Azumatt.AzuAutoStore.cfg";
		ConnectionError = "";
		AzuAutoStoreLogger = Logger.CreateLogSource("AzuAutoStore");
		ConfigSync = new ConfigSync("Azumatt.AzuAutoStore")
		{
			DisplayName = "AzuAutoStore",
			CurrentVersion = "3.1.7",
			MinimumRequiredVersion = "3.1.7"
		};
		BackpacksIsLoaded = false;
		yamlFileName = "Azumatt.AzuAutoStore.yml";
		string configPath2 = Paths.ConfigPath;
		directorySeparatorChar = Path.DirectorySeparatorChar;
		yamlPath = configPath2 + directorySeparatorChar + yamlFileName;
		AzuAutoStoreContainerData = new CustomSyncedValue<string>(ConfigSync, "azuautostoreData", "");
		CraftyContainerGroupsData = new CustomSyncedValue<string>(ConfigSync, "azuautostoreGroupsData", "");
		groups = null;
		self = null;
		_serverConfigLocked = null;
		DontStoreToBackpacks = null;
		ChestsPickupFromGround = null;
		MustHaveExistingItemToPull = null;
		SingleItemShortcut = null;
		_storeShortcut = null;
		_pauseShortcut = null;
		SecondsToWaitBeforeStoring = null;
		IntervalSeconds = null;
		FishSuction = null;
		PlayerRange = null;
		FallbackRange = null;
		PlayerIgnoreHotbar = null;
		PlayerIgnoreQuickSlots = null;
		PingVfxString = null;
		HighlightContainers = null;
		PingContainers = null;
		BorderColorFavoritedItem = null;
		BorderColorFavoritedItemOnFavoritedSlot = null;
		BorderColorFavoritedSlot = null;
		DisplayTooltipHint = null;
		FavoritingModifierKeybind1 = null;
		FavoritingModifierKeybind2 = null;
		SearchModifierKeybind = null;
		FavoritedItemTooltip = null;
		FavoritedSlotTooltip = null;
		ItemOnFavoritedSlotTooltip = null;
	}
}
