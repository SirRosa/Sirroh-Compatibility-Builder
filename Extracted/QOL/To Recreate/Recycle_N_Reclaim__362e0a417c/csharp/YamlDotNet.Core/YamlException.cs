using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal class YamlException : Exception
{
	public Mark Start { get; }

	public Mark End { get; }

	public YamlException(string message)
		: this(in Mark.Empty, in Mark.Empty, message)
	{
	}

	public YamlException(in Mark start, in Mark end, string message)
		: this(in start, in end, message, null)
	{
	}

	public YamlException(in Mark start, in Mark end, string message, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] Exception innerException)
		: base(message, innerException)
	{
		Start = start;
		End = end;
	}

	public YamlException(string message, Exception inner)
		: this(in Mark.Empty, in Mark.Empty, message, inner)
	{
	}

	public override string ToString()
	{
		return $"({Start}) - ({End}): {Message}";
	}
}
