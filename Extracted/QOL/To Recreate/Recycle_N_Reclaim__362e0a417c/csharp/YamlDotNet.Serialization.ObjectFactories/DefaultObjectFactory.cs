using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.ObjectFactories;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class DefaultObjectFactory : ObjectFactoryBase
{
	private readonly Dictionary<Type, Type> DefaultGenericInterfaceImplementations = new Dictionary<Type, Type>
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

	private readonly Dictionary<Type, Type> DefaultNonGenericInterfaceImplementations = new Dictionary<Type, Type>
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

	private readonly Settings settings;

	public DefaultObjectFactory()
		: this(new Dictionary<Type, Type>(), new Settings())
	{
	}

	public DefaultObjectFactory(IDictionary<Type, Type> mappings)
		: this(mappings, new Settings())
	{
	}

	public DefaultObjectFactory(IDictionary<Type, Type> mappings, Settings settings)
	{
		foreach (KeyValuePair<Type, Type> mapping in mappings)
		{
			if (!mapping.Key.IsAssignableFrom(mapping.Value))
			{
				throw new InvalidOperationException($"Type '{mapping.Value}' does not implement type '{mapping.Key}'.");
			}
			DefaultNonGenericInterfaceImplementations.Add(mapping.Key, mapping.Value);
		}
		this.settings = settings;
	}

	public override object Create(Type type)
	{
		if (type.IsInterface())
		{
			Type value2;
			if (type.IsGenericType())
			{
				if (DefaultGenericInterfaceImplementations.TryGetValue(type.GetGenericTypeDefinition(), out var value))
				{
					type = value.MakeGenericType(type.GetGenericArguments());
				}
			}
			else if (DefaultNonGenericInterfaceImplementations.TryGetValue(type, out value2))
			{
				type = value2;
			}
		}
		try
		{
			return Activator.CreateInstance(type, settings.AllowPrivateConstructors);
		}
		catch (Exception innerException)
		{
			throw new InvalidOperationException("Failed to create an instance of type '" + type.FullName + "'.", innerException);
		}
	}
}
