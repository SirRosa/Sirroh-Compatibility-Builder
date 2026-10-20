using HarmonyLib;

namespace CarturSafeStamina;

[HarmonyPatch(typeof(Player), "UseStamina")]
public static class Patch_EncumberedDrain
{
	private static bool Prefix()
	{
		return !Patch_EncumberedBracket.Skip;
	}
}
