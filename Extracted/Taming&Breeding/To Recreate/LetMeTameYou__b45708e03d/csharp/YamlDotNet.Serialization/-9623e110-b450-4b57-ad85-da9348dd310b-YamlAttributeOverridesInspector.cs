using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Serialization.TypeInspectors;

namespace YamlDotNet.Serialization;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C9623e110_002Db450_002D4b57_002Dad85_002Dda9348dd310b_003EYamlAttributeOverridesInspector : ReflectionTypeInspector
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	public sealed class OverridePropertyDescriptor : _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor
	{
		private readonly _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor baseDescriptor;

		private readonly _003C7f6c7070_002D6c7a_002D4444_002D8623_002D48498d557692_003EYamlAttributeOverrides overrides;

		private readonly Type classType;

		public string Name => baseDescriptor.Name;

		public bool Required => baseDescriptor.Required;

		public bool AllowNulls => baseDescriptor.AllowNulls;

		public bool CanWrite => baseDescriptor.CanWrite;

		public Type Type => baseDescriptor.Type;

		[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
		public Type TypeOverride
		{
			[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
			get
			{
				return baseDescriptor.TypeOverride;
			}
			[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
			set
			{
				baseDescriptor.TypeOverride = value;
			}
		}

		[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
		public Type ConverterType
		{
			[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
			get
			{
				return GetCustomAttribute<YamlConverterAttribute>()?.ConverterType ?? baseDescriptor.ConverterType;
			}
		}

		public int Order
		{
			get
			{
				return baseDescriptor.Order;
			}
			set
			{
				baseDescriptor.Order = value;
			}
		}

		public _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle ScalarStyle
		{
			get
			{
				return baseDescriptor.ScalarStyle;
			}
			set
			{
				baseDescriptor.ScalarStyle = value;
			}
		}

		public OverridePropertyDescriptor(_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor baseDescriptor, _003C7f6c7070_002D6c7a_002D4444_002D8623_002D48498d557692_003EYamlAttributeOverrides overrides, Type classType)
		{
			this.baseDescriptor = baseDescriptor;
			this.overrides = overrides;
			this.classType = classType;
		}

		public void Write(object target, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object value)
		{
			baseDescriptor.Write(target, value);
		}

		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)]
		[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
		public T GetCustomAttribute<T>() where T : Attribute
		{
			T attribute = overrides.GetAttribute<T>(classType, Name);
			return attribute ?? baseDescriptor.GetCustomAttribute<T>();
		}

		public _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor Read(object target)
		{
			return baseDescriptor.Read(target);
		}
	}

	private readonly _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector innerTypeDescriptor;

	private readonly _003C7f6c7070_002D6c7a_002D4444_002D8623_002D48498d557692_003EYamlAttributeOverrides overrides;

	public _003C9623e110_002Db450_002D4b57_002Dad85_002Dda9348dd310b_003EYamlAttributeOverridesInspector(_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector innerTypeDescriptor, _003C7f6c7070_002D6c7a_002D4444_002D8623_002D48498d557692_003EYamlAttributeOverrides overrides)
	{
		this.innerTypeDescriptor = innerTypeDescriptor;
		this.overrides = overrides;
	}

	public override IEnumerable<_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor> GetProperties(Type type, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object container)
	{
		IEnumerable<_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor> enumerable = innerTypeDescriptor.GetProperties(type, container);
		if (overrides != null)
		{
			enumerable = enumerable.Select((Func<_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor, _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor>)([_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor p) => new OverridePropertyDescriptor(p, overrides, type)));
		}
		return enumerable;
	}
}
