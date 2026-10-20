using HarmonyLib;

namespace BetterTames.Scripts.Portals;

[HarmonyPatch]
public static class PortalPatches
{
	[HarmonyPostfix]
	[HarmonyPatch(typeof(TeleportWorld), "Teleport")]
	private static void TeleportWorld_Teleport_Postfix(TeleportWorld __instance, Player player)
	{
		Portals.OnTeleport(__instance, player);
	}
}
