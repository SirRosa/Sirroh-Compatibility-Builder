using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.ObjectFactories;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class DefaultObjectFactory : IObjectFactory
{
	private static readonly Dictionary<Type, Type> defaultGenericInterfaceImplementations = new Dictionary<Type, Type>
	{
		{
			typeof(IEnumerable<>),
			typeof(List<>)
		},
		{
			typeof(ICollection<>),
			typeof(List<>)
		},
		{
			typeof(IList<>),
			typeof(List<>)
		},
		{
			typeof(IDictionary<, >),
			typeof(Dictionary<, >)
		}
	};

	private static readonly Dictionary<Type, Type> defaultNonGenericInterfaceImplementations = new Dictionary<Type, Type>
	{
		{
			typeof(IEnumerable),
			typeof(List<object>)
		},
		{
			typeof(ICollection),
			typeof(List<object>)
		},
		{
			typeof(IList),
			typeof(List<object>)
		},
		{
			typeof(IDictionary),
			typeof(Dictionary<object, object>)
		}
	};

	public object Create(Type type)
	{
		if (type.IsInterface())
		{
			Type value2;
			if (type.IsGenericType())
			{
				if (defaultGenericInterfaceImplementations.TryGetValue(type.GetGenericTypeDefinition(), out var value))
				{
					type = value.MakeGenericType(type.GetGenericArguments());
				}
			}
			else if (defaultNonGenericInterfaceImplementations.TryGetValue(type, out value2))
			{
				type = value2;
			}
		}
		try
		{
			return Activator.CreateInstance(type);
		}
		catch (Exception innerException)
		{
			throw new InvalidOperationException("Failed to create an instance of type '" + type.FullName + "'.", innerException);
		}
	}
}
