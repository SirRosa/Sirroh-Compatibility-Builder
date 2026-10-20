using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

internal abstract class _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent
{
	public virtual int NestingIncrease => 0;

	internal abstract _003C10437f4b_002D3ee2_002D41ea_002D89ce_002Dac952d373058_003EEventType Type { get; }

	public _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark Start { get; }

	public _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark End { get; }

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public abstract void Accept(_003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor visitor);

	internal _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent(in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end)
	{
		Start = start;
		End = end;
	}
}
