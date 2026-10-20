using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using UnityEngine;

namespace LetMeTameYou;

public static class Utils
{
	public static AssetBundle LoadAssetBundle(string bundleName, Assembly assembly)
	{
		string text = null;
		try
		{
			text = assembly.GetManifestResourceNames().Single((string str) => str.EndsWith(bundleName));
		}
		catch
		{
		}
		if (text == null)
		{
			DBG.blogWarning("Could not find asset by the name " + bundleName);
			return null;
		}
		Stream manifestResourceStream = assembly.GetManifestResourceStream(text);
		AssetBundle result;
		using (manifestResourceStream)
		{
			result = AssetBundle.LoadFromStream(manifestResourceStream);
		}
		return result;
	}

	public static T CopyBroComponent<T, TU>(this Component comp, TU other) where T : Component
	{
		Type baseType = ((object)comp).GetType().BaseType;
		IEnumerable<FieldInfo> fields = baseType.GetFields();
		foreach (FieldInfo item in fields)
		{
			object value = item.GetValue(other);
			try
			{
				item.SetValue(comp, value);
			}
			catch
			{
				DBG.blogDebug("Failed bro copy for: " + item);
			}
		}
		return (T)(object)((comp is T) ? comp : null);
	}

	public static string GetPrefabName(string name)
	{
		int num = name.IndexOfAny(new char[2] { '(', ' ' });
		if (num != -1)
		{
			return name.Remove(num);
		}
		return name;
	}

	public static bool addToZNS(GameObject go)
	{
		ZNetScene instance = ZNetScene.instance;
		if (!Object.op_Implicit((Object)(object)instance))
		{
			return false;
		}
		int stableHashCode = StringExtensionMethods.GetStableHashCode(((Object)go).name);
		if (instance.m_namedPrefabs.ContainsKey(stableHashCode))
		{
			DBG.blogDebug("ZNS already has " + ((Object)go).name);
			return false;
		}
		if (Object.op_Implicit((Object)(object)go.GetComponent<ZNetView>()))
		{
			instance.m_prefabs.Add(go);
		}
		else
		{
			instance.m_nonNetViewPrefabs.Add(go);
		}
		instance.m_namedPrefabs.Add(stableHashCode, go);
		DBG.blogDebug("Added " + ((Object)go).name + " to zns");
		return true;
	}

	public static bool addItemToODB(GameObject go, ObjectDB odb)
	{
		int stableHashCode = StringExtensionMethods.GetStableHashCode(((Object)go).name);
		if ((Object)(object)go.GetComponent<ItemDrop>() == (Object)null)
		{
			DBG.blogDebug("Does not have ItemDrop: " + ((Object)go).name);
			return false;
		}
		if (odb.m_itemByHash.ContainsKey(stableHashCode))
		{
			DBG.blogDebug("Already added item " + ((Object)go).name);
			return false;
		}
		addToZNS(go);
		odb.m_items.Add(go);
		odb.m_itemByHash.Add(stableHashCode, go);
		return true;
	}

	public static void cloneProperties<TOne, TTwo>(TOne copyTo, TTwo CopyFrom) where TOne : Component where TTwo : Component
	{
		FieldInfo[] fields = ((object)CopyFrom).GetType().GetFields();
		foreach (FieldInfo fieldInfo in fields)
		{
			try
			{
				if ((fieldInfo.GetValue(copyTo) != null) & (fieldInfo.GetValue(CopyFrom) != fieldInfo.GetValue(copyTo)))
				{
					fieldInfo.SetValue(copyTo, fieldInfo.GetValue(CopyFrom));
					DBG.blogDebug("From " + ((object)CopyFrom).GetType()?.ToString() + fieldInfo.Name + " set to " + fieldInfo.GetValue(copyTo));
				}
			}
			catch
			{
				DBG.blogDebug(((object)copyTo).GetType()?.ToString() + " does not have " + fieldInfo.Name);
			}
		}
	}

