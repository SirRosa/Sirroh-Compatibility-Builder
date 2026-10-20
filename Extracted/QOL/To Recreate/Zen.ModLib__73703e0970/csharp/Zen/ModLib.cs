using System;
using System.Linq;
using BepInEx;
using BepInEx.Configuration;
using Jotunn.Utils;
using UnityEngine;
using Zen.Commands;
using Zen.Compatibility;
using Zen.Components;
using Zen.FixVanilla;
using Zen.Lib;
using Zen.Lib.Config;
using Zen.Lib.Controls;

namespace Zen;

[BepInPlugin("ZenDragon.Zen.ModLib", "Zen.ModLib", "1.14.22")]
[BepInDependency(/*Could not decode attribute arguments.*/)]
[SynchronizationMode(/*Could not decode attribute arguments.*/)]
[NetworkCompatibility(/*Could not decode attribute arguments.*/)]
public class ModLib : ZenMod<ModLib>
{
	public static class Configs
	{
		internal static readonly ConfigEntry<bool> AllowDebugLogs;

		internal static readonly ConfigEntry<bool> DebugAll;

		internal static readonly ConfigEntry<bool> EnableMessageCache;

		internal static readonly ConfigEntry<bool> EnablePrefabLookupCache;

		internal static readonly ConfigEntry<bool> EnableValheimVersionCheck;

		internal static readonly ConfigEntry<bool> EnableHighlightOutline;

		internal static readonly ConfigEntry<int> ConfigThrashWarningLimit;

		internal static readonly ConfigEntry<bool> SanitizeData;

		internal static readonly ConfigEntry<bool> SanitizeDataAfterSync;

		internal static readonly ConfigEntry<bool> FixApplyPlayerKeyOnBossDeath;

		internal static readonly ConfigEntry<float> FixApplyPlayerKeyOnBossDeathDistance;

		internal static readonly ConfigEntry<bool> FixFireIsLit;

		internal static readonly ConfigEntry<bool> FixRunAttackStaminaDrain;

		internal static readonly ConfigEntry<StringList> FixWolfEatMeats;

		internal static readonly ConfigEntry<bool> FixFuelLeak;

		internal static readonly ConfigEntry<bool> FixGamepadDropLTriggerX;

		internal static readonly ConfigEntry<bool> FixIconSwapTrophyAndAchievement;

		internal static readonly ConfigEntry<bool> FixAltDodgeRequireMovementAndNoUI;

		internal static readonly ConfigEntry<bool> FixExploitChairBypass;

		internal static readonly ConfigEntry<bool> FixExploitTooHardMsg;

		internal static readonly ConfigEntry<bool> FixExploitAttackAnimations;

		internal static readonly ConfigEntry<bool> OptimizeNetworkRpcNoSendEveryoneActive;

		internal static readonly ConfigEntry<bool> OptimizeNetworkRpcNoSendEveryoneFromClient;

		internal static readonly ConfigEntry<StringList> OptimizeNetworkRpcNoSendEveryoneGlobalAllow;

		internal static readonly ConfigEntry<StringList> OptimizeNetworkRpcNoSendEveryoneNearbyOnly;

		internal static readonly ConfigEntry<bool> OptimizeNetworkSendToPeersSync;

		internal static readonly ConfigEntry<bool> UseModSeasonsFuelBurnRate;

		internal static readonly ConfigEntry<bool> UpdateKeyHints;

		internal static readonly ConfigEntry<bool> AllowAchievementsWithDevCommands;

		internal static readonly ConfigEntry<Color> DefaultHighlightColor;

		internal static readonly ConfigEntry<StringList> RemoveRichTextFromTranslations;

		internal static readonly ConfigEntry<bool> ShowHelpInfo;

		internal static readonly ConfigEntry<int> ShowHelpInfoIndex;

		internal static readonly ConfigEntry<string> ShowHelpInfoPrefix;

		internal static readonly ConfigEntry<bool> AdminAllowServerCommands;

		internal static readonly ConfigEntry<bool> AdminLoginAutoGodMode;

