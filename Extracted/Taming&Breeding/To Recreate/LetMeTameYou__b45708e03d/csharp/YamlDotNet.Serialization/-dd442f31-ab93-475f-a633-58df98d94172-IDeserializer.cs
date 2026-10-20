using System;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal interface _003Cdd442f31_002Dab93_002D475f_002Da633_002D58df98d94172_003EIDeserializer
{
	T Deserialize<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] T>(string input);

	T Deserialize<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] T>(TextReader input);

	T Deserialize<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] T>(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser);

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	object Deserialize(string input);

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	object Deserialize(TextReader input);

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	object Deserialize(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser);

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	object Deserialize(string input, Type type);

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	object Deserialize(TextReader input, Type type);

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	object Deserialize(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, Type type);
}
