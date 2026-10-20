namespace Husbandry.Herd;

internal static class Cap
{
	internal static int Effective(int vanilla, int configured)
	{
		if (vanilla <= 0)
		{
			if (configured <= 0)
			{
				return 0;
			}
			return configured;
		}
		if (configured <= 0)
		{
			return vanilla;
		}
		if (vanilla >= configured)
		{
			return configured;
		}
		return vanilla;
	}

	internal static bool Reached(int nearby, int cap)
	{
		if (cap > 0)
		{
			return nearby >= cap;
		}
		return false;
	}

	internal static bool CertainlyUnder(int worldTotal, int cap)
	{
		if (cap > 0)
		{
			return worldTotal < cap;
		}
		return false;
	}
}
