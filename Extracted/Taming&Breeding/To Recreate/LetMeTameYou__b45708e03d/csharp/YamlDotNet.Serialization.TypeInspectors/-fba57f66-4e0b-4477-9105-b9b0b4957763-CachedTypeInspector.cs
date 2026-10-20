using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Helpers;

namespace YamlDotNet.Serialization.TypeInspectors;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal class _003Cfba57f66_002D4e0b_002D4477_002D9105_002Db9b0b4957763_003ECachedTypeInspector : _003Cb3d6a51f_002D6584_002D4a6c_002Da94f_002D3d33acb8e7cc_003ETypeInspectorSkeleton
{
	private readonly _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector innerTypeDescriptor;

	private readonly ConcurrentDictionary<Type, List<_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor>> cache = new ConcurrentDictionary<Type, List<_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor>>();

	private readonly ConcurrentDictionary<Type, ConcurrentDictionary<string, string>> enumNameCache = new ConcurrentDictionary<Type, ConcurrentDictionary<string, string>>();

	private readonly ConcurrentDictionary<object, string> enumValueCache = new ConcurrentDictionary<object, string>();

	public _003Cfba57f66_002D4e0b_002D4477_002D9105_002Db9b0b4957763_003ECachedTypeInspector(_003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector innerTypeDescriptor)
	{
		this.innerTypeDescriptor = innerTypeDescriptor ?? throw new ArgumentNullException("innerTypeDescriptor");
	}

	public override string GetEnumName(Type enumType, string name)
	{
		ConcurrentDictionary<string, string> orAdd = enumNameCache.GetOrAdd(enumType, (Type _) => new ConcurrentDictionary<string, string>());
		return DictionaryExtensions.GetOrAdd(orAdd, name, [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (string n, (Type enumType, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector innerTypeDescriptor) context) =>
		{
			var (enumType2, obj) = context;
			return obj.GetEnumName(enumType2, n);
		}, (enumType, innerTypeDescriptor));
	}

	public override string GetEnumValue(object enumValue)
	{
		return DictionaryExtensions.GetOrAdd(enumValueCache, enumValue, [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (object _, (object enumValue, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector innerTypeDescriptor) context) =>
		{
			var (enumValue2, obj) = context;
			return obj.GetEnumValue(enumValue2);
		}, (enumValue, innerTypeDescriptor));
	}

	public override IEnumerable<_003Cfb049447_002D1f0c_002D4be8_002D9d1f_002Df2f3b9b68bf0_003EIPropertyDescriptor> GetProperties(Type type, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object container)
	{
		return DictionaryExtensions.GetOrAdd(cache, type, [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (Type t, (object container, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector innerTypeDescriptor) context) =>
		{
			var (container2, obj) = context;
			return obj.GetProperties(t, container2).ToList();
		}, (container, innerTypeDescriptor));
	}
}
