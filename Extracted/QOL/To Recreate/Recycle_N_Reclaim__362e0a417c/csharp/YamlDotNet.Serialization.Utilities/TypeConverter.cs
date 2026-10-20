using System;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.Utilities;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal static class TypeConverter
{
	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(1)]
	public static T ChangeType<T>(object value)
	{
		return (T)ChangeType(value, typeof(T));
	}

	public static T ChangeType<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] T>([_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object value, IFormatProvider provider)
	{
		return (T)ChangeType(value, typeof(T), provider);
	}

	public static T ChangeType<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] T>([_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object value, CultureInfo culture)
	{
		return (T)ChangeType(value, typeof(T), culture);
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
	public static object ChangeType(object value, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(1)] Type destinationType)
	{
		return ChangeType(value, destinationType, CultureInfo.InvariantCulture);
	}

	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public static object ChangeType([_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object value, Type destinationType, IFormatProvider provider)
	{
		return ChangeType(value, destinationType, new CultureInfoAdapter(CultureInfo.CurrentCulture, provider));
	}

	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public static object ChangeType([_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object value, Type destinationType, CultureInfo culture)
	{
		if (value == null || value.IsDbNull())
		{
			if (!destinationType.IsValueType())
			{
				return null;
			}
			return Activator.CreateInstance(destinationType);
		}
		Type type = value.GetType();
		if (destinationType == type || destinationType.IsAssignableFrom(type))
		{
			return value;
		}
		if (destinationType.IsGenericType() && destinationType.GetGenericTypeDefinition() == typeof(Nullable<>))
		{
			Type destinationType2 = destinationType.GetGenericArguments()[0];
			object obj = ChangeType(value, destinationType2, culture);
			return Activator.CreateInstance(destinationType, obj);
		}
		if (destinationType.IsEnum())
		{
			if (!(value is string value2))
			{
				return value;
			}
			return Enum.Parse(destinationType, value2, ignoreCase: true);
		}
		if (destinationType == typeof(bool))
		{
			if ("0".Equals(value))
			{
				return false;
			}
			if ("1".Equals(value))
			{
				return true;
			}
		}
		System.ComponentModel.TypeConverter converter = TypeDescriptor.GetConverter(type);
		if (converter != null && converter.CanConvertTo(destinationType))
		{
			return converter.ConvertTo(null, culture, value, destinationType);
		}
		System.ComponentModel.TypeConverter converter2 = TypeDescriptor.GetConverter(destinationType);
		if (converter2 != null && converter2.CanConvertFrom(type))
		{
			return converter2.ConvertFrom(null, culture, value);
		}
		Type[] array = new Type[2] { type, destinationType };
		for (int i = 0; i < array.Length; i++)
		{
			foreach (MethodInfo publicStaticMethod2 in array[i].GetPublicStaticMethods())
			{
				if (!publicStaticMethod2.IsSpecialName || (!(publicStaticMethod2.Name == "op_Implicit") && !(publicStaticMethod2.Name == "op_Explicit")) || !destinationType.IsAssignableFrom(publicStaticMethod2.ReturnParameter.ParameterType))
				{
					continue;
				}
				ParameterInfo[] parameters = publicStaticMethod2.GetParameters();
				if (parameters.Length == 1 && parameters[0].ParameterType.IsAssignableFrom(type))
				{
					try
					{
						return publicStaticMethod2.Invoke(null, new object[1] { value });
					}
					catch (TargetInvocationException ex)
					{
						throw ex.Unwrap();
					}
				}
			}
		}
		if (type == typeof(string))
		{
			try
			{
				MethodInfo publicStaticMethod = destinationType.GetPublicStaticMethod("Parse", typeof(string), typeof(IFormatProvider));
				if (publicStaticMethod != null)
				{
					return publicStaticMethod.Invoke(null, new object[2] { value, culture });
				}
				publicStaticMethod = destinationType.GetPublicStaticMethod("Parse", typeof(string));
				if (publicStaticMethod != null)
				{
					return publicStaticMethod.Invoke(null, new object[1] { value });
				}
			}
			catch (TargetInvocationException ex2)
			{
				throw ex2.Unwrap();
			}
		}
		if (destinationType == typeof(TimeSpan))
		{
			return TimeSpan.Parse((string)ChangeType(value, typeof(string), CultureInfo.InvariantCulture));
		}
		return Convert.ChangeType(value, destinationType, CultureInfo.InvariantCulture);
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)]
	public static void RegisterTypeConverter<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] TConvertible, TConverter>() where TConverter : System.ComponentModel.TypeConverter
	{
		if (!TypeDescriptor.GetAttributes(typeof(TConvertible)).OfType<TypeConverterAttribute>().Any([_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(0)] (TypeConverterAttribute a) => a.ConverterTypeName == typeof(TConverter).AssemblyQualifiedName))
		{
			TypeDescriptor.AddAttributes(typeof(TConvertible), new TypeConverterAttribute(typeof(TConverter)));
		}
	}
}
