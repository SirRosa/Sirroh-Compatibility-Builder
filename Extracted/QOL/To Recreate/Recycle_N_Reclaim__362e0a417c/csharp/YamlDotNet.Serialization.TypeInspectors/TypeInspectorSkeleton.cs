using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.Serialization;

namespace YamlDotNet.Serialization.TypeInspectors;

internal abstract class TypeInspectorSkeleton : ITypeInspector
{
	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public abstract IEnumerable<IPropertyDescriptor> GetProperties(Type type, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object container);

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public IPropertyDescriptor GetProperty(Type type, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object container, string name, [MaybeNullWhen(true)] bool ignoreUnmatched)
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
