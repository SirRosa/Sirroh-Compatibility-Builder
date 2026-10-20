using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C520e7a43_002D33b2_002D4d07_002Dbf0d_002D5b6c4f41dfa0_003EPropertyDescriptor : _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor
{
	private readonly _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor baseDescriptor;

	public bool AllowNulls => baseDescriptor.AllowNulls;

	public string Name { get; set; }

	public bool Required => baseDescriptor.Required;

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
			return baseDescriptor.ConverterType;
		}
	}

	public int Order { get; set; }

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

	public bool CanWrite => baseDescriptor.CanWrite;

	public _003C520e7a43_002D33b2_002D4d07_002Dbf0d_002D5b6c4f41dfa0_003EPropertyDescriptor(_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor baseDescriptor)
	{
		this.baseDescriptor = baseDescriptor;
		Name = baseDescriptor.Name;
	}

	public void Write(object target, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object value)
	{
		baseDescriptor.Write(target, value);
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)]
	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public T GetCustomAttribute<T>() where T : Attribute
	{
		return baseDescriptor.GetCustomAttribute<T>();
	}

	public _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor Read(object target)
	{
		return baseDescriptor.Read(target);
	}
}