		internal static readonly ConfigEntry<bool> AdminLoginAutoGhostMode;

		internal static readonly ConfigEntry<bool> AdminLoginAutoNoCostMode;

		internal static readonly ConfigEntry<bool> AdminLoginAutoDevCommandsMode;

		internal static readonly ConfigEntry<bool> AdminEnterPrivateAreas;

		internal static readonly ConfigEntry<bool> AdminUnencumberedGods;

		internal static readonly ConfigEntry<KeyCode> AdminMapTeleportKey;

		internal static readonly ConfigEntry<bool> AdminShowStatusIndicators;

		internal static readonly ConfigEntry<bool> AdminProcessChatSlash;

		internal static readonly ConfigEntry<bool> AdminOnlyShowBuildAuthor;

		internal static readonly ConfigEntry<bool> ConsoleUseQuotedArgs;

		internal static readonly ConfigEntry<bool> ConsoleAllowed;

		internal static readonly ConfigEntry<StringList> CommandsRequireAdmin;

		internal static readonly ConfigEntry<bool> CommandRelayEnabled;

		internal static readonly ConfigEntry<KeyCode> InteractAltKey;

		internal static readonly ConfigEntry<bool> InteractAltUseShiftE;

		internal static readonly ConfigEntry<GamepadRemap.RemapRule> GamepadRemapRule;

		internal static readonly ConfigEntry<bool> GamepadRadialMenu;

		internal static readonly ConfigEntry<float> GamepadRadialMenuDuration;

