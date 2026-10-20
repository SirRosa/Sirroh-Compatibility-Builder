using System;
using UnityEngine;

namespace neobotics.ModSdk;

public class CrossPlatformRandom : Random
{
	private const int LCG_MULTIPLIER = 134775813;

	private const int LCG_INCREMENT = 1;

	private int _seed;

	public float value => (float)NextDouble();

	public CrossPlatformRandom()
	{
		Random random = new Random();
		_seed = random.Next();
	}

	public CrossPlatformRandom(int seed)
	{
		_seed = seed;
	}

	public float Range(int min, int max)
	{
		return Next(min, max);
	}

	public float Range(float min, float max)
	{
		return Mathf.Lerp(min, max, (float)NextDouble());
	}

	private int GetNext()
	{
		_seed = _seed * 134775813 + 1;
		return _seed;
	}

	public override int Next()
	{
		return Next(int.MaxValue);
	}

	public override int Next(int maxValue)
	{
		if (maxValue < 0)
		{
			throw new ArgumentOutOfRangeException("maxValue is less than zero.");
		}
		return (int)((long)(uint)GetNext() * (long)(uint)maxValue >>> 32);
	}

	public override int Next(int minValue, int maxValue)
	{
		if (minValue > maxValue)
		{
			throw new ArgumentOutOfRangeException("minValue is greater than maxValue.");
		}
		return minValue + Next(maxValue - minValue);
	}

	public override double NextDouble()
	{
		return Sample();
	}

	protected override double Sample()
	{
		return (double)Next() / 2147483647.0;
	}
}
