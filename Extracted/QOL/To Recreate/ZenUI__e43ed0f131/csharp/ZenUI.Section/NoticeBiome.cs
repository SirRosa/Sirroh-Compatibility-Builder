using System;
using System.Collections.Generic;
using System.Reflection;
using HarmonyLib;
using UnityEngine;
using Zen;
using Zen.Lib;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class NoticeBiome
{
	private const float BiomeMessageDelay = 3.5f;

	private const double BiomeMessageCooldown = 0.0;

	private static double _lastBiomeMessageTime;

	private static void ShowBiomeMessage(this Player? player, BiomeSector? prevBiome = null)
	{
		if (!Object.op_Implicit((Object)(object)player))
		{
			return;
		}
		((MonoBehaviour)(object)player).Delay(3.5f, () =>
		{
			//IL_0010: Unknown result type (might be due to invalid IL or missing references)
			BiomeSector biomeSector = WorldGenerator.instance.GetBiomeSector(((Component)player).transform.position, false);
			string name = biomeSector.GetName(false);
			BiomeSector? val = prevBiome;
			bool shouldAppend;
			if (name == ((val != null) ? val.GetName(false) : null))
			{
				Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(26, 1, out shouldAppend);
				if (shouldAppend)
				{
					msg.AppendLiteral("Biome unchanged, skipping ");
					msg.AppendFormatted(name);
				}
				Logging<Plugin>.Info(msg);
			}
			else if (MessageHud.instance.m_biomeFoundQueue.Count > 0)
			{
				Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(39, 1, out shouldAppend);
				if (shouldAppend)
				{
					msg.AppendLiteral("Biome message already queued, skipping ");
					msg.AppendFormatted<BiomeSector>(biomeSector);
				}
				Logging<Plugin>.Info(msg);
			}
			else if (Time.timeAsDouble < _lastBiomeMessageTime + 0.0)
			{
				Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(54, 2, out shouldAppend);
				if (shouldAppend)
				{
					msg.AppendLiteral("Biome message recently displayed, cooldown: ");
					msg.AppendFormatted(0.0);
					msg.AppendLiteral(" skipping ");
					msg.AppendFormatted<BiomeSector>(biomeSector);
				}
				Logging<Plugin>.Info(msg);
			}
			else
			{
				Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(21, 1, out shouldAppend);
				if (shouldAppend)
				{
					msg.AppendLiteral("Show biome messsage: ");
					msg.AppendFormatted(name);
				}
				Logging<Plugin>.Info(msg);
				MessageHud.instance.ShowBiomeFoundMsg(name, true);
			}
		});
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Game), "SpawnPlayer")]
	private static void Game_SpawnPlayer(Game __instance, Player __result, bool spawnValkyrie)
	{
		if (!spawnValkyrie && Configs.NoticeShowBiome.Value.HasFlag(BiomeNoticeType.PlayerSpawn))
		{
			__result.ShowBiomeMessage();
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Player), "TeleportTo")]
	private static void Player_TeleportTo(Player __instance, bool distantTeleport, bool __result)
	{
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		if (Configs.NoticeShowBiome.Value.HasFlag(BiomeNoticeType.Teleport) && distantTeleport && __result)
		{
			BiomeSector prevBiome = WorldGenerator.instance.GetBiomeSector(((Component)__instance).transform.position, false);
			((MonoBehaviour)(object)__instance).WhenNot((Func<bool>)((Character)__instance).IsTeleporting, (Action)(() =>
			{
				__instance.ShowBiomeMessage(prevBiome);
			}));
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(MessageHud), "ShowBiomeFoundMsg")]
	private static void MessageHud_ShowBiomeFoundMsg(ref bool __runOriginal)
	{
		if (Configs.NoticeShowBiome.Value.HasFlag(BiomeNoticeType.Teleport))
		{
			_lastBiomeMessageTime = Time.timeAsDouble;
			if (Player.m_localPlayer.ShowTeleportAnimation())
			{
				__runOriginal = false;
			}
		}
	}

	[HarmonyTranspiler]
	[HarmonyPatch(typeof(Player), "AddKnownBiome")]
	[HarmonyPriority(100)]
	private static IEnumerable<CodeInstruction> Player_AddKnownBiome_Transpiler(IEnumerable<CodeInstruction> codes)
	{
		MethodInfo methodInfo = AccessTools.Method(typeof(MessageHud), "ShowBiomeFoundMsg", (Type[])null, (Type[])null);
		Action<MessageHud, string, bool> action = ShowBiomeFoundMsgIntercept;
		return Transpilers.MethodReplacer(codes, (MethodBase)methodInfo, (MethodBase)action.Method);
		static void ShowBiomeFoundMsgIntercept(MessageHud self, string text, bool playStinger)
		{
			if (Configs.NoticeShowBiome.Value.HasFlag(BiomeNoticeType.Discovery))
			{
				self.ShowBiomeFoundMsg(text, playStinger);
			}
		}
	}
}