	public static Color colFromHex(string hexStr)
	{
		//IL_00be: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ab: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ad: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c7: Unknown result type (might be due to invalid IL or missing references)
		try
		{
			DBG.blogDebug("in colfromhex");
			int num = int.Parse(hexStr.Replace("#", ""), NumberStyles.HexNumber);
			float num2 = num & 0xFF;
			float num3 = (num >> 8) & 0xFF;
			float num4 = (num >> 16) & 0xFF;
			DBG.blogDebug("r,g,b=" + num4 + "," + num3 + "," + num2);
			return new Color(num4 / 255f, num3 / 255f, num2 / 255f);
		}
		catch
		{
			DBG.blogWarning("Not a valid hex color code");
			return Color.white;
		}
	}

	public static Texture2D changeEggTex(Texture2D oldTex, Color col, bool invertShadow)
	{
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_007a: Unknown result type (might be due to invalid IL or missing references)
		//IL_007f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0167: Unknown result type (might be due to invalid IL or missing references)
		//IL_016c: Unknown result type (might be due to invalid IL or missing references)
		//IL_016e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0173: Unknown result type (might be due to invalid IL or missing references)
		//IL_0175: Unknown result type (might be due to invalid IL or missing references)
		//IL_0177: Unknown result type (might be due to invalid IL or missing references)
		//IL_0188: Unknown result type (might be due to invalid IL or missing references)
		//IL_0199: Unknown result type (might be due to invalid IL or missing references)
		//IL_01aa: Unknown result type (might be due to invalid IL or missing references)
		//IL_01af: Unknown result type (might be due to invalid IL or missing references)
		//IL_01b4: Unknown result type (might be due to invalid IL or missing references)
		//IL_01be: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c3: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c4: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c9: Unknown result type (might be due to invalid IL or missing references)
		//IL_0093: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ad: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ba: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bc: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cd: Unknown result type (might be due to invalid IL or missing references)
		//IL_00de: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ef: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ff: Unknown result type (might be due to invalid IL or missing references)
		//IL_0104: Unknown result type (might be due to invalid IL or missing references)
		//IL_0105: Unknown result type (might be due to invalid IL or missing references)
		//IL_010a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0110: Unknown result type (might be due to invalid IL or missing references)
		//IL_0112: Unknown result type (might be due to invalid IL or missing references)
		//IL_0114: Unknown result type (might be due to invalid IL or missing references)
		//IL_0116: Unknown result type (might be due to invalid IL or missing references)
		//IL_0120: Unknown result type (might be due to invalid IL or missing references)
		//IL_0125: Unknown result type (might be due to invalid IL or missing references)
		//IL_012a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0133: Unknown result type (might be due to invalid IL or missing references)
		//IL_013a: Unknown result type (might be due to invalid IL or missing references)
		//IL_013f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0141: Unknown result type (might be due to invalid IL or missing references)
		//IL_014b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0154: Unknown result type (might be due to invalid IL or missing references)
		//IL_0159: Unknown result type (might be due to invalid IL or missing references)
		//IL_015e: Unknown result type (might be due to invalid IL or missing references)
		//IL_01d8: Unknown result type (might be due to invalid IL or missing references)
		DBG.blogDebug("in change color");
		Texture2D val = Object.Instantiate<Texture2D>(oldTex);
		Color[] array = new Color[3] { col, col, col };
		int num = Mathf.Min(3, ((Texture)val).mipmapCount);
		for (int i = 0; i < num; i++)
		{
			Color[] pixels = val.GetPixels(i);
			DBG.blogDebug("cols.length=" + pixels.Length);
			for (int j = 0; j < pixels.Length; j++)
			{
				Color val2 = pixels[j];
				if (invertShadow)
				{
					Color val3 = new Color(1f - val2.r, 1f - val2.g, 1f - val2.b);
					Color val4 = val3 - new Color(Mathf.Min(val3.r, 0.6f), Mathf.Min(val3.g, 0.6f), Mathf.Min(val3.b, 0.6f));
					Color val5 = pixels[j] * col;
					pixels[j] = val5 - val5 * val4 * 1f;
					pixels[j] = changeHue(val5, 0.5f) * val3 * 1.3f + pixels[j];
				}
				else
				{
					Color val6 = Color.grey * val2;
					val6 -= new Color(Mathf.Min(val6.r, 0.25f), Mathf.Min(val6.g, 0.25f), Mathf.Min(val6.b, 0.25f));
					pixels[j] *= col;
				}
				pixels[j].a = val2.a;
			}
			val.SetPixels(pixels, i);
		}
		val.Apply(false);
		return val;
	}

