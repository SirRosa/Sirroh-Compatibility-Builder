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

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class YamlAttributeOverrides
{
	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
	private struct AttributeKey(Type attributeType, string propertyName)
	{
		public readonly Type AttributeType = attributeType;

		public readonly string PropertyName = propertyName;

		[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
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
			return YamlDotNet.Core.HashCode.CombineHashCodes(AttributeType.GetHashCode(), PropertyName.GetHashCode());
		}
	}

	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
	private sealed class AttributeMapping
	{
		public readonly Type RegisteredType;

		public readonly Attribute Attribute;

		public AttributeMapping(Type registeredType, Attribute attribute)
		{
			RegisteredType = registeredType;
			Attribute = attribute;
		}

		[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
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
			return YamlDotNet.Core.HashCode.CombineHashCodes(RegisteredType.GetHashCode(), Attribute.GetHashCode());
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
				type = type.BaseType();
			}
			if (Enumerable.Contains(matchType.GetInterfaces(), RegisteredType))
			{
				return num;
			}
			return 0;
		}
	}

	private readonly Dictionary<AttributeKey, List<AttributeMapping>> overrides = new Dictionary<AttributeKey, List<AttributeMapping>>();

	[return: MaybeNull]
	public T GetAttribute<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)] T>(Type type, string member) where T : Attribute
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

	public YamlAttributeOverrides Clone()
	{
		YamlAttributeOverrides yamlAttributeOverrides = new YamlAttributeOverrides();
		foreach (KeyValuePair<AttributeKey, List<AttributeMapping>> @override in overrides)
		{
			foreach (AttributeMapping item in @override.Value)
			{
				yamlAttributeOverrides.Add(item.RegisteredType, @override.Key.PropertyName, item.Attribute);
			}
		}
		return yamlAttributeOverrides;
	}

	public void Add<[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] TClass>(Expression<Func<TClass, object>> propertyAccessor, Attribute attribute)
	{
		PropertyInfo propertyInfo = propertyAccessor.AsProperty();
		Add(typeof(TClass), propertyInfo.Name, attribute);
	}
}
