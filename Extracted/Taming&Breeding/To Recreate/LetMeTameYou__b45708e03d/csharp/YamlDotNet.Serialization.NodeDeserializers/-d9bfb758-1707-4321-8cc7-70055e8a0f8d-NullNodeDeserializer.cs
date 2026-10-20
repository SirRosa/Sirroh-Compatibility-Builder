using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeDeserializers;

internal sealed class _003Cd9bfb758_002D1707_002D4321_002D8cc7_002D70055e8a0f8d_003ENullNodeDeserializer : _003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer
{
	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public bool Deserialize(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, Type expectedType, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser, Type, object> nestedObjectDeserializer, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] out object value, _003Ccf1bb9c3_002D9707_002D4afa_002Daa6b_002D02a0a9430a5f_003EObjectDeserializer rootDeserializer)
	{
		value = null;
		if (parser.Accept<_003C1af307a4_002D0546_002D4fb8_002D9199_002D3379b8888e00_003ENodeEvent>(out var @event) && NodeIsNull(@event))
		{
			parser.SkipThisAndNestedEvents();
			return true;
		}
		return false;
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	private static bool NodeIsNull(_003C1af307a4_002D0546_002D4fb8_002D9199_002D3379b8888e00_003ENodeEvent nodeEvent)
	{
		if (nodeEvent.Tag == "tag:yaml.org,2002:null")
		{
			return true;
		}
		if (nodeEvent is _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar { Style: _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Plain, IsKey: false, Value: var value })
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
