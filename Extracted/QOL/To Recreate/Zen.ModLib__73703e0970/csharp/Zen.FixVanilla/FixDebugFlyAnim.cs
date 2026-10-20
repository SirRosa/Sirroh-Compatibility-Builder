using HarmonyLib;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixDebugFlyAnim
{
	[HarmonyPostfix]
	[HarmonyPatch(typeof(Character), "UpdateDebugFly")]
	private static void Character_UpdateDebugFly(Character __instance)
	{
		__instance.m_zanim.SetBool(Character.s_onGround, false);
		__instance.m_zanim.SetBool(Character.s_encumbered, false);
		__instance.m_zanim.SetBool(Character.s_animatorFalling, true);
	}
}
