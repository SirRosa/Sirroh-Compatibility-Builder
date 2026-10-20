using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization;

internal sealed class SequenceStartEventInfo : ObjectEventInfo
{
	public bool IsImplicit { get; set; }

	public SequenceStyle Style { get; set; }

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	public SequenceStartEventInfo(IObjectDescriptor source)
		: base(source)
	{
	}
}
