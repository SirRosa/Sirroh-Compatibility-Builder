using HarmonyLib;
using Husbandry.Config;
using Husbandry.Idle;

namespace Husbandry.Patches;

[HarmonyPatch(typeof(BaseAI), "UpdateAI")]
internal static class TickPatch
{
	private static bool Prepare()
	{
		if (HusbandryConfig.Enabled != null)
		{
			return HusbandryConfig.Enabled.Value;
		}
		return true;
	}

	[HarmonyPrefix]
	[HarmonyPriority(200)]
	private static bool Prefix(BaseAI __instance, ref float dt, ref bool __result)
	{
		if (!Drowse.Skip(__instance, ref dt))
		{
			return true;
		}
		__result = false;
		return false;
	}
}
