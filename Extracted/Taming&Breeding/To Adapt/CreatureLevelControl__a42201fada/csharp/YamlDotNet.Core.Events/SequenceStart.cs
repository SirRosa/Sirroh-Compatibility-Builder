using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class SequenceStart : NodeEvent
{
	public override int NestingIncrease => 1;

	internal override EventType Type => EventType.SequenceStart;

	public bool IsImplicit { get; }

	public override bool IsCanonical => !IsImplicit;

	public SequenceStyle Style { get; }

	public SequenceStart(AnchorName anchor, TagName tag, bool isImplicit, SequenceStyle style, Mark start, Mark end)
		: base(anchor, tag, start, end)
	{
		IsImplicit = isImplicit;
		Style = style;
	}

	public SequenceStart(AnchorName anchor, TagName tag, bool isImplicit, SequenceStyle style)
		: this(anchor, tag, isImplicit, style, Mark.Empty, Mark.Empty)
	{
	}

	public override string ToString()
	{
		return string.Format("Sequence start [anchor = {0}, tag = {1}, isImplicit = {2}, style = {3}]", new object[4] { Anchor, Tag, IsImplicit, Style });
	}

	public override void Accept(IParsingEventVisitor visitor)
	{
		visitor.Visit(this);
	}
}
