using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.ObjectGraphVisitors;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal abstract class ChainedObjectGraphVisitor : IObjectGraphVisitor<IEmitter>
{
	private readonly IObjectGraphVisitor<IEmitter> nextVisitor;

	protected ChainedObjectGraphVisitor(IObjectGraphVisitor<IEmitter> nextVisitor)
	{
		this.nextVisitor = nextVisitor;
	}

	public virtual bool Enter(IObjectDescriptor value, IEmitter context)
	{
		return nextVisitor.Enter(value, context);
	}

	public virtual bool EnterMapping(IObjectDescriptor key, IObjectDescriptor value, IEmitter context)
	{
		return nextVisitor.EnterMapping(key, value, context);
	}

	public virtual bool EnterMapping(IPropertyDescriptor key, IObjectDescriptor value, IEmitter context)
	{
		return nextVisitor.EnterMapping(key, value, context);
	}

	public virtual void VisitScalar(IObjectDescriptor scalar, IEmitter context)
	{
		nextVisitor.VisitScalar(scalar, context);
	}

	public virtual void VisitMappingStart(IObjectDescriptor mapping, Type keyType, Type valueType, IEmitter context)
	{
		nextVisitor.VisitMappingStart(mapping, keyType, valueType, context);
	}

	public virtual void VisitMappingEnd(IObjectDescriptor mapping, IEmitter context)
	{
		nextVisitor.VisitMappingEnd(mapping, context);
	}

	public virtual void VisitSequenceStart(IObjectDescriptor sequence, Type elementType, IEmitter context)
	{
		nextVisitor.VisitSequenceStart(sequence, elementType, context);
	}

	public virtual void VisitSequenceEnd(IObjectDescriptor sequence, IEmitter context)
	{
		nextVisitor.VisitSequenceEnd(sequence, context);
	}
}
