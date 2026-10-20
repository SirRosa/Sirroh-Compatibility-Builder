using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal class _003Ce9d64664_002D780c_002D48f6_002D81d1_002Db37d0843fdf1_003EReadableAndWritablePropertiesTypeInspector : _003Cb3d6a51f_002D6584_002D4a6c_002Da94f_002D3d33acb8e7cc_003ETypeInspectorSkeleton
{
	private readonly _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector innerTypeDescriptor;

	public _003Ce9d64664_002D780c_002D48f6_002D81d1_002Db37d0843fdf1_003EReadableAndWritablePropertiesTypeInspector(_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector innerTypeDescriptor)
	{
		this.innerTypeDescriptor = innerTypeDescriptor ?? throw new ArgumentNullException("innerTypeDescriptor");
	}

	public override string GetEnumName(Type enumType, string name)
	{
		return innerTypeDescriptor.GetEnumName(enumType, name);
	}

	public override string GetEnumValue(object enumValue)
	{
		return innerTypeDescriptor.GetEnumValue(enumValue);
	}

	public override IEnumerable<_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor> GetProperties(Type type, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object container)
	{
		return from p in innerTypeDescriptor.GetProperties(type, container)
			where p.CanWrite
			select p;
	}
}
