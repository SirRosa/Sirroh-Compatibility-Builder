using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeTypeResolvers;

[Obsolete("The mechanism that this class uses to specify type names is non-standard. Register the tags explicitly instead of using this convention.")]
internal sealed class _003C8bb0a43d_002D5de7_002D4f15_002Db701_002D8d512c599693_003ETypeNameInTagNodeTypeResolver : _003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver
{
	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	bool _003C5d87a147_002Dae74_002D49a7_002D8626_002Dec84a8adca93_003EINodeTypeResolver.Resolve([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] _003C1af307a4_002D0546_002D4fb8_002D9199_002D3379b8888e00_003ENodeEvent nodeEvent, ref Type currentType)
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
