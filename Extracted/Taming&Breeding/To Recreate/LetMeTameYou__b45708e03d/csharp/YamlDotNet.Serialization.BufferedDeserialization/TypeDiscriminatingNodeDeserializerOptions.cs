using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Serialization.BufferedDeserialization.TypeDiscriminators;

namespace YamlDotNet.Serialization.BufferedDeserialization;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal class TypeDiscriminatingNodeDeserializerOptions : ITypeDiscriminatingNodeDeserializerOptions
{
	internal readonly List<ITypeDiscriminator> discriminators = new List<ITypeDiscriminator>();

	public void AddTypeDiscriminator(ITypeDiscriminator discriminator)
	{
		discriminators.Add(discriminator);
	}

	public void AddKeyValueTypeDiscriminator<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] T>(string discriminatorKey, IDictionary<string, Type> valueTypeMapping)
	{
		discriminators.Add(new KeyValueTypeDiscriminator(typeof(T), discriminatorKey, valueTypeMapping));
	}

	public void AddUniqueKeyTypeDiscriminator<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] T>(IDictionary<string, Type> uniqueKeyTypeMapping)
	{
		discriminators.Add(new UniqueKeyTypeDiscriminator(typeof(T), uniqueKeyTypeMapping));
	}
}
