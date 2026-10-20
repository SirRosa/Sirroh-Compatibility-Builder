using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

internal sealed class StringLookAheadBuffer : ILookAheadBuffer
{
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(1)]
	private readonly string value;

	public int Position { get; private set; }

	public int Length => value.Length;

	public bool EndOfInput => IsOutside(Position);

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	public StringLookAheadBuffer(string value)
	{
		this.value = value;
	}

	public char Peek(int offset)
	{
		int index = Position + offset;
		if (!IsOutside(index))
		{
			return value[index];
		}
		return '\0';
	}

	private bool IsOutside(int index)
	{
		return index >= value.Length;
	}

	public void Skip(int length)
	{
		if (length < 0)
		{
			throw new ArgumentOutOfRangeException("length", "The length must be positive.");
		}
		Position += length;
	}
}
