using HarmonyLib;

namespace CarturSafeStamina;

[HarmonyPatch(typeof(SEMan), "ModifySneakStaminaUsage")]
public static class Patch_SneakStamina
{
	private static void Postfix(ref float staminaUse, bool minZero, Character ___m_character)
	{
		if (minZero && Plugin.AffectSneak.Value && Plugin.IsLocalAndSafe(___m_character))
		{
			staminaUse = 0f;
		}
	}
}
