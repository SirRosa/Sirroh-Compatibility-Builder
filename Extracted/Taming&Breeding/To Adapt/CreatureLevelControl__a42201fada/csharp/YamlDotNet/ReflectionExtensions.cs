using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;

namespace YamlDotNet;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal static class ReflectionExtensions
{
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	private static readonly FieldInfo remoteStackTraceField = typeof(Exception).GetField("_remoteStackTraceString", BindingFlags.Instance | BindingFlags.NonPublic);

	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	public static Type BaseType(this Type type)
	{
		return type.BaseType;
	}

	public static bool IsValueType(this Type type)
	{
		return type.IsValueType;
	}

	public static bool IsGenericType(this Type type)
	{
		return type.IsGenericType;
	}

	public static bool IsGenericTypeDefinition(this Type type)
	{
		return type.IsGenericTypeDefinition;
	}

	public static bool IsInterface(this Type type)
	{
		return type.IsInterface;
	}

	public static bool IsEnum(this Type type)
	{
		return type.IsEnum;
	}

	public static bool IsDbNull(this object value)
	{
		return value is DBNull;
	}

	public static bool HasDefaultConstructor(this Type type)
	{
		if (!type.IsValueType)
		{
			return type.GetConstructor(BindingFlags.Instance | BindingFlags.Public, null, Type.EmptyTypes, null) != null;
		}
		return true;
	}

	public static TypeCode GetTypeCode(this Type type)
	{
		return Type.GetTypeCode(type);
	}

	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	public static PropertyInfo GetPublicProperty(this Type type, string name)
	{
		return type.GetProperty(name);
	}

	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	public static FieldInfo GetPublicStaticField(this Type type, string name)
	{
		return type.GetField(name, BindingFlags.Static | BindingFlags.Public);
	}

	public static IEnumerable<PropertyInfo> GetProperties(this Type type, bool includeNonPublic)
	{
		BindingFlags bindingFlags = BindingFlags.Instance | BindingFlags.Public;
		if (includeNonPublic)
		{
			bindingFlags |= BindingFlags.NonPublic;
		}
		if (!type.IsInterface)
		{
			return type.GetProperties(bindingFlags);
		}
		return new Type[1] { type }.Concat(type.GetInterfaces()).SelectMany([_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(0)] (Type i) => i.GetProperties(bindingFlags));
	}

	public static IEnumerable<PropertyInfo> GetPublicProperties(this Type type)
	{
		return type.GetProperties(includeNonPublic: false);
	}

	public static IEnumerable<FieldInfo> GetPublicFields(this Type type)
	{
		return type.GetFields(BindingFlags.Instance | BindingFlags.Public);
	}

	public static IEnumerable<MethodInfo> GetPublicStaticMethods(this Type type)
	{
		return type.GetMethods(BindingFlags.Static | BindingFlags.Public);
	}

	public static MethodInfo GetPrivateStaticMethod(this Type type, string name)
	{
		return type.GetMethod(name, BindingFlags.Static | BindingFlags.NonPublic) ?? throw new MissingMethodException("Expected to find a method named '" + name + "' in '" + type.FullName + "'.");
	}

	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	public static MethodInfo GetPublicStaticMethod(this Type type, string name, params Type[] parameterTypes)
	{
		return type.GetMethod(name, BindingFlags.Static | BindingFlags.Public, null, parameterTypes, null);
	}

	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	public static MethodInfo GetPublicInstanceMethod(this Type type, string name)
	{
		return type.GetMethod(name, BindingFlags.Instance | BindingFlags.Public);
	}

	public static Exception Unwrap(this TargetInvocationException ex)
	{
		Exception innerException = ex.InnerException;
		if (innerException == null)
		{
			return ex;
		}
		if (remoteStackTraceField != null)
		{
			remoteStackTraceField.SetValue(innerException, innerException.StackTrace + "\r\n");
		}
		return innerException;
	}

	public static bool IsInstanceOf(this Type type, object o)
	{
		return type.IsInstanceOfType(o);
	}

	public static Attribute[] GetAllCustomAttributes<[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] TAttribute>(this PropertyInfo property)
	{
		return Attribute.GetCustomAttributes(property, typeof(TAttribute));
	}
}
