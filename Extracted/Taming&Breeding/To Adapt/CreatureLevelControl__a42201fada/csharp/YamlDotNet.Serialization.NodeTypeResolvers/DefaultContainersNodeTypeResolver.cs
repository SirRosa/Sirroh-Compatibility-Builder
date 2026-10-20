using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeTypeResolvers;

internal sealed class DefaultContainersNodeTypeResolver : INodeTypeResolver
{
	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	bool INodeTypeResolver.Resolve([_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] NodeEvent nodeEvent, ref Type currentType)
	{
		if (currentType == typeof(object))
		{
			if (nodeEvent is SequenceStart)
			{
				currentType = typeof(List<object>);
				return true;
			}
			if (nodeEvent is MappingStart)
			{
				currentType = typeof(Dictionary<object, object>);
				return true;
			}
		}
		return false;
	}
}
