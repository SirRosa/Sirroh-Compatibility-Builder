using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Tokens;

internal sealed class FlowSequenceEnd : Token
{
	public FlowSequenceEnd()
		: this(Mark.Empty, Mark.Empty)
	{
	}

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	public FlowSequenceEnd(Mark start, Mark end)
		: base(start, end)
	{
	}
}
