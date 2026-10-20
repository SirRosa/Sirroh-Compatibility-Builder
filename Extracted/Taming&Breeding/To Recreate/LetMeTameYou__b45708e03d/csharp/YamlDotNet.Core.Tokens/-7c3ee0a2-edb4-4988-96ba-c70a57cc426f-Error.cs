using System.Runtime.CompilerServices;

namespace YamlDotNet.Core.Tokens;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal class _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError : _003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken
{
	public string Value { get; }

	public _003C7c3ee0a2_002Dedb4_002D4988_002D96ba_002Dc70a57cc426f_003EError(string value, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end)
		: base(in start, in end)
	{
		Value = value;
	}
}
