using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Serialization.BufferedDeserialization.TypeDiscriminators;

namespace YamlDotNet.Serialization.BufferedDeserialization;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal class TypeDiscriminatingNodeDeserializer : _003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer
{
	private readonly IList<_003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer> innerDeserializers;

	private readonly IList<ITypeDiscriminator> typeDiscriminators;

	private readonly int maxDepthToBuffer;

	private readonly int maxLengthToBuffer;

	public TypeDiscriminatingNodeDeserializer(IList<_003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer> innerDeserializers, IList<ITypeDiscriminator> typeDiscriminators, int maxDepthToBuffer, int maxLengthToBuffer)
	{
		this.innerDeserializers = innerDeserializers;
		this.typeDiscriminators = typeDiscriminators;
		this.maxDepthToBuffer = maxDepthToBuffer;
		this.maxLengthToBuffer = maxLengthToBuffer;
	}

	public bool Deserialize(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser reader, Type expectedType, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser, Type, object> nestedObjectDeserializer, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] out object value, _003Ccf1bb9c3_002D9707_002D4afa_002Daa6b_002D02a0a9430a5f_003EObjectDeserializer rootDeserializer)
	{
		if (!reader.Accept<_003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart>(out var _))
		{
			value = null;
			return false;
		}
		IEnumerable<ITypeDiscriminator> enumerable = typeDiscriminators.Where([_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (ITypeDiscriminator t) => t.BaseType.IsAssignableFrom(expectedType));
		if (!enumerable.Any())
		{
			value = null;
			return false;
		}
		_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start = reader.Current.Start;
		Type expectedType2 = expectedType;
		ParserBuffer parserBuffer;
		try
		{
			parserBuffer = new ParserBuffer(reader, maxDepthToBuffer, maxLengthToBuffer);
		}
		catch (Exception innerException)
		{
			throw new _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(in start, reader.Current.End, "Failed to buffer yaml node", innerException);
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
			throw new _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(in start, reader.Current.End, "Failed to discriminate type", innerException2);
		}
		parserBuffer.Reset();
		foreach (_003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer innerDeserializer in innerDeserializers)
		{
			if (innerDeserializer.Deserialize(parserBuffer, expectedType2, nestedObjectDeserializer, out value, rootDeserializer))
			{
				return true;
			}
		}
		value = null;
		return false;
	}
}
