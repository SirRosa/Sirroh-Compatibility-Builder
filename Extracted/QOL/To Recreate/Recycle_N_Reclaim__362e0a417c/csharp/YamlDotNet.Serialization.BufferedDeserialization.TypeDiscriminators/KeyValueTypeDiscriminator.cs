using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.BufferedDeserialization.TypeDiscriminators;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
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

	public bool TryDiscriminate(IParser parser, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] out Type suggestedType)
	{
		if (parser.TryFindMappingEntry((Scalar scalar2) => targetKey == scalar2.Value, out var _, out var value) && value is Scalar scalar && typeMapping.TryGetValue(scalar.Value, out var value2))
		{
			suggestedType = value2;
			return true;
		}
		suggestedType = null;
		return false;
	}
}
