using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal interface IEventEmitter
{
	void Emit(AliasEventInfo eventInfo, IEmitter emitter);

	void Emit(ScalarEventInfo eventInfo, IEmitter emitter);

	void Emit(MappingStartEventInfo eventInfo, IEmitter emitter);

	void Emit(MappingEndEventInfo eventInfo, IEmitter emitter);

	void Emit(SequenceStartEventInfo eventInfo, IEmitter emitter);

	void Emit(SequenceEndEventInfo eventInfo, IEmitter emitter);
}
