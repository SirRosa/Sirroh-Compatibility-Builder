namespace Husbandry.Offline;

internal static class Mending
{
	internal static float Restored(float health, float max, float perSecond, double seconds)
	{
		if (health <= 0f)
		{
			return health;
		}
		if (health >= max)
		{
			return health;
		}
		if (perSecond <= 0f)
		{
			return health;
		}
		if (seconds <= 0.0)
		{
			return health;
		}
		float num = health + (float)((double)perSecond * seconds);
		if (!(num > max))
		{
			return num;
		}
		return max;
	}

	internal static bool Worth(float before, float after)
	{
		return after - before > 0.01f;
	}
}
