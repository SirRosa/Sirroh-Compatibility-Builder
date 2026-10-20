using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
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
