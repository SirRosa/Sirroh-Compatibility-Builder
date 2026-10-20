using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class AnchorAlias : ParsingEvent
{
	internal override EventType Type => EventType.Alias;

	public AnchorName Value { get; }

	public AnchorAlias(AnchorName value, Mark start, Mark end)
		: base(in start, in end)
	{
		if (value.IsEmpty)
		{
			throw new YamlException(in start, in end, "Anchor value must not be empty.");
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
