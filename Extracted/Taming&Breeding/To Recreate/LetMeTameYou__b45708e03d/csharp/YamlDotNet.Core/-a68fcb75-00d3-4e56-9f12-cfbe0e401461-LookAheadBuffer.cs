using System;
using System.Diagnostics;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Helpers;

namespace YamlDotNet.Core;

[DebuggerStepThrough]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal sealed class _003Ca68fcb75_002D00d3_002D4e56_002D9f12_002Dcfbe0e401461_003ELookAheadBuffer : _003C33a4e672_002D71cf_002D4c8e_002D8d57_002Dd5f7e20fac15_003EILookAheadBuffer
{
	private readonly TextReader input;

	private readonly char[] buffer;

	private readonly int blockSize;

	private readonly int mask;

	private int firstIndex;

	private int writeOffset;

	private int count;

	private bool endOfInput;

	public bool EndOfInput
	{
		get
		{
			if (endOfInput)
			{
				return count == 0;
			}
			return false;
		}
	}

	public _003Ca68fcb75_002D00d3_002D4e56_002D9f12_002Dcfbe0e401461_003ELookAheadBuffer(TextReader input, int capacity)
	{
		if (capacity < 1)
		{
			throw new ArgumentOutOfRangeException("capacity", "The capacity must be positive.");
		}
		if (!_003Ca7a37fde_002D5f65_002D42cc_002Da170_002Dc7ccc055fb1c_003ENumberExtensions.IsPowerOfTwo(capacity))
		{
			throw new ArgumentException("The capacity must be a power of 2.", "capacity");
		}
		this.input = input ?? throw new ArgumentNullException("input");
		blockSize = capacity;
		buffer = new char[capacity * 2];
		mask = capacity * 2 - 1;
	}

	private int GetIndexForOffset(int offset)
	{
		return (firstIndex + offset) & mask;
	}

	public char Peek(int offset)
	{
		if (offset >= count)
		{
			FillBuffer();
		}
		if (offset < count)
		{
			return buffer[(firstIndex + offset) & mask];
		}
		return '\0';
	}

	public void Cache(int length)
	{
		if (length >= count)
		{
			FillBuffer();
		}
	}

	private void FillBuffer()
	{
		if (endOfInput)
		{
			return;
		}
		int num = blockSize;
		do
		{
			int num2 = input.Read(buffer, writeOffset, num);
			if (num2 == 0)
			{
				endOfInput = true;
				return;
			}
			num -= num2;
			writeOffset += num2;
			count += num2;
		}
		while (num > 0);
		if (writeOffset == buffer.Length)
		{
			writeOffset = 0;
		}
	}

	public void Skip(int length)
	{
		if (length < 1 || length > blockSize)
		{
			throw new ArgumentOutOfRangeException("length", "The length must be between 1 and the number of characters in the buffer. Use the Peek() and / or Cache() methods to fill the buffer.");
		}
		firstIndex = GetIndexForOffset(length);
		count -= length;
	}
}
