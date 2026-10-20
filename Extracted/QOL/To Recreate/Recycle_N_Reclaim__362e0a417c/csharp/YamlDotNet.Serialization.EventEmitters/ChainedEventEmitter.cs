using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.EventEmitters;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
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
