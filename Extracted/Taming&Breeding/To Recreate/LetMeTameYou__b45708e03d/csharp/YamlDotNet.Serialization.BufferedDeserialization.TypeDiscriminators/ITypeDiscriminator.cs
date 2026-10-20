using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.BufferedDeserialization.TypeDiscriminators;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal interface ITypeDiscriminator
{
	Type BaseType { get; }

	bool TryDiscriminate(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser buffer, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] out Type suggestedType);
}
