using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Serialization.BufferedDeserialization.TypeDiscriminators;

namespace YamlDotNet.Serialization.BufferedDeserialization;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal class TypeDiscriminatingNodeDeserializer : INodeDeserializer
{
	private readonly IList<INodeDeserializer> innerDeserializers;

	private readonly IList<ITypeDiscriminator> typeDiscriminators;

	private readonly int maxDepthToBuffer;

	private readonly int maxLengthToBuffer;

	public TypeDiscriminatingNodeDeserializer(IList<INodeDeserializer> innerDeserializers, IList<ITypeDiscriminator> typeDiscriminators, int maxDepthToBuffer, int maxLengthToBuffer)
	{
		this.innerDeserializers = innerDeserializers;
		this.typeDiscriminators = typeDiscriminators;
		this.maxDepthToBuffer = maxDepthToBuffer;
		this.maxLengthToBuffer = maxLengthToBuffer;
	}

	public bool Deserialize(IParser reader, Type expectedType, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] out object value)
	{
		if (!reader.Accept<MappingStart>(out var _))
		{
			value = null;
			return false;
		}
		IEnumerable<ITypeDiscriminator> enumerable = typeDiscriminators.Where([_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)] (ITypeDiscriminator t) => t.BaseType.IsAssignableFrom(expectedType));
		if (!enumerable.Any())
		{
			value = null;
			return false;
		}
		Mark start = reader.Current.Start;
		Type expectedType2 = expectedType;
		ParserBuffer parserBuffer;
		try
		{
			parserBuffer = new ParserBuffer(reader, maxDepthToBuffer, maxLengthToBuffer);
		}
		catch (Exception innerException)
		{
			throw new YamlException(in start, reader.Current.End, "Failed to buffer yaml node", innerException);
		}
		try
		{
			foreach (ITypeDiscriminator item in enumerable)
			{
				parserBuffer.Reset();
				if (item.TryDiscriminate(parserBuffer, out var suggestedType))
				{
					expectedType2 = suggestedType;
					break;
				}
			}
		}
		catch (Exception innerException2)
		{
			throw new YamlException(in start, reader.Current.End, "Failed to discriminate type", innerException2);
		}
		parserBuffer.Reset();
		foreach (INodeDeserializer innerDeserializer in innerDeserializers)
		{
			if (innerDeserializer.Deserialize(parserBuffer, expectedType2, nestedObjectDeserializer, out value))
			{
				return true;
			}
		}
		value = null;
		return false;
	}
}
