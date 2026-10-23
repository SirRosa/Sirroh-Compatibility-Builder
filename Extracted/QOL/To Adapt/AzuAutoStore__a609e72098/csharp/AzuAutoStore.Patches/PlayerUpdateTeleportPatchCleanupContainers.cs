using AzuAutoStore.Util;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.Patches;

[HarmonyPatch(typeof(Player), "UpdateTeleport")]
public static class PlayerUpdateTeleportPatchCleanupContainers
{
	public static void Prefix(float dt)
	{
		if (!((Object)(object)Player.m_localPlayer == (Object)null) && Player.m_localPlayer.m_teleporting)
		{
			Boxes.PruneDestroyed();
		}
	}
}
