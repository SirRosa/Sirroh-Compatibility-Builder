using HarmonyLib;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixRunAttackStaminaDrain
{
	[HarmonyPostfix]
	[HarmonyPatch(typeof(Character), "CheckRun")]
	private static void Character_CheckRun(Character __instance, ref bool __result)
	{
		if (ModLib.Configs.FixRunAttackStaminaDrain.Value && __result)
		{
			__result = !__instance.InAttack();
		}
	}
}
