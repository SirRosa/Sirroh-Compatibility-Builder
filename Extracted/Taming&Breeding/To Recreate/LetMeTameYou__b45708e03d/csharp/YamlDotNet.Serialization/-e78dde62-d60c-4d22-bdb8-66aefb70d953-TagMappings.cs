using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal sealed class _003Ce78dde62_002Dd60c_002D4d22_002Dbdb8_002D66aefb70d953_003ETagMappings
{
	private readonly Dictionary<string, Type> mappings;

	public _003Ce78dde62_002Dd60c_002D4d22_002Dbdb8_002D66aefb70d953_003ETagMappings()
	{
		mappings = new Dictionary<string, Type>();
	}

	public _003Ce78dde62_002Dd60c_002D4d22_002Dbdb8_002D66aefb70d953_003ETagMappings(IDictionary<string, Type> mappings)
	{
		this.mappings = new Dictionary<string, Type>(mappings);
	}

	public void Add(string tag, Type mapping)
	{
		mappings.Add(tag, mapping);
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	internal Type GetMapping(string tag)
	{
		if (!mappings.TryGetValue(tag, out var value))
		{
			return null;
		}
		return value;
	}
}
