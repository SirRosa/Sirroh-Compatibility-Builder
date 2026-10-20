using System;
using System.Collections;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using YamlDotNet.Serialization.Callbacks;

namespace YamlDotNet.Serialization.ObjectFactories;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal class _003C479a382a_002D2155_002D49cf_002Da593_002D58e1078158d9_003EDefaultObjectFactory : ObjectFactoryBase
{
	private readonly Dictionary<Type, ConcurrentDictionary<Type, MethodInfo[]>> stateMethods = new Dictionary<Type, ConcurrentDictionary<Type, MethodInfo[]>>
	{
		{
			typeof(OnDeserializedAttribute),
			new ConcurrentDictionary<Type, MethodInfo[]>()
		},
		{
			typeof(OnDeserializingAttribute),
			new ConcurrentDictionary<Type, MethodInfo[]>()
		},
		{
			typeof(OnSerializedAttribute),
			new ConcurrentDictionary<Type, MethodInfo[]>()
		},
		{
			typeof(OnSerializingAttribute),
			new ConcurrentDictionary<Type, MethodInfo[]>()
		}
	};

	private readonly Dictionary<Type, Type> defaultGenericInterfaceImplementations = new Dictionary<Type, Type>
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

	private readonly Dictionary<Type, Type> defaultNonGenericInterfaceImplementations = new Dictionary<Type, Type>
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

	public _003C479a382a_002D2155_002D49cf_002Da593_002D58e1078158d9_003EDefaultObjectFactory()
		: this(new Dictionary<Type, Type>(), new Settings())
	{
	}

	public _003C479a382a_002D2155_002D49cf_002Da593_002D58e1078158d9_003EDefaultObjectFactory(IDictionary<Type, Type> mappings)
		: this(mappings, new Settings())
	{
	}

	public _003C479a382a_002D2155_002D49cf_002Da593_002D58e1078158d9_003EDefaultObjectFactory(IDictionary<Type, Type> mappings, Settings settings)
	{
		foreach (KeyValuePair<Type, Type> mapping in mappings)
		{
			if (!mapping.Key.IsAssignableFrom(mapping.Value))
			{
				throw new InvalidOperationException($"Type '{mapping.Value}' does not implement type '{mapping.Key}'.");
			}
			defaultNonGenericInterfaceImplementations.Add(mapping.Key, mapping.Value);
		}
		this.settings = settings;
	}

	public override object Create(Type type)
	{
		if (_003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.IsInterface(type))
		{
			Type value2;
			if (_003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.IsGenericType(type))
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
			return Activator.CreateInstance(type, settings.AllowPrivateConstructors);
		}
		catch (Exception innerException)
		{
			string message = "Failed to create an instance of type '" + type.FullName + "'.";
			throw new InvalidOperationException(message, innerException);
		}
	}

	public override void ExecuteOnDeserialized(object value)
	{
		ExecuteState(typeof(OnDeserializedAttribute), value);
	}

	public override void ExecuteOnDeserializing(object value)
	{
		ExecuteState(typeof(OnDeserializingAttribute), value);
	}

	public override void ExecuteOnSerialized(object value)
	{
		ExecuteState(typeof(OnSerializedAttribute), value);
	}

	public override void ExecuteOnSerializing(object value)
	{
		ExecuteState(typeof(OnSerializingAttribute), value);
	}

	private void ExecuteState(Type attributeType, object value)
	{
		if (value != null)
		{
			Type type = value.GetType();
			MethodInfo[] array = GetStateMethods(attributeType, type);
			MethodInfo[] array2 = array;
			foreach (MethodInfo methodInfo in array2)
			{
				methodInfo.Invoke(value, null);
			}
		}
	}

	private MethodInfo[] GetStateMethods(Type attributeType, Type valueType)
	{
		ConcurrentDictionary<Type, MethodInfo[]> concurrentDictionary = stateMethods[attributeType];
		return concurrentDictionary.GetOrAdd(valueType, (Type type) =>
		{
			MethodInfo[] methods = type.GetMethods(BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
			return methods.Where([_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (MethodInfo x) => x.GetCustomAttributes(attributeType, inherit: true).Length != 0).ToArray();
		});
	}
}
