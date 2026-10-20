using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class Comment : ParsingEvent
{
	public string Value { get; }

	public bool IsInline { get; }

	internal override EventType Type => EventType.Comment;

	public Comment(string value, bool isInline)
		: this(value, isInline, Mark.Empty, Mark.Empty)
	{
	}

	public Comment(string value, bool isInline, Mark start, Mark end)
		: base(start, end)
	{
		Value = value;
		IsInline = isInline;
	}

	public override void Accept(IParsingEventVisitor visitor)
	{
		visitor.Visit(this);
	}

	public override string ToString()
	{
		return (IsInline ? "Inline" : "Block") + " Comment [" + Value + "]";
	}
}
