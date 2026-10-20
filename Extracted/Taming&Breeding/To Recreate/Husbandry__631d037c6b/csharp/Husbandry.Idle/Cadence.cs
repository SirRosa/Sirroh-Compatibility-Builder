using UnityEngine;

namespace Husbandry.Idle;

internal static class Cadence
{
	internal static int Every(float distance, float near, float far, int midSkip, int farSkip)
	{
		if (midSkip < 1)
		{
			midSkip = 1;
		}
		if (farSkip < 1)
		{
			farSkip = 1;
		}
		if (distance < 0f || float.IsNaN(distance))
		{
			return 1;
		}
		if (distance <= near)
		{
			return 1;
		}
		if (distance <= far)
		{
			return midSkip;
		}
		return farSkip;
	}

	internal static float FromCamera(Vector3 where, bool havePlayer, Vector3 player)
	{
		//IL_0009: Unknown result type (might be due to invalid IL or missing references)
		//IL_000a: Unknown result type (might be due to invalid IL or missing references)
		if (!havePlayer)
		{
			return -1f;
		}
		return Vector3.Distance(where, player);
	}
}
