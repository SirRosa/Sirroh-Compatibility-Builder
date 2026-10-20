using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.EventEmitters;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal abstract class ChainedEventEmitter : IEventEmitter
{
	protected readonly IEventEmitter nextEmitter;

	protected ChainedEventEmitter(IEventEmitter nextEmitter)
	{
		this.nextEmitter = nextEmitter ?? throw new ArgumentNullException("nextEmitter");
	}

	public virtual void Emit(AliasEventInfo eventInfo, IEmitter emitter)
	{
		nextEmitter.Emit(eventInfo, emitter);
	}

	public virtual void Emit(ScalarEventInfo eventInfo, IEmitter emitter)
	{
		nextEmitter.Emit(eventInfo, emitter);
	}

	public virtual void Emit(MappingStartEventInfo eventInfo, IEmitter emitter)
	{
		nextEmitter.Emit(eventInfo, emitter);
	}

	public virtual void Emit(MappingEndEventInfo eventInfo, IEmitter emitter)
	{
		nextEmitter.Emit(eventInfo, emitter);
	}

	public virtual void Emit(SequenceStartEventInfo eventInfo, IEmitter emitter)
	{
		nextEmitter.Emit(eventInfo, emitter);
	}

	public virtual void Emit(SequenceEndEventInfo eventInfo, IEmitter emitter)
	{
		nextEmitter.Emit(eventInfo, emitter);
	}
}
