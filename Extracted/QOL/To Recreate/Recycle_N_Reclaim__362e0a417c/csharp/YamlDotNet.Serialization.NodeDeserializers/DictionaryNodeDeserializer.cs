using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Helpers;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal class DictionaryNodeDeserializer : DictionaryDeserializer, INodeDeserializer
{
	private readonly IObjectFactory objectFactory;

	public DictionaryNodeDeserializer(IObjectFactory objectFactory, bool duplicateKeyChecking)
		: base(duplicateKeyChecking)
	{
		this.objectFactory = objectFactory ?? throw new ArgumentNullException("objectFactory");
	}

	public bool Deserialize(IParser parser, Type expectedType, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] out object value)
	{
		Type implementedGenericInterface = ReflectionUtility.GetImplementedGenericInterface(expectedType, typeof(IDictionary<, >));
		Type type;
		Type type2;
		IDictionary dictionary;
		if (implementedGenericInterface != null)
		{
			Type[] genericArguments = implementedGenericInterface.GetGenericArguments();
			type = genericArguments[0];
			type2 = genericArguments[1];
			value = objectFactory.Create(expectedType);
			dictionary = value as IDictionary;
			if (dictionary == null)
			{
				dictionary = (IDictionary)Activator.CreateInstance(typeof(GenericDictionaryToNonGenericAdapter<, >).MakeGenericType(type, type2), value);
			}
		}
		else
		{
			if (!typeof(IDictionary).IsAssignableFrom(expectedType))
			{
				value = null;
				return false;
			}
			type = typeof(object);
			type2 = typeof(object);
			value = objectFactory.Create(expectedType);
			dictionary = (IDictionary)value;
		}
		Deserialize(type, type2, parser, nestedObjectDeserializer, dictionary);
		return true;
	}
}
