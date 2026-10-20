using System;
using HarmonyLib;
using UnityEngine;

namespace BetterTames.Scripts.Protection;

[HarmonyPatch]
public static class ProtectionPatches
{
	[HarmonyPrefix]
	[HarmonyPatch(typeof(Character), "CheckDeath")]
	private static bool Character_CheckDeath_Prefix(Character __instance)
	{
		return !Protection.TryDown(__instance);
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Character), "ApplyDamage")]
	private static bool Character_ApplyDamage_Prefix(Character __instance)
	{
		return !Protection.IsDowned(__instance);
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Procreation), "Procreate")]
	private static bool Procreation_Procreate_Prefix(Procreation __instance)
	{
		return !Protection.IsDowned(((Component)__instance).GetComponent<Character>());
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Procreation), "ReadyForProcreation")]
	private static void Procreation_ReadyForProcreation_Postfix(Procreation __instance, ref bool __result)
	{
		if (__result && Protection.IsDowned(((Component)__instance).GetComponent<Character>()))
		{
			__result = false;
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(MonsterAI), "UpdateSleep")]
	private static bool MonsterAI_UpdateSleep_Prefix(MonsterAI __instance)
	{
		return !Protection.UpdateRecovery(__instance);
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Tameable), "Interact")]
	private static bool Tameable_Interact_Prefix(Tameable __instance, ref bool __result)
	{
		if (!Protection.SwallowsInteract(__instance))
		{
			return true;
		}
		__result = true;
		return false;
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Character), "GetHoverText")]
	private static void Character_GetHoverText_Postfix(Character __instance, ref string __result)
	{
		__result = Protection.AddPrompt(__instance, __result);
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(EnemyHud), "UpdateHuds")]
	private static void EnemyHud_UpdateHuds_Postfix(EnemyHud __instance)
	{
		Protection.TintNameplates(__instance);
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Player), "FindHoverObject")]
	private static void Player_FindHoverObject_Postfix(Player __instance, ref Character hoverCreature)
	{
		Protection.FindDownedHover(__instance, ref hoverCreature);
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(BaseAI), "IsEnemy", new Type[]
	{
		typeof(Character),
		typeof(Character)
	})]
	private static void BaseAI_IsEnemy_Postfix(Character a, Character b, ref bool __result)
	{
		if (!__result && Plugin.tamesFightOwnKind.Value && (Object)(object)a != (Object)null && (Object)(object)b != (Object)null && (Object)(object)a != (Object)(object)b && a.IsTamed() != b.IsTamed() && !a.IsPlayer() && !b.IsPlayer())
		{
			string text = a.GetGroup();
			if (text.Length > 0 && text == b.GetGroup() && Protection.WildWillFight(a.IsTamed() ? b : a))
			{
				__result = true;
			}
		}
		if (__result && (Protection.IsDowned(a) || Protection.IsDowned(b)))
		{
			__result = false;
		}
	}
}
