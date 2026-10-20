using System;
using System.Linq;
using HarmonyLib;
using UnityEngine;
using Zen.Lib;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixAddPlayerKeyOnBossDeath
{
	private static float MaxDistance => ModLib.Configs.FixApplyPlayerKeyOnBossDeathDistance.Value;

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Character), "Awake")]
	private static void Character_Awake(Character __instance)
	{
		if (ModLib.Configs.FixApplyPlayerKeyOnBossDeath.Value && Object.op_Implicit((Object)(object)__instance.m_nview))
		{
			__instance.m_nview.Register<string, Vector3>("RPC_SetPlayerKeyOnDeath", (Action<long, string, Vector3>)RPC_SetPlayerKeyOnDeath);
		}
	}

	internal static void Shutdown()
	{
		if (!ModLib.Configs.FixApplyPlayerKeyOnBossDeath.Value)
		{
			return;
		}
		foreach (Character item in Character.s_characters.Where((Character c) => Object.op_Implicit((Object)(object)c.m_nview)))
		{
			item.m_nview.Unregister("RPC_SetPlayerKeyOnDeath");
		}
	}

	private static void RPC_SetPlayerKeyOnDeath(long sender, string key, Vector3 position)
	{
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_004e: Unknown result type (might be due to invalid IL or missing references)
		if (Object.op_Implicit((Object)(object)Player.m_localPlayer) && ((MonoBehaviour)(object)Player.m_localPlayer).DistanceTo(position) < MaxDistance)
		{
			Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(23, 2, out var shouldAppend);
			if (shouldAppend)
			{
				msg.AppendLiteral("Set key: ");
				msg.AppendFormatted(key);
				msg.AppendLiteral(" at position: ");
				msg.AppendFormatted<Vector3>(position);
			}
			Logging<ModLib>.Info(msg);
			((Humanoid)Player.m_localPlayer).AddUniqueKey(key);
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Character), "OnDeath")]
	private static void Character_OnDeath(Character __instance)
	{
		//IL_0065: Unknown result type (might be due to invalid IL or missing references)
		if (ModLib.Configs.FixApplyPlayerKeyOnBossDeath.Value && !__instance.IsPlayer() && !string.IsNullOrEmpty(__instance.m_defeatSetGlobalKey) && Object.op_Implicit((Object)(object)__instance.m_nview) && __instance.m_nview.IsOwner())
		{
			__instance.m_nview.InvokeRPC(ZNetView.Everybody, "RPC_SetPlayerKeyOnDeath", new object[2]
			{
				__instance.m_defeatSetGlobalKey,
				((Component)__instance).transform.position
			});
		}
	}
}
