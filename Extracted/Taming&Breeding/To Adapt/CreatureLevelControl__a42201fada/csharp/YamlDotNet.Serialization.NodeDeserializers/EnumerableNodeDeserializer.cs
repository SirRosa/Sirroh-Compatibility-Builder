using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.NodeDeserializers;

internal sealed class EnumerableNodeDeserializer : INodeDeserializer
{
	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	bool INodeDeserializer.Deserialize(IParser parser, Type expectedType, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] out object value)
	{
		Type type;
		if (expectedType == typeof(IEnumerable))
		{
			type = typeof(object);
		}
		else
		{
			Type implementedGenericInterface = ReflectionUtility.GetImplementedGenericInterface(expectedType, typeof(IEnumerable<>));
			if (implementedGenericInterface != expectedType)
			{
				value = null;
				return false;
			}
			type = implementedGenericInterface.GetGenericArguments()[0];
		}
		Type arg = typeof(List<>).MakeGenericType(type);
		value = nestedObjectDeserializer(parser, arg);
		return true;
	}
}
