using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Tokens;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class Tag : Token
{
	public string Handle { get; }

	public string Suffix { get; }

	public Tag(string handle, string suffix)
		: this(handle, suffix, Mark.Empty, Mark.Empty)
	{
	}

	public Tag(string handle, string suffix, Mark start, Mark end)
		: base(start, end)
	{
		Handle = handle ?? throw new ArgumentNullException("handle");
		Suffix = suffix ?? throw new ArgumentNullException("suffix");
	}
}
