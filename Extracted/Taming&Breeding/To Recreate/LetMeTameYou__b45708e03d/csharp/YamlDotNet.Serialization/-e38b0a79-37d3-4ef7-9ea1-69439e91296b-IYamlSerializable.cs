using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[Obsolete("Please use IYamlConvertible instead")]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal interface _003Ce38b0a79_002D37d3_002D4ef7_002D9ea1_002D69439e91296b_003EIYamlSerializable
{
	void ReadYaml(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser);

	void WriteYaml(_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter);
}
