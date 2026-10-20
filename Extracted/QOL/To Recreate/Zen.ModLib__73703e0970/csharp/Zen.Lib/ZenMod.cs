using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using BepInEx;
using BepInEx.Configuration;
using BepInEx.Logging;
using HarmonyLib;
using Jotunn.Managers;
using Jotunn.Utils;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.SceneManagement;
using Zen.Lib.Config;
using Zen.Lib.Controls;

namespace Zen.Lib;

public abstract class ZenMod : BaseUnityPlugin
{
	public const string AuthorName = "ZenDragon";

	public const string HomeURL = "https://github.com/ZenDragonX/ZenMods_Valheim/wiki";

	internal static readonly Dictionary<Assembly, ZenMod> Instances = new Dictionary<Assembly, ZenMod>();

	private static bool _requireGamepadRemap;

	protected bool RunOnServer { get; set; }

	protected static bool IsHeadless
	{
		get
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			//IL_0006: Invalid comparison between Unknown and I4
			return (int)SystemInfo.graphicsDeviceType == 4;
		}
	}

	protected bool IsScriptEngine
	{
		get
		{
			if (!Utility.IsNullOrWhiteSpace(((BaseUnityPlugin)this).Info.Location))
			{
				return ((BaseUnityPlugin)this).Info.Location.Contains("scripts");
			}
			return true;
		}
	}

	public static bool RequireGamepadRemap
	{
		get
		{
			return _requireGamepadRemap;
		}
		protected set
		{
			if (ModLib.Configs.GamepadRemapRule.Value != GamepadRemap.RemapRule.Never && !_requireGamepadRemap && value)
			{
				if (!IsHeadless)
				{
					Logging<ModLib>.Message("Applying gamepad remap for " + Assembly.GetCallingAssembly().GetName().Name);
				}
				_requireGamepadRemap = value;
			}
		}
	}

	protected internal virtual HelpInfo? GetHelpInfo()
	{
		return null;
	}
}
public abstract class ZenMod<TPlugin> : ZenMod where TPlugin : ZenMod<TPlugin>
{
	private bool _loadedOnce;

	private bool _isInitialized;

	private readonly TerminalCtrl _terminal;

	private readonly Assembly _assembly;

	private readonly Harmony _harmony;

	internal readonly Logging<TPlugin> Logging;

	private readonly List<Action> _craftingSyncConfigs = new List<Action>();

	private readonly List<Action> _prefabSyncConfigs = new List<Action>();

	private bool _isPrefabsRegistered;

	private bool _isItemsRegistered;

	public static TPlugin Instance { get; private set; }

	public static bool Initialized
	{
		get
		{
			if (Object.op_Implicit((Object)(object)Instance))
			{
				return Instance._isInitialized;
			}
			return false;
		}
	}

	public static TerminalCtrl Terminal => Instance._terminal;

	public static bool IsOnServerAlso => ModCompatibility.IsModuleOnServer((BaseUnityPlugin)(object)Instance);

	public HotLoad HotLoad { get; } = new HotLoad();

	public static bool IsOnServerAndAllClients
	{
		get
		{
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			//IL_0023: Unknown result type (might be due to invalid IL or missing references)
			//IL_0025: Unknown result type (might be due to invalid IL or missing references)
			//IL_0027: Invalid comparison between Unknown and I4
			if (!IsOnServerAlso)
			{
				return false;
			}
			CompatibilityLevel enforceModOnClients = ((MemberInfo)((object)Instance).GetType()).GetCustomAttribute<NetworkCompatibilityAttribute>().EnforceModOnClients;
			if (enforceModOnClients - 2 <= 1)
			{
				return true;
			}
			return false;
		}
	}

	public event Action? RegisterInputs;

	public event Func<Action?>? RegisterCraftingItems;

	public event Func<Action?>? PrefabsRegistered;

	public event Action<string>? LanguageChanged;

	public event Action? KeyboardLayoutChanged;

	public event Action? ConfigSync;

	internal ManualLogSource GetLogger()
	{
		return ((BaseUnityPlugin)this).Logger;
	}

	public static bool TryGetDataFile(string filename, out FileInfo fileInfo)
	{
		return DataFile.TryGetFile(Instance, filename, out fileInfo);
	}

