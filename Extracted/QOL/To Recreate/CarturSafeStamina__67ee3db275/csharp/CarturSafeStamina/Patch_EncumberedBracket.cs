using System;
using HarmonyLib;
using UnityEngine;

namespace CarturSafeStamina;

[HarmonyPatch(typeof(Player), "UpdateStats", new Type[] { typeof(float) })]
public static class Patch_EncumberedBracket
{
	internal static bool Skip;

	private static void Prefix(Player __instance)
	{
		Skip = Plugin.AffectEncumbered.Value && (Object)(object)__instance == (Object)(object)Player.m_localPlayer && ((Character)__instance).IsEncumbered() && Plugin.IsSafe(__instance);
	}

	private static void Finalizer()
	{
		Skip = false;
	}
}
