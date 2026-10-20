using HarmonyLib;
using Husbandry.Config;
using Husbandry.Herd;
using Husbandry.Offline;
using UnityEngine;

namespace Husbandry.Patches;

[HarmonyPatch(typeof(Procreation), "Procreate")]
internal static class BreedPatch
{
	internal static int Skipped { get; private set; }

	internal static void ResetForTests()
	{
		Skipped = 0;
	}

	private static bool Prepare()
	{
		if (HusbandryConfig.Enabled == null || HusbandryConfig.Enabled.Value)
		{
			if (HusbandryConfig.CheapCensus != null)
			{
				return HusbandryConfig.CheapCensus.Value;
			}
			return true;
		}
		return false;
	}

	[HarmonyPrefix]
	private static bool Prefix(Procreation __instance)
	{
		//IL_0094: Unknown result type (might be due to invalid IL or missing references)
		if ((Object)(object)__instance == (Object)null)
		{
			return true;
		}
		ZNetView component = ((Component)__instance).GetComponent<ZNetView>();
		if ((Object)(object)component == (Object)null || !component.IsValid() || !component.IsOwner())
		{
			return true;
		}
		if (Quickening.Carrying(component.GetZDO().GetLong(ZDOVars.s_pregnant, 0L)))
		{
			return true;
		}
		int num = Cap.Effective(__instance.m_maxCreatures, HusbandryConfig.SoftCap.Value);
		if (num <= 0)
		{
			return true;
		}
		int prefab = component.GetZDO().GetPrefab();
		Census census = Muster.Current(Time.time);
		if (Cap.CertainlyUnder(census.Total(prefab), num))
		{
			return true;
		}
		if (!Cap.Reached(census.Within(prefab, ((Component)__instance).transform.position, __instance.m_totalCheckRange), num))
		{
			return true;
		}
		Skipped++;
		return false;
	}
}
