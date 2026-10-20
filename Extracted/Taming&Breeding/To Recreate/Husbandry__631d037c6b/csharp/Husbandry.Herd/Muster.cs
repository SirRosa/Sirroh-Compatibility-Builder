using System.Collections.Generic;
using Husbandry.Config;
using UnityEngine;

namespace Husbandry.Herd;

internal static class Muster
{
	private static readonly Census Taken = new Census();

	private static readonly List<Census.Head> Heads = new List<Census.Head>();

	internal static int Counted => Taken.Counted;

	internal static int Species => Taken.Species;

	internal static int Takings { get; private set; }

	internal static void ResetForTests()
	{
		Taken.Clear();
		Heads.Clear();
		Takings = 0;
	}

	internal static Census Current(float now)
	{
		//IL_00ab: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b0: Unknown result type (might be due to invalid IL or missing references)
		if (!Taken.Stale(now, HusbandryConfig.CensusInterval.Value))
		{
			return Taken;
		}
		Heads.Clear();
		List<BaseAI> baseAIInstances = BaseAI.BaseAIInstances;
		if (baseAIInstances != null)
		{
			foreach (BaseAI item in baseAIInstances)
			{
				if ((Object)(object)item == (Object)null)
				{
					continue;
				}
				Character component = ((Component)item).GetComponent<Character>();
				if (!((Object)(object)component == (Object)null) && component.IsTamed())
				{
					ZNetView component2 = ((Component)item).GetComponent<ZNetView>();
					if (!((Object)(object)component2 == (Object)null) && component2.IsValid())
					{
						Heads.Add(new Census.Head
						{
							Prefab = component2.GetZDO().GetPrefab(),
							Where = ((Component)item).transform.position,
							Tamed = true
						});
					}
				}
			}
		}
		Taken.Take(Heads, now);
		Takings++;
		return Taken;
	}
}
