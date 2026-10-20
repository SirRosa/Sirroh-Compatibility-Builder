using HarmonyLib;
using UnityEngine;

namespace CarturSafeStamina;

[HarmonyPatch(typeof(Attack), "GetAttackStamina")]
public static class Patch_GetAttackStamina
{
	private static void Postfix(ref float __result, Humanoid ___m_character)
	{
		if (Plugin.AffectAttacks.Value && !(__result <= 0f))
		{
			Player val = (Player)(object)((___m_character is Player) ? ___m_character : null);
			if (val != null && !((Object)(object)val != (Object)(object)Player.m_localPlayer) && Plugin.IsSafe(val))
			{
				__result = 0f;
			}
		}
	}
}
