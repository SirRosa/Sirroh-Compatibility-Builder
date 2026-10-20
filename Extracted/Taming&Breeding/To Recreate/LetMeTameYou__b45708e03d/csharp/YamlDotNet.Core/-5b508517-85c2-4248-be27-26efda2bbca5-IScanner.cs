using System.Runtime.CompilerServices;
using YamlDotNet.Core.Tokens;

namespace YamlDotNet.Core;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
internal interface _003C5b508517_002D85c2_002D4248_002Dbe27_002D26efda2bbca5_003EIScanner
{
	_003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark CurrentPosition { get; }

	_003Cf0484293_002Dc2f9_002D46d3_002Dbedc_002D375db65eb72f_003EToken Current { get; }

	bool MoveNext();

	bool MoveNextWithoutConsuming();

	void ConsumeCurrent();
}
