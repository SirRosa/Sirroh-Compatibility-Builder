namespace Husbandry.Offline;

internal static class Clocks
{
	internal const long PerSecond = 10000000L;

	internal static double Between(long then, long now)
	{
		return (double)(now - then) / 10000000.0;
	}

	internal static bool Elapsed(long stamp, long now, double span)
	{
		return Between(stamp, now) > span;
	}

	internal static long Ago(long now, double seconds)
	{
		return now - (long)(seconds * 10000000.0);
	}
}
