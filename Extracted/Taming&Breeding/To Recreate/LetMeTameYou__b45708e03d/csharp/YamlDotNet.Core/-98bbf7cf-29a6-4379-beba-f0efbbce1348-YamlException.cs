using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal class _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException : Exception
{
	public _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark Start { get; }

	public _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark End { get; }

	public _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(string message)
		: this(in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, message)
	{
	}

	public _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end, string message)
		: this(in start, in end, message, null)
	{
	}

	public _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end, string message, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] Exception innerException)
		: base(message, innerException)
	{
		Start = start;
		End = end;
	}

	public _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(string message, Exception inner)
		: this(in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, message, inner)
	{
	}

	public override string ToString()
	{
		return $"({Start}) - ({End}): {Message}";
	}
}
