using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
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

	public override IEnumerable<IPropertyDescriptor> GetProperties(Type type, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object container)
	{
		return typeInspectors.SelectMany([_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)] (ITypeInspector i) => i.GetProperties(type, container));
	}
}
