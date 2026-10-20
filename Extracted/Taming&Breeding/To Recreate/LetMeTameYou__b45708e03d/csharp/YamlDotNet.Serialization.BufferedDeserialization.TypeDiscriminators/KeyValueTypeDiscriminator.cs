using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.BufferedDeserialization.TypeDiscriminators;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal class KeyValueTypeDiscriminator : ITypeDiscriminator
{
	private readonly string targetKey;

	private readonly IDictionary<string, Type> typeMapping;

	public Type BaseType { get; private set; }

	public KeyValueTypeDiscriminator(Type baseType, string targetKey, IDictionary<string, Type> typeMapping)
	{
		foreach (KeyValuePair<string, Type> item in typeMapping)
		{
			if (!baseType.IsAssignableFrom(item.Value))
			{
				throw new ArgumentOutOfRangeException("typeMapping", $"{item.Value} is not a assignable to {baseType}");
			}
		}
		BaseType = baseType;
		this.targetKey = targetKey;
		this.typeMapping = typeMapping;
	}

	public bool TryDiscriminate(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] out Type suggestedType)
	{
		if (parser.TryFindMappingEntry((_003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar scalar) => targetKey == scalar.Value, out var _, out var value) && value is _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar obj && typeMapping.TryGetValue(obj.Value, out var value2))
		{
			suggestedType = value2;
			return true;
		}
		suggestedType = null;
		return false;
	}
}
