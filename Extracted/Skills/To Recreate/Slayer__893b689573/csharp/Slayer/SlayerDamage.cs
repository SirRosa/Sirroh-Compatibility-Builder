using System;
using HarmonyLib;
using UnityEngine;

namespace Slayer;

internal static class SlayerDamage
{
	[HarmonyPatch(typeof(ItemData), "GetDamage", new Type[]
	{
		typeof(int),
		typeof(float)
	})]
	private static class DamagePatch
	{
		private static void Postfix(ItemData __instance, ref DamageTypes __result)
		{
			//IL_003c: Unknown result type (might be due to invalid IL or missing references)
			if (SlayerConfig.DamageEnabled.Value)
			{
				Player localPlayer = Player.m_localPlayer;
				if (!((Object)(object)localPlayer == (Object)null) && SlayerWeapons.IsSlayerWeapon(__instance))
				{
					float skillFactor = ((Character)localPlayer).GetSkillFactor(Slayer.SlayerType);
					float num = 1f + skillFactor * SlayerConfig.DamageAmount.Value / 100f;
					__result.Modify(num);
				}
			}
		}
	}

	public static void Initialize()
	{
		Slayer.DebugLog("Damage system initialized.");
	}
}
