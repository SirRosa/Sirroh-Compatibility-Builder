using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeTypeResolvers;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal class _003Ce1985726_002D4932_002D48d0_002Da4ea_002Dbee25a0948c0_003EMappingNodeTypeResolver : _003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver
{
	private readonly IDictionary<Type, Type> mappings;

	public _003Ce1985726_002D4932_002D48d0_002Da4ea_002Dbee25a0948c0_003EMappingNodeTypeResolver(IDictionary<Type, Type> mappings)
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
		this.mappings = mappings;
	}

	public bool Resolve([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] _003C1af307a4_002D0546_002D4fb8_002D9199_002D3379b8888e00_003ENodeEvent nodeEvent, ref Type currentType)
	{
		if (mappings.TryGetValue(currentType, out var value))
		{
			currentType = value;
			return true;
		}
		return false;
	}
}
