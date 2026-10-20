using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal class MappingEnd : ParsingEvent
{
	public override int NestingIncrease => -1;

	internal override EventType Type => EventType.MappingEnd;

	public MappingEnd(Mark start, Mark end)
		: base(start, end)
	{
	}

	public MappingEnd()
		: this(Mark.Empty, Mark.Empty)
	{
	}

	public override string ToString()
	{
		return "Mapping end";
	}

	public override void Accept(IParsingEventVisitor visitor)
	{
		visitor.Visit(this);
	}
}
