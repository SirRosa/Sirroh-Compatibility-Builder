using HarmonyLib;

namespace BetterTames.Scripts.Breeding;

[HarmonyPatch]
public static class OffspringPatches
{
	[HarmonyPrefix]
	[HarmonyPatch(typeof(Procreation), "Procreate")]
	private static void Procreation_Procreate_Prefix(Procreation __instance)
	{
		Offspring.BeginProcreate(__instance);
	}

	[HarmonyFinalizer]
	[HarmonyPatch(typeof(Procreation), "Procreate")]
	private static void Procreation_Procreate_Finalizer()
	{
		Offspring.EndProcreate();
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Character), "SetLevel")]
	private static void Character_SetLevel_Prefix(Character __instance, ref int level)
	{
		Offspring.AdjustNewbornLevel(__instance, ref level);
	}
}