	protected ZenMod()
	{
		//IL_0085: Unknown result type (might be due to invalid IL or missing references)
		//IL_008f: Expected Obj, but got Unknown
		Game.isModded = true;
		if (Object.op_Implicit((Object)(object)Instance))
		{
			throw new Exception($"Instance {typeof(TPlugin)} is already loaded. There can be only one!");
		}
		Instance = (TPlugin)this;
		_assembly = ((object)this).GetType().Assembly;
		_harmony = new Harmony(((BaseUnityPlugin)this).Info.Metadata.GUID);
		_terminal = new TerminalCtrl(((BaseUnityPlugin)this).Info.Metadata.Name);
		ZenMod.Instances.Add(_assembly, this);
		Zen.Lib.Config.Config.File = ((BaseUnityPlugin)this).Config;
		Zen.Lib.Config.Config.Define(isAdmin: false, "_Author", "Website", "https://github.com/ZenDragonX/ZenMods_Valheim/wiki", "ZenDragon\nLike my mods?");
		ConfigEntry<bool> configEnabled = Zen.Lib.Config.Config.Define(isAdmin: false, "_Debug", "Enable Logging", defaultValue: false, "Generate additional debug information in the logs for this mod.\r\nThis will cause a performance hit and should only be used for debugging.");
		Logging = new Logging<TPlugin>(configEnabled);
		if (IsScriptEngine)
		{
			Logging<ModLib>.Warning("------------------------------");
			Logging<ModLib>.Warning($"Type: {((object)this).GetType()}");
			Logging<ModLib>.Warning("Assembly: " + _assembly.GetName().Name);
			Logging<ModLib>.Warning($"Assembly Hash: {_assembly.GetHashCode():X}");
			Logging<ModLib>.Warning("------------------------------");
		}
	}

	protected abstract void Setup();

	protected abstract void TitleScene(bool isFirstBoot);

	protected abstract void WorldStart();

	protected abstract void Shutdown();

	protected virtual void HotRestore()
	{
	}

	private void Awake()
	{
		InitConfigs();
		VersionCheck.TryVerify(this);
		_harmony.PatchAll(_assembly);
		RegisterEventHandlers();
		Setup();
		PreInit();
		InitInputs();
		if (IsScriptEngine)
		{
			DebugAddTranslations();
		}
	}

	private void PreInit()
	{
		_isInitialized = false;
		((MonoBehaviour)this).StopAllCoroutines();
		((MonoBehaviour)this).CancelInvoke("CheckInit");
		((MonoBehaviour)this).InvokeRepeating("CheckInit", 1f, 1f);
	}

	protected virtual bool IsSysReady()
	{
		bool flag = Object.op_Implicit((Object)(object)Hud.instance) && Player.m_localPlayer.IsReady();
		bool flag2 = Object.op_Implicit((Object)(object)ZNet.instance) && ZNet.instance.IsDedicated();
		if (Object.op_Implicit((Object)(object)ZoneSystem.instance) && Object.op_Implicit((Object)(object)ZNet.instance))
		{
			return flag2 | flag;
		}
		return false;
	}

	private void CheckInit()
	{
		Logging<ModLib>.Debug("CheckInit");
		if (!IsSysReady())
		{
			return;
		}
		if (ZNet.instance.IsDedicated())
		{
			if (!RunOnServer)
			{
				Logging<ModLib>.Message(((BaseUnityPlugin)this).Info.Metadata.Name + " server mode: ConfigSync");
				AbortInit();
				return;
			}
			Logging<ModLib>.Message(((BaseUnityPlugin)this).Info.Metadata.Name + " server mode: Active");
		}
		((MonoBehaviour)this).CancelInvoke("CheckInit");
		if (!_loadedOnce)
		{
			OnLanguageChange();
			OnInputLayoutChanged();
		}
		UI.CanvasScaler = ((Component)Hud.instance).GetComponent<GuiScaler>().m_canvasScaler;
		Logging<ModLib>.Info("Reload Configs");
		((BaseUnityPlugin)this).Config.Reload();
		if (!HotLoad.IsPrefabInitInvoked && IsScriptEngine)
		{
			Logging<ModLib>.Warning("Hot restoring existing objects");
			HotLoad.PrefabInitInvoke();
			HotRestore();
			GUIManager.BlockInput(false);
		}
		if (this is ModLib modLib)
		{
			modLib.BeforeWorldStart();
		}
		Logging<ModLib>.Info("World Start");
		WorldStart();
		_isInitialized = true;
		_loadedOnce = true;
	}

	private void AbortInit()
	{
		((MonoBehaviour)this).CancelInvoke("CheckInit");
		_harmony.UnpatchSelf();
	}

	private void InitConfigs()
	{
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(19, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendFormatted(((BaseUnityPlugin)this).Info.Metadata.Name);
			msg.AppendLiteral(" Initialize Configs");
		}
		Logging<ModLib>.Info(msg);
		Zen.Lib.Config.Config.File = ((BaseUnityPlugin)this).Config;
		Logging<ModLib>.Info("Config file: " + Zen.Lib.Config.Config.File.ConfigFilePath);
		InvokeStaticConstructorForFields(typeof(ConfigEntry<>));
		Zen.Lib.Config.Config.File = null;
	}

	private void InitInputs()
	{
		InvokeStaticConstructorForFields(typeof(ActionString));
	}

