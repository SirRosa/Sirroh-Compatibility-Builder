using System;

namespace YamlDotNet.Core;

internal sealed class RecursionLevel
{
	private int current;

	public int Maximum { get; }

	public RecursionLevel(int maximum)
	{
		Maximum = maximum;
	}

	public void Increment(in Mark start, in Mark end)
	{
		if (!TryIncrement())
		{
			throw new MaximumRecursionLevelReachedException(in start, in end, "Maximum level of recursion reached");
		}
	}

	public bool TryIncrement()
	{
		if (current < Maximum)
		{
			current++;
			return true;
		}
		return false;
	}

	public void Decrement()
	{
		if (current == 0)
		{
			throw new InvalidOperationException("Attempted to decrement RecursionLevel to a negative value");
		}
		current--;
	}
}
