using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class YamlSerializableNodeDeserializer : INodeDeserializer
{
	private readonly IObjectFactory objectFactory;

	public YamlSerializableNodeDeserializer(IObjectFactory objectFactory)
	{
		this.objectFactory = objectFactory;
	}

	public bool Deserialize(IParser parser, Type expectedType, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] out object value)
	{
		if (typeof(IYamlSerializable).IsAssignableFrom(expectedType))
		{
			IYamlSerializable yamlSerializable = (IYamlSerializable)objectFactory.Create(expectedType);
			yamlSerializable.ReadYaml(parser);
			value = yamlSerializable;
			return true;
		}
		value = null;
		return false;
	}
}
