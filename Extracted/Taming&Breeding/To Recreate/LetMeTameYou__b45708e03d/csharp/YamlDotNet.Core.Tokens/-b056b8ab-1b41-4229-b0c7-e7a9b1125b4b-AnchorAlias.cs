using System;

namespace YamlDotNet.Core.Tokens;

internal sealed class _003Cb056b8ab_002D1b41_002D4229_002Db0c7_002De7a9b1125b4b_003EAnchorAlias : _003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken
{
	public _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName Value { get; }

	public _003Cb056b8ab_002D1b41_002D4229_002Db0c7_002De7a9b1125b4b_003EAnchorAlias(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName value)
		: this(value, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	public _003Cb056b8ab_002D1b41_002D4229_002Db0c7_002De7a9b1125b4b_003EAnchorAlias(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName value, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end)
		: base(in start, in end)
	{
		if (value.IsEmpty)
		{
			throw new ArgumentNullException("value");
		}
		Value = value;
	}
}