		static Configs()
		{
			//IL_063a: Unknown result type (might be due to invalid IL or missing references)
			AllowDebugLogs = Config.Define(isAdmin: true, "_Debug", "Allow Debug Logs", defaultValue: false, "Must be enabled by admin for any ZenMods to generate debug logs.\r\nIf disabled prevents ZenMods from generating debug logs while connected to live servers.\r\nSingle-player, multiplayer hosts, and dedicated servers ignore this config.");
			DebugAll = Config.Define(isAdmin: false, "_Debug", "Enable All Logs", defaultValue: false, "Enable all debug flags for all ZenMods. Caution this will reduce performance! Useful only for internal testing.");
			EnableMessageCache = Config.Define(isAdmin: true, "_Debug", "Enable Message Cache", defaultValue: true, "Cache the results of Interop SendMessage calls to improve performance.\r\nThis is primarily a developer debug option, end users probably never need to disable this.");
			EnablePrefabLookupCache = Config.Define(isAdmin: true, "_Debug", "Enable Prefab Lookup Cache", defaultValue: true, "Cache the results of prefab lookups that are not found in the JVL cache.\r\nThis is primarily a developer debug option, end users probably never need to disable this.");
			EnableValheimVersionCheck = Config.Define(isAdmin: true, "_Debug", "Enable Valheim Version Check", defaultValue: true, "Verify the version of Valheim is compatible with this mod.\r\nDisabling this is not recommended and can lead to unpredictable runtime errors.\r\nRequired versions: " + VersionCheck.GetVersions());
			EnableHighlightOutline = Config.Define(isAdmin: true, "_Debug", "Enable Highlight Outline", defaultValue: true, "Dev debugging, you should never need to disable this.\r\nToggle the display of piece highlight outlines.\r\n[logout required for changes to take effect]");
			ConfigThrashWarningLimit = Config.Define(isAdmin: false, "Diagnostics", "Config Thrashing Warning Limit", 100, Config.AcceptRange(0, 1000), "Upper limit before triggering a warning in the logs that config files are being thrashed. \r\nThis happens when mods like ConfigWatcher are spamming IO operations and constantly reloading config files.\r\nYou really should investigate the cause of any thrashing alerts triggered by this.\r\nIt means your config files are being reloaded constantly in the background, that can hurt performance.\r\nA few times is no big deal, but if it's happening constantly, you should investigate the cause.\r\nSet to 0 to disable the alert if you don't care about the performance impact from mods that are repeatedly hammering IO.");
			SanitizeData = Config.Define(isAdmin: false, "Diagnostics", "Sanitize Data", defaultValue: true, "Sanitize item and recipe data to ensure they are properly indexed.");
			SanitizeDataAfterSync = Config.Define(isAdmin: true, "Diagnostics", "Sanitize Data After Sync", defaultValue: false, "Run data sanitization again after sync to compensate for some mods not registering items correctly.\r\nEnable this if you see errors that say: \"Exception: Unable to locate item prefab. Missing dropPrefab and sharedData index\"");
			UseModSeasonsFuelBurnRate = Config.Define(isAdmin: true, "Compatibility", "Use Mod Seasons Fuel Burn Rates", defaultValue: true, "Enable fireplace burn rate calculations from the Seasons mod if it is installed.\r\nIf unsure just leave this enabled, it has no effect if Seasons is not installed.");
			UpdateKeyHints = Config.Define(isAdmin: true, "Compatibility", "Update KeyHints", defaultValue: true, "Noramlly ZenMods update the KeyHints at the bottom of the screen to reflect the new controls and behaviors.\r\nIf other mods alter the node structure of the key hints then there can be conflicts and errors.\r\nDisable this if you are having conflicts and would like ZenMods to ignore attempts to update the KeyHints.");
			AdminAllowServerCommands = Config.Define(isAdmin: true, "Admin", "Allow Dedicated Server Admin Commands", defaultValue: false, "Allow admins to run admin-only console commands while connected to a dedicated server.\r\nDoes not affect non-admin players.\r\n[This feature is disabled if the mod \"Server DevCommands\" is installed]");
			string text = "[This feature requires \"" + ((ConfigEntryBase)AdminAllowServerCommands).Definition.Key + "\" to be enabled]";
			AdminEnterPrivateAreas = Config.Define(isAdmin: false, "Admin", "Enter Private Areas", defaultValue: false, "If you are admin you can enter warded areas or private chests.\r\n/devcommands context must be enabled to enter private areas.\r\n[This feature is disabled if the mod \"Server DevCommands\" is installed]");
			AdminUnencumberedGods = Config.Define(isAdmin: true, "Admin", "Unencumbered Gods", defaultValue: true, "Gods have no burdens, you are never encumbered while in god mode.\r\n[This feature is disabled if the mod \"Server DevCommands\" is installed]");
			AdminLoginAutoDevCommandsMode = Config.Define(isAdmin: false, "Admin", "Login Auto DevCommands", defaultValue: false, "If you are admin automatically enable /devcommands context on login. \r\nPower user mode. Run commands with cheats enabled.\r\n" + text);
			AdminLoginAutoGodMode = Config.Define(isAdmin: false, "Admin", "Login Auto God Mode", defaultValue: false, "If you are admin automatically enable /god mode on login.\r\nYou can not die.\r\n" + text);
			AdminLoginAutoGhostMode = Config.Define(isAdmin: false, "Admin", "Login Auto Ghost Mode", defaultValue: false, "If you are admin automatically enable /ghost mode on login.\r\nMonsters will not attack you.\r\n" + text);
			AdminLoginAutoNoCostMode = Config.Define(isAdmin: false, "Admin", "Login Auto NoCost Mode", defaultValue: false, "If you are admin automatically enable /nocost mode on login. \r\nBuilding and crafting are free.\r\n" + text);
			AdminMapTeleportKey = Config.Define<KeyCode>(isAdmin: false, "Admin", "Map Teleport Key", (KeyCode)306, "If you are admin hold this key and middle click the map to teleport.\r\n/devcommands context must be enabled before you can teleport on the map.\r\n[This feature is disabled if the mod \"Server DevCommands\" is installed]");
			AdminShowStatusIndicators = Config.Define(isAdmin: true, "Admin", "Show Status Indicators", defaultValue: true, "Show the current status of admin modes in the HUD as icons on the bottom left corner.\r\nThe icons are: DevCommands, God, Ghost, NoCost, EnterPrivateAreas");
			AdminProcessChatSlash = Config.Define(isAdmin: true, "Admin", "Run Slash Commands From Chat", defaultValue: true, "Admins can run commands from chat with the slash (/) prefix\r\n/devcommands context must be enabled prior to using other admin slash commands.\r\n[This feature is disabled if the mod \"Server DevCommands\" is installed]");
			AdminOnlyShowBuildAuthor = Config.Define(isAdmin: true, "Admin", "Admin Only Show Build Author", defaultValue: true, "Must be admin to see build piece author when hovering on a piece.\r\n(Vanilla: false)");
			ConsoleAllowed = Config.Define(isAdmin: true, "Console", "Allow Console", defaultValue: false, "Toggle for server-wide access to the console for all players connected to the server.\r\nNOTE: Admin can always access the console.");
			CommandRelayEnabled = Config.Define(isAdmin: true, "Console", "Command Relay", defaultValue: false, "Maintenance: Allow server admins to run console commands as another player.\r\nUseful for admins to update or fix problems with player characters.\r\nCan be changed while the game is running via Configuration Manager.\r\nIf this mod is installed on the server then the admin can toggle this for everyone.\r\nIf not installed on the server then the receiver must manually enable this to allow access.\r\nDisable this when not in use to prevent griefing.\r\nMust be admin to use this command and in the devcommands context.\r\nSyntax: relay <player> <command>");
			CommandsRequireAdmin = Config.Define(isAdmin: true, "Console", "Require Admin", new StringList { "seed", "printseeds", "nextseed" }, "Comma separated list of commands that are forced to be admin-only devcommands context.\r\n[restart required for changes to take effect]");
			ConsoleUseQuotedArgs = Config.Define(isAdmin: true, "Console", "Use Quoted Arguments", defaultValue: true, "If your command arguments have spaces in them such as \"Player Name\" \r\nthen quotes can be used to wrap the argument and pass it as a single token to the command.");
			OptimizeNetworkRpcNoSendEveryoneActive = Config.Define(isAdmin: true, "Optimizations", "Network - RPC NoSpam Everyone - Active", defaultValue: true, "This is the feature master switch.\r\nBy default vanilla broadcasts many RPCs to everyone on the server for even basic things like footsteps or trees growing.\r\nThis feature limits the broadcast of location based RPCs only to players nearby. This reduces network traffic between server and client.\r\nAll ZNetView messages that target Everybody are restricted to only players within the area of the origin.\r\n(vanilla: false)");
			OptimizeNetworkRpcNoSendEveryoneFromClient = Config.Define(isAdmin: true, "Optimizations", "Network - RPC NoSpam Everyone - From Client", defaultValue: true, "Prevent the client from sending messages to the server that target Everybody if nobody else is near the client.\r\nThis reduces client-to-server network traffic when players are isolated in an area.\r\n[NOTE: if you use EWP the server will not get RPC messages from the client for your server-side scripts if this is enabled]\r\n(vanilla: false)\r\n[" + ((ConfigEntryBase)OptimizeNetworkRpcNoSendEveryoneActive).Definition.Key + " must be enabled]");
			OptimizeNetworkRpcNoSendEveryoneNearbyOnly = Config.Define(isAdmin: true, "Optimizations", "Network - RPC NoSpam Everyone - Nearby Only", new StringList { "RPC_DamageText" }, "List of additional messages which are not related to ZNetView that still need to be proximity filtered instead of globally broadcast.\r\nThis only affects RPCs which target Everybody.\r\n[" + ((ConfigEntryBase)OptimizeNetworkRpcNoSendEveryoneActive).Definition.Key + " must be enabled]");
			OptimizeNetworkRpcNoSendEveryoneGlobalAllow = Config.Define(isAdmin: true, "Optimizations", "Network - RPC NoSpam Everyone - Global Allow", new StringList { "RPC_TeleportTo" }, "List of RPC messages that are always allowed to be sent to everyone regardless of distance.\r\n[" + ((ConfigEntryBase)OptimizeNetworkRpcNoSendEveryoneActive).Definition.Key + " must be enabled]");
			OptimizeNetworkSendToPeersSync = Config.Define(isAdmin: true, "Optimizations", "Network - Dedicated Server - SendToPeers Sync", defaultValue: true, "When this is enabled dedicated servers will send every peer's ZDO data in the same frame update. However, it will increase server work per frame.\r\nThis has no effect on single player games or hosted games.\r\nNOTE: This is similar to the mod \"ReturnToSender\" You should not use both this feature and that mod at the same time, pick one.\r\nExplanation: The vanilla ZDOMan.SendZDOToPeers2 function splits the sending of ZDO data up over multiple frame updates asynchronously.\r\nThat is good if you are playing a hosted game because it will keep your host pc's framerate up when dealing with many peers.\r\nHowever, a dedicated server runs headless. spreading the zdo updates over multiple frames can cause clients to have packets arriving a bit later than needed.\r\n(vanilla: false)");
			FixFireIsLit = Config.Define(isAdmin: true, "BugFix", "Verify Fire Is Lit", defaultValue: true, "As of Valheim Version: 0.220.5 (n-34) vanilla code is wrong.\r\nIt is not checking if the fire is lit under a cauldron, just that it's a burning area.\r\nThis fix verifies that the fire is actually lit.");
			FixRunAttackStaminaDrain = Config.Define(isAdmin: true, "BugFix", "Fix Run Attack Stamina Drain", defaultValue: true, "Prevent excess stamina drain when running and then attacking without releasing the move button.\r\nIn vanilla, it will keep draining your stamina as if you are running even though you are no longer running when you attack.");
			FixApplyPlayerKeyOnBossDeath = Config.Define(isAdmin: true, "BugFix", "Apply Player Key", defaultValue: true, "Vanilla has a bug where it does not apply the player key on boss death.\r\nThis mostly affects Hildir's Quest when PlayerEvents is enabled.\r\nThis option is here to turn this fix off if IG later fixes the bug.");
			FixApplyPlayerKeyOnBossDeathDistance = Config.Define(isAdmin: true, "BugFix", "Apply Player Key Distance", 300f, Config.AcceptRange(0f, 1000f), "The max distance that other players can be from the boss when it dies to still get the key applied.");
			FixFuelLeak = Config.Define(isAdmin: true, "BugFix", "Fix Fuel Leak", defaultValue: true, "Prevent loss of resources when ZDO owner lags while another player adds fuel/ore to piece.\r\nForce claim ownership of the ZDO. The resource has already been removed from inventory.");
			FixWolfEatMeats = Config.Define(isAdmin: true, "BugFix", "Fix Wolf Eat Meats", new StringList { "BjornMeat", "SerpentMeat", "BoneMawSerpentMeat", "GiantBloodSack" }, "List of additional meats that wolves will eat.\r\n[restart required for changes to take effect]");
			FixExploitChairBypass = Config.Define(isAdmin: true, "BugFix", "Fix Exploit - Chair Bypass", defaultValue: true, "Prevent players from clipping through doors and walls with chairs.");
			FixExploitTooHardMsg = Config.Define(isAdmin: true, "BugFix", "Fix Exploit - Too Hard Msg", defaultValue: true, "Suppress the Too Hard message when slamming the ground to find silver.");
			FixExploitAttackAnimations = Config.Define(isAdmin: true, "BugFix", "Fix Exploit - Attack Animation", defaultValue: true, "Prevent various fast attack exploits that use animation cancelling or emote spam.\r\nThis will make the melee & bow animations uninterruptable.");
			FixGamepadDropLTriggerX = Config.Define(isAdmin: true, "BugFix", "Fix Gamepad - Drop TriggerL + X", defaultValue: true, "Prevent Gamepad TriggerL + X from droping items from your inventory.  It should not.");
			FixIconSwapTrophyAndAchievement = Config.Define(isAdmin: true, "BugFix", "Fix Icon Swap Trophy And Achievements", defaultValue: true, "The icon and trophy are backwards.  The trophy icon is achievements and achievements icon is trophies.\r\nThis option flips the icons so they are correct.\r\n[logout required for changes to take effect]");
			FixAltDodgeRequireMovementAndNoUI = Config.Define(isAdmin: true, "BugFix", "Fix Alt Dodge Require Movement And No UI", defaultValue: true, "Can no longer dodge if the UI is open and can not dodge unless movement is also applied.");
			ShowHelpInfo = Config.Define(isAdmin: true, "Compendium", "Enable Help Info", defaultValue: true, "Populate the Compendium (aka Raven Menu) with help info for installed Zen Mods.");
			ShowHelpInfoIndex = Config.Define(isAdmin: true, "Compendium", "Insertion Index", 2, "Index position in the Compendium to insert help info entries.\r\n-1 will add to the end of the list.\r\n0 will add to the top of the list.\r\n2 will add after the \"Message log\" entry.");
			ShowHelpInfoPrefix = Config.Define(isAdmin: true, "Compendium", "Label Prefix", "Zen:", "Prefix each help info entry in the Compendium with this string.");
			AllowAchievementsWithDevCommands = Config.Define(isAdmin: true, "General", "Allow Achievements With DevCommands", defaultValue: true, "Achievements will be recorded even if dev commands are used.\r\nIgnore flags applied to items if dev commands are used.\r\nThis setting is applied to all players on the server.\r\n[Same logic as the vanilla command: yesiuseddevcommandsbutiwantmyachievementsanyway]");
			DefaultHighlightColor = Config.Define<Color>(isAdmin: false, "General", "Default Highlight Color", new Color(1f, 0.5f, 0f, 1f), "Default highlight color when outlining pieces.");
			RemoveRichTextFromTranslations = Config.Define(isAdmin: true, "General", "Remove Rich Text From Translations", new StringList { "_RtD$" }, "Comma separated list of regex patterns matched against the translation keys. \r\nMatched keys have their translations stripped of rich text tags.\r\nSome mods add rich text tags like <color> to their translations.\r\nIn order to provide a consistent UI theme you can remove those tags from the translations of matched keys.\r\nIf you don't want to remove any tags then leave the list empty. (Default is to remove the rich text on RtD mods)\r\nIf you need help with regex patterns then check out https://regex101.com/ or ask an AI.");
			InteractAltKey = Config.Define<KeyCode>(isAdmin: false, "Input", "Alternate Interact Key", (KeyCode)113, $"Single key to use for alternative interaction instead of Shift + E\r\nThis is a single button that can be pressed instead of a button combo for alternative ineract behavior.\r\nDedicated button: cleaner UI, simpler controls, less keystrokes.\r\nIf set to {(object)(KeyCode)0} then the vanilla key combo Shift + E is used instead.\r\n(Vanilla: {(object)(KeyCode)0})");
			InteractAltKey.SettingChanged += (object _, EventArgs _) =>
			{
				ZenMod<ModLib>.Instance.RefreshInputs();
			};
			InteractAltUseShiftE = Config.Define(isAdmin: true, "Input", "Alternate Interact Use Shift+E", defaultValue: false, string.Format("Disabling this can prevent accidentially invoking Shift+E when {0} is defined.\r\nFor example, can be useful when trying to run and press E at the same time.\r\nNOTE: If you use other mods and disable this they won't detect the Shift input key.\r\nHowever, if they are designed to detect alt interact via vanilla inputs then \r\nyou should be able to use the {1} instead.\r\nNOTE: This option has no effect if {2} is set to {3}\r\n(Vanilla: true)", new object[4]
			{
				((ConfigEntryBase)InteractAltKey).Definition.Key,
				((ConfigEntryBase)InteractAltKey).Definition.Key,
				((ConfigEntryBase)InteractAltKey).Definition.Key,
				(object)(KeyCode)0
			}));
			GamepadRemapRule = Config.Define(isAdmin: false, "Input", "Gamepad Remap Rule", GamepadRemap.RemapRule.Automatic, "Some ZenMods add extra button inputs that do not fit on the standard vanilla gamepad layouts.  In these cases the inputs are remapped to make room for the new inputs.\r\nAll new inputs are documented in the Pause Menu when using a Gamepad.\r\n- Automatic: Let Zen.ModLib decide when to remap the Gamepad based on installed mods.\r\n- Always: Remap is always applied, even if not needed by a ZenMod.\r\n- Never: Remap is never applied. (This can cause some ZenMods that depend on the remap to not work correctly with Gamepad)\r\n[restart required for changes to take effect]");
			GamepadRadialMenu = Config.Define(isAdmin: false, "Input", "Gamepad Radial Menu", defaultValue: true, "Enable or disable the radial menu activation when using a gamepad.  \r\nIf this is disabled the menu can only be activated via keyboard.\r\n[restart required for changes to take effect]");
			GamepadRadialMenuDuration = Config.Define(isAdmin: false, "Input", "Gamepad Radial Menu Duration", 0.33f, Config.AcceptRange(0.33f, 1f), "How long to hold the button before activating the radial menu on gamepad. (Vanilla: 0.33)");
		}
	}

