using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class EmittingObjectGraphVisitor : IObjectGraphVisitor<IEmitter>
{
	private readonly IEventEmitter eventEmitter;

	public EmittingObjectGraphVisitor(IEventEmitter eventEmitter)
	{
		this.eventEmitter = eventEmitter;
	}

	bool IObjectGraphVisitor<IEmitter>.Enter(IObjectDescriptor value, IEmitter context)
	{
		return true;
	}

	bool IObjectGraphVisitor<IEmitter>.EnterMapping(IObjectDescriptor key, IObjectDescriptor value, IEmitter context)
	{
		return true;
	}

	bool IObjectGraphVisitor<IEmitter>.EnterMapping(IPropertyDescriptor key, IObjectDescriptor value, IEmitter context)
	{
		return true;
	}

	void IObjectGraphVisitor<IEmitter>.VisitScalar(IObjectDescriptor scalar, IEmitter context)
	{
		eventEmitter.Emit(new ScalarEventInfo(scalar), context);
	}

	void IObjectGraphVisitor<IEmitter>.VisitMappingStart(IObjectDescriptor mapping, Type keyType, Type valueType, IEmitter context)
	{
		eventEmitter.Emit(new MappingStartEventInfo(mapping), context);
	}

	void IObjectGraphVisitor<IEmitter>.VisitMappingEnd(IObjectDescriptor mapping, IEmitter context)
	{
		eventEmitter.Emit(new MappingEndEventInfo(mapping), context);
	}

	void IObjectGraphVisitor<IEmitter>.VisitSequenceStart(IObjectDescriptor sequence, Type elementType, IEmitter context)
	{
		eventEmitter.Emit(new SequenceStartEventInfo(sequence), context);
	}

	void IObjectGraphVisitor<IEmitter>.VisitSequenceEnd(IObjectDescriptor sequence, IEmitter context)
	{
		eventEmitter.Emit(new SequenceEndEventInfo(sequence), context);
	}
}
