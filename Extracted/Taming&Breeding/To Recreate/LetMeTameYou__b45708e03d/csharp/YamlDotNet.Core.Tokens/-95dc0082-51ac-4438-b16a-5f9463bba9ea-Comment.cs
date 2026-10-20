using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Tokens;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C95dc0082_002D51ac_002D4438_002Db16a_002D5f9463bba9ea_003EComment : _003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken
{
	public string Value { get; }

	public bool IsInline { get; }

	public _003C95dc0082_002D51ac_002D4438_002Db16a_002D5f9463bba9ea_003EComment(string value, bool isInline)
		: this(value, isInline, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	public _003C95dc0082_002D51ac_002D4438_002Db16a_002D5f9463bba9ea_003EComment(string value, bool isInline, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end)
		: base(in start, in end)
	{
		Value = value ?? throw new ArgumentNullException("value");
		IsInline = isInline;
	}
}
