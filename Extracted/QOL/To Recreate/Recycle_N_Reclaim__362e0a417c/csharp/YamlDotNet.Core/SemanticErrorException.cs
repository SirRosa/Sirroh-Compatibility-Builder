using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal class SemanticErrorException : YamlException
{
	public SemanticErrorException(string message)
		: base(message)
	{
	}

	public SemanticErrorException(in Mark start, in Mark end, string message)
		: base(in start, in end, message)
	{
	}

	public SemanticErrorException(string message, Exception inner)
		: base(message, inner)
	{
	}
}
