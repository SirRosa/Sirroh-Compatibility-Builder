using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeDeserializers;

internal sealed class NullNodeDeserializer : INodeDeserializer
{
	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public bool Deserialize(IParser parser, Type expectedType, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] out object value)
	{
		value = null;
		if (parser.Accept<NodeEvent>(out var @event) && NodeIsNull(@event))
		{
			parser.SkipThisAndNestedEvents();
			return true;
		}
		return false;
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	private bool NodeIsNull(NodeEvent nodeEvent)
	{
		if (nodeEvent.Tag == "tag:yaml.org,2002:null")
		{
			return true;
		}
		if (nodeEvent is Scalar { Style: ScalarStyle.Plain, IsKey: false, Value: var value })
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
