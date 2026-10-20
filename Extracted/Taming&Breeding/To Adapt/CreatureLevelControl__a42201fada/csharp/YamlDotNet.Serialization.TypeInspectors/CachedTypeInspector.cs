using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class CachedTypeInspector : TypeInspectorSkeleton
{
	private readonly ITypeInspector innerTypeDescriptor;

	private readonly ConcurrentDictionary<Type, List<IPropertyDescriptor>> cache = new ConcurrentDictionary<Type, List<IPropertyDescriptor>>();

	public CachedTypeInspector(ITypeInspector innerTypeDescriptor)
	{
		this.innerTypeDescriptor = innerTypeDescriptor ?? throw new ArgumentNullException("innerTypeDescriptor");
	}

	public override IEnumerable<IPropertyDescriptor> GetProperties(Type type, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object container)
	{
		return cache.GetOrAdd(type, (Type t) => innerTypeDescriptor.GetProperties(t, container).ToList());
	}
}
