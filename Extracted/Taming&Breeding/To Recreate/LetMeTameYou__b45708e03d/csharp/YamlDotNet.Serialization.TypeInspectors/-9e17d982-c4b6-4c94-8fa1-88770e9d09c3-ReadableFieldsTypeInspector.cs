using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal class _003C9e17d982_002Dc4b6_002D4c94_002D8fa1_002D88770e9d09c3_003EReadableFieldsTypeInspector : ReflectionTypeInspector
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	protected class ReflectionFieldDescriptor : _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor
	{
		private readonly FieldInfo fieldInfo;

		private readonly _003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver typeResolver;

		public string Name => fieldInfo.Name;

		public bool Required => fieldInfo.IsRequired();

		public Type Type => fieldInfo.FieldType;

		[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
		[field: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
		public Type ConverterType
		{
			[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
			get;
		}

		[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
		[field: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
		public Type TypeOverride
		{
			[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
			get;
			[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
			set;
		}

		public bool AllowNulls => fieldInfo.AcceptsNull();

		public int Order { get; set; }

		public bool CanWrite => !fieldInfo.IsInitOnly;

		public _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle ScalarStyle { get; set; }

		public ReflectionFieldDescriptor(FieldInfo fieldInfo, _003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver typeResolver)
		{
			this.fieldInfo = fieldInfo;
			this.typeResolver = typeResolver;
			YamlConverterAttribute customAttribute = fieldInfo.GetCustomAttribute<YamlConverterAttribute>();
			if (customAttribute != null)
			{
				ConverterType = customAttribute.ConverterType;
			}
			ScalarStyle = _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Any;
		}

		public void Write(object target, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object value)
		{
			fieldInfo.SetValue(target, value);
		}

		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)]
		[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
		public T GetCustomAttribute<T>() where T : Attribute
		{
			object[] customAttributes = fieldInfo.GetCustomAttributes(typeof(T), inherit: true);
			return (T)customAttributes.FirstOrDefault();
		}

		public _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor Read(object target)
		{
			object value = fieldInfo.GetValue(target);
			Type type = TypeOverride ?? typeResolver.Resolve(Type, value);
			return new _003Ce413efdf_002D5e9a_002D4b56_002D9686_002Da7eb44e10568_003EObjectDescriptor(value, type, Type, ScalarStyle);
		}
	}

	private readonly _003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver typeResolver;

	public _003C9e17d982_002Dc4b6_002D4c94_002D8fa1_002D88770e9d09c3_003EReadableFieldsTypeInspector(_003C9a18e817_002D7f53_002D45f5_002D8cc8_002D78dd60e37121_003EITypeResolver typeResolver)
	{
		this.typeResolver = typeResolver ?? throw new ArgumentNullException("typeResolver");
	}

	public override IEnumerable<_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor> GetProperties(Type type, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object container)
	{
		return _003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.GetPublicFields(type).Select((Func<FieldInfo, _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor>)([_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (FieldInfo p) => new ReflectionFieldDescriptor(p, typeResolver)));
	}
}
