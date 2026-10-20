using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C50667387_002D32a0_002D4cfa_002D90ba_002D9e18d76632e5_003EStreamEnd : _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent
{
	public override int NestingIncrease => -1;

	internal override _003C10437f4b_002D3ee2_002D41ea_002D89ce_002Dac952d373058_003EEventType Type => _003C10437f4b_002D3ee2_002D41ea_002D89ce_002Dac952d373058_003EEventType.StreamEnd;

	public _003C50667387_002D32a0_002D4cfa_002D90ba_002D9e18d76632e5_003EStreamEnd(in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end)
		: base(in start, in end)
	{
	}

	public _003C50667387_002D32a0_002D4cfa_002D90ba_002D9e18d76632e5_003EStreamEnd()
		: this(in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	public override string ToString()
	{
		return "Stream end";
	}

	public override void Accept(_003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor visitor)
	{
		visitor.Visit(this);
	}
}
