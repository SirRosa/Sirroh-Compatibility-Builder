using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal sealed class _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar : _003C1af307a4_002D0546_002D4fb8_002D9199_002D3379b8888e00_003ENodeEvent
{
	internal override _003C10437f4b_002D3ee2_002D41ea_002D89ce_002Dac952d373058_003EEventType Type => _003C10437f4b_002D3ee2_002D41ea_002D89ce_002Dac952d373058_003EEventType.Scalar;

	public string Value { get; }

	public _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle Style { get; }

	public bool IsPlainImplicit { get; }

	public bool IsQuotedImplicit { get; }

	public override bool IsCanonical
	{
		get
		{
			if (!IsPlainImplicit)
			{
				return !IsQuotedImplicit;
			}
			return false;
		}
	}

	public bool IsKey { get; }

	public _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName anchor, _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName tag, string value, _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle style, bool isPlainImplicit, bool isQuotedImplicit, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end, bool isKey = false)
		: base(anchor, tag, start, end)
	{
		Value = value;
		Style = style;
		IsPlainImplicit = isPlainImplicit;
		IsQuotedImplicit = isQuotedImplicit;
		IsKey = isKey;
	}

	public _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName anchor, _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName tag, string value, _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle style, bool isPlainImplicit, bool isQuotedImplicit)
		: this(anchor, tag, value, style, isPlainImplicit, isQuotedImplicit, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	public _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar(string value)
		: this(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName.Empty, _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName.Empty, value, _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Any, isPlainImplicit: true, isQuotedImplicit: true, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	public _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar(_003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName tag, string value)
		: this(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName.Empty, tag, value, _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Any, isPlainImplicit: true, isQuotedImplicit: true, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	public _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName anchor, _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName tag, string value)
		: this(anchor, tag, value, _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Any, isPlainImplicit: true, isQuotedImplicit: true, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	public override string ToString()
	{
		return string.Format("Scalar [anchor = {0}, tag = {1}, value = {2}, style = {3}, isPlainImplicit = {4}, isQuotedImplicit = {5}]", new object[6] { Anchor, Tag, Value, Style, IsPlainImplicit, IsQuotedImplicit });
	}

	public override void Accept(_003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor visitor)
	{
		visitor.Visit(this);
	}
}
