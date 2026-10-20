using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.ValueDeserializers;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class NodeValueDeserializer : IValueDeserializer
{
	private readonly IList<INodeDeserializer> deserializers;

	private readonly IList<INodeTypeResolver> typeResolvers;

	private readonly ITypeConverter typeConverter;

	public NodeValueDeserializer(IList<INodeDeserializer> deserializers, IList<INodeTypeResolver> typeResolvers, ITypeConverter typeConverter)
	{
		this.deserializers = deserializers ?? throw new ArgumentNullException("deserializers");
		this.typeResolvers = typeResolvers ?? throw new ArgumentNullException("typeResolvers");
		this.typeConverter = typeConverter ?? throw new ArgumentNullException("typeConverter");
	}

	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public object DeserializeValue(IParser parser, Type expectedType, SerializerState state, IValueDeserializer nestedObjectDeserializer)
	{
		parser.Accept<NodeEvent>(out var @event);
		Type typeFromEvent = GetTypeFromEvent(@event, expectedType);
		try
		{
			foreach (INodeDeserializer deserializer in deserializers)
			{
				if (deserializer.Deserialize(parser, typeFromEvent, [return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] (IParser r, Type t) => nestedObjectDeserializer.DeserializeValue(r, t, state, nestedObjectDeserializer), out var value))
				{
					return typeConverter.ChangeType(value, expectedType);
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

	private Type GetTypeFromEvent([_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] NodeEvent nodeEvent, Type currentType)
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
