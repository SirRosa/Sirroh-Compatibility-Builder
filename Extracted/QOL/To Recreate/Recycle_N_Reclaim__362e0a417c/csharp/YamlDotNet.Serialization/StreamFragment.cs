using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class StreamFragment : IYamlConvertible
{
	private readonly List<ParsingEvent> events = new List<ParsingEvent>();

	public IList<ParsingEvent> Events => events;

	void IYamlConvertible.Read(IParser parser, Type expectedType, ObjectDeserializer nestedObjectDeserializer)
	{
		events.Clear();
		int num = 0;
		do
		{
			if (!parser.MoveNext())
			{
				throw new InvalidOperationException("The parser has reached the end before deserialization completed.");
			}
			ParsingEvent current = parser.Current;
			events.Add(current);
			num += current.NestingIncrease;
		}
		while (num > 0);
	}

	void IYamlConvertible.Write(IEmitter emitter, ObjectSerializer nestedObjectSerializer)
	{
		foreach (ParsingEvent @event in events)
		{
			emitter.Emit(@event);
		}
	}
}
