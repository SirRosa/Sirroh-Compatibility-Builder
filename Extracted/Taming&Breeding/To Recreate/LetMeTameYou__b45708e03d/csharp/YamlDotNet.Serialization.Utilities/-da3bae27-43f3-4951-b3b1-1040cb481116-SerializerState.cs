using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.Utilities;

internal sealed class _003Cda3bae27_002D43f3_002D4951_002Db3b1_002D1040cb481116_003ESerializerState : IDisposable
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(1)]
	private readonly Dictionary<Type, object> items = new Dictionary<Type, object>();

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
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
		foreach (_003C6971e000_002Dcc4f_002D4cc3_002D9ada_002Da4855b120d57_003EIPostDeserializationCallback item in items.Values.OfType<_003C6971e000_002Dcc4f_002D4cc3_002D9ada_002Da4855b120d57_003EIPostDeserializationCallback>())
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
