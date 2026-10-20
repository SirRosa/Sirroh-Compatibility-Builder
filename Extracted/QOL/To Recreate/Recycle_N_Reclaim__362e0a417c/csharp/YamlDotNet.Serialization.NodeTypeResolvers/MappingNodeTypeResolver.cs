using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeTypeResolvers;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal class MappingNodeTypeResolver : INodeTypeResolver
{
	private readonly IDictionary<Type, Type> _mappings;

	public MappingNodeTypeResolver(IDictionary<Type, Type> mappings)
	{
		if (mappings == null)
		{
			throw new ArgumentNullException("mappings");
		}
		foreach (KeyValuePair<Type, Type> mapping in mappings)
		{
			if (!mapping.Key.IsAssignableFrom(mapping.Value))
			{
				throw new InvalidOperationException($"Type '{mapping.Value}' does not implement type '{mapping.Key}'.");
			}
		}
		_mappings = mappings;
	}

	public bool Resolve([_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] NodeEvent nodeEvent, ref Type currentType)
	{
		if (_mappings.TryGetValue(currentType, out var value))
		{
			currentType = value;
			return true;
		}
		return false;
	}
}
