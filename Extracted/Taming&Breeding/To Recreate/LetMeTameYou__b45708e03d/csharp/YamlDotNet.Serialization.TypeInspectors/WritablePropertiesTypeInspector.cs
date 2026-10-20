using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal class WritablePropertiesTypeInspector : ReflectionTypeInspector
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	protected class ReflectionPropertyDescriptor : _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor
	{
		private readonly PropertyInfo propertyInfo;

		private readonly _003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver typeResolver;

		public string Name => propertyInfo.Name;

		public bool Required => propertyInfo.IsRequired();

		public Type Type => propertyInfo.PropertyType;

		[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
		[field: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
		public Type TypeOverride
		{
			[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
			get;
			[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
			set;
		}

		[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
		[field: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
		public Type ConverterType
		{
			[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
			get;
			[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
			set;
		}

		public bool AllowNulls => propertyInfo.AcceptsNull();

		public int Order { get; set; }

		public bool CanWrite => propertyInfo.CanWrite;

		public _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle ScalarStyle { get; set; }

		public ReflectionPropertyDescriptor(PropertyInfo propertyInfo, _003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver typeResolver)
		{
			this.propertyInfo = propertyInfo ?? throw new ArgumentNullException("propertyInfo");
			this.typeResolver = typeResolver ?? throw new ArgumentNullException("typeResolver");
			ScalarStyle = _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Any;
			YamlConverterAttribute customAttribute = propertyInfo.GetCustomAttribute<YamlConverterAttribute>();
			if (customAttribute != null)
			{
				ConverterType = customAttribute.ConverterType;
			}
		}

		public void Write(object target, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object value)
		{
			propertyInfo.SetValue(target, value, null);
		}

		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)]
		[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
		public T GetCustomAttribute<T>() where T : Attribute
		{
			Attribute[] allCustomAttributes = _003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.GetAllCustomAttributes<T>(propertyInfo);
			return (T)allCustomAttributes.FirstOrDefault();
		}

		public _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor Read(object target)
		{
			object obj = _003Cbf83bdff_002D8b22_002D4a46_002D8b22_002Df2a76d48f904_003EPropertyInfoExtensions.ReadValue(propertyInfo, target);
			Type type = TypeOverride ?? typeResolver.Resolve(Type, obj);
			return new _003Ce413efdf_002D5e9a_002D4b56_002D9686_002Da7eb44e10568_003EObjectDescriptor(obj, type, Type, ScalarStyle);
		}
	}

	private readonly _003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver typeResolver;

	private readonly bool includeNonPublicProperties;

	public WritablePropertiesTypeInspector(_003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver typeResolver)
		: this(typeResolver, includeNonPublicProperties: false)
	{
	}

	public WritablePropertiesTypeInspector(_003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver typeResolver, bool includeNonPublicProperties)
	{
		this.typeResolver = typeResolver ?? throw new ArgumentNullException("typeResolver");
		this.includeNonPublicProperties = includeNonPublicProperties;
	}

	private static bool IsValidProperty(PropertyInfo property)
	{
		if (property.CanWrite)
		{
			return property.GetSetMethod(nonPublic: true).GetParameters().Length == 1;
		}
		return false;
	}

	public override IEnumerable<_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor> GetProperties(Type type, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object container)
	{
		return _003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.GetProperties(type, includeNonPublicProperties).Where(IsValidProperty).Select((Func<PropertyInfo, _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor>)([_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (PropertyInfo p) => new ReflectionPropertyDescriptor(p, typeResolver)))
			.ToArray();
	}
}
