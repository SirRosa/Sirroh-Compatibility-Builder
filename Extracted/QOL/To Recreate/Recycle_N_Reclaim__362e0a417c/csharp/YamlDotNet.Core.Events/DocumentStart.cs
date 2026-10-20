using System.Runtime.CompilerServices;
using YamlDotNet.Core.Tokens;

namespace YamlDotNet.Core.Events;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
internal sealed class DocumentStart : ParsingEvent
{
	public override int NestingIncrease => 1;

	internal override EventType Type => EventType.DocumentStart;

	public TagDirectiveCollection Tags { get; }

	public VersionDirective Version { get; }

	public bool IsImplicit { get; }

	public DocumentStart(VersionDirective version, TagDirectiveCollection tags, bool isImplicit, Mark start, Mark end)
		: base(in start, in end)
	{
		Version = version;
		Tags = tags;
		IsImplicit = isImplicit;
	}

	public DocumentStart(VersionDirective version, TagDirectiveCollection tags, bool isImplicit)
		: this(version, tags, isImplicit, Mark.Empty, Mark.Empty)
	{
	}

	public DocumentStart(in Mark start, in Mark end)
		: this(null, null, isImplicit: true, start, end)
	{
	}

	public DocumentStart()
		: this(null, null, isImplicit: true, Mark.Empty, Mark.Empty)
	{
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public override string ToString()
	{
		return $"Document start [isImplicit = {IsImplicit}]";
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public override void Accept(IParsingEventVisitor visitor)
	{
		visitor.Visit(this);
	}
}
