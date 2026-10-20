using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

internal class ObjectEventInfo : EventInfo
{
	public AnchorName Anchor { get; set; }

	public TagName Tag { get; set; }

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	protected ObjectEventInfo(IObjectDescriptor source)
		: base(source)
	{
	}
}
