using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeTypeResolvers;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class TagNodeTypeResolver : INodeTypeResolver
{
	private readonly IDictionary<TagName, Type> tagMappings;

	public TagNodeTypeResolver(IDictionary<TagName, Type> tagMappings)
	{
		this.tagMappings = tagMappings ?? throw new ArgumentNullException("tagMappings");
	}

	bool INodeTypeResolver.Resolve([_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] NodeEvent nodeEvent, ref Type currentType)
	{
		if (nodeEvent != null && !nodeEvent.Tag.IsEmpty && tagMappings.TryGetValue(nodeEvent.Tag, out var value))
		{
			currentType = value;
			return true;
		}
		return false;
	}
}
