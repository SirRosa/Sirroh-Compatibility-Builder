using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class NamingConventionTypeInspector : TypeInspectorSkeleton
{
	private readonly ITypeInspector innerTypeDescriptor;

	private readonly INamingConvention namingConvention;

	public NamingConventionTypeInspector(ITypeInspector innerTypeDescriptor, INamingConvention namingConvention)
	{
		this.innerTypeDescriptor = innerTypeDescriptor ?? throw new ArgumentNullException("innerTypeDescriptor");
		this.namingConvention = namingConvention ?? throw new ArgumentNullException("namingConvention");
	}

	public override IEnumerable<IPropertyDescriptor> GetProperties(Type type, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object container)
	{
		return innerTypeDescriptor.GetProperties(type, container).Select([_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (IPropertyDescriptor p) =>
		{
			YamlMemberAttribute customAttribute = p.GetCustomAttribute<YamlMemberAttribute>();
			return (customAttribute != null && !customAttribute.ApplyNamingConventions) ? p : new PropertyDescriptor(p)
			{
				Name = namingConvention.Apply(p.Name)
			};
		});
	}
}
