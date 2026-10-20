using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class ObjectNodeDeserializer : INodeDeserializer
{
	private readonly IObjectFactory objectFactory;

	private readonly ITypeInspector typeDescriptor;

	private readonly bool ignoreUnmatched;

	public ObjectNodeDeserializer(IObjectFactory objectFactory, ITypeInspector typeDescriptor, bool ignoreUnmatched)
	{
		this.objectFactory = objectFactory ?? throw new ArgumentNullException("objectFactory");
		this.typeDescriptor = typeDescriptor ?? throw new ArgumentNullException("typeDescriptor");
		this.ignoreUnmatched = ignoreUnmatched;
	}

	bool INodeDeserializer.Deserialize(IParser parser, Type expectedType, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] out object value)
	{
		if (!parser.TryConsume<MappingStart>(out var _))
		{
			value = null;
			return false;
		}
		value = objectFactory.Create(expectedType);
		MappingEnd event2;
		while (!parser.TryConsume<MappingEnd>(out event2))
		{
			Scalar scalar = parser.Consume<Scalar>();
			IPropertyDescriptor property = typeDescriptor.GetProperty(expectedType, null, scalar.Value, ignoreUnmatched);
			if (property == null)
			{
				parser.SkipThisAndNestedEvents();
				continue;
			}
			object obj = nestedObjectDeserializer(parser, property.Type);
			if (obj is IValuePromise valuePromise)
			{
				object valueRef = value;
				valuePromise.ValueAvailable += [_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)] (object v) =>
				{
					object value3 = TypeConverter.ChangeType(v, property.Type);
					property.Write(valueRef, value3);
				};
			}
			else
			{
				object value2 = TypeConverter.ChangeType(obj, property.Type);
				property.Write(value, value2);
			}
		}
		return true;
	}
}
