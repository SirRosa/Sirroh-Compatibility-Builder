using System;

namespace YamlDotNet.Core;

internal sealed class _003C0330118d_002Da7bd_002D47a5_002D8c95_002D32910628e74b_003ERecursionLevel
{
	private int current;

	public int Maximum { get; }

	public _003C0330118d_002Da7bd_002D47a5_002D8c95_002D32910628e74b_003ERecursionLevel(int maximum)
	{
		Maximum = maximum;
	}

	public void Increment()
	{
		if (!TryIncrement())
		{
			throw new _003C7588e5e7_002Dd15b_002D4b99_002Db2f8_002Dd825dd1fade2_003EMaximumRecursionLevelReachedException("Maximum level of recursion reached");
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
