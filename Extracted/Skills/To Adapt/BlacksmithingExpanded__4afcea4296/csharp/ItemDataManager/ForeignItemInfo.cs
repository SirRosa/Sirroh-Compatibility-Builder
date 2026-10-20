using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using JetBrains.Annotations;

namespace ItemDataManager;

[PublicAPI]
public class ForeignItemInfo : IEnumerable<object>, IEnumerable
{
	private readonly object foreignItemInfo;

	public string Mod => ((string)foreignItemInfo.GetType().GetProperty("Mod")?.GetValue(foreignItemInfo)) ?? "";

	public ItemData ItemData { get; private set; }

	public string? this[string key]
	{
		get
		{
			object obj = foreignItemInfo.GetType().InvokeMember("Item", BindingFlags.Instance | BindingFlags.Public | BindingFlags.GetProperty, null, foreignItemInfo, new object[1] { key });
			if (obj != null)
			{
				return (string)obj.GetType().GetProperty("Value")?.GetValue(obj);
			}
			return null;
		}
		set
		{
			foreignItemInfo.GetType().GetMethod("set_Item", BindingFlags.Instance | BindingFlags.Public)?.Invoke(foreignItemInfo, new object[2] { key, value });
		}
	}

	internal ForeignItemInfo(ItemData itemData, object foreignItemInfo)
	{
		ItemData = itemData;
		this.foreignItemInfo = foreignItemInfo;
	}

	public T GetOrCreate<T>(string key = "") where T : class, new()
	{
		return Add<T>(key) ?? Get<T>(key);
	}

	private object? call(string name, object?[] values, Type?[] args, Type? generic = null)
	{
		MethodInfo[] methods = foreignItemInfo.GetType().GetMethods();
		foreach (MethodInfo methodInfo in methods)
		{
			if (methodInfo.Name == name && (from p in methodInfo.GetParameters()
				select p.ParameterType.IsGenericParameter ? null : p.ParameterType).SequenceEqual(args) && (object)generic != null == methodInfo.IsGenericMethod)
			{
				MethodInfo methodInfo2 = methodInfo;
				if ((object)generic != null)
				{
					methodInfo2 = methodInfo2.MakeGenericMethod(generic);
				}
				return methodInfo2.Invoke(foreignItemInfo, values);
			}
		}
		return null;
	}

	public T? Add<T>(string key = "") where T : class, new()
	{
		return call("Add", new object[1] { key }, new Type[1] { typeof(string) }, typeof(T)) as T;
	}

	public T? Get<T>(string key = "") where T : class
	{
		return call("Get", new object[1] { key }, new Type[1] { typeof(string) }, typeof(T)) as T;
	}

	public Dictionary<string, T> GetAll<T>() where T : class
	{
		return ((call("GetAll", Array.Empty<object>(), Array.Empty<Type>(), typeof(T)) as T) as Dictionary<string, T>) ?? new Dictionary<string, T>();
	}

	public bool Remove(string key = "")
	{
		return call("Add", new object[1] { key }, new Type[1] { typeof(string) }) as bool? == true;
	}

	public bool Remove<T>(string key = "") where T : class
	{
		return call("Remove", new object[1] { key }, new Type[1] { typeof(string) }, typeof(T)) as bool? == true;
	}

	public bool Remove<T>(T itemData) where T : class
	{
		return call("Remove", new object[1] { itemData }, new Type[1], typeof(T)) as bool? == true;
	}

	public void Save()
	{
		call("Save", Array.Empty<object>(), Array.Empty<Type>());
	}

	public void LoadAll()
	{
		call("LoadAll", Array.Empty<object>(), Array.Empty<Type>());
	}

	public IEnumerator<object> GetEnumerator()
	{
		return (IEnumerator<object>)((call("GetEnumerator", Array.Empty<object>(), Array.Empty<Type>()) as IEnumerator<object>) ?? ((object)new List<object>().GetEnumerator()));
	}

	IEnumerator IEnumerable.GetEnumerator()
	{
		return GetEnumerator();
	}
}
