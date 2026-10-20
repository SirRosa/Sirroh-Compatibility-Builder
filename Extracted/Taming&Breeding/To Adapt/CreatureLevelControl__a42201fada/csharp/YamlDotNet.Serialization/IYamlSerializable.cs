using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[Obsolete("Please use IYamlConvertible instead")]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal interface IYamlSerializable
{
	void ReadYaml(IParser parser);

	void WriteYaml(IEmitter emitter);
}
