using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Text;

namespace Recycle_N_Reclaim.GamePatches;

[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
public class ObjectDumper
{
	private readonly List<int> _hashListOfFoundElements;

	private readonly int _indentSize;

	private readonly StringBuilder _stringBuilder;

	private int _level;

	private ObjectDumper(int indentSize)
	{
		_indentSize = indentSize;
		_stringBuilder = new StringBuilder();
		_hashListOfFoundElements = new List<int>();
	}

	public static string Dump(object element, int indentSize = 2)
	{
		return new ObjectDumper(indentSize).DumpElement(element);
	}

	private string GetTypeName(Type type)
	{
		if (!IsAnonymousType(type))
		{
			return type.Name;
		}
		return "AnonymousType";
	}

	private string DumpElement(object element)
	{
		if ((element == null || element is ValueType || element is string) ? true : false)
		{
			Write(FormatValue(element));
		}
		else
		{
			Type type = element.GetType();
			if (!typeof(IEnumerable).IsAssignableFrom(type))
			{
				Write("{{{0}}}", GetTypeName(type));
				_hashListOfFoundElements.Add(element.GetHashCode());
				_level++;
			}
			if (element is IEnumerable enumerable)
			{
				foreach (object item in enumerable)
				{
					if (item is IEnumerable enumerable2 && !(enumerable2 is string))
					{
						_level++;
						DumpElement(item);
						_level--;
					}
					else if (!AlreadyTouched(item))
					{
						DumpElement(item);
					}
					else
					{
						Write("{{{0}}} <-- bidirectional reference found", GetTypeName(item.GetType()));
					}
				}
			}
			else
			{
				MemberInfo[] members = element.GetType().GetMembers(BindingFlags.Instance | BindingFlags.Public);
				foreach (MemberInfo memberInfo in members)
				{
					FieldInfo fieldInfo = memberInfo as FieldInfo;
					PropertyInfo propertyInfo = memberInfo as PropertyInfo;
					if (fieldInfo == null && propertyInfo == null)
					{
						continue;
					}
					Type type2 = ((fieldInfo != null) ? fieldInfo.FieldType : propertyInfo.PropertyType);
					object obj = ((fieldInfo != null) ? fieldInfo.GetValue(element) : propertyInfo.GetValue(element, null));
					if (type2.IsValueType || type2 == typeof(string))
					{
						Write("{0}: {1}", memberInfo.Name, FormatValue(obj));
						continue;
					}
					bool flag = typeof(IEnumerable).IsAssignableFrom(type2);
					Write("{0}: {1}", memberInfo.Name, flag ? "..." : "{ }");
					bool num = !flag && AlreadyTouched(obj);
					_level++;
					if (!num)
					{
						DumpElement(obj);
					}
					else
					{
						Write("{{{0}}} <-- bidirectional reference found", GetTypeName(obj.GetType()));
					}
					_level--;
				}
			}
			if (!typeof(IEnumerable).IsAssignableFrom(type))
			{
				_level--;
			}
		}
		return _stringBuilder.ToString();
	}

	private bool AlreadyTouched(object value)
	{
		if (value == null)
		{
			return false;
		}
		int hashCode = value.GetHashCode();
		for (int i = 0; i < _hashListOfFoundElements.Count; i++)
		{
			if (_hashListOfFoundElements[i] == hashCode)
			{
				return true;
			}
		}
		return false;
	}

	private void Write(string value, params object[] args)
	{
		string text = new string(' ', _level * _indentSize);
		if (args != null)
		{
			value = string.Format(value, args);
		}
		_stringBuilder.AppendLine(text + value);
	}

	private string FormatValue(object o)
	{
		if (o != null)
		{
			if (!(o is DateTime dateTime))
			{
				if (!(o is string))
				{
					if (o is char)
					{
						if ((char)o == '\0')
						{
							return string.Empty;
						}
					}
					else if (!(o is ValueType))
					{
						if (o is IEnumerable)
						{
							return "...";
						}
						return "{ }";
					}
					return o.ToString();
				}
				return $"\"{o}\"";
			}
			return dateTime.ToShortDateString();
		}
		return "null";
	}

	private static bool IsAnonymousType(Type type)
	{
		if (type == null)
		{
			throw new ArgumentNullException("type");
		}
		if (Attribute.IsDefined(type, typeof(CompilerGeneratedAttribute), inherit: false) && type.IsGenericType && type.Name.Contains("AnonymousType") && (type.Name.StartsWith("<>") || type.Name.StartsWith("VB$")))
		{
			return type.Attributes.HasFlag(TypeAttributes.NotPublic);
		}
		return false;
	}
}
