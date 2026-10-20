using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

internal abstract class ParsingEvent
{
	public virtual int NestingIncrease => 0;

	internal abstract EventType Type { get; }

	public Mark Start { get; }

	public Mark End { get; }

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public abstract void Accept(IParsingEventVisitor visitor);

	internal ParsingEvent(in Mark start, in Mark end)
	{
		Start = start;
		End = end;
	}
}
