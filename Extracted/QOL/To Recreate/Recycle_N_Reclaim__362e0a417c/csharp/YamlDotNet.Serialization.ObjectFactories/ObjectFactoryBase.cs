using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Helpers;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.ObjectFactories;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal abstract class ObjectFactoryBase : IObjectFactory
{
	public abstract object Create(Type type);

	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public virtual object CreatePrimitive(Type type)
	{
		if (!type.IsValueType())
		{
			return null;
		}
		return Activator.CreateInstance(type);
	}

	public virtual bool GetDictionary(IObjectDescriptor descriptor, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] out IDictionary dictionary, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 2, 1 })] out Type[] genericArguments)
	{
		Type implementedGenericInterface = ReflectionUtility.GetImplementedGenericInterface(descriptor.Type, typeof(IDictionary<, >));
		if (implementedGenericInterface != null)
		{
			genericArguments = implementedGenericInterface.GetGenericArguments();
			object obj = Activator.CreateInstance(typeof(GenericDictionaryToNonGenericAdapter<, >).MakeGenericType(genericArguments), descriptor.Value);
			dictionary = obj as IDictionary;
			return true;
		}
		genericArguments = null;
		dictionary = null;
		return false;
	}

	public virtual Type GetValueType(Type type)
	{
		Type implementedGenericInterface = ReflectionUtility.GetImplementedGenericInterface(type, typeof(IEnumerable<>));
		if (!(implementedGenericInterface != null))
		{
			return typeof(object);
		}
		return implementedGenericInterface.GetGenericArguments()[0];
	}
}
