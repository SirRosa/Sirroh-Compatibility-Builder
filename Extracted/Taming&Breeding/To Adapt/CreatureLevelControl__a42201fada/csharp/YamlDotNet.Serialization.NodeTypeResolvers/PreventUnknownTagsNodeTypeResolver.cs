using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeTypeResolvers;

internal class PreventUnknownTagsNodeTypeResolver : INodeTypeResolver
{
	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	bool INodeTypeResolver.Resolve([_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] NodeEvent nodeEvent, ref Type currentType)
	{
		if (nodeEvent != null && !nodeEvent.Tag.IsEmpty)
		{
			throw new YamlException(nodeEvent.Start, nodeEvent.End, $"Encountered an unresolved tag '{nodeEvent.Tag}'");
		}
		return false;
	}
}
