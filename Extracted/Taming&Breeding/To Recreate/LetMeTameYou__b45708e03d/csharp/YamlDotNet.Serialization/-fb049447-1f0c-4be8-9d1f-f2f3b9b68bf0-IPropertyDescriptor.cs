using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal interface _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor
{
	string Name { get; }

	bool AllowNulls { get; }

	bool CanWrite { get; }

	Type Type { get; }

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	Type TypeOverride
	{
		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
		get;
		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
		set;
	}

	int Order { get; set; }

	_003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle ScalarStyle { get; set; }

	bool Required { get; }

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	Type ConverterType
	{
		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
		get;
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)]
	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	T GetCustomAttribute<T>() where T : Attribute;

	_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor Read(object target);

	void Write(object target, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object value);
}
