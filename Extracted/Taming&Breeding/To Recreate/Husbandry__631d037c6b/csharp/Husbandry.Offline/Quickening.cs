namespace Husbandry.Offline;

internal static class Quickening
{
	internal static Verdict Judge(bool tamed, bool pregnant, bool havePartner, bool hungry, bool underCap, int lovePoints, int required)
	{
		if (!tamed)
		{
			return Verdict.NotOurs;
		}
		if (pregnant)
		{
			return Verdict.Expecting;
		}
		if (!havePartner)
		{
			return Verdict.Alone;
		}
		if (hungry)
		{
			return Verdict.Hungry;
		}
		if (!underCap)
		{
			return Verdict.Capped;
		}
		if (required < 1)
		{
			required = 1;
		}
		if (lovePoints + 1 < required)
		{
			return Verdict.Courting;
		}
		return Verdict.Conceives;
	}

	internal static bool Carrying(long stamp)
	{
		return stamp != 0;
	}

	internal static bool Courts(Verdict verdict)
	{
		return verdict == Verdict.Courting;
	}

	internal static bool Conceives(Verdict verdict)
	{
		return verdict == Verdict.Conceives;
	}

	internal static bool Company(int sameKindNearby)
	{
		return sameKindNearby >= 2;
	}
}
