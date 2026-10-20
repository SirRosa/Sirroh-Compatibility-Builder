using HarmonyLib;

namespace CarturSafeStamina;

[HarmonyPatch(typeof(SEMan), "ModifyRunStaminaDrain")]
public static class Patch_RunStaminaDrain
{
	private static void Postfix(ref float drain, bool minZero, Character ___m_character)
	{
		if (minZero && Plugin.AffectSprint.Value && Plugin.IsLocalAndSafe(___m_character))
		{
			drain = 0f;
		}
	}
}
