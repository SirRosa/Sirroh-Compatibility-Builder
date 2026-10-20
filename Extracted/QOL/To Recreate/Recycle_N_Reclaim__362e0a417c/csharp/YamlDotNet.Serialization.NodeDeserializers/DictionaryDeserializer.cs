using System;
using System.Collections;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal abstract class DictionaryDeserializer
{
	private readonly bool duplicateKeyChecking;

	public DictionaryDeserializer(bool duplicateKeyChecking)
	{
		this.duplicateKeyChecking = duplicateKeyChecking;
	}

	private void TryAssign(IDictionary result, object key, object value, MappingStart propertyName)
	{
		if (duplicateKeyChecking && result.Contains(key))
		{
			throw new YamlException(propertyName.Start, propertyName.End, $"Encountered duplicate key {key}");
		}
		result[key] = value;
	}

	protected virtual void Deserialize(Type tKey, Type tValue, IParser parser, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, IDictionary result)
	{
		MappingStart property = parser.Consume<MappingStart>();
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
					valuePromise2.ValueAvailable += [_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)] (object v) =>
					{
						result[v] = value;
					};
					continue;
				}
				bool hasFirstPart = false;
				valuePromise2.ValueAvailable += [_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)] (object v) =>
				{
					if (hasFirstPart)
					{
						TryAssign(result, v, value, property);
					}
					else
					{
						key = v;
						hasFirstPart = true;
					}
				};
				valuePromise.ValueAvailable += [_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)] (object v) =>
				{
					if (hasFirstPart)
					{
						TryAssign(result, key, v, property);
					}
					else
					{
						value = v;
						hasFirstPart = true;
					}
				};
				continue;
			}
			if (key == null)
			{
				throw new ArgumentException("Empty key names are not supported yet.", "key");
			}
			if (valuePromise == null)
			{
				TryAssign(result, key, value, property);
				continue;
			}
			valuePromise.ValueAvailable += [_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)] (object v) =>
			{
				result[key] = v;
			};
		}
	}
}
