using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
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
		: base(in start, in end)
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
