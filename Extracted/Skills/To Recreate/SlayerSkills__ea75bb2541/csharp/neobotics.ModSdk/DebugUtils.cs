using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using UnityEngine;

namespace neobotics.ModSdk;

internal class DebugUtils
{
	internal static void ObjectInspector(object o)
	{
		if (o == null)
		{
			Debug.Log((object)"Object is null");
			return;
		}
		BindingFlags bindingAttr = BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic;
		Type type = o.GetType();
		Debug.Log((object)("Object: " + o.ToString() + " Type " + type.Name));
		PropertyInfo[] properties = type.GetProperties(bindingAttr);
		foreach (PropertyInfo propertyInfo in properties)
		{
			if (propertyInfo.CanRead)
			{
				Debug.Log((object)$"Property: {type.Name}.{propertyInfo.Name} = {propertyInfo.GetValue(o)}");
				continue;
			}
			Debug.Log((object)("Property: " + type.Name + "." + propertyInfo.Name + " is write-only"));
		}
		FieldInfo[] fields = type.GetFields(bindingAttr);
		foreach (FieldInfo field in fields)
		{
			FieldPrinter(o, type, field);
		}
	}

	internal static void MethodInspector(object o)
	{
		if (o == null)
		{
			Debug.Log((object)"Object is null");
			return;
		}
		BindingFlags bindingAttr = BindingFlags.Instance | BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic;
		Type type = o.GetType();
		Debug.Log((object)("Method: " + o.ToString() + " Type " + type.Name));
		MethodInfo[] methods = type.GetMethods(bindingAttr);
		foreach (MethodInfo methodInfo in methods)
		{
			methodInfo.GetParameters();
			string arg = string.Join(", ", (from x in methodInfo.GetParameters()
				select x.ParameterType?.ToString() + " " + x.Name).ToArray());
			Debug.Log((object)$"{methodInfo.ReturnType} {methodInfo.Name} ({arg})");
		}
	}

	private static void ItemDataInspector(ItemData item)
	{
		ObjectInspector(item);
		ObjectInspector(item?.m_shared);
	}

	private static void FieldPrinter(object o, Type t, FieldInfo field)
	{
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Expected Obj, but got Unknown
		//IL_0077: Unknown result type (might be due to invalid IL or missing references)
		//IL_007d: Expected Obj, but got Unknown
		//IL_00ed: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f3: Expected Obj, but got Unknown
		try
		{
			if (field.FieldType == typeof(ItemData))
			{
				ItemData val = (ItemData)field.GetValue(o);
				if (val != null)
				{
					ItemDataInspector(val);
				}
				else
				{
					Debug.Log((object)$"{t.Name}.{field.Name} = {field.GetValue(o)} [null]");
				}
			}
			else if (field.FieldType == typeof(Transform))
			{
				Transform val2 = (Transform)field.GetValue(o);
				if ((Object)(object)val2 != (Object)null)
				{
					Debug.Log((object)("\tTransform.parent = " + ((Object)val2.parent).name));
				}
				else
				{
					Debug.Log((object)$"{t.Name}.{field.Name} = {field.GetValue(o)} [null]");
				}
			}
			else if (field.FieldType == typeof(EffectList))
			{
				EffectList val3 = (EffectList)field.GetValue(o);
				if (val3 != null)
				{
					Debug.Log((object)$"{t.Name}.{field.Name} = {field.GetValue(o)}:");
					EffectData[] effectPrefabs = val3.m_effectPrefabs;
					foreach (EffectData val4 in effectPrefabs)
					{
						Debug.Log((object)("\tEffectData.m_prefab = " + ((Object)val4.m_prefab).name));
					}
				}
				else
				{
					Debug.Log((object)$"{t.Name}.{field.Name} = {field.GetValue(o)} [null]");
				}
			}
			else
			{
				Debug.Log((object)$"{t.Name}.{field.Name} = {field.GetValue(o)}");
			}
		}
		catch (Exception)
		{
			Debug.Log((object)("Exception accessing " + t?.Name + "." + field?.Name));
		}
	}

	internal static void GameObjectInspector(GameObject go)
	{
		if ((Object)(object)go == (Object)null)
		{
			Debug.Log((object)"\n\nGame Object is null");
			return;
		}
		Debug.Log((object)("\n\nInspecting GameObject " + ((Object)go).name));
		ObjectInspector(go);
		Component[] componentsInChildren = go.GetComponentsInChildren<Component>();
		if (componentsInChildren.Length == 0)
		{
			return;
		}
		Component[] array = componentsInChildren;
		foreach (Component c in array)
		{
			try
			{
				ComponentInspector(c);
			}
			catch (Exception)
			{
			}
		}
	}

	internal static void PrintList<T>(List<T> l)
	{
		foreach (T item in l)
		{
			Debug.Log((object)item.ToString());
		}
	}

	internal static void ComponentInspector(Component c)
	{
		string obj = ((c != null) ? ((Object)c).name : null);
		object obj2;
		if (c == null)
		{
			obj2 = null;
		}
		else
		{
			Transform transform = c.transform;
			if (transform == null)
			{
				obj2 = null;
			}
			else
			{
				Transform parent = transform.parent;
				obj2 = ((parent != null) ? ((Object)parent).name : null);
			}
		}
		Debug.Log((object)("\n\nInspecting Component " + obj + " with parent " + (string?)obj2));
		ObjectInspector(c);
	}

	internal static void EffectsInspector(EffectList e)
	{
		EffectData[] effectPrefabs = e.m_effectPrefabs;
		Debug.Log((object)$"Effect list has effects {e.HasEffects()} count {effectPrefabs.Length}");
		EffectData[] array = effectPrefabs;
		foreach (EffectData val in array)
		{
			Debug.Log((object)$"Effect Data {val} prefab name {((Object)val.m_prefab).name} prefab GameObject name {((Object)val.m_prefab.gameObject).name}");
		}
	}

	internal static void PrintInventory()
	{
		foreach (ItemData allItem in ((Humanoid)Player.m_localPlayer).GetInventory().GetAllItems())
		{
			Debug.Log((object)allItem.m_shared.m_name);
		}
	}

	internal static void PrintAllObjects()
	{
		ZNetScene.instance.m_prefabs.ForEach((GameObject x) =>
		{
			Debug.Log((object)("GameObject " + ((Object)x).name));
		});
	}

	internal static void PrintAllCharacters()
	{
		Character.GetAllCharacters().ForEach((Character x) =>
		{
			Debug.Log((object)("Character " + ((Object)x).name));
		});
	}

	internal static void PrintAllLayers()
	{
		string[] array = (from index in Enumerable.Range(0, 31)
			select LayerMask.LayerToName(index) into l
			where !string.IsNullOrEmpty(l)
			select l).ToArray();
		foreach (string text in array)
		{
			Debug.Log((object)("Layer " + text + " " + Convert.ToString(LayerMask.NameToLayer(text), 2).PadLeft(32, '0')));
		}
	}
}
