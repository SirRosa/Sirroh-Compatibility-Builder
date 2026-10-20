using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Helpers;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class DictionaryNodeDeserializer : INodeDeserializer
{
	private readonly IObjectFactory objectFactory;

	public DictionaryNodeDeserializer(IObjectFactory objectFactory)
	{
		this.objectFactory = objectFactory ?? throw new ArgumentNullException("objectFactory");
	}

	bool INodeDeserializer.Deserialize(IParser parser, Type expectedType, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] out object value)
	{
		Type implementedGenericInterface = ReflectionUtility.GetImplementedGenericInterface(expectedType, typeof(IDictionary<, >));
		Type type;
		Type type2;
		IDictionary dictionary;
		if (implementedGenericInterface != null)
		{
			Type[] genericArguments = implementedGenericInterface.GetGenericArguments();
			type = genericArguments[0];
			type2 = genericArguments[1];
			value = objectFactory.Create(expectedType);
			dictionary = value as IDictionary;
			if (dictionary == null)
			{
				dictionary = (IDictionary)Activator.CreateInstance(typeof(GenericDictionaryToNonGenericAdapter<, >).MakeGenericType(type, type2), value);
			}
		}
		else
		{
			if (!typeof(IDictionary).IsAssignableFrom(expectedType))
			{
				value = null;
				return false;
			}
			type = typeof(object);
			type2 = typeof(object);
			value = objectFactory.Create(expectedType);
			dictionary = (IDictionary)value;
		}
		DeserializeHelper(type, type2, parser, nestedObjectDeserializer, dictionary);
		return true;
	}

	private static void DeserializeHelper(Type tKey, Type tValue, IParser parser, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, IDictionary result)
	{
		parser.Consume<MappingStart>();
		MappingEnd @event;
		while (!parser.TryConsume<MappingEnd>(out @event))
		{
			object key = nestedObjectDeserializer(parser, tKey);
			object value = nestedObjectDeserializer(parser, tValue);
			IValuePromise valuePromise = value as IValuePromise;
			if (key is IValuePromise valuePromise2)
			{
				if (valuePromise == null)
				{
					valuePromise2.ValueAvailable += [_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)] (object v) =>
					{
						result[v] = value;
					};
					continue;
				}
				bool hasFirstPart = false;
				valuePromise2.ValueAvailable += [_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)] (object v) =>
				{
					if (hasFirstPart)
					{
						result[v] = value;
					}
					else
					{
						key = v;
						hasFirstPart = true;
					}
				};
				valuePromise.ValueAvailable += [_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)] (object v) =>
				{
					if (hasFirstPart)
					{
						result[key] = v;
					}
					else
					{
						value = v;
						hasFirstPart = true;
					}
				};
			}
			else if (valuePromise == null)
			{
				result[key] = value;
			}
			else
			{
				valuePromise.ValueAvailable += [_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)] (object v) =>
				{
					result[key] = v;
				};
			}
		}
	}
}