	private void InvokeStaticConstructorForFields(Type searchFieldType)
	{
		Func<Type, bool> predicate = (Type t) => (object)t != null && t.IsClass && t.IsAbstract && t.IsSealed;
		foreach (Type item in _assembly.GetTypes().Where(predicate))
		{
			if (item.GetFields(BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic).Any((FieldInfo field) =>
			{
				if (!searchFieldType.IsGenericType)
				{
					if (!field.FieldType.IsGenericType)
					{
						return field.FieldType == searchFieldType;
					}
					return false;
				}
				return field.FieldType.IsGenericType && field.FieldType.GetGenericTypeDefinition() == searchFieldType;
			}))
			{
				RuntimeHelpers.RunClassConstructor(item.TypeHandle);
			}
		}
	}

	private void DebugAddTranslations()
	{
		if (!IsScriptEngine)
		{
			Logging<ModLib>.Warning("Not running as script! Skipping debug add translations");
			return;
		}
		((MonoBehaviour)(object)Instance).EndOfFrame(() =>
		{
			Logging<ModLib>.Debug("Assembly: " + ((object)this).GetType().Assembly.GetName().Name);
			Logging<ModLib>.Debug("Assembly Location: " + ((object)this).GetType().Assembly.Location);
			Logging<ModLib>.Debug("Type: " + ((object)this).GetType());
			Logging<ModLib>.Debug("Name: " + ((BaseUnityPlugin)this).Info.Metadata.Name);
			Logging<ModLib>.Debug("Instance: " + (object)((BaseUnityPlugin)this).Info.Instance);
			Logging<ModLib>.Debug("Location: " + ((BaseUnityPlugin)this).Info.Location);
			string directoryName = Path.GetDirectoryName(((BaseUnityPlugin)this).Info.Location);
			if (!Directory.Exists(directoryName))
			{
				throw new DirectoryNotFoundException(directoryName);
			}
			Logging<ModLib>.Info("Search: " + directoryName);
			string[] files = Directory.GetFiles(directoryName, "*.json", SearchOption.AllDirectories);
			foreach (string text in files)
			{
				LocalizationManager.Instance.GetLocalization().AddFileByPath(text, true);
			}
		});
	}

	private void OnDestroy()
	{
		string name = _assembly.GetName().Name;
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(9, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Destroy: ");
			msg.AppendFormatted(name);
		}
		Logging<ModLib>.Info(msg);
		ZenMod.Instances.Remove(_assembly);
		UnregisterEventHandlers();
		Shutdown();
		if (ModLib.IsApplicationQuit)
		{
			msg = new Logging<ModLib>.InterpolatedString(6, 1, out shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Quit: ");
				msg.AppendFormatted(name);
			}
			Logging<ModLib>.Info(msg);
			return;
		}
		msg = new Logging<ModLib>.InterpolatedString(9, 1, out shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Cleanup: ");
			msg.AppendFormatted(name);
		}
		Logging<ModLib>.Info(msg);
		HotLoad.RestoreAll();
		((MonoBehaviour)this).StopAllCoroutines();
		Cleanup.External((BaseUnityPlugin)(object)this);
		ActionString.Shutdown(_assembly);
		KeyHint.RemoveAll(_assembly);
		_terminal.Shutdown();
		msg = new Logging<ModLib>.InterpolatedString(11, 1, out shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Unpatching ");
			msg.AppendFormatted(name);
		}
		Logging<ModLib>.Info(msg);
		LoggingBase.Shutdown();
		_harmony.UnpatchSelf();
	}

	private void RegisterEventHandlers()
	{
		ZInput.OnInputLayoutChanged += OnInputLayoutChanged;
		SceneManager.sceneLoaded += OnSceneLoaded;
		SynchronizationManager.OnConfigurationSynchronized += OnConfigSync;
		Localization.OnLanguageChange = (Action)Delegate.Combine(Localization.OnLanguageChange, new Action(OnLanguageChange));
		InputSystem.onDeviceChange += OnInputDeviceChanged;
		PrefabManager.OnVanillaPrefabsAvailable += OnVanillaPrefabsAvailableOnce;
		PrefabManager.OnPrefabsRegistered += OnPrefabsRegisteredOnce;
	}

	private void OnInputDeviceChanged(InputDevice device, InputDeviceChange change)
	{
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		//IL_000a: Invalid comparison between Unknown and I4
		if (device is Keyboard && (int)change == 7)
		{
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(38, 1, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendFormatted(((BaseUnityPlugin)this).Info.Metadata.GUID);
				msg.AppendLiteral(": Keyboard changed, resetting language");
			}
			Logging<ModLib>.Info(msg);
			KeyboardLayoutChanged?.Invoke();
			OnLanguageChange();
			if (this is ModLib)
			{
				Localization.instance.m_cache.EvictAll();
			}
		}
	}

