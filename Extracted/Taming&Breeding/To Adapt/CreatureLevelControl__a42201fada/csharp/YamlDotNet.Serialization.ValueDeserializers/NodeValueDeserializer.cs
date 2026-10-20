using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.ValueDeserializers;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class NodeValueDeserializer : IValueDeserializer
{
	private readonly IList<INodeDeserializer> deserializers;

	private readonly IList<INodeTypeResolver> typeResolvers;

	public NodeValueDeserializer(IList<INodeDeserializer> deserializers, IList<INodeTypeResolver> typeResolvers)
	{
		this.deserializers = deserializers ?? throw new ArgumentNullException("deserializers");
		this.typeResolvers = typeResolvers ?? throw new ArgumentNullException("typeResolvers");
	}

	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	public object DeserializeValue(IParser parser, Type expectedType, SerializerState state, IValueDeserializer nestedObjectDeserializer)
	{
		parser.Accept<NodeEvent>(out var @event);
		Type typeFromEvent = GetTypeFromEvent(@event, expectedType);
		try
		{
			foreach (INodeDeserializer deserializer in deserializers)
			{
				if (deserializer.Deserialize(parser, typeFromEvent, [return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] (IParser r, Type t) => nestedObjectDeserializer.DeserializeValue(r, t, state, nestedObjectDeserializer), out var value))
				{
					return TypeConverter.ChangeType(value, expectedType);
				}
			}
		}
		catch (YamlException)
		{
			throw;
		}
		catch (Exception innerException)
		{
			throw new YamlException(@event?.Start ?? Mark.Empty, @event?.End ?? Mark.Empty, "Exception during deserialization", innerException);
		}
		throw new YamlException(@event?.Start ?? Mark.Empty, @event?.End ?? Mark.Empty, "No node deserializer was able to deserialize the node into type " + expectedType.AssemblyQualifiedName);
	}

	private Type GetTypeFromEvent([_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] NodeEvent nodeEvent, Type currentType)
	{
		using (IEnumerator<INodeTypeResolver> enumerator = typeResolvers.GetEnumerator())
		{
			while (enumerator.MoveNext() && !enumerator.Current.Resolve(nodeEvent, ref currentType))
			{
			}
		}
		return currentType;
	}
}
