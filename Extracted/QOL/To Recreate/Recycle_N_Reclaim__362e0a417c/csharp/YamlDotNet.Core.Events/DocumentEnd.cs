using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class DocumentEnd : ParsingEvent
{
	public override int NestingIncrease => -1;

	internal override EventType Type => EventType.DocumentEnd;

	public bool IsImplicit { get; }

	public DocumentEnd(bool isImplicit, Mark start, Mark end)
		: base(in start, in end)
	{
		IsImplicit = isImplicit;
	}

	public DocumentEnd(bool isImplicit)
		: this(isImplicit, Mark.Empty, Mark.Empty)
	{
	}

	public override string ToString()
	{
		return $"Document end [isImplicit = {IsImplicit}]";
	}

	public override void Accept(IParsingEventVisitor visitor)
	{
		visitor.Visit(this);
	}
}
