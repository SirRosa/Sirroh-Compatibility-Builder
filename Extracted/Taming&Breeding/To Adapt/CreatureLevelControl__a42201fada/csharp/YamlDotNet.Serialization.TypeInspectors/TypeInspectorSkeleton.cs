using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.Serialization;

namespace YamlDotNet.Serialization.TypeInspectors;

internal abstract class TypeInspectorSkeleton : ITypeInspector
{
	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	public abstract IEnumerable<IPropertyDescriptor> GetProperties(Type type, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object container);

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	public IPropertyDescriptor GetProperty(Type type, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object container, string name, [MaybeNullWhen(true)] bool ignoreUnmatched)
	{
		IEnumerable<IPropertyDescriptor> enumerable = from p in GetProperties(type, container)
			where p.Name == name
			select p;
		using IEnumerator<IPropertyDescriptor> enumerator = enumerable.GetEnumerator();
		if (!enumerator.MoveNext())
		{
			if (ignoreUnmatched)
			{
				return null;
			}
			throw new SerializationException("Property '" + name + "' not found on type '" + type.FullName + "'.");
		}
		IPropertyDescriptor current = enumerator.Current;
		if (enumerator.MoveNext())
		{
			throw new SerializationException("Multiple properties with the name/alias '" + name + "' already exists on type '" + type.FullName + "', maybe you're misusing YamlAlias or maybe you are using the wrong naming convention? The matching properties are: " + string.Join(", ", enumerable.Select((IPropertyDescriptor p) => p.Name).ToArray()));
		}
		return current;
	}
}
