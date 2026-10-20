using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Helpers;

namespace YamlDotNet.Serialization;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal sealed class _003C7f6c7070_002D6c7a_002D4444_002D8623_002D48498d557692_003EYamlAttributeOverrides
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	private readonly struct AttributeKey(Type attributeType, string propertyName)
	{
		public readonly Type AttributeType = attributeType;

		public readonly string PropertyName = propertyName;

		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
		public override bool Equals(object obj)
		{
			if (obj is AttributeKey attributeKey && AttributeType.Equals(attributeKey.AttributeType))
			{
				return PropertyName.Equals(attributeKey.PropertyName);
			}
			return false;
		}

		public override int GetHashCode()
		{
			return _003Ceda05417_002Dc99c_002D442b_002D93de_002De22ef768bacb_003EHashCode.CombineHashCodes(AttributeType.GetHashCode(), PropertyName.GetHashCode());
		}
	}

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	private sealed class AttributeMapping
	{
		public readonly Type RegisteredType;

		public readonly Attribute Attribute;

		public AttributeMapping(Type registeredType, Attribute attribute)
		{
			RegisteredType = registeredType;
			Attribute = attribute;
		}

		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
		public override bool Equals(object obj)
		{
			if (obj is AttributeMapping attributeMapping && RegisteredType.Equals(attributeMapping.RegisteredType))
			{
				return Attribute.Equals(attributeMapping.Attribute);
			}
			return false;
		}

		public override int GetHashCode()
		{
			return _003Ceda05417_002Dc99c_002D442b_002D93de_002De22ef768bacb_003EHashCode.CombineHashCodes(RegisteredType.GetHashCode(), Attribute.GetHashCode());
		}

		public int Matches(Type matchType)
		{
			int num = 0;
			Type type = matchType;
			while (type != null)
			{
				num++;
				if (type == RegisteredType)
				{
					return num;
				}
				type = _003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.BaseType(type);
			}
			if (Enumerable.Contains(matchType.GetInterfaces(), RegisteredType))
			{
				return num;
			}
			return 0;
		}
	}

	private readonly Dictionary<AttributeKey, List<AttributeMapping>> overrides = new Dictionary<AttributeKey, List<AttributeMapping>>();

	[return: _003C3d1e7086_002D102b_002D445d_002Da443_002D61677c23c63a_003EMaybeNull]
	public T GetAttribute<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)] T>(Type type, string member) where T : Attribute
	{
		if (overrides.TryGetValue(new AttributeKey(typeof(T), member), out var value))
		{
			int num = 0;
			AttributeMapping attributeMapping = null;
			foreach (AttributeMapping item in value)
			{
				int num2 = item.Matches(type);
				if (num2 > num)
				{
					num = num2;
					attributeMapping = item;
				}
			}
			if (num > 0)
			{
				return (T)attributeMapping.Attribute;
			}
		}
		return null;
	}

	public void Add(Type type, string member, Attribute attribute)
	{
		AttributeMapping item = new AttributeMapping(type, attribute);
		AttributeKey key = new AttributeKey(attribute.GetType(), member);
		if (!overrides.TryGetValue(key, out var value))
		{
			value = new List<AttributeMapping>();
			overrides.Add(key, value);
		}
		else if (value.Contains(item))
		{
			throw new InvalidOperationException($"Attribute ({attribute}) already set for Type {type.FullName}, Member {member}");
		}
		value.Add(item);
	}

	public _003C7f6c7070_002D6c7a_002D4444_002D8623_002D48498d557692_003EYamlAttributeOverrides Clone()
	{
		_003C7f6c7070_002D6c7a_002D4444_002D8623_002D48498d557692_003EYamlAttributeOverrides obj = new _003C7f6c7070_002D6c7a_002D4444_002D8623_002D48498d557692_003EYamlAttributeOverrides();
		foreach (KeyValuePair<AttributeKey, List<AttributeMapping>> @override in overrides)
		{
			foreach (AttributeMapping item in @override.Value)
			{
				obj.Add(item.RegisteredType, @override.Key.PropertyName, item.Attribute);
			}
		}
		return obj;
	}

	public void Add<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TClass>(Expression<Func<TClass, object>> propertyAccessor, Attribute attribute)
	{
		PropertyInfo propertyInfo = _003Ca11f62e4_002D58f5_002D412b_002Db246_002D833482eae852_003EExpressionExtensions.AsProperty(propertyAccessor);
		Add(typeof(TClass), propertyInfo.Name, attribute);
	}
}
