using System;
using System.Collections.Generic;
using System.Reflection;
using HarmonyLib;
using UnityEngine;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class NoticePieceRepair
{
	[HarmonyTranspiler]
	[HarmonyPatch(typeof(Player), "Repair")]
	[HarmonyPriority(0)]
	private static IEnumerable<CodeInstruction> Player_Repair(IEnumerable<CodeInstruction> codes)
	{
		MethodInfo methodInfo = AccessTools.DeclaredMethod(typeof(Character), "Message", (Type[])null, (Type[])null);
		Action<Character, MessageType, string, int, Sprite, bool> action = SuppressMessage;
		return Transpilers.MethodReplacer(codes, (MethodBase)methodInfo, (MethodBase)action.Method);
		static void SuppressMessage(Character c, MessageType type, string msg, int amount, Sprite icon, bool log)
		{
			//IL_000d: Unknown result type (might be due to invalid IL or missing references)
			if (Configs.NoticeShowPieceRepair.Value)
			{
				c.Message(type, msg, amount, icon, log);
			}
		}
	}
}
