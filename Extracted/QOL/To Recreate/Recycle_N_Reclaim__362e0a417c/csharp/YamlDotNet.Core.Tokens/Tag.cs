using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Tokens;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class Tag : Token
{
	public string Handle { get; }

	public string Suffix { get; }

	public Tag(string handle, string suffix)
		: this(handle, suffix, Mark.Empty, Mark.Empty)
	{
	}

	public Tag(string handle, string suffix, Mark start, Mark end)
		: base(in start, in end)
	{
		Handle = handle ?? throw new ArgumentNullException("handle");
		Suffix = suffix ?? throw new ArgumentNullException("suffix");
	}
}
