using HarmonyLib;
using UnityEngine;

namespace NoSlopeSlide;

internal class Patch
{
	[HarmonyPatch(typeof(Character), "ApplySlide")]
	private class Character_ApplySlide_Patch
	{
		private static bool Prefix(Character __instance)
		{
			if (!NoSlopeSlide.Enabled.Value)
			{
				return true;
			}
			if (!((Object)(object)__instance == (Object)null))
			{
				return !__instance.IsPlayer();
			}
			return true;
		}
	}

	[HarmonyPatch(typeof(Character), "UpdateMotion")]
	private class Character_UpdateMotion_Patch
	{
		private static void Prefix(Character __instance)
		{
			//IL_0025: Unknown result type (might be due to invalid IL or missing references)
			//IL_002a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0075: Unknown result type (might be due to invalid IL or missing references)
			//IL_007a: Unknown result type (might be due to invalid IL or missing references)
			//IL_009b: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a6: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a8: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a9: Unknown result type (might be due to invalid IL or missing references)
			if (NoSlopeSlide.Enabled.Value && !((Object)(object)__instance == (Object)null) && !((Object)(object)__instance != (Object)(object)Player.m_localPlayer) && !(__instance.GetMoveDir() != Vector3.zero) && __instance.IsOnGround() && !__instance.IsSwimming() && !__instance.IsAttached() && !__instance.IsRiding() && !__instance.IsDead() && !((Object)(object)__instance.GetStandingOnShip() != (Object)null))
			{
				Rigidbody component = ((Component)__instance).GetComponent<Rigidbody>();
				Vector3 lastGroundNormal = __instance.m_lastGroundNormal;
				if (!((Object)(object)component == (Object)null) && !(lastGroundNormal.sqrMagnitude < 0.5f))
				{
					lastGroundNormal.Normalize();
					Vector3 val = Vector3.ProjectOnPlane(Physics.gravity, lastGroundNormal);
					component.AddForce(-val, (ForceMode)5);
				}
			}
		}
	}
}
