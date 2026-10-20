using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003Ce413efdf_002D5e9a_002D4b56_002D9686_002Da7eb44e10568_003EObjectDescriptor : _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	[field: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public object Value
	{
		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
		get;
		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
		private set;
	}

	public Type Type { get; private set; }

	public Type StaticType { get; private set; }

	public _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle ScalarStyle { get; private set; }

	public _003Ce413efdf_002D5e9a_002D4b56_002D9686_002Da7eb44e10568_003EObjectDescriptor([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object value, Type type, Type staticType)
		: this(value, type, staticType, _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Any)
	{
	}

	public _003Ce413efdf_002D5e9a_002D4b56_002D9686_002Da7eb44e10568_003EObjectDescriptor([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object value, Type type, Type staticType, _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle scalarStyle)
	{
		Value = value;
		Type = type ?? throw new ArgumentNullException("type");
		StaticType = staticType ?? throw new ArgumentNullException("staticType");
		ScalarStyle = scalarStyle;
	}
}
