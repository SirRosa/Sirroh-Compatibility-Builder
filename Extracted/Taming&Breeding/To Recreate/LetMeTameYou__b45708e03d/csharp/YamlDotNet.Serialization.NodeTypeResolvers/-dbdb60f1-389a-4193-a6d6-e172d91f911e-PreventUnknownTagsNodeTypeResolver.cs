using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeTypeResolvers;

internal class _003Cdbdb60f1_002D389a_002D4193_002Da6d6_002De172d91f911e_003EPreventUnknownTagsNodeTypeResolver : _003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver
{
	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	bool _003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver.Resolve([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] _003C1af307a4_002D0546_002D4fb8_002D9199_002D3379b8888e00_003ENodeEvent nodeEvent, ref Type currentType)
	{
		if (nodeEvent != null && !nodeEvent.Tag.IsEmpty)
		{
			throw new _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(nodeEvent.Start, nodeEvent.End, $"Encountered an unresolved tag '{nodeEvent.Tag}'");
		}
		return false;
	}
}