	public static Color changeHue(Color col, float hue)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_0026: Unknown result type (might be due to invalid IL or missing references)
		float num2 = default;
		float num3 = default;
		float num = default;
		Color.RGBToHSV(col, ref num, ref num2, ref num3);
		num = (num + hue) % 1f;
		return Color.HSVToRGB(num, num2, num3);
	}

	public static T GetCopyOf<T>(this Component comp, T other) where T : Component
	{
		Type type = ((object)comp).GetType();
		if (type != ((object)other).GetType())
		{
			return default;
		}
		List<Type> list = new List<Type>();
		Type baseType = type.BaseType;
		while (baseType != null && !(baseType == typeof(MonoBehaviour)))
		{
			list.Add(baseType);
			baseType = baseType.BaseType;
		}
		IEnumerable<PropertyInfo> enumerable = type.GetProperties(BindingFlags.Public);
		foreach (Type item in list)
		{
			enumerable = enumerable.Concat(item.GetProperties(BindingFlags.Public));
		}
		enumerable = from property in enumerable
			where !(type == typeof(Rigidbody)) || !(property.Name == "inertiaTensor")
			where !property.CustomAttributes.Any((CustomAttributeData attribute) => attribute.AttributeType == typeof(ObsoleteAttribute))
			select property;
		foreach (PropertyInfo pinfo in enumerable)
		{
			if (pinfo.CanWrite && !enumerable.Any((PropertyInfo e) => e.Name == $"shared{char.ToUpper(pinfo.Name[0])}{pinfo.Name.Substring(1)}"))
			{
				try
				{
					pinfo.SetValue(comp, pinfo.GetValue(other, null), null);
				}
				catch
				{
				}
			}
		}
		IEnumerable<FieldInfo> enumerable2 = type.GetFields(BindingFlags.Public);
		foreach (FieldInfo finfo in enumerable2)
		{
			foreach (Type item2 in list)
			{
				if (!enumerable2.Any((FieldInfo e) => e.Name == $"shared{char.ToUpper(finfo.Name[0])}{finfo.Name.Substring(1)}"))
				{
					enumerable2 = enumerable2.Concat(item2.GetFields(BindingFlags.Public));
				}
			}
		}
		foreach (FieldInfo item3 in enumerable2)
		{
			item3.SetValue(comp, item3.GetValue(other));
		}
		enumerable2 = enumerable2.Where((FieldInfo field) => field.CustomAttributes.Any((CustomAttributeData attribute) => attribute.AttributeType == typeof(ObsoleteAttribute)));
		foreach (FieldInfo item4 in enumerable2)
		{
			item4.SetValue(comp, item4.GetValue(other));
		}
		return (T)(object)((comp is T) ? comp : null);
	}

	public static T AddComponent<T>(this GameObject go, T toAdd) where T : Component
	{
		return go.AddComponent(((object)toAdd).GetType()).GetCopyOf(toAdd);
	}

	public static T CopyIntoParent<T>(T go, T parent) where T : Component
	{
		//IL_0055: Unknown result type (might be due to invalid IL or missing references)
		T val = Object.Instantiate<T>(go);
		((Object)(object)val).name = ((Object)(object)go).name;
		((Component)val).transform.parent = ((Component)parent).transform;
		((Component)val).transform.localPosition = new Vector3(0f, 0f, 0f);
		return val;
	}
}
