using System;
using System.Collections;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.NodeDeserializers;

internal abstract class CollectionDeserializer
{
	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	protected static void DeserializeHelper(Type tItem, IParser parser, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, IList result, bool canUpdate, IObjectFactory objectFactory)
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
				int index = result.Add(objectFactory.CreatePrimitive(tItem));
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
