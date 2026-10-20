using HarmonyLib;
using Husbandry.Config;
using Husbandry.Herd;
using UnityEngine;

namespace Husbandry.Patches;

[HarmonyPatch(typeof(Tameable), "Interact")]
internal static class ShoveePatch
{
	internal static bool Armed { get; private set; }

	private static bool Prepare()
	{
		if (HusbandryConfig.Enabled != null)
		{
			return HusbandryConfig.Enabled.Value;
		}
		return true;
	}

	internal static void ResetForTests()
	{
		Armed = false;
	}

	private static void Postfix()
	{
		Armed = true;
	}

	[HarmonyPrefix]
	private static bool Prefix(Tameable __instance, Humanoid user, bool hold, bool alt, ref bool __result)
	{
		if (!hold | alt)
		{
			return true;
		}
		Armed = true;
		Character val = (((Object)(object)__instance == (Object)null) ? null : ((Component)__instance).GetComponent<Character>());
		if ((Object)(object)val == (Object)null)
		{
			return true;
		}
		if (!Bumping.Mine(val.IsTamed()))
		{
			return true;
		}
		if (!Shoving.Toggle(val))
		{
			return true;
		}
		if ((Object)(object)user != (Object)null)
		{
			((Character)user).Message((MessageType)2, val.m_name + " " + Bumping.Plain(Shoving.IsSolid(val)), 0, (Sprite)null, false);
		}
		__result = true;
		return false;
	}
}
