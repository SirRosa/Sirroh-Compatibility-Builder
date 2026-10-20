using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Serialization.TypeInspectors;

namespace YamlDotNet.Serialization;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class YamlAttributesTypeInspector : TypeInspectorSkeleton
{
	private readonly ITypeInspector innerTypeDescriptor;

	public YamlAttributesTypeInspector(ITypeInspector innerTypeDescriptor)
	{
		this.innerTypeDescriptor = innerTypeDescriptor;
	}

	public override IEnumerable<IPropertyDescriptor> GetProperties(Type type, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object container)
	{
		return from p in (from p in innerTypeDescriptor.GetProperties(type, container)
				where p.GetCustomAttribute<YamlIgnoreAttribute>() == null
				select p).Select((Func<IPropertyDescriptor, IPropertyDescriptor>)([_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (IPropertyDescriptor p) =>
			{
				PropertyDescriptor propertyDescriptor = new PropertyDescriptor(p);
				YamlMemberAttribute customAttribute = p.GetCustomAttribute<YamlMemberAttribute>();
				if (customAttribute != null)
				{
					if (customAttribute.SerializeAs != null)
					{
						propertyDescriptor.TypeOverride = customAttribute.SerializeAs;
					}
					propertyDescriptor.Order = customAttribute.Order;
					propertyDescriptor.ScalarStyle = customAttribute.ScalarStyle;
					if (customAttribute.Alias != null)
					{
						propertyDescriptor.Name = customAttribute.Alias;
					}
				}
				return propertyDescriptor;
			}))
			orderby p.Order
			select p;
	}
}
