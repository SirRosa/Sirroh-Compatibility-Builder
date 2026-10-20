using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.BufferedDeserialization;

internal class ParserBuffer : _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(1)]
	private readonly LinkedList<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> buffer;

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 2, 1 })]
	private LinkedListNode<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent> current;

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent Current
	{
		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
		get
		{
			return current?.Value;
		}
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public ParserBuffer(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parserToBuffer, int maxDepth, int maxLength)
	{
		buffer = new LinkedList<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent>();
		buffer.AddLast(parserToBuffer.Consume<_003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart>());
		int num = 0;
		do
		{
			_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent obj = parserToBuffer.Consume<_003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent>();
			num += obj.NestingIncrease;
			buffer.AddLast(obj);
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
