using System;
using System.Collections;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Serialization.ObjectFactories;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class StaticCollectionNodeDeserializer : INodeDeserializer
{
	private readonly StaticObjectFactory factory;

	public StaticCollectionNodeDeserializer(StaticObjectFactory factory)
	{
		this.factory = factory ?? throw new ArgumentNullException("factory");
	}

	public bool Deserialize(IParser parser, Type expectedType, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] out object value)
	{
		if (!factory.IsList(expectedType))
		{
			value = null;
			return false;
		}
		DeserializeHelper(result: (IList)(value = factory.Create(expectedType) as IList), tItem: factory.GetValueType(expectedType), parser: parser, nestedObjectDeserializer: nestedObjectDeserializer, factory: factory);
		return true;
	}

	internal static void DeserializeHelper(Type tItem, IParser parser, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, IList result, IObjectFactory factory)
	{
		parser.Consume<SequenceStart>();
		SequenceEnd @event;
		while (!parser.TryConsume<SequenceEnd>(out @event))
		{
			_ = parser.Current;
			object obj = nestedObjectDeserializer(parser, tItem);
			if (obj is IValuePromise valuePromise)
			{
				int index = result.Add(factory.CreatePrimitive(tItem));
				valuePromise.ValueAvailable += [_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)] (object v) =>
				{
					result[index] = v;
				};
			}
			else
			{
				result.Add(obj);
			}
		}
	}
}
