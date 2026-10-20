using System;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal interface IDeserializer
{
	T Deserialize<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] T>(string input);

	T Deserialize<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] T>(TextReader input);

	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	object Deserialize(TextReader input);

	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	object Deserialize(string input, Type type);

	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	object Deserialize(TextReader input, Type type);

	T Deserialize<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] T>(IParser parser);

	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	object Deserialize(IParser parser);

	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	object Deserialize(IParser parser, Type type);
}
