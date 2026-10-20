using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Events;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias : _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent
{
	internal override _003C10437f4b_002D3ee2_002D41ea_002D89ce_002Dac952d373058_003EEventType Type => _003C10437f4b_002D3ee2_002D41ea_002D89ce_002Dac952d373058_003EEventType.Alias;

	public _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName Value { get; }

	public _003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName value, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end)
		: base(in start, in end)
	{
		if (value.IsEmpty)
		{
			throw new _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(in start, in end, "Anchor value must not be empty.");
		}
		Value = value;
	}

	public _003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName value)
		: this(value, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	public override string ToString()
	{
		return $"Alias [value = {Value}]";
	}

	public override void Accept(_003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor visitor)
	{
		visitor.Visit(this);
	}
}
