using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.EventEmitters;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
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
