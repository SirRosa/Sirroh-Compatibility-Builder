using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.Serialization;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal abstract class _003Cb3d6a51f_002D6584_002D4a6c_002Da94f_002D3d33acb8e7cc_003ETypeInspectorSkeleton : _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector
{
	public abstract string GetEnumName(Type enumType, string name);

	public abstract string GetEnumValue(object enumValue);

	public abstract IEnumerable<_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor> GetProperties(Type type, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object container);

	public _003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor GetProperty(Type type, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object container, string name, [_003C3e7b65c3_002D9a34_002D466b_002D9a0e_002Dc991173a4ba0_003EMaybeNullWhen(true)] bool ignoreUnmatched, bool caseInsensitivePropertyMatching)
	{
		IEnumerable<_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor> enumerable = ((!caseInsensitivePropertyMatching) ? (from p in GetProperties(type, container)
			where p.Name == name
			select p) : (from p in GetProperties(type, container)
			where p.Name.Equals(name, StringComparison.OrdinalIgnoreCase)
			select p));
		using IEnumerator<_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor> enumerator = enumerable.GetEnumerator();
		if (!enumerator.MoveNext())
		{
			if (ignoreUnmatched)
			{
				return null;
			}
			throw new SerializationException("Property '" + name + "' not found on type '" + type.FullName + "'.");
		}
		_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor current = enumerator.Current;
		if (enumerator.MoveNext())
		{
			throw new SerializationException("Multiple properties with the name/alias '" + name + "' already exists on type '" + type.FullName + "', maybe you're misusing YamlAlias or maybe you are using the wrong naming convention? The matching properties are: " + string.Join(", ", enumerable.Select([_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor p) => p.Name).ToArray()));
		}
		return current;
	}
}