	public const string PluginName = "Zen.ModLib";

	public const string PluginVersion = "1.14.22";

	public const string PluginGUID = "ZenDragon.Zen.ModLib";

	public static bool IsApplicationQuit { get; private set; }

	private void OnApplicationQuit()
	{
		IsApplicationQuit = true;
	}

	protected override void Setup()
	{
		switch (Configs.GamepadRemapRule.Value)
		{
		case GamepadRemap.RemapRule.Always:
			Logging<ModLib>.Message($"Gamepad remap rule: {GamepadRemap.RemapRule.Always}");
			ZenMod.RequireGamepadRemap = true;
			break;
		case GamepadRemap.RemapRule.Never:
			Logging<ModLib>.Warning($"Gamepad remap rule: {GamepadRemap.RemapRule.Never} (Some ZenMods will not work correctly with Gamepad)");
			break;
		default:
			throw new ArgumentOutOfRangeException("GamepadRemapRule");
		case GamepadRemap.RemapRule.Automatic:
			break;
		}
		RunOnServer = true;
		SetupConsoleCommands();
		LanguageChanged += OnLanguageChanged;
		ConfigSync += FixWolfEatMeat.InitPrefab;
	}

	protected override void TitleScene(bool isFirstBoot)
	{
	}

	protected override void HotRestore()
	{
		base.HotRestore();
		ServerTime.RegisterRPC();
	}

