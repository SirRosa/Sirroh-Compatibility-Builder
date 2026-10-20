using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C287713a7_002D26e2_002D40c3_002Dbfea_002D1c61c7a66cba_003EComment : _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent
{
	public string Value { get; }

	public bool IsInline { get; }

	internal override _003C10437f4b_002D3ee2_002D41ea_002D89ce_002Dac952d373058_003EEventType Type => _003C10437f4b_002D3ee2_002D41ea_002D89ce_002Dac952d373058_003EEventType.Comment;

	public _003C287713a7_002D26e2_002D40c3_002Dbfea_002D1c61c7a66cba_003EComment(string value, bool isInline)
		: this(value, isInline, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	public _003C287713a7_002D26e2_002D40c3_002Dbfea_002D1c61c7a66cba_003EComment(string value, bool isInline, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end)
		: base(in start, in end)
	{
		Value = value;
		IsInline = isInline;
	}

	public override void Accept(_003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor visitor)
	{
		visitor.Visit(this);
	}

	public override string ToString()
	{
		return (IsInline ? "Inline" : "Block") + " Comment [" + Value + "]";
	}
}
