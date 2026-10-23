using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.Serialization;
using System.Text;
using HarmonyLib;
using JetBrains.Annotations;
using UnityEngine;

namespace ItemDataManager;

[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[PublicAPI]
[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
public abstract class ItemData
{
	internal static WeakReference<_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo> constructingInfo = null;

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(new byte[] { 2, 1 })]
	internal WeakReference<_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo> info;

	private static readonly FieldInfo parameterInfoClassImpl = AccessTools.DeclaredField(typeof(ParameterInfo), "ClassImpl");

	private static Dictionary<Type, Dictionary<string, FieldInfo>> serializedFields = new Dictionary<Type, Dictionary<string, FieldInfo>>();

	public string CustomDataKey { get; internal set; }

	protected virtual bool AllowStackingIdenticalValues { get; set; }

	public string Value
	{
		get
		{
			if (!Item.m_customData.TryGetValue(CustomDataKey, out var value))
			{
				return "";
			}
			return value;
		}
		set
		{
			Item.m_customData[CustomDataKey] = value;
		}
	}

	public string Key { get; internal set; }

	public bool IsCloned => Info.isCloned.Contains(CustomDataKey);

	public bool IsAlive
	{
		get
		{
			_003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo target;
			return (info ?? constructingInfo).TryGetTarget(out target);
		}
	}

	public ItemData Item => Info.ItemData;

	public _003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo Info
	{
		get
		{
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_0022: Expected Obj, but got Unknown
			if (!(info ?? constructingInfo).TryGetTarget(out var target))
			{
				return new _003C27135a16_002D41db_002D418a_002Dafd2_002D7267dbe18137_003EItemInfo(new ItemData());
			}
			return target;
		}
	}

	public virtual void FirstLoad()
	{
	}

	public virtual void Load()
	{
		//IL_0078: Unknown result type (might be due to invalid IL or missing references)
		//IL_007f: Expected Obj, but got Unknown
		Dictionary<string, FieldInfo> dictionary = fetchSerializedFields();
		if (dictionary == null || dictionary.Count <= 0 || Value == "")
		{
			return;
		}
		List<object> list = new List<object>();
		string[] array = Value.Split(new char[1] { '|' });
		for (int i = 0; i < array.Length; i++)
		{
			string[] array2 = array[i].Split(new char[1] { ':' });
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
		//IL_0030: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Expected Obj, but got Unknown
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

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(2)]
	public virtual string TryStack(ItemData data)
	{
		if (!AllowStackingIdenticalValues || !(data?.Value == Value))
		{
			return null;
		}
		return Value;
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
			select f).ToDictionary([_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (FieldInfo f) => f.Name, [_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(0)] (FieldInfo f) => f);
	}
}
