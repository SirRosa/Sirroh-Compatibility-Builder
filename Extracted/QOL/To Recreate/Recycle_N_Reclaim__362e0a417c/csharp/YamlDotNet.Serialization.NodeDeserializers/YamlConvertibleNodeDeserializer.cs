using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class YamlConvertibleNodeDeserializer : INodeDeserializer
{
	private readonly IObjectFactory objectFactory;

	public YamlConvertibleNodeDeserializer(IObjectFactory objectFactory)
	{
		this.objectFactory = objectFactory;
	}

	public bool Deserialize(IParser parser, Type expectedType, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] out object value)
	{
		if (typeof(IYamlConvertible).IsAssignableFrom(expectedType))
		{
			IYamlConvertible yamlConvertible = (IYamlConvertible)objectFactory.Create(expectedType);
			yamlConvertible.Read(parser, expectedType, [return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] (Type type) => nestedObjectDeserializer(parser, type));
			value = yamlConvertible;
			return true;
		}
		value = null;
		return false;
	}
}
