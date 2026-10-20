using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class CompositeTypeInspector : TypeInspectorSkeleton
{
	private readonly IEnumerable<ITypeInspector> typeInspectors;

	public CompositeTypeInspector(params ITypeInspector[] typeInspectors)
		: this((IEnumerable<ITypeInspector>)typeInspectors)
	{
	}

	public CompositeTypeInspector(IEnumerable<ITypeInspector> typeInspectors)
	{
		this.typeInspectors = typeInspectors?.ToList() ?? throw new ArgumentNullException("typeInspectors");
	}

	public override IEnumerable<IPropertyDescriptor> GetProperties(Type type, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object container)
	{
		return typeInspectors.SelectMany([_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (ITypeInspector i) => i.GetProperties(type, container));
	}
}
