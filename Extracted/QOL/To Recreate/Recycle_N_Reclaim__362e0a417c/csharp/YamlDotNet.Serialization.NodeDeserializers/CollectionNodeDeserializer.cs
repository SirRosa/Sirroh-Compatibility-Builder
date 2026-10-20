using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Helpers;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class CollectionNodeDeserializer : INodeDeserializer
{
	private readonly IObjectFactory objectFactory;

	public CollectionNodeDeserializer(IObjectFactory objectFactory)
	{
		this.objectFactory = objectFactory ?? throw new ArgumentNullException("objectFactory");
	}

	public bool Deserialize(IParser parser, Type expectedType, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] out object value)
	{
		bool canUpdate = true;
		Type implementedGenericInterface = ReflectionUtility.GetImplementedGenericInterface(expectedType, typeof(ICollection<>));
		Type type;
		IList list;
		if (implementedGenericInterface != null)
		{
			type = implementedGenericInterface.GetGenericArguments()[0];
			value = objectFactory.Create(expectedType);
			list = value as IList;
			if (list == null)
			{
				canUpdate = ReflectionUtility.GetImplementedGenericInterface(expectedType, typeof(IList<>)) != null;
				list = (IList)Activator.CreateInstance(typeof(GenericCollectionToNonGenericAdapter<>).MakeGenericType(type), value);
			}
		}
		else
		{
			if (!typeof(IList).IsAssignableFrom(expectedType))
			{
				value = null;
				return false;
			}
			type = typeof(object);
			value = objectFactory.Create(expectedType);
			list = (IList)value;
		}
		DeserializeHelper(type, parser, nestedObjectDeserializer, list, canUpdate);
		return true;
	}

	internal static void DeserializeHelper(Type tItem, IParser parser, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, IList result, bool canUpdate)
	{
		parser.Consume<SequenceStart>();
		SequenceEnd @event;
		while (!parser.TryConsume<SequenceEnd>(out @event))
		{
			ParsingEvent current = parser.Current;
			object obj = nestedObjectDeserializer(parser, tItem);
			if (obj is IValuePromise valuePromise)
			{
				if (!canUpdate)
				{
					throw new ForwardAnchorNotSupportedException(current?.Start ?? Mark.Empty, current?.End ?? Mark.Empty, "Forward alias references are not allowed because this type does not implement IList<>");
				}
				int index = result.Add(tItem.IsValueType() ? Activator.CreateInstance(tItem) : null);
				valuePromise.ValueAvailable += [_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)] (object v) =>
				{
					result[index] = TypeConverter.ChangeType(v, tItem);
				};
			}
			else
			{
				result.Add(TypeConverter.ChangeType(obj, tItem));
			}
		}
	}
}
