using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
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
