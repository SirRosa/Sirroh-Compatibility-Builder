using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal class _003C5976699b_002D4688_002D4b44_002Dba23_002Dc6d415abc868_003ECompositeTypeInspector : _003Cb3d6a51f_002D6584_002D4a6c_002Da94f_002D3d33acb8e7cc_003ETypeInspectorSkeleton
{
	private readonly IEnumerable<_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector> typeInspectors;

	public _003C5976699b_002D4688_002D4b44_002Dba23_002Dc6d415abc868_003ECompositeTypeInspector(params _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector[] typeInspectors)
		: this((IEnumerable<_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector>)typeInspectors)
	{
	}

	public _003C5976699b_002D4688_002D4b44_002Dba23_002Dc6d415abc868_003ECompositeTypeInspector(IEnumerable<_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector> typeInspectors)
	{
		this.typeInspectors = typeInspectors?.ToList() ?? throw new ArgumentNullException("typeInspectors");
	}

	public override string GetEnumName(Type enumType, string name)
	{
		foreach (_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector in typeInspectors)
		{
			try
			{
				return typeInspector.GetEnumName(enumType, name);
			}
			catch
			{
			}
		}
		throw new ArgumentOutOfRangeException("enumType,name", "Name not found on enum type");
	}

	public override string GetEnumValue(object enumValue)
	{
		if (enumValue == null)
		{
			throw new ArgumentNullException("enumValue");
		}
		foreach (_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector in typeInspectors)
		{
			try
			{
				return typeInspector.GetEnumValue(enumValue);
			}
			catch
			{
			}
		}
		throw new ArgumentOutOfRangeException("enumValue", $"Value not found for ({enumValue})");
	}

	public override IEnumerable<_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor> GetProperties(Type type, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object container)
	{
		return typeInspectors.SelectMany([_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector i) => i.GetProperties(type, container));
	}
}
