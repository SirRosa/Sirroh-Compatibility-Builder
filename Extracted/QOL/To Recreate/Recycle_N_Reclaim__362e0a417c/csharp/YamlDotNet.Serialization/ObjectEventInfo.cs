using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

internal class ObjectEventInfo : EventInfo
{
	public AnchorName Anchor { get; set; }

	public TagName Tag { get; set; }

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	protected ObjectEventInfo(IObjectDescriptor source)
		: base(source)
	{
	}
}
