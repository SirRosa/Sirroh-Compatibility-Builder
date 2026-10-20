using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.ObjectPool;

namespace YamlDotNet.Core;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C3ccba267_002Dcc21_002D47f6_002D87b1_002Dacd20b3e4fe6_003EStringLookAheadBuffer : _003C33a4e672_002D71cf_002D4c8e_002D8d57_002Dd5f7e20fac15_003EILookAheadBuffer, IResettable
{
	public string Value { get; set; } = string.Empty;

	public int Position { get; private set; }

	public int Length => Value.Length;

	public bool EndOfInput => IsOutside(Position);

	public char Peek(int offset)
	{
		int index = Position + offset;
		if (!IsOutside(index))
		{
			return Value[index];
		}
		return '\0';
	}

	private bool IsOutside(int index)
	{
		return index >= Value.Length;
	}

	public void Skip(int length)
	{
		if (length < 0)
		{
			throw new ArgumentOutOfRangeException("length", "The length must be positive.");
		}
		Position += length;
	}

	public bool TryReset()
	{
		Position = 0;
		Value = string.Empty;
		return true;
	}
}
