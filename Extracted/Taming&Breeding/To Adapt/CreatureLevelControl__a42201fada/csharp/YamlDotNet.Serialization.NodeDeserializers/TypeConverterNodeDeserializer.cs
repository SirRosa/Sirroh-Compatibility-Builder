using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class TypeConverterNodeDeserializer : INodeDeserializer
{
	private readonly IEnumerable<IYamlTypeConverter> converters;

	public TypeConverterNodeDeserializer(IEnumerable<IYamlTypeConverter> converters)
	{
		this.converters = converters ?? throw new ArgumentNullException("converters");
	}

	bool INodeDeserializer.Deserialize(IParser parser, Type expectedType, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] out object value)
	{
		IYamlTypeConverter yamlTypeConverter = converters.FirstOrDefault([_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (IYamlTypeConverter c) => c.Accepts(expectedType));
		if (yamlTypeConverter == null)
		{
			value = null;
			return false;
		}
		value = yamlTypeConverter.ReadYaml(parser, expectedType);
		return true;
	}
}
