using System;
using HarmonyLib;
using UnityEngine;

namespace CarturSafeStamina;

[HarmonyPatch(typeof(Player), "UpdateStats", new Type[] { typeof(float) })]
public static class Patch_UpdateStats
{
	private static void Postfix(Player __instance, float dt, ref float ___m_stamina, float ___m_staminaRegenTimer)
	{
		if (!((Object)(object)__instance != (Object)(object)Player.m_localPlayer) && !(___m_staminaRegenTimer > 0f) && BlockedAndAllowed(__instance) && Plugin.IsSafe(__instance))
		{
			float maxStamina = ((Character)__instance).GetMaxStamina();
			if (!(___m_stamina >= maxStamina))
			{
				float num = __instance.m_staminaRegen + (1f - ___m_stamina / maxStamina) * __instance.m_staminaRegen * __instance.m_staminaRegenTimeMultiplier;
				float num2 = 1f;
				((Character)__instance).GetSEMan().ModifyStaminaRegen(ref num2);
				___m_stamina = Mathf.Min(maxStamina, ___m_stamina + num * num2 * dt * Game.m_staminaRegenRate);
			}
		}
	}

	private static bool BlockedAndAllowed(Player p)
	{
		if (((Character)p).IsEncumbered())
		{
			return Plugin.AffectEncumbered.Value;
		}
		if (((Character)p).IsSwimming() && !((Character)p).IsOnGround())
		{
			return Plugin.AffectSwim.Value;
		}
		if (((Character)p).InAttack() || ((Character)p).InDodge())
		{
			return Plugin.AffectAttacks.Value;
		}
		return ((Character)p).IsWallRunning();
	}
}
