using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class DocumentEnd : ParsingEvent
{
	public override int NestingIncrease => -1;

	internal override EventType Type => EventType.DocumentEnd;

	public bool IsImplicit { get; }

	public DocumentEnd(bool isImplicit, Mark start, Mark end)
		: base(start, end)
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
