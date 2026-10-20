using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class ForwardAnchorNotSupportedException : YamlException
{
	public ForwardAnchorNotSupportedException(string message)
		: base(message)
	{
	}

	public ForwardAnchorNotSupportedException(Mark start, Mark end, string message)
		: base(start, end, message)
	{
	}

	public ForwardAnchorNotSupportedException(string message, Exception inner)
		: base(message, inner)
	{
	}
}
