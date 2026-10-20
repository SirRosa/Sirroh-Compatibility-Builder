using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.Utilities;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal static class ReflectionUtility
{
	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	public static Type GetImplementedGenericInterface(Type type, Type genericInterfaceType)
	{
		foreach (Type implementedInterface in GetImplementedInterfaces(type))
		{
			if (implementedInterface.IsGenericType() && implementedInterface.GetGenericTypeDefinition() == genericInterfaceType)
			{
				return implementedInterface;
			}
		}
		return null;
	}

	public static IEnumerable<Type> GetImplementedInterfaces(Type type)
	{
		if (type.IsInterface())
		{
			yield return type;
		}
		Type[] interfaces = type.GetInterfaces();
		for (int i = 0; i < interfaces.Length; i++)
		{
			yield return interfaces[i];
		}
	}
}
