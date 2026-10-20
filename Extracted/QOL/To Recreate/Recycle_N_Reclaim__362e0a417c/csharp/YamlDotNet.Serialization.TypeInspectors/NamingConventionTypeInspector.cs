using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class NamingConventionTypeInspector : TypeInspectorSkeleton
{
	private readonly ITypeInspector innerTypeDescriptor;

	private readonly INamingConvention namingConvention;

	public NamingConventionTypeInspector(ITypeInspector innerTypeDescriptor, INamingConvention namingConvention)
	{
		this.innerTypeDescriptor = innerTypeDescriptor ?? throw new ArgumentNullException("innerTypeDescriptor");
		this.namingConvention = namingConvention ?? throw new ArgumentNullException("namingConvention");
	}

	public override IEnumerable<IPropertyDescriptor> GetProperties(Type type, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object container)
	{
		return innerTypeDescriptor.GetProperties(type, container).Select([_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)] (IPropertyDescriptor p) =>
		{
			YamlMemberAttribute customAttribute = p.GetCustomAttribute<YamlMemberAttribute>();
			return (customAttribute != null && !customAttribute.ApplyNamingConventions) ? p : new PropertyDescriptor(p)
			{
				Name = namingConvention.Apply(p.Name)
			};
		});
	}
}
