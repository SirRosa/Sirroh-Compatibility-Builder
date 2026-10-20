using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal class _003Cf2cd6aa7_002D767a_002D449b_002D8198_002D55e156780a2f_003ENamingConventionTypeInspector : _003Cb3d6a51f_002D6584_002D4a6c_002Da94f_002D3d33acb8e7cc_003ETypeInspectorSkeleton
{
	private readonly _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector innerTypeDescriptor;

	private readonly _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention namingConvention;

	public _003Cf2cd6aa7_002D767a_002D449b_002D8198_002D55e156780a2f_003ENamingConventionTypeInspector(_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector innerTypeDescriptor, _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention namingConvention)
	{
		this.innerTypeDescriptor = innerTypeDescriptor ?? throw new ArgumentNullException("innerTypeDescriptor");
		this.namingConvention = namingConvention ?? throw new ArgumentNullException("namingConvention");
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
		return innerTypeDescriptor.GetProperties(type, container).Select([_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor p) =>
		{
			_003C625dc0d1_002D7c1b_002D49f8_002Da5bf_002D106bb34594e8_003EYamlMemberAttribute customAttribute = p.GetCustomAttribute<_003C625dc0d1_002D7c1b_002D49f8_002Da5bf_002D106bb34594e8_003EYamlMemberAttribute>();
			return (customAttribute != null && !customAttribute.ApplyNamingConventions) ? p : new _003C520e7a43_002D33b2_002D4d07_002Dbf0d_002D5b6c4f41dfa0_003EPropertyDescriptor(p)
			{
				Name = namingConvention.Apply(p.Name)
			};
		});
	}
}
