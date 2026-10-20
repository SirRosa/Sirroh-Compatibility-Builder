using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeTypeResolvers;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class TagNodeTypeResolver : INodeTypeResolver
{
	private readonly IDictionary<TagName, Type> tagMappings;

	public TagNodeTypeResolver(IDictionary<TagName, Type> tagMappings)
	{
		this.tagMappings = tagMappings ?? throw new ArgumentNullException("tagMappings");
	}

	bool INodeTypeResolver.Resolve([_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] NodeEvent nodeEvent, ref Type currentType)
	{
		if (nodeEvent != null && !nodeEvent.Tag.IsEmpty && tagMappings.TryGetValue(nodeEvent.Tag, out var value))
		{
			currentType = value;
			return true;
		}
		return false;
	}
}
