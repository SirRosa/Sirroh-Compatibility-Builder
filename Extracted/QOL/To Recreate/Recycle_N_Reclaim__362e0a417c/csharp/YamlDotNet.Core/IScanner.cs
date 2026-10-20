using System.Runtime.CompilerServices;
using YamlDotNet.Core.Tokens;

namespace YamlDotNet.Core;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
internal interface IScanner
{
	Mark CurrentPosition { get; }

	Token Current { get; }

	bool MoveNext();

	bool MoveNextWithoutConsuming();

	void ConsumeCurrent();
}
