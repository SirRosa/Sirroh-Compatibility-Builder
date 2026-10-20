using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.BufferedDeserialization;

internal class ParserBuffer : IParser
{
	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(1)]
	private readonly LinkedList<ParsingEvent> buffer;

	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 2, 1 })]
	private LinkedListNode<ParsingEvent> current;

	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public ParsingEvent Current
	{
		[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
		get
		{
			return current?.Value;
		}
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public ParserBuffer(IParser parserToBuffer, int maxDepth, int maxLength)
	{
		buffer = new LinkedList<ParsingEvent>();
		buffer.AddLast(parserToBuffer.Consume<MappingStart>());
		int num = 0;
		do
		{
			ParsingEvent parsingEvent = parserToBuffer.Consume<ParsingEvent>();
			num += parsingEvent.NestingIncrease;
			buffer.AddLast(parsingEvent);
			if (maxDepth > -1 && num > maxDepth)
			{
				throw new ArgumentOutOfRangeException("parserToBuffer", "Parser buffer exceeded max depth");
			}
			if (maxLength > -1 && buffer.Count > maxLength)
			{
				throw new ArgumentOutOfRangeException("parserToBuffer", "Parser buffer exceeded max length");
			}
		}
		while (num >= 0);
		current = buffer.First;
	}

	public bool MoveNext()
	{
		current = current?.Next;
		return current != null;
	}

	public void Reset()
	{
		current = buffer.First;
	}
}
