using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Serialization.BufferedDeserialization.TypeDiscriminators;

namespace YamlDotNet.Serialization.BufferedDeserialization;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal interface ITypeDiscriminatingNodeDeserializerOptions
{
	void AddTypeDiscriminator(ITypeDiscriminator discriminator);

	void AddKeyValueTypeDiscriminator<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] T>(string discriminatorKey, IDictionary<string, Type> valueTypeMapping);

	void AddUniqueKeyTypeDiscriminator<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] T>(IDictionary<string, Type> uniqueKeyTypeMapping);
}
