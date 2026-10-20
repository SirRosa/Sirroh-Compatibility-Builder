using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.Utilities;

internal sealed class SerializerState : IDisposable
{
	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(1)]
	private readonly IDictionary<Type, object> items = new Dictionary<Type, object>();

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public T Get<T>() where T : class, new()
	{
		if (!items.TryGetValue(typeof(T), out var value))
		{
			value = new T();
			items.Add(typeof(T), value);
		}
		return (T)value;
	}

	public void OnDeserialization()
	{
		foreach (IPostDeserializationCallback item in items.Values.OfType<IPostDeserializationCallback>())
		{
			item.OnDeserialization();
		}
	}

	public void Dispose()
	{
		foreach (IDisposable item in items.Values.OfType<IDisposable>())
		{
			item.Dispose();
		}
	}
}