	private void UnregisterEventHandlers()
	{
		ZInput.OnInputLayoutChanged -= OnInputLayoutChanged;
		SceneManager.sceneLoaded -= OnSceneLoaded;
		SynchronizationManager.OnConfigurationSynchronized -= OnConfigSync;
		Localization.OnLanguageChange = (Action)Delegate.Remove(Localization.OnLanguageChange, new Action(OnLanguageChange));
		InputSystem.onDeviceChange -= OnInputDeviceChanged;
	}

	private static IEnumerable<Action> GetSyncConfigs(Func<Action?>? @event)
	{
		Delegate[] array = @event?.GetInvocationList() ?? Array.Empty<Delegate>();
		for (int i = 0; i < array.Length; i++)
		{
			Action action = ((Func<Action>)array[i])();
			if (action != null)
			{
				yield return action;
			}
		}
	}

	private void OnVanillaPrefabsAvailableOnce()
	{
		PrefabManager.OnVanillaPrefabsAvailable -= OnVanillaPrefabsAvailableOnce;
		_craftingSyncConfigs.AddRange(GetSyncConfigs(RegisterCraftingItems));
		_isItemsRegistered = true;
	}

	private void OnPrefabsRegisteredOnce()
	{
		PrefabManager.OnPrefabsRegistered -= OnPrefabsRegisteredOnce;
		HotLoad.PrefabInitInvoke();
		_prefabSyncConfigs.AddRange(GetSyncConfigs(PrefabsRegistered));
		_isPrefabsRegistered = true;
		ApplyConfigSync();
	}

	private void OnConfigSync(object sender, EventArgs args)
	{
		OnConfigSync();
	}

	private void OnConfigSync()
	{
		if (_isPrefabsRegistered && _isItemsRegistered)
		{
			ApplyConfigSync();
		}
		else if (Logging<ModLib>.IsEnabled)
		{
			Logging<ModLib>.Warning(((BaseUnityPlugin)this).Info.Metadata.GUID + ": Can not sync configs at this time, prefabs are not registered yet.");
		}
	}

	private void ApplyConfigSync()
	{
		try
		{
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(13, 1, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendFormatted(((BaseUnityPlugin)this).Info.Metadata.GUID);
				msg.AppendLiteral(": Config sync");
			}
			Logging<ModLib>.Info(msg);
			ConfigSync?.Invoke();
			InvokeSyncCallbacks();
		}
		catch (Exception arg)
		{
			Logging<ModLib>.Error($"{((BaseUnityPlugin)this).Info.Metadata.GUID}: Config sync failed: {arg}", 0);
		}
	}

	private void InvokeSyncCallbacks()
	{
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(43, 2, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendFormatted(((BaseUnityPlugin)this).Info.Metadata.GUID);
			msg.AppendLiteral(": Invoking ");
			msg.AppendFormatted(_craftingSyncConfigs.Count);
			msg.AppendLiteral(" RegisterCraftingItems callbacks");
		}
		Logging<ModLib>.Info(msg);
		foreach (Action craftingSyncConfig in _craftingSyncConfigs)
		{
			craftingSyncConfig();
		}
		msg = new Logging<ModLib>.InterpolatedString(39, 2, out shouldAppend);
		if (shouldAppend)
		{
			msg.AppendFormatted(((BaseUnityPlugin)this).Info.Metadata.GUID);
			msg.AppendLiteral(": Invoking ");
			msg.AppendFormatted(_prefabSyncConfigs.Count);
			msg.AppendLiteral(" PrefabsRegistered callbacks");
		}
		Logging<ModLib>.Info(msg);
		foreach (Action prefabSyncConfig in _prefabSyncConfigs)
		{
			prefabSyncConfig();
		}
	}

	private void OnLanguageChange()
	{
		ActionString.TranslateAll(_assembly);
		LanguageChanged?.Invoke(PlayerPrefs.GetString("language", "English"));
	}

	private void OnSceneLoaded(Scene scene, LoadSceneMode mode)
	{
		if (this is ModLib)
		{
			GlobalStatic.ResetPrefabLookupCache();
		}
		if (scene.name == "start")
		{
			StringList.AccessCount.Clear();
			KeyHint.RemoveAll(_assembly);
			TitleScene(!_isInitialized);
			PreInit();
		}
	}

	private void OnInputLayoutChanged()
	{
		if (ZenMod.IsHeadless)
		{
			Logging<ModLib>.Info("Running headless, input layout change doesn't apply");
			return;
		}
		if (this is ModLib)
		{
			InteractAlt.Register();
			GamepadRemap.SetupControls();
		}
		RegisterInputs?.Invoke();
	}

	public void RefreshInputs()
	{
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		ZInput.instance.ChangeInputLayout(ZInput.InputLayout);
	}
}
