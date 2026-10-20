using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class TagMappings
{
	private readonly IDictionary<string, Type> mappings;

	public TagMappings()
	{
		mappings = new Dictionary<string, Type>();
	}

	public TagMappings(IDictionary<string, Type> mappings)
	{
		this.mappings = new Dictionary<string, Type>(mappings);
	}

	public void Add(string tag, Type mapping)
	{
		mappings.Add(tag, mapping);
	}

	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	internal Type GetMapping(string tag)
	{
		if (!mappings.TryGetValue(tag, out var value))
		{
			return null;
		}
		return value;
	}
}
