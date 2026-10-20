using System.Runtime.CompilerServices;
using YamlDotNet.Core.Tokens;

namespace YamlDotNet.Core.Events;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
internal sealed class DocumentStart : ParsingEvent
{
	public override int NestingIncrease => 1;

	internal override EventType Type => EventType.DocumentStart;

	public TagDirectiveCollection Tags { get; }

	public VersionDirective Version { get; }

	public bool IsImplicit { get; }

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	public DocumentStart([_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] VersionDirective version, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] TagDirectiveCollection tags, bool isImplicit, Mark start, Mark end)
		: base(start, end)
	{
		Version = version;
		Tags = tags;
		IsImplicit = isImplicit;
	}

	public DocumentStart(VersionDirective version, TagDirectiveCollection tags, bool isImplicit)
		: this(version, tags, isImplicit, Mark.Empty, Mark.Empty)
	{
	}

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	public DocumentStart(Mark start, Mark end)
		: this(null, null, isImplicit: true, start, end)
	{
	}

	public DocumentStart()
		: this(null, null, isImplicit: true, Mark.Empty, Mark.Empty)
	{
	}

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	public override string ToString()
	{
		return $"Document start [isImplicit = {IsImplicit}]";
	}

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	public override void Accept(IParsingEventVisitor visitor)
	{
		visitor.Visit(this);
	}
}
