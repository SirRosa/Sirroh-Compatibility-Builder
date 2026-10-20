using System.Reflection;
using HarmonyLib;
using UnityEngine;

namespace RunicBuildCamera.Integration;

[HarmonyPatch]
internal static class PlayerSetControlsPatch
{
	private static MethodBase TargetMethod()
	{
		return ValheimAdapter.SetControlsMethod;
	}

	private static void Prefix(Player __instance, ref Vector3 movedir, ref bool attack, ref bool attackHold, ref bool secondaryAttack, ref bool secondaryAttackHold, ref bool block, ref bool blockHold, ref bool jump, ref bool crouch, ref bool run, ref bool autoRun, ref bool dodge)
	{
		//IL_000a: Unknown result type (might be due to invalid IL or missing references)
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
		if (BuildCameraRuntime.ShouldFreezePlayer(__instance))
		{
			movedir = Vector3.zero;
			attack = false;
			attackHold = false;
			secondaryAttack = false;
			secondaryAttackHold = false;
			block = false;
			blockHold = false;
			jump = false;
			crouch = false;
			run = false;
			autoRun = false;
			dodge = false;
		}
	}
}
