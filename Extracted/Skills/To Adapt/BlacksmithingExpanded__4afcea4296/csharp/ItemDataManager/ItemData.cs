using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.Serialization;
using System.Text;
using HarmonyLib;
using JetBrains.Annotations;
using UnityEngine;

namespace ItemDataManager;

[PublicAPI]
public abstract class ItemData
{
	internal static WeakReference<ItemInfo> constructingInfo = null;

	internal WeakReference<ItemInfo>? info;

	private static readonly FieldInfo parameterInfoClassImpl = AccessTools.DeclaredField(typeof(ParameterInfo), "ClassImpl");

	private static Dictionary<Type, Dictionary<string, FieldInfo>> serializedFields = new Dictionary<Type, Dictionary<string, FieldInfo>>();

	public string CustomDataKey { get; internal set; } = null;

	protected virtual bool AllowStackingIdenticalValues { get; set; } = false;

	public string Value
	{
		get
		{
			string value;
			return Item.m_customData.TryGetValue(CustomDataKey, out value) ? value : "";
		}
		set
		{
			Item.m_customData[CustomDataKey] = value;
		}
	}

	public string Key { get; internal set; } = null;

	public bool IsCloned => Info.isCloned.Contains(CustomDataKey);

	public bool IsAlive
	{
		get
		{
			ItemInfo target;
			return (info ?? constructingInfo).TryGetTarget(out target);
		}
	}

	public ItemData Item => Info.ItemData;

	public ItemInfo Info
	{
		get
		{
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Expected Obj, but got Unknown
			ItemInfo target;
			return (info ?? constructingInfo).TryGetTarget(out target) ? target : new ItemInfo(new ItemData());
		}
	}

	public virtual void FirstLoad()
	{
	}

	public virtual void Load()
	{
		//IL_0098: Unknown result type (might be due to invalid IL or missing references)
		//IL_009f: Expected Obj, but got Unknown
		Dictionary<string, FieldInfo> dictionary = fetchSerializedFields();
		if (dictionary == null || dictionary.Count <= 0 || Value == "")
		{
			return;
		}
		List<object> list = new List<object>();
		string[] array = Value.Split(new char[1] { '|' });
		foreach (string text in array)
		{
			string[] array2 = text.Split(new char[1] { ':' });
			if (array2.Length == 2 && dictionary.TryGetValue(array2[0], out var value))
			{
				ZPackage val = new ZPackage(array2[1]);
				ParameterInfo parameterInfo = (ParameterInfo)FormatterServices.GetUninitializedObject(typeof(ParameterInfo));
				parameterInfoClassImpl.SetValue(parameterInfo, value.FieldType);
				list.Clear();
				ZRpc.Deserialize(new ParameterInfo[2] { null, parameterInfo }, val, ref list);
				if (list.Count > 0)
				{
					value.SetValue(this, list[0]);
				}
			}
		}
	}

	public virtual void Save()
	{
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_004a: Expected Obj, but got Unknown
		Dictionary<string, FieldInfo> dictionary = fetchSerializedFields();
		if (dictionary == null || dictionary.Count <= 0)
		{
			return;
		}
		StringBuilder stringBuilder = new StringBuilder();
		foreach (FieldInfo value in dictionary.Values)
		{
			ZPackage val = new ZPackage();
			ZRpc.Serialize(new object[1] { value.GetValue(this) }, ref val);
			stringBuilder.Append(value.Name);
			stringBuilder.Append(':');
			stringBuilder.Append(val.GetBase64());
			stringBuilder.Append('|');
		}
		int length = stringBuilder.Length - 1;
		stringBuilder.Length = length;
		Value = stringBuilder.ToString();
	}

	public virtual void Unload()
	{
	}

	public virtual void Upgraded()
	{
	}

	public virtual string? TryStack(ItemData? data)
	{
		return (AllowStackingIdenticalValues && data?.Value == Value) ? Value : null;
	}

	private Dictionary<string, FieldInfo> fetchSerializedFields()
	{
		Type type = GetType();
		if (serializedFields.TryGetValue(type, out var value))
		{
			return value;
		}
		return serializedFields[type] = (from f in type.GetFields(BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic)
			where f.GetCustomAttributes(typeof(SerializeField), inherit: true).Length != 0
			select f).ToDictionary((FieldInfo f) => f.Name, (FieldInfo f) => f);
	}
}
