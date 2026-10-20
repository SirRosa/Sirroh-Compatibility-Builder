namespace Husbandry.Herd;

internal static class Beast
{
	internal static bool Ours(bool tamed, bool hasNetView, bool owned)
	{
		return tamed & hasNetView & owned;
	}

	internal static bool Dozy(bool ours, bool alerted, bool hasTarget, bool following)
	{
		if (ours && !alerted && !hasTarget)
		{
			return !following;
		}
		return false;
	}
}
