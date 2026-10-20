using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

internal abstract class NodeEvent : ParsingEvent
{
	public AnchorName Anchor { get; }

	public TagName Tag { get; }

	public abstract bool IsCanonical { get; }

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	protected NodeEvent(AnchorName anchor, TagName tag, Mark start, Mark end)
		: base(start, end)
	{
		Anchor = anchor;
		Tag = tag;
	}

	protected NodeEvent(AnchorName anchor, TagName tag)
		: this(anchor, tag, Mark.Empty, Mark.Empty)
	{
	}
}
