using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeTypeResolvers;

internal sealed class _003C001da766_002Dd948_002D452c_002Daa06_002Dfcea59410c62_003EDefaultContainersNodeTypeResolver : _003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver
{
	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	bool _003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver.Resolve([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] _003C1af307a4_002D0546_002D4fb8_002D9199_002D3379b8888e00_003ENodeEvent nodeEvent, ref Type currentType)
	{
		if (currentType == typeof(object))
		{
			if (nodeEvent is _003C9f7de5d2_002Dfe16_002D493d_002D8158_002D378a5bfd51bb_003ESequenceStart)
			{
				currentType = typeof(List<object>);
				return true;
			}
			if (nodeEvent is _003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart)
			{
				currentType = typeof(Dictionary<object, object>);
				return true;
			}
		}
		return false;
	}
}
