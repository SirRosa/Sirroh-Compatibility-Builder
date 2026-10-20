using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal interface IObjectGraphVisitor<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] TContext>
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
