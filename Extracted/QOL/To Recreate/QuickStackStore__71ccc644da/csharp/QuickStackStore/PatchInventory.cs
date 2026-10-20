using HarmonyLib;

namespace QuickStackStore;

[HarmonyPatch(typeof(Inventory))]
internal class PatchInventory
{
	[HarmonyPatch("TopFirst")]
	[HarmonyPrefix]
	[HarmonyPriority(500)]
	public static bool TopFirstPatch(ref bool __result)
	{
		if (QSSConfig.GeneralConfig.UseTopDownLogicForEverything.Value)
		{
			__result = true;
			return false;
		}
		return true;
	}
}
