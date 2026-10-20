using System;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Helpers;

namespace YamlDotNet.Core;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class LookAheadBuffer : ILookAheadBuffer
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

	public LookAheadBuffer(TextReader input, int capacity)
	{
		if (capacity < 1)
		{
			throw new ArgumentOutOfRangeException("capacity", "The capacity must be positive.");
		}
		if (!capacity.IsPowerOfTwo())
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
