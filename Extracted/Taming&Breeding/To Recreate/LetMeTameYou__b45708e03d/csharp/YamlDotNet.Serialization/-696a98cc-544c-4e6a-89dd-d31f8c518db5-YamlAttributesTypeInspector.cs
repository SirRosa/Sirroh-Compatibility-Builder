using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Serialization.TypeInspectors;

namespace YamlDotNet.Serialization;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C696a98cc_002D544c_002D4e6a_002D89dd_002Dd31f8c518db5_003EYamlAttributesTypeInspector : _003Cb3d6a51f_002D6584_002D4a6c_002Da94f_002D3d33acb8e7cc_003ETypeInspectorSkeleton
{
	private readonly _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector innerTypeDescriptor;

	public _003C696a98cc_002D544c_002D4e6a_002D89dd_002Dd31f8c518db5_003EYamlAttributesTypeInspector(_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector innerTypeDescriptor)
	{
		this.innerTypeDescriptor = innerTypeDescriptor;
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
		return from p in (from p in innerTypeDescriptor.GetProperties(type, container)
				where p.GetCustomAttribute<_003C3176ac4a_002D52ad_002D4645_002D95c2_002D8aa8d94fbc9c_003EYamlIgnoreAttribute>() == null
				select p).Select((Func<_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor, _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor>)([_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor p) =>
			{
				_003C520e7a43_002D33b2_002D4d07_002Dbf0d_002D5b6c4f41dfa0_003EPropertyDescriptor obj = new _003C520e7a43_002D33b2_002D4d07_002Dbf0d_002D5b6c4f41dfa0_003EPropertyDescriptor(p);
				_003C625dc0d1_002D7c1b_002D49f8_002Da5bf_002D106bb34594e8_003EYamlMemberAttribute customAttribute = p.GetCustomAttribute<_003C625dc0d1_002D7c1b_002D49f8_002Da5bf_002D106bb34594e8_003EYamlMemberAttribute>();
				if (customAttribute != null)
				{
					if (customAttribute.SerializeAs != null)
					{
						obj.TypeOverride = customAttribute.SerializeAs;
					}
					obj.Order = customAttribute.Order;
					obj.ScalarStyle = customAttribute.ScalarStyle;
					if (customAttribute.Alias != null)
					{
						obj.Name = customAttribute.Alias;
					}
				}
				return obj;
			}))
			orderby p.Order
			select p;
	}
}
