using HarmonyLib;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixShieldGenNullRefOnQuit
{
	[HarmonyPrefix]
	[HarmonyPatch(typeof(ShieldDomeImageEffect), "ToggleActiveImageEffect")]
	private static bool ShieldDomeImageEffect_ToggleActiveImageEffect()
	{
		return !ModLib.IsApplicationQuit;
	}
}
