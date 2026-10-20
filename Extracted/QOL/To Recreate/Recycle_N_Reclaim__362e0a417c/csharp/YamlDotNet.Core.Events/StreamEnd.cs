using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class StreamEnd : ParsingEvent
{
	public override int NestingIncrease => -1;

	internal override EventType Type => EventType.StreamEnd;

	public StreamEnd(in Mark start, in Mark end)
		: base(in start, in end)
	{
	}

	public StreamEnd()
		: this(in Mark.Empty, in Mark.Empty)
	{
	}

	public override string ToString()
	{
		return "Stream end";
	}

	public override void Accept(IParsingEventVisitor visitor)
	{
		visitor.Visit(this);
	}
}
