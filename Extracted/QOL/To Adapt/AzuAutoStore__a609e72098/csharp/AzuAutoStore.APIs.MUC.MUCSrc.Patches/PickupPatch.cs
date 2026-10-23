using System.Runtime.CompilerServices;
using HarmonyLib;

namespace AzuAutoStore.APIs.MUC.MUCSrc.Patches;

[HarmonyPatch]
public static class PickupPatch
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	[HarmonyPatch(typeof(Humanoid), "Pickup")]
	[HarmonyPrefix]
	public static bool HaveEmptySlotPrefix(Humanoid __instance, ref bool __result)
	{
		if (MUCCompat.DoNotPatch)
		{
			return true;
		}
		if (InventoryBlock.Get(__instance.GetInventory()).IsAnySlotBlocked())
		{
			__result = false;
			return false;
		}
		return true;
	}
}
