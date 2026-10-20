using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Helpers;

namespace YamlDotNet.Serialization.Utilities;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class TypeConverterCache
{
	private readonly _003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter[] typeConverters;

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 1, 0, 2 })]
	private readonly ConcurrentDictionary<Type, (bool HasMatch, _003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter TypeConverter)> cache = new ConcurrentDictionary<Type, (bool, _003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter)>();

	public TypeConverterCache([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 2, 1 })] IEnumerable<_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter> typeConverters)
		: this(typeConverters?.ToArray() ?? Array.Empty<_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter>())
	{
	}

	public TypeConverterCache(_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter[] typeConverters)
	{
		this.typeConverters = typeConverters;
	}

	public bool TryGetConverterForType(Type type, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)][_003Cb00cde0a_002Db4f0_002D4b9f_002Db13f_002D3c9332bf6e97_003ENotNullWhen(true)] out _003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter typeConverter)
	{
		(bool, _003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter) orAdd = DictionaryExtensions.GetOrAdd(cache, type, [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (Type t, _003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter[] tc) => LookupTypeConverter(t, tc), typeConverters);
		typeConverter = orAdd.Item2;
		return orAdd.Item1;
	}

	public _003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter GetConverterByType(Type converter)
	{
		_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter[] array = typeConverters;
		foreach (_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter obj in array)
		{
			if (obj.GetType() == converter)
			{
				return obj;
			}
		}
		throw new ArgumentException("IYamlTypeConverter of type " + converter.FullName + " not found", "converter");
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 0, 2 })]
	private static (bool HasMatch, _003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter TypeConverter) LookupTypeConverter(Type type, _003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter[] typeConverters)
	{
		foreach (_003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter obj in typeConverters)
		{
			if (obj.Accepts(type))
			{
				return (HasMatch: true, TypeConverter: obj);
			}
		}
		return (HasMatch: false, TypeConverter: null);
	}
}
