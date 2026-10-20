using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Tokens;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar : _003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken
{
	public bool IsKey { get; set; }

	public string Value { get; }

	public _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle Style { get; }

	public _003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar(string value)
		: this(value, _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Any)
	{
	}

	public _003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar(string value, _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle style)
		: this(value, style, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	public _003Ca75b8374_002Daef2_002D4fe4_002D9788_002Dece9f52f6465_003EScalar(string value, _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle style, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end)
		: base(in start, in end)
	{
		Value = value ?? throw new ArgumentNullException("value");
		Style = style;
	}
}
