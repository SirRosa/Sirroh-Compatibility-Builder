using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using JetBrains.Annotations;

namespace ItemDataManager;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[PublicAPI]
public class _003C3679b648_002D5ca3_002D43b3_002Da105_002D7e87d198b67d_003EForeignItemInfo : IEnumerable<object>, IEnumerable
{
	private readonly object foreignItemInfo;

	public string Mod => ((string)foreignItemInfo.GetType().GetProperty("Mod")?.GetValue(foreignItemInfo)) ?? "";

	public ItemData ItemData { get; private set; }

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	public string this[string key]
	{
		[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
		get
		{
			object obj = foreignItemInfo.GetType().InvokeMember("Item", BindingFlags.Instance | BindingFlags.Public | BindingFlags.GetProperty, null, foreignItemInfo, new object[1] { key });
			if (obj != null)
			{
				return (string)obj.GetType().GetProperty("Value")?.GetValue(obj);
			}
			return null;
		}
		[param: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
		set
		{
			foreignItemInfo.GetType().GetMethod("set_Item", BindingFlags.Instance | BindingFlags.Public)?.Invoke(foreignItemInfo, new object[2] { key, value });
		}
	}

	internal _003C3679b648_002D5ca3_002D43b3_002Da105_002D7e87d198b67d_003EForeignItemInfo(ItemData itemData, object foreignItemInfo)
	{
		ItemData = itemData;
		this.foreignItemInfo = foreignItemInfo;
	}

	public T GetOrCreate<T>(string key = "") where T : class, new()
	{
		return Add<T>(key) ?? Get<T>(key);
	}

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(2)]
	private object call([_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(1)] string name, [_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 1, 2 })] object[] values, [_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 1, 2 })] Type[] args, Type generic = null)
	{
		MethodInfo[] methods = foreignItemInfo.GetType().GetMethods();
		foreach (MethodInfo methodInfo in methods)
		{
			if (methodInfo.Name == name && (from p in methodInfo.GetParameters()
				select (!p.ParameterType.IsGenericParameter) ? p.ParameterType : null).SequenceEqual(args) && (object)generic != null == methodInfo.IsGenericMethod)
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

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	public T Add<T>(string key = "") where T : class, new()
	{
		return call("Add", new object[1] { key }, new Type[1] { typeof(string) }, typeof(T)) as T;
	}

	[return: _003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(2)]
	public T Get<T>(string key = "") where T : class
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
