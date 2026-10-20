using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[Obsolete("Please use IYamlConvertible instead")]
internal interface IYamlSerializable
{
	void ReadYaml(IParser parser);

	void WriteYaml(IEmitter emitter);
}
