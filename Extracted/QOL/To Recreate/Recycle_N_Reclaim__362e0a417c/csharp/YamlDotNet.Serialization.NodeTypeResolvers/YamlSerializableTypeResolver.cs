using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeTypeResolvers;

internal sealed class YamlSerializableTypeResolver : INodeTypeResolver
{
	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public bool Resolve([_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] NodeEvent nodeEvent, ref Type currentType)
	{
		return typeof(IYamlSerializable).IsAssignableFrom(currentType);
	}
}