	internal void BeforeWorldStart()
	{
		if (Configs.SanitizeDataAfterSync.Value)
		{
			SanitizeData.SanitizeItemsAndRecipes("After Sync - World Start");
		}
	}

	protected override void WorldStart()
	{
		VirtualInventory.Init();
		AdminStatusIndicators.Init();
		RelayCmd.RegisterRPC();
		ServerAdmin.AdjustTerminalCommands();
		ConsoleRules.SetAdminOnlyCommands();
	}

	protected override void Shutdown()
	{
		Logging<ModLib>.Message("Shutting down");
		ServerTime.Shutdown();
		QuickOutline.Shutdown();
		RelayCmd.Shutdown();
		FixAddPlayerKeyOnBossDeath.Shutdown();
		VirtualInventory.Shutdown();
		AdminStatusIndicators.Shutdown();
	}

	private static void OnLanguageChanged(string language)
	{
		InteractAlt.ClearCache();
		if (Configs.RemoveRichTextFromTranslations.Value.Any())
		{
			Localization.instance.RemoveRichTextTags();
		}
	}

	private static void SetupConsoleCommands()
	{
		ZenMod<ModLib>.Terminal.CreateCommand(new RelayCmd());
		ZenMod<ModLib>.Terminal.CreateCommand(new PlayerListCmd());
		ZenMod<ModLib>.Terminal.CreateCommand(new BroadcastCmd());
		ZenMod<ModLib>.Terminal.CreateCommand(new RepairAllCmd());
	}
}
