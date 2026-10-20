using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
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

	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	internal Type GetMapping(string tag)
	{
		if (!mappings.TryGetValue(tag, out var value))
		{
			return null;
		}
		return value;
	}
}
