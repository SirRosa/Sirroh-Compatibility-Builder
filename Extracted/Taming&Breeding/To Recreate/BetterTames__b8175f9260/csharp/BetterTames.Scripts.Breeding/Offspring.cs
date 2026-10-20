using UnityEngine;

namespace BetterTames.Scripts.Breeding;

public static class Offspring
{
	private const int MaxLevel = 3;

	private static Character? birthingParent;

	public static void BeginProcreate(Procreation procreation)
	{
		birthingParent = ((Component)procreation).GetComponent<Character>();
	}

	public static void EndProcreate()
	{
		birthingParent = null;
	}

	public static void AdjustNewbornLevel(Character character, ref int level)
	{
		if (!((Object)(object)birthingParent == (Object)null) && !((Object)(object)character == (Object)(object)birthingParent))
		{
			birthingParent = null;
			if (level < 6 && Random.Range(0f, 100f) < (float)Plugin.offspringStarChance.Value)
			{
				level++;
			}
		}
	}
}
