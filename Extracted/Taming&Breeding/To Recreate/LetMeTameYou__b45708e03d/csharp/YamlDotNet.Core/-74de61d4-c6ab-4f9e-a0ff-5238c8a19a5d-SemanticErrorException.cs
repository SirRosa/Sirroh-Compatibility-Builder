using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal class _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException : _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException
{
	public _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(string message)
		: base(message)
	{
	}

	public _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end, string message)
		: base(in start, in end, message)
	{
	}

	public _003C74de61d4_002Dc6ab_002D4f9e_002Da0ff_002D5238c8a19a5d_003ESemanticErrorException(string message, Exception inner)
		: base(message, inner)
	{
	}
}
