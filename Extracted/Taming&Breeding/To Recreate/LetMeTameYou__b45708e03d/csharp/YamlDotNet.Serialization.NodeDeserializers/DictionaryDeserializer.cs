using System;
using System.Collections;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal abstract class DictionaryDeserializer
{
	private readonly bool duplicateKeyChecking;

	public DictionaryDeserializer(bool duplicateKeyChecking)
	{
		this.duplicateKeyChecking = duplicateKeyChecking;
	}

	private void TryAssign(IDictionary result, object key, object value, _003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart propertyName)
	{
		if (duplicateKeyChecking && result.Contains(key))
		{
			throw new _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(propertyName.Start, propertyName.End, $"Encountered duplicate key {key}");
		}
		result[key] = value;
	}

	protected virtual void Deserialize(Type tKey, Type tValue, _003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser, Type, object> nestedObjectDeserializer, IDictionary result, _003Ccf1bb9c3_002D9707_002D4afa_002Daa6b_002D02a0a9430a5f_003EObjectDeserializer rootDeserializer)
	{
		_003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart property = parser.Consume<_003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart>();
		_003C446b682a_002D36b6_002D46ea_002Db1c3_002D0616b60e5c52_003EMappingEnd @event;
		while (!parser.TryConsume<_003C446b682a_002D36b6_002D46ea_002Db1c3_002D0616b60e5c52_003EMappingEnd>(out @event))
		{
			object key = nestedObjectDeserializer(parser, tKey);
			object value = nestedObjectDeserializer(parser, tValue);
			_003C9bf148ef_002Dec3e_002D48e2_002Db55a_002D857a8fcd2a5e_003EIValuePromise obj = value as _003C9bf148ef_002Dec3e_002D48e2_002Db55a_002D857a8fcd2a5e_003EIValuePromise;
			if (key is _003C9bf148ef_002Dec3e_002D48e2_002Db55a_002D857a8fcd2a5e_003EIValuePromise obj2)
			{
				if (obj == null)
				{
					obj2.ValueAvailable += [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)] (object v) =>
					{
						result[v] = value;
					};
					continue;
				}
				bool hasFirstPart = false;
				obj2.ValueAvailable += [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)] (object v) =>
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
				obj.ValueAvailable += [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)] (object v) =>
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
				throw new ArgumentException("Empty key names are not supported yet.", "tKey");
			}
			if (obj == null)
			{
				TryAssign(result, key, value, property);
				continue;
			}
			obj.ValueAvailable += [_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)] (object v) =>
			{
				result[key] = v;
			};
		}
	}
}
