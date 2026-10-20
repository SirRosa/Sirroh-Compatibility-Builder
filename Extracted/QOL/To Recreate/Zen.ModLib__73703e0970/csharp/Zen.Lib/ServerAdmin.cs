using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using BepInEx.Bootstrap;
using BepInEx.Configuration;
using HarmonyLib;
using JetBrains.Annotations;
using Jotunn.Managers;
using UnityEngine;

namespace Zen.Lib;

[HarmonyPatch]
internal static class ServerAdmin
{
	private static class ZDOVar
	{
		public static readonly int GodMode = StringExtensionMethods.GetStableHashCode("Zen_IsGodMode");

		public static readonly int GhostMode = StringExtensionMethods.GetStableHashCode("Zen_IsGhostMode");
	}

	[HarmonyPatch(typeof(ZNet), "InternalCommand")]
	private static class ZNetInternalCommand
	{
		[UsedImplicitly]
		private static void Prefix(ZNet __instance, ZRpc? rpc)
		{
			if (IsConfigsAllow)
			{
				_bypassCheat = false;
				if (IsDedicatedServer && rpc != null && __instance.ListContainsId(__instance.m_adminList, rpc.GetSocket().GetHostName()))
				{
					_bypassCheat = true;
				}
			}
		}

		[UsedImplicitly]
		private static void Finalizer()
		{
			_bypassCheat = false;
		}
	}

	[HarmonyPatch]
	private static class ZNetRemoteCommand
	{
		private static ZRpc? _requester;

		[HarmonyPrefix]
		[HarmonyPatch(typeof(ZNet), "RPC_RemoteCommand")]
		private static void ZNet_RPC_RemoteCommand_Prefix(ZNet __instance, ZRpc? rpc)
		{
			if (__instance.IsDedicated())
			{
				_requester = rpc;
			}
		}

		[HarmonyFinalizer]
		[HarmonyPatch(typeof(ZNet), "RPC_RemoteCommand")]
		private static void ZNet_RPC_RemoteCommand_Finalizer()
		{
			_requester = null;
		}

		[HarmonyPrefix]
		[HarmonyPatch(typeof(Terminal), "AddString", new Type[] { typeof(string) })]
		private static void Terminal_AddString(string text, ref bool __runOriginal)
		{
			if (_requester != null)
			{
				ZNet.instance.RemotePrint(_requester, text);
				__runOriginal = false;
			}
		}
	}

	private static bool _bypassCheat;

	private static bool IsModServerDevCommandsInstalled => Chainloader.PluginInfos.ContainsKey("server_devcommands");

	private static bool IsConfigsAllow
	{
		get
		{
			if (ModLib.Configs.AdminAllowServerCommands.Value)
			{
				return !IsModServerDevCommandsInstalled;
			}
			return false;
		}
	}

	private static bool IsDedicatedServer
	{
		get
		{
			if (Object.op_Implicit((Object)(object)ZNet.instance))
			{
				return ZNet.instance.IsDedicated();
			}
			return false;
		}
	}

	internal static bool IsAdminInCheatMode
	{
		get
		{
			if (SynchronizationManager.Instance.PlayerIsAdmin)
			{
				if (!Terminal.m_cheat)
				{
					return _bypassCheat;
				}
				return true;
			}
			return false;
		}
	}

	private static void SetAdminDefaults(Player player)
	{
		if (!ZNet.instance.IsDedicated() && !((Object)(object)Player.m_localPlayer != (Object)(object)player))
		{
			Terminal.m_cheat = false;
			if (ModLib.Configs.AdminLoginAutoDevCommandsMode.Value)
			{
				((Terminal)Chat.instance).TryRunCommand("devcommands", false, false);
			}
			_bypassCheat = true;
			if (ModLib.Configs.AdminLoginAutoGodMode.Value)
			{
				((Terminal)Chat.instance).TryRunCommand("god on", false, false);
			}
			if (ModLib.Configs.AdminLoginAutoGhostMode.Value)
			{
				((Terminal)Chat.instance).TryRunCommand("ghost on", false, false);
			}
			if (ModLib.Configs.AdminLoginAutoNoCostMode.Value)
			{
				((Terminal)Chat.instance).TryRunCommand("nocost on", false, false);
			}
			_bypassCheat = false;
		}
	}

