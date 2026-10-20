using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.EventEmitters;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class WriterEventEmitter : IEventEmitter
{
	void IEventEmitter.Emit(AliasEventInfo eventInfo, IEmitter emitter)
	{
		emitter.Emit(new AnchorAlias(eventInfo.Alias));
	}

	void IEventEmitter.Emit(ScalarEventInfo eventInfo, IEmitter emitter)
	{
		emitter.Emit(new Scalar(eventInfo.Anchor, eventInfo.Tag, eventInfo.RenderedValue, eventInfo.Style, eventInfo.IsPlainImplicit, eventInfo.IsQuotedImplicit));
	}

	void IEventEmitter.Emit(MappingStartEventInfo eventInfo, IEmitter emitter)
	{
		emitter.Emit(new MappingStart(eventInfo.Anchor, eventInfo.Tag, eventInfo.IsImplicit, eventInfo.Style));
	}

	void IEventEmitter.Emit(MappingEndEventInfo eventInfo, IEmitter emitter)
	{
		emitter.Emit(new MappingEnd());
	}

	void IEventEmitter.Emit(SequenceStartEventInfo eventInfo, IEmitter emitter)
	{
		emitter.Emit(new SequenceStart(eventInfo.Anchor, eventInfo.Tag, eventInfo.IsImplicit, eventInfo.Style));
	}

	void IEventEmitter.Emit(SequenceEndEventInfo eventInfo, IEmitter emitter)
	{
		emitter.Emit(new SequenceEnd());
	}
}
