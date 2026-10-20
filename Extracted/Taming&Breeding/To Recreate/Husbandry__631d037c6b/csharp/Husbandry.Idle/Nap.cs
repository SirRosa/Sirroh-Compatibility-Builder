namespace Husbandry.Idle;

internal struct Nap
{
	internal float Banked;

	internal int Missed;

	internal static bool Think(ref Nap nap, int every, float dt, out float give)
	{
		if (every <= 1)
		{
			give = dt + nap.Banked;
			nap = default;
			return true;
		}
		nap.Banked += dt;
		nap.Missed++;
		if (nap.Missed < every)
		{
			give = 0f;
			return false;
		}
		give = nap.Banked;
		nap = default;
		return true;
	}

	internal static float Wake(ref Nap nap, float dt)
	{
		float result = dt + nap.Banked;
		nap = default;
		return result;
	}
}
