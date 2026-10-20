using HarmonyLib;

namespace RunicBuildCamera.Integration;

[HarmonyPatch(typeof(CraftingStation), "GetStationBuildRange")]
internal static class CraftingStationScopedBuildRangePatch
{
	private static void Postfix(ref float __result)
	{
		if (ValheimAdapter.TryGetScopedStationRange(out var range) && __result < range)
		{
			__result = range;
		}
	}
}
