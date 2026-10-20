using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal interface IEventEmitter
{
	void Emit(AliasEventInfo eventInfo, IEmitter emitter);

	void Emit(ScalarEventInfo eventInfo, IEmitter emitter);

	void Emit(MappingStartEventInfo eventInfo, IEmitter emitter);

	void Emit(MappingEndEventInfo eventInfo, IEmitter emitter);

	void Emit(SequenceStartEventInfo eventInfo, IEmitter emitter);

	void Emit(SequenceEndEventInfo eventInfo, IEmitter emitter);
}
