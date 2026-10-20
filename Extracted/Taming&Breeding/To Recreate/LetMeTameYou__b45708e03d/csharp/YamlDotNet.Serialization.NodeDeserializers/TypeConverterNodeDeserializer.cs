using System;
using System.Collections.Generic;
using System.Linq;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.NodeDeserializers;

internal sealed class TypeConverterNodeDeserializer : INodeDeserializer
{
	private readonly IEnumerable<IYamlTypeConverter> converters;

	public TypeConverterNodeDeserializer(IEnumerable<IYamlTypeConverter> converters)
	{
		this.converters = converters ?? throw new ArgumentNullException("converters");
	}

	bool INodeDeserializer.Deserialize(IParser parser, Type expectedType, Func<IParser, Type, object?> nestedObjectDeserializer, out object? value)
	{
		IYamlTypeConverter yamlTypeConverter = converters.FirstOrDefault((IYamlTypeConverter c) => c.Accepts(expectedType));
		if (yamlTypeConverter == null)
		{
			value = null;
			return false;
		}
		value = yamlTypeConverter.ReadYaml(parser, expectedType);
		return true;
	}
}
