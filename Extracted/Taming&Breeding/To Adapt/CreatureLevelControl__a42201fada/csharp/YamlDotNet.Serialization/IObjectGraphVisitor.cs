using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal interface IObjectGraphVisitor<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] TContext>
{
	bool Enter(IObjectDescriptor value, TContext context);

	bool EnterMapping(IObjectDescriptor key, IObjectDescriptor value, TContext context);

	bool EnterMapping(IPropertyDescriptor key, IObjectDescriptor value, TContext context);

	void VisitScalar(IObjectDescriptor scalar, TContext context);

	void VisitMappingStart(IObjectDescriptor mapping, Type keyType, Type valueType, TContext context);

	void VisitMappingEnd(IObjectDescriptor mapping, TContext context);

	void VisitSequenceStart(IObjectDescriptor sequence, Type elementType, TContext context);

	void VisitSequenceEnd(IObjectDescriptor sequence, TContext context);
}
