using System;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using System.Text;
using HarmonyLib;
using Jotunn.Managers;
using UnityEngine;

namespace Zen.Lib;

[HarmonyPatch]
internal static class ConsoleRules
{
	public static void SetAdminOnlyCommands()
	{
		if (ZNet.instance.IsDedicated())
		{
			return;
		}
		foreach (string item in ModLib.Configs.CommandsRequireAdmin.Value)
		{
			if (Terminal.commands.TryGetValue(item.ToLower(), out var value))
			{
				value.IsCheat = true;
			}
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Console), "Update")]
	private static void Console_Update()
	{
		if (Object.op_Implicit((Object)(object)ZNet.instance) && !ZNet.IsSinglePlayer)
		{
			if (SynchronizationManager.Instance.PlayerIsAdmin)
			{
				Console.m_consoleEnabled = true;
			}
			else if (!ModLib.Configs.ConsoleAllowed.Value)
			{
				Console.m_consoleEnabled = false;
			}
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(/*Could not decode attribute arguments.*/)]
	private static void ConsoleEventArgs_Constructor(ConsoleEventArgs __instance, string line)
	{
		if (ModLib.Configs.ConsoleUseQuotedArgs.Value)
		{
			__instance.Args = SplitQuotedArgs(line);
		}
	}

	private static string[] SplitQuotedArgs(string line)
	{
		List<string> list = new List<string>();
		StringBuilder stringBuilder = new StringBuilder();
		bool flag = false;
		foreach (char c in line)
		{
			if (c == '"')
			{
				flag = !flag;
				stringBuilder.Append(c);
			}
			else if (char.IsWhiteSpace(c) && !flag)
			{
				if (stringBuilder.Length > 0)
				{
					list.Add(UnquoteIfFullyQuoted(stringBuilder.ToString()));
					stringBuilder.Clear();
				}
			}
			else
			{
				stringBuilder.Append(c);
			}
		}
		if (stringBuilder.Length > 0)
		{
			list.Add(UnquoteIfFullyQuoted(stringBuilder.ToString()));
		}
		return list.ToArray();
		static string UnquoteIfFullyQuoted(string token)
		{
			if (token.Length > 1 && token[0] == '"' && token[token.Length - 1] == '"')
			{
				return token.Substring(1, token.Length - 2);
			}
			return token;
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(Chat), "Update")]
	[HarmonyPriority(100)]
	private static IEnumerable<CodeInstruction> Chat_Update(IEnumerable<CodeInstruction> codes, ILGenerator gen)
	{
		MethodInfo methodInfo = AccessTools.DeclaredMethod(typeof(Terminal), "TryRunCommand", (Type[])null, (Type[])null);
		Action<Terminal, string, bool, bool> action = InterceptTryRunCommand;
		return Transpilers.MethodReplacer(codes, (MethodBase)methodInfo, (MethodBase)action.Method);
		static void InterceptTryRunCommand(Terminal terminal, string text, bool silentFail, bool skipAllowedCheck)
		{
			if (SynchronizationManager.Instance.PlayerIsAdmin || !ModLib.Configs.CommandsRequireAdmin.Value.Contains("bind"))
			{
				terminal.TryRunCommand(text, silentFail, skipAllowedCheck);
			}
		}
	}
}
