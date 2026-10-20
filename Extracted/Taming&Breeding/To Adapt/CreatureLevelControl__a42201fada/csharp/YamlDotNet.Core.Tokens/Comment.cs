using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Tokens;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class Comment : Token
{
	public string Value { get; }

	public bool IsInline { get; }

	public Comment(string value, bool isInline)
		: this(value, isInline, Mark.Empty, Mark.Empty)
	{
	}

	public Comment(string value, bool isInline, Mark start, Mark end)
		: base(start, end)
	{
		Value = value ?? throw new ArgumentNullException("value");
		IsInline = isInline;
	}
}
