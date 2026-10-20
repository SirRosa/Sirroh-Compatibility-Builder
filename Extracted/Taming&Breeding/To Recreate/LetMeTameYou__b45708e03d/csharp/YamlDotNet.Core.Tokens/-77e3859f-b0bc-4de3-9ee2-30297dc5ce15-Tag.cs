using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Tokens;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal sealed class _003C77e3859f_002Db0bc_002D4de3_002D9ee2_002D30297dc5ce15_003ETag : _003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken
{
	public string Handle { get; }

	public string Suffix { get; }

	public _003C77e3859f_002Db0bc_002D4de3_002D9ee2_002D30297dc5ce15_003ETag(string handle, string suffix)
		: this(handle, suffix, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	public _003C77e3859f_002Db0bc_002D4de3_002D9ee2_002D30297dc5ce15_003ETag(string handle, string suffix, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end)
		: base(in start, in end)
	{
		Handle = handle ?? throw new ArgumentNullException("handle");
		Suffix = suffix ?? throw new ArgumentNullException("suffix");
	}
}
