using System;
using System.Linq;
using BepInEx;
using HarmonyLib;
using UnityEngine;
using Zen.Lib;

namespace Zen.Commands;

[HarmonyPatch]
internal sealed class RelayCmd : TerminalCtrl.TerminalCommand
{
	public const string DefinitionSyntax = "relay <player> <command>";

	private const string CommandName = "relay";

	private const int None = 0;

	private static long _netTarget;

	public override string Name => "relay";

	public override string Description => "Execute a command as another player's character.";

	public override string Syntax => "relay <player> <command>";

	public override bool IsCheat => true;

	public override bool UsePrefix => false;

	private static string MyPlayerName
	{
		get
		{
			Player localPlayer = Player.m_localPlayer;
			return ((localPlayer != null) ? localPlayer.GetPlayerName() : null) ?? "Unknown";
		}
	}

	private static bool IsRelayRequest => _netTarget != 0;

	private static void RedirectOutput(long uid)
	{
		_netTarget = uid;
	}

	public override void Exec(string[] args)
	{
		string text = GeneralExtensions.Join<string>(args.Skip(2), (Func<string, string>)null, " ");
		if (Utility.IsNullOrWhiteSpace(text) || args.Length < 3)
		{
			((Terminal)Console.instance).AddString("Syntax: " + Syntax);
			return;
		}
		string text2 = args[1];
		long playerUID = ZNet.instance.GetPlayerUID(text2);
		if (playerUID == 0L)
		{
			((Terminal)Console.instance).AddString("Unable to find player: " + text2);
			return;
		}
		if (playerUID == ZNet.GetUID())
		{
			((Terminal)Console.instance).AddString("You cannot relay commands to yourself");
			return;
		}
		ZRoutedRpc.instance.InvokeRoutedRPC(playerUID, "RPC_RelayCommand", new object[2] { MyPlayerName, text });
	}

	internal static void RegisterRPC()
	{
		if (Object.op_Implicit((Object)(object)ZNet.instance) && !ZNet.instance.IsDedicated())
		{
			ZRoutedRpc.instance.Register<string, string>("RPC_RelayCommand", (Action<long, string, string>)RPC_RelayCommand);
			ZRoutedRpc.instance.Register<string, string>("RPC_RelayResponse", (Action<long, string, string>)RPC_RelayResponse);
		}
	}

	private static void UnregisterRPC()
	{
		if (Object.op_Implicit((Object)(object)ZNet.instance) && !ZNet.instance.IsDedicated())
		{
			ZRoutedRpc.instance.Unregister("RPC_RelayCommand");
			ZRoutedRpc.instance.Unregister("RPC_RelayResponse");
		}
	}

	internal static void Shutdown()
	{
		UnregisterRPC();
	}

	private static void RPC_RelayCommand(long sender, string senderName, string command)
	{
		string text = command.Split(new char[1] { ' ' }).FirstOrDefault() ?? string.Empty;
		Logging<ModLib>.Message("Remote command recieved from " + senderName + ": " + text + "...");
		if (!ModLib.Configs.CommandRelayEnabled.Value)
		{
			SendResponse(sender, "Not accepting relay commands.");
			return;
		}
		if (text.ToLower() == "relay".ToLower())
		{
			SendResponse(sender, "You cannot double relay");
			return;
		}
		((Terminal)Console.instance).AddString("Executing command on behalf of " + senderName);
		RedirectOutput(sender);
		RunConsoleCommand(Console.instance, command, silentFail: false, skipAllowedCheck: true);
		RedirectOutput(0L);
	}

	[HarmonyReversePatch(/*Could not decode attribute arguments.*/)]
	[HarmonyPatch(typeof(Terminal), "TryRunCommand")]
	private static void RunConsoleCommand(object instance, string text, bool silentFail = false, bool skipAllowedCheck = false)
	{
		throw new NotImplementedException("reverse patch stub");
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Achievements), "IsCheatedAtAll")]
	private static void Achievements_IsCheatedAtAll(ref bool __result)
	{
		if (IsRelayRequest)
		{
			__result = true;
		}
	}

	private static void SendResponse(long target, string text)
	{
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(28, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Sending response to remote: ");
			msg.AppendFormatted(text);
		}
		Logging<ModLib>.Info(msg);
		ZRoutedRpc.instance.InvokeRoutedRPC(target, "RPC_RelayResponse", new object[2] { MyPlayerName, text });
	}

	private static void RPC_RelayResponse(long sender, string senderName, string response)
	{
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(25, 2, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Response received from ");
			msg.AppendFormatted(senderName);
			msg.AppendLiteral(": ");
			msg.AppendFormatted(response);
		}
		Logging<ModLib>.Info(msg);
		((Terminal)Console.instance).AddString("[" + senderName + "] " + response);
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Terminal), "AddString", new Type[] { typeof(string) })]
	private static void Console_AddString(ref string text, ref bool __runOriginal)
	{
		if (IsRelayRequest)
		{
			SendResponse(_netTarget, text);
			__runOriginal = false;
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(ConsoleCommand), "IsValid")]
	private static void ConsoleCommand_IsValid(ref bool __result)
	{
		__result = __result || IsRelayRequest;
	}
}
