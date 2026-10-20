using HarmonyLib;

namespace CarturSafeStamina;

[HarmonyPatch(typeof(SEMan), "ModifyJumpStaminaUsage")]
public static class Patch_JumpStamina
{
	private static void Postfix(ref float staminaUse, bool minZero, Character ___m_character)
	{
		if (minZero && Plugin.AffectJump.Value && Plugin.IsLocalAndSafe(___m_character))
		{
			staminaUse = 0f;
		}
	}
}
