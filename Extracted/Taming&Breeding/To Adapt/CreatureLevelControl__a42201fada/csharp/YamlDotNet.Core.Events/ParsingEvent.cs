using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal abstract class ParsingEvent
{
	public virtual int NestingIncrease => 0;

	internal abstract EventType Type { get; }

	public Mark Start { get; }

	public Mark End { get; }

	public abstract void Accept(IParsingEventVisitor visitor);

	internal ParsingEvent(Mark start, Mark end)
	{
		Start = start ?? throw new ArgumentNullException("start");
		End = end ?? throw new ArgumentNullException("end");
	}
}
