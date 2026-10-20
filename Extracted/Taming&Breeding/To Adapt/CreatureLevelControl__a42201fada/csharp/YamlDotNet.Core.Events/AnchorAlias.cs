using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class AnchorAlias : ParsingEvent
{
	internal override EventType Type => EventType.Alias;

	public AnchorName Value { get; }

	public AnchorAlias(AnchorName value, Mark start, Mark end)
		: base(start, end)
	{
		if (value.IsEmpty)
		{
			throw new YamlException(start, end, "Anchor value must not be empty.");
		}
		Value = value;
	}

	public AnchorAlias(AnchorName value)
		: this(value, Mark.Empty, Mark.Empty)
	{
	}

	public override string ToString()
	{
		return $"Alias [value = {Value}]";
	}

	public override void Accept(IParsingEventVisitor visitor)
	{
		visitor.Visit(this);
	}
}
