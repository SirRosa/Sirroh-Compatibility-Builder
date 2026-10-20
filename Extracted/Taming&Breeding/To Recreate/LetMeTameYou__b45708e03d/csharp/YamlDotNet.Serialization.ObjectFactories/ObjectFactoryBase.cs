using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Helpers;

namespace YamlDotNet.Serialization.ObjectFactories;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal abstract class ObjectFactoryBase : _003C86c651de_002D54a3_002D4b26_002D8421_002D77d942e1f3bb_003EIObjectFactory
{
	public abstract object Create(Type type);

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public virtual object CreatePrimitive(Type type)
	{
		if (!_003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.IsValueType(type))
		{
			return null;
		}
		return Activator.CreateInstance(type);
	}

	public virtual void ExecuteOnDeserialized(object value)
	{
	}

	public virtual void ExecuteOnDeserializing(object value)
	{
	}

	public virtual void ExecuteOnSerialized(object value)
	{
	}

	public virtual void ExecuteOnSerializing(object value)
	{
	}

	public virtual bool GetDictionary(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor descriptor, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] out IDictionary dictionary, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 2, 1 })] out Type[] genericArguments)
	{
		Type implementationOfOpenGenericInterface = descriptor.Type.GetImplementationOfOpenGenericInterface(typeof(IDictionary<, >));
		if (implementationOfOpenGenericInterface != null)
		{
			genericArguments = implementationOfOpenGenericInterface.GetGenericArguments();
			object obj = Activator.CreateInstance(typeof(_003Cd373bcab_002D2c3e_002D415f_002Db75b_002D9b34da7d0852_003EGenericDictionaryToNonGenericAdapter<, >).MakeGenericType(genericArguments), descriptor.Value);
			dictionary = obj as IDictionary;
			return true;
		}
		genericArguments = null;
		dictionary = null;
		return false;
	}

	public virtual Type GetValueType(Type type)
	{
		Type implementationOfOpenGenericInterface = type.GetImplementationOfOpenGenericInterface(typeof(IEnumerable<>));
		return (implementationOfOpenGenericInterface != null) ? implementationOfOpenGenericInterface.GetGenericArguments()[0] : typeof(object);
	}
}
