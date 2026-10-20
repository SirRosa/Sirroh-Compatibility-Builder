using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.EventEmitters;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal abstract class _003C2c280942_002D8e06_002D4626_002Da61e_002D3b13681e453e_003EChainedEventEmitter : _003Ca359f02a_002D4850_002D48f6_002Da961_002Dc904bad904ab_003EIEventEmitter
{
	protected readonly _003Ca359f02a_002D4850_002D48f6_002Da961_002Dc904bad904ab_003EIEventEmitter nextEmitter;

	protected _003C2c280942_002D8e06_002D4626_002Da61e_002D3b13681e453e_003EChainedEventEmitter(_003Ca359f02a_002D4850_002D48f6_002Da961_002Dc904bad904ab_003EIEventEmitter nextEmitter)
	{
		this.nextEmitter = nextEmitter ?? throw new ArgumentNullException("nextEmitter");
	}

	public virtual void Emit(_003C695b7599_002D579b_002D401a_002Db6a8_002De16fca8b4542_003EAliasEventInfo eventInfo, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter)
	{
		nextEmitter.Emit(eventInfo, emitter);
	}

	public virtual void Emit(_003C770f57fd_002Dbae1_002D4ccf_002D8ccf_002D88c849ae3ab1_003EScalarEventInfo eventInfo, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter)
	{
		nextEmitter.Emit(eventInfo, emitter);
	}

	public virtual void Emit(_003Cf86b4489_002D7ae4_002D48a5_002Dbf69_002D820dcd79c453_003EMappingStartEventInfo eventInfo, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter)
	{
		nextEmitter.Emit(eventInfo, emitter);
	}

	public virtual void Emit(_003Cca17ac92_002Dbe84_002D40e9_002Daf61_002D95f77327eed2_003EMappingEndEventInfo eventInfo, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter)
	{
		nextEmitter.Emit(eventInfo, emitter);
	}

	public virtual void Emit(_003C36d39d35_002D67a3_002D41cc_002Da600_002De72a94055f2e_003ESequenceStartEventInfo eventInfo, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter)
	{
		nextEmitter.Emit(eventInfo, emitter);
	}

	public virtual void Emit(_003C7b029d40_002Dc8f8_002D4c06_002D8678_002D56f5fad39c49_003ESequenceEndEventInfo eventInfo, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter)
	{
		nextEmitter.Emit(eventInfo, emitter);
	}
}
