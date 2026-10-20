using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal class YamlException : Exception
{
	public Mark Start { get; }

	public Mark End { get; }

	public YamlException(string message)
		: this(Mark.Empty, Mark.Empty, message)
	{
	}

	public YamlException(Mark start, Mark end, string message)
		: this(start, end, message, null)
	{
	}

	public YamlException(Mark start, Mark end, string message, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] Exception innerException)
		: base($"({start}) - ({end}): {message}", innerException)
	{
		Start = start;
		End = end;
	}

	public YamlException(string message, Exception inner)
		: this(Mark.Empty, Mark.Empty, message, inner)
	{
	}
}
