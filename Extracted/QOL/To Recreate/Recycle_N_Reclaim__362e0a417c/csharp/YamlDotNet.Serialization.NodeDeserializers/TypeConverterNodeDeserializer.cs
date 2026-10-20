using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class TypeConverterNodeDeserializer : INodeDeserializer
{
	private readonly IEnumerable<IYamlTypeConverter> converters;

	public TypeConverterNodeDeserializer(IEnumerable<IYamlTypeConverter> converters)
	{
		this.converters = converters ?? throw new ArgumentNullException("converters");
	}

	public bool Deserialize(IParser parser, Type expectedType, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] out object value)
	{
		IYamlTypeConverter yamlTypeConverter = converters.FirstOrDefault([_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)] (IYamlTypeConverter c) => c.Accepts(expectedType));
		if (yamlTypeConverter == null)
		{
			value = null;
			return false;
		}
		value = yamlTypeConverter.ReadYaml(parser, expectedType);
		return true;
	}
}
