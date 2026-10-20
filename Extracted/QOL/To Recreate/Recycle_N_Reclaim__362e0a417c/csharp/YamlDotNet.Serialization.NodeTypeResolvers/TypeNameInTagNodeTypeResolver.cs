using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeTypeResolvers;

[Obsolete("The mechanism that this class uses to specify type names is non-standard. Register the tags explicitly instead of using this convention.")]
internal sealed class TypeNameInTagNodeTypeResolver : INodeTypeResolver
{
	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	bool INodeTypeResolver.Resolve([_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] NodeEvent nodeEvent, ref Type currentType)
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
