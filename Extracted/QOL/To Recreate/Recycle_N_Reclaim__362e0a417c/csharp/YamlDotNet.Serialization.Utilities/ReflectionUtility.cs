using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.Utilities;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal static class ReflectionUtility
{
	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
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
