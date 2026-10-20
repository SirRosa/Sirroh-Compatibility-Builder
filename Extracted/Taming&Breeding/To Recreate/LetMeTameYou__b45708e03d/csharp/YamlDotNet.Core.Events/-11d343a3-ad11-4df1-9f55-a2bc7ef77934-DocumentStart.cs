using System.Runtime.CompilerServices;
using YamlDotNet.Core.Tokens;

namespace YamlDotNet.Core.Events;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
internal sealed class _003C11d343a3_002Dad11_002D4df1_002D9f55_002Da2bc7ef77934_003EDocumentStart : _003C47bae968_002D6c5e_002D4df2_002D83b4_002D202823c3b1a4_003EParsingEvent
{
	public override int NestingIncrease => 1;

	internal override _003C10437f4b_002D3ee2_002D41ea_002D89ce_002Dac952d373058_003EEventType Type => _003C10437f4b_002D3ee2_002D41ea_002D89ce_002Dac952d373058_003EEventType.DocumentStart;

	public _003Ca82c72f0_002D22d6_002D4f99_002Db89a_002Df3404da1c7e0_003ETagDirectiveCollection Tags { get; }

	public _003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective Version { get; }

	public bool IsImplicit { get; }

	public _003C11d343a3_002Dad11_002D4df1_002D9f55_002Da2bc7ef77934_003EDocumentStart(_003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective version, _003Ca82c72f0_002D22d6_002D4f99_002Db89a_002Df3404da1c7e0_003ETagDirectiveCollection tags, bool isImplicit, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end)
		: base(in start, in end)
	{
		Version = version;
		Tags = tags;
		IsImplicit = isImplicit;
	}

	public _003C11d343a3_002Dad11_002D4df1_002D9f55_002Da2bc7ef77934_003EDocumentStart(_003Cf27dd385_002D3eaa_002D42f1_002D8a3f_002Dd10c08c1b0c1_003EVersionDirective version, _003Ca82c72f0_002D22d6_002D4f99_002Db89a_002Df3404da1c7e0_003ETagDirectiveCollection tags, bool isImplicit)
		: this(version, tags, isImplicit, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	public _003C11d343a3_002Dad11_002D4df1_002D9f55_002Da2bc7ef77934_003EDocumentStart(in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, in _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end)
		: this(null, null, isImplicit: true, start, end)
	{
	}

	public _003C11d343a3_002Dad11_002D4df1_002D9f55_002Da2bc7ef77934_003EDocumentStart()
		: this(null, null, isImplicit: true, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty)
	{
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public override string ToString()
	{
		return $"Document start [isImplicit = {IsImplicit}]";
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public override void Accept(_003C8e45faab_002D558f_002D4b7c_002D9be7_002Dfe61db5e445f_003EIParsingEventVisitor visitor)
	{
		visitor.Visit(this);
	}
}
