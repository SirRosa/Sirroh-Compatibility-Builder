using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeTypeResolvers;

[Obsolete("The mechanism that this class uses to specify type names is non-standard. Register the tags explicitly instead of using this convention.")]
internal sealed class TypeNameInTagNodeTypeResolver : INodeTypeResolver
{
	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	bool INodeTypeResolver.Resolve([_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] NodeEvent nodeEvent, ref Type currentType)
	{
		if (nodeEvent != null && !nodeEvent.Tag.IsEmpty)
		{
			Type type = Type.GetType(nodeEvent.Tag.Value.Substring(1), throwOnError: false);
			if (type != null)
			{
				currentType = type;
				return true;
			}
		}
		return false;
	}
}
