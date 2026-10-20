using System.Runtime.CompilerServices;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Core;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
internal interface IParser
{
	ParsingEvent Current { get; }

	bool MoveNext();
}
