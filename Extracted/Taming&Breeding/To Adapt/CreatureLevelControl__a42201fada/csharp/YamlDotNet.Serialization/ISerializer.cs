using System;
using System.IO;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal interface ISerializer
{
	void Serialize(TextWriter writer, object graph);

	string Serialize(object graph);

	void Serialize(TextWriter writer, object graph, Type type);

	void Serialize(IEmitter emitter, object graph);

	void Serialize(IEmitter emitter, object graph, Type type);
}
