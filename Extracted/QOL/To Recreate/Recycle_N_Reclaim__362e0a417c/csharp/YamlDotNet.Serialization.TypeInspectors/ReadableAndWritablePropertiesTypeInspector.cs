using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class ReadableAndWritablePropertiesTypeInspector : TypeInspectorSkeleton
{
	private readonly ITypeInspector innerTypeDescriptor;

	public ReadableAndWritablePropertiesTypeInspector(ITypeInspector innerTypeDescriptor)
	{
		this.innerTypeDescriptor = innerTypeDescriptor ?? throw new ArgumentNullException("innerTypeDescriptor");
	}

	public override IEnumerable<IPropertyDescriptor> GetProperties(Type type, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object container)
	{
		return from p in innerTypeDescriptor.GetProperties(type, container)
			where p.CanWrite
			select p;
	}
}
