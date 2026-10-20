using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

internal sealed class StringLookAheadBuffer : ILookAheadBuffer
{
	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(1)]
	private readonly string value;

	public int Position { get; private set; }

	public int Length => value.Length;

	public bool EndOfInput => IsOutside(Position);

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
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
