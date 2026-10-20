using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeTypeResolvers;

internal sealed class DefaultContainersNodeTypeResolver : INodeTypeResolver
{
	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	bool INodeTypeResolver.Resolve([_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] NodeEvent nodeEvent, ref Type currentType)
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