	internal static void AdjustTerminalCommands()
	{
		if (IsConfigsAllow && Terminal.commands.TryGetValue("listkeys", out var value))
		{
			value.RemoteCommand = false;
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Game), "SpawnPlayer")]
	private static void Game_SpawnPlayer(Game __instance, Player __result)
	{
		if (IsConfigsAllow && SynchronizationManager.Instance.PlayerIsAdmin && __instance.m_firstSpawn)
		{
			SetAdminDefaults(__result);
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Terminal), "IsCheatsEnabled")]
	private static void Terminal_IsCheatsEnabled(Terminal __instance, ref bool __result)
	{
		if (IsConfigsAllow)
		{
			__result = __result || IsAdminInCheatMode;
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(ConsoleCommand), "IsValid")]
	private static IEnumerable<CodeInstruction> ConsoleCommand_IsValid(IEnumerable<CodeInstruction> codes)
	{
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		//IL_002f: Expected Obj, but got Unknown
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0060: Expected Obj, but got Unknown
		//IL_006d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0073: Expected Obj, but got Unknown
		//IL_0076: Unknown result type (might be due to invalid IL or missing references)
		CodeMatch[] array = new CodeMatch[1]
		{
			new CodeMatch((OpCode?)OpCodes.Callvirt, (object)AccessTools.DeclaredMethod(typeof(ZNet), "IsServer", (Type[])null, (Type[])null), (string)null)
		};
		Func<bool, ConsoleCommand, bool> func = IsServerOrAdmin;
		CodeInstruction[] array2 = new CodeInstruction[2]
		{
			new CodeInstruction(OpCodes.Ldarg_0, (object)null),
			new CodeInstruction(OpCodes.Call, (object)func.Method)
		};
		return new CodeMatcher(codes, (ILGenerator)null).End().MatchEndBackwards(array).ThrowIfInvalid("Unable to match IL sequence")
			.Advance(1)
			.Insert(array2)
			.InstructionEnumeration();
		static bool IsServerOrAdmin(bool isServer, ConsoleCommand command)
		{
			if (!IsConfigsAllow)
			{
				return isServer;
			}
			if (isServer)
			{
				return true;
			}
			if (command.RemoteCommand)
			{
				return false;
			}
			return IsAdminInCheatMode;
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Minimap), "OnMapMiddleClick")]
	private static void Minimap_OnMapMiddleClick(Minimap __instance, ref bool __runOriginal)
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_002a: Unknown result type (might be due to invalid IL or missing references)
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_005f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0051: Unknown result type (might be due to invalid IL or missing references)
		if (IsAdminInCheatMode && !IsModServerDevCommandsInstalled && ZInput.GetKey(ModLib.Configs.AdminMapTeleportKey.Value, true))
		{
			__instance.HidePinTextInput(false);
			Vector3 val = __instance.ScreenToWorldPoint(ZInput.pointerPosition);
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(16, 1, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Teleporting to: ");
				msg.AppendFormatted<Vector3>(val);
			}
			Logging<ModLib>.Info(msg);
			__instance.DebugTeleport(val);
			__runOriginal = false;
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Chat), "isAllowedCommand")]
	private static bool Chat_IsAllowedCommand(Chat __instance, ConsoleCommand cmd, ref bool __result)
	{
		if (IsModServerDevCommandsInstalled)
		{
			return true;
		}
		if (ModLib.Configs.AdminProcessChatSlash.Value && IsAdminInCheatMode)
		{
			__result = true;
			return false;
		}
		return true;
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Container), "CheckAccess")]
	private static bool Container_CheckAccess(ref bool __result)
	{
		return CheckAccess(ref __result);
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(PrivateArea), "CheckAccess")]
	private static bool PrivateArea_CheckAccess(ref bool __result)
	{
		return CheckAccess(ref __result);
	}

	private static bool CheckAccess(ref bool result)
	{
		if (IsModServerDevCommandsInstalled)
		{
			return true;
		}
		if (ModLib.Configs.AdminEnterPrivateAreas.Value && IsAdminInCheatMode)
		{
			result = true;
			return false;
		}
		return true;
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Terminal), "TryRunCommand")]
	private static bool Terminal_TryRunCommand(Terminal __instance, string text)
	{
		if (!IsConfigsAllow)
		{
			return true;
		}
		if (!text.TrimStart(Array.Empty<char>()).ToLowerInvariant().StartsWith("devcommands"))
		{
			return true;
		}
		if (!SynchronizationManager.Instance.PlayerIsAdmin)
		{
			__instance.AddString("You are not admin");
			return false;
		}
		if (IsDedicatedServer)
		{
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(118, 1, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("For security, blocking 'devcommands' on the dedicated server. It should never be in 'cheat' mode. Disable via config: ");
				msg.AppendFormatted(((ConfigEntryBase)ModLib.Configs.AdminAllowServerCommands).Definition.Key);
			}
			Logging<ModLib>.Info(msg);
			return false;
		}
		return true;
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(Terminal), "TryRunCommand")]
	[HarmonyPriority(0)]
	private static IEnumerable<CodeInstruction> Terminal_TryRunCommand(IEnumerable<CodeInstruction> codes)
	{
		FieldInfo remoteCommand = AccessTools.DeclaredField(typeof(ConsoleCommand), "RemoteCommand");
		Func<ConsoleCommand, bool> remoteAndContextValid = IsRemoteAndContextValid;
		return Transpilers.Manipulator(codes, (Func<CodeInstruction, bool>)((CodeInstruction c) => CodeInstructionExtensions.Is(c, OpCodes.Ldfld, (MemberInfo)remoteCommand)), (Action<CodeInstruction>)((CodeInstruction c) =>
		{
			c.opcode = OpCodes.Call;
			c.operand = remoteAndContextValid.Method;
		}));
		static bool IsRemoteAndContextValid(ConsoleCommand command)
		{
			if (!IsConfigsAllow)
			{
				return command.RemoteCommand;
			}
			if (!command.RemoteCommand)
			{
				return false;
			}
			if (command.IsCheat)
			{
				return IsAdminInCheatMode;
			}
			return true;
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Player), "SetGodMode")]
	private static void Player_SetGodMode(Player __instance)
	{
		if (((Character)__instance).m_nview.TryGetZDO(out ZDO zdo))
		{
			zdo.Set(ZDOVar.GodMode, __instance.m_godMode);
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Player), "InGodMode")]
	private static void Player_InGodMode(Player __instance, ref bool __result)
	{
		if (!__result && ((Character)__instance).m_nview.TryGetZDO(out ZDO zdo))
		{
			__result = zdo.GetBool(ZDOVar.GodMode, false);
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Player), "SetGhostMode")]
	private static void Player_SetGhostMode(Player __instance)
	{
		if (((Character)__instance).m_nview.TryGetZDO(out ZDO zdo))
		{
			zdo.Set(ZDOVar.GhostMode, __instance.m_ghostMode);
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Player), "InGhostMode")]
	private static void Player_InGhostMode(Player __instance, ref bool __result)
	{
		if (!__result && ((Character)__instance).m_nview.TryGetZDO(out ZDO zdo))
		{
			__result = zdo.GetBool(ZDOVar.GhostMode, false);
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Player), "EdgeOfWorldKill")]
	private static void Player_EdgeOfWorldKill(Player __instance, ref bool __runOriginal)
	{
		__runOriginal = !((Character)__instance).InGodMode();
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Player), "IsEncumbered")]
	[HarmonyPriority(0)]
	private static void Player_IsEncumbered(Player __instance, ref bool __result)
	{
		if (!IsModServerDevCommandsInstalled && __result && ModLib.Configs.AdminUnencumberedGods.Value && ((Character)__instance).InGodMode())
		{
			__result = false;
		}
	}
}
