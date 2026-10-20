using System;
using HarmonyLib;
using UnityEngine;

namespace Slayer;

internal static class SlayerPushback
{
	[HarmonyPatch(typeof(Character), "ApplyPushback", new Type[]
	{
		typeof(Vector3),
		typeof(float)
	})]
	private static class PushbackPatch
	{
		private static void Prefix(Character __instance, ref Vector3 dir, ref float pushForce)
		{
			//IL_003f: Unknown result type (might be due to invalid IL or missing references)
			if (!SlayerConfig.PushbackResistanceEnabled.Value)
			{
				return;
			}
			Player val = (Player)(object)((__instance is Player) ? __instance : null);
			if (val != null && !((Object)(object)val != (Object)(object)Player.m_localPlayer))
			{
				float skillFactor = ((Character)val).GetSkillFactor(Slayer.SlayerType);
				float num = Mathf.Clamp01(skillFactor * SlayerConfig.PushbackResistanceAmount.Value);
				if (((Character)val).InAttack())
				{
					ApplyResistance(ref dir, ref pushForce, num);
				}
				else if (((Character)val).IsBlocking())
				{
					ApplyResistance(ref dir, ref pushForce, num * 0.5f);
				}
			}
		}

		private static void ApplyResistance(ref Vector3 dir, ref float pushForce, float resistance)
		{
			//IL_0027: Unknown result type (might be due to invalid IL or missing references)
			//IL_002c: Unknown result type (might be due to invalid IL or missing references)
			float num = 1f - resistance;
			pushForce *= num;
			if (num <= 0f)
			{
				pushForce = 0f;
				dir = Vector3.zero;
			}
		}
	}

	public static void Initialize()
	{
	}
}
