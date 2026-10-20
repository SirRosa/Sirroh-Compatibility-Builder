using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.Utilities;

internal sealed class SerializerState : IDisposable
{
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(1)]
	private readonly IDictionary<Type, object> items = new Dictionary<Type, object>();

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
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
