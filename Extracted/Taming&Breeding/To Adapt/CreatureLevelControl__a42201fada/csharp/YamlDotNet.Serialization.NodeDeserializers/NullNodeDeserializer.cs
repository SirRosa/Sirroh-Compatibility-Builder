using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeDeserializers;

internal sealed class NullNodeDeserializer : INodeDeserializer
{
	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	bool INodeDeserializer.Deserialize(IParser parser, Type expectedType, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] out object value)
	{
		value = null;
		if (parser.Accept<NodeEvent>(out var @event) && NodeIsNull(@event))
		{
			parser.SkipThisAndNestedEvents();
			return true;
		}
		return false;
	}

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	private bool NodeIsNull(NodeEvent nodeEvent)
	{
		if (nodeEvent.Tag == "tag:yaml.org,2002:null")
		{
			return true;
		}
		if (nodeEvent is Scalar { Style: ScalarStyle.Plain, Value: var value })
		{
			switch (value)
			{
			default:
				return value == "NULL";
			case "":
			case "~":
			case "null":
			case "Null":
				return true;
			}
		}
		return false;
	}
}
