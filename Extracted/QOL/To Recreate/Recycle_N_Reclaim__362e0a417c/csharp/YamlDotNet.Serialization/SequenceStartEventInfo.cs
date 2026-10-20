using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization;

internal sealed class SequenceStartEventInfo : ObjectEventInfo
{
	public bool IsImplicit { get; set; }

	public SequenceStyle Style { get; set; }

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public SequenceStartEventInfo(IObjectDescriptor source)
		: base(source)
	{
	}
}
