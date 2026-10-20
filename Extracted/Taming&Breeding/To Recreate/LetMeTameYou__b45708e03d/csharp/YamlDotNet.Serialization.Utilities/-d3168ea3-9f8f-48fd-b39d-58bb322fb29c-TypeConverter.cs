using System;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using YamlDotNet.Helpers;

namespace YamlDotNet.Serialization.Utilities;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal static class _003Cd3168ea3_002D9f8f_002D48fd_002Db39d_002D58bb322fb29c_003ETypeConverter
{
	public static T ChangeType<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] T>([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object value, _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector)
	{
		return (T)ChangeType(value, typeof(T), enumNamingConvention, typeInspector);
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public static object ChangeType([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object value, Type destinationType, _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector)
	{
		return ChangeType(value, destinationType, CultureInfo.InvariantCulture, enumNamingConvention, typeInspector);
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public static object ChangeType([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object value, Type destinationType, IFormatProvider provider, _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector)
	{
		return ChangeType(value, destinationType, new _003C85e2c2b0_002D3cc5_002D4133_002Db3c9_002D1ecb8e6d278d_003ECultureInfoAdapter(CultureInfo.CurrentCulture, provider), enumNamingConvention, typeInspector);
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public static object ChangeType([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object value, Type destinationType, CultureInfo culture, _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector)
	{
		if (value == null || _003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.IsDbNull(value))
		{
			if (!_003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.IsValueType(destinationType))
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
		if (_003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.IsGenericType(destinationType))
		{
			Type genericTypeDefinition = destinationType.GetGenericTypeDefinition();
			if (genericTypeDefinition == typeof(Nullable<>) || FsharpHelper.IsOptionType(genericTypeDefinition))
			{
				Type destinationType2 = destinationType.GetGenericArguments()[0];
				object obj = ChangeType(value, destinationType2, culture, enumNamingConvention, typeInspector);
				return Activator.CreateInstance(destinationType, obj);
			}
		}
		if (_003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.IsEnum(destinationType))
		{
			object result = value;
			if (value is string value2)
			{
				string name = enumNamingConvention.Reverse(value2);
				name = typeInspector.GetEnumName(destinationType, name);
				result = Enum.Parse(destinationType, name, ignoreCase: true);
			}
			return result;
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
		foreach (Type type2 in array)
		{
			foreach (MethodInfo publicStaticMethod2 in _003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.GetPublicStaticMethods(type2))
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
						throw ex.InnerException;
					}
				}
			}
		}
		if (type == typeof(string))
		{
			try
			{
				MethodInfo publicStaticMethod = _003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.GetPublicStaticMethod(destinationType, "Parse", typeof(string), typeof(IFormatProvider));
				if (publicStaticMethod != null)
				{
					return publicStaticMethod.Invoke(null, new object[2] { value, culture });
				}
				publicStaticMethod = _003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.GetPublicStaticMethod(destinationType, "Parse", typeof(string));
				if (publicStaticMethod != null)
				{
					return publicStaticMethod.Invoke(null, new object[1] { value });
				}
			}
			catch (TargetInvocationException ex2)
			{
				throw ex2.InnerException;
			}
		}
		if (destinationType == typeof(TimeSpan))
		{
			return TimeSpan.Parse((string)ChangeType(value, typeof(string), CultureInfo.InvariantCulture, enumNamingConvention, typeInspector), CultureInfo.InvariantCulture);
		}
		return Convert.ChangeType(value, destinationType, CultureInfo.InvariantCulture);
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)]
	public static void RegisterTypeConverter<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TConvertible, TConverter>() where TConverter : System.ComponentModel.TypeConverter
	{
		if (!TypeDescriptor.GetAttributes(typeof(TConvertible)).OfType<TypeConverterAttribute>().Any([_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (TypeConverterAttribute a) => a.ConverterTypeName == typeof(TConverter).AssemblyQualifiedName))
		{
			TypeDescriptor.AddAttributes(typeof(TConvertible), new TypeConverterAttribute(typeof(TConverter)));
		}
	}
}
