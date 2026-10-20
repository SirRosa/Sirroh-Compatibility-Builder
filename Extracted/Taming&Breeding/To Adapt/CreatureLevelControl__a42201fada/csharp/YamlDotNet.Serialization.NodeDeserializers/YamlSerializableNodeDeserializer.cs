using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class YamlSerializableNodeDeserializer : INodeDeserializer
{
	private readonly IObjectFactory objectFactory;

	public YamlSerializableNodeDeserializer(IObjectFactory objectFactory)
	{
		this.objectFactory = objectFactory;
	}

	public bool Deserialize(IParser parser, Type expectedType, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] out object value)
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
