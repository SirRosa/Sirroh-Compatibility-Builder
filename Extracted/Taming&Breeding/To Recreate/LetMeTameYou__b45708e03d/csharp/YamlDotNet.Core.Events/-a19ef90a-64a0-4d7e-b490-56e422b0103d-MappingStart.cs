using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart : _003C1af307a4_002D0546_002D4fb8_002D9199_002D3379b8888e00_003ENodeEvent
{
	public override int NestingIncrease => 1;

	internal override _003C10437f4b_002D3ee2_002D41ea_002D89ce_002Dac952d373058_003EEventType Type => _003C10437f4b_002D3ee2_002D41ea_002D89ce_002Dac952d373058_003EEventType.MappingStart;

	public bool IsImplicit { get; }

	public override bool IsCanonical => !IsImplicit;

	public _003C4531dc81_002Df938_002D4560_002D9983_002D291645827825_003EMappingStyle Style { get; }

	public _003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName anchor, _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName tag, bool isImplicit, _003C4531dc81_002Df938_002D4560_002D9983_002D291645827825_003EMappingStyle style, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end)
		: base(anchor, tag, start, end)
	{
		IsImplicit = isImplicit;
		Style = style;
	}

	public _003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName anchor, _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName tag, bool isImplicit, _003C4531dc81_002Df938_002D4560_002D9983_002D291645827825_003EMappingStyle style)
		: this(anchor, tag, isImplicit, style, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	public _003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart()
		: this(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName.Empty, _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName.Empty, isImplicit: true, _003C4531dc81_002Df938_002D4560_002D9983_002D291645827825_003EMappingStyle.Any, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	public override string ToString()
	{
		return string.Format("Mapping start [anchor = {0}, tag = {1}, isImplicit = {2}, style = {3}]", new object[4] { Anchor, Tag, IsImplicit, Style });
	}

	public override void Accept(_003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor visitor)
	{
		visitor.Visit(this);
	}
}
