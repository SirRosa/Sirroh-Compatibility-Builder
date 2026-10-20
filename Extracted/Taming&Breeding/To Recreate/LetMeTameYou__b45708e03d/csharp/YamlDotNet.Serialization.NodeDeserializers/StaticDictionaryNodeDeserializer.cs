using System;
using System.Collections;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Serialization.ObjectFactories;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal class StaticDictionaryNodeDeserializer : DictionaryDeserializer, _003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer
{
	private readonly StaticObjectFactory objectFactory;

	public StaticDictionaryNodeDeserializer(StaticObjectFactory objectFactory, bool duplicateKeyChecking)
		: base(duplicateKeyChecking)
	{
		this.objectFactory = objectFactory ?? throw new ArgumentNullException("objectFactory");
	}

	public bool Deserialize(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser reader, Type expectedType, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser, Type, object> nestedObjectDeserializer, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] out object value, _003Ccf1bb9c3_002D9707_002D4afa_002Daa6b_002D02a0a9430a5f_003EObjectDeserializer rootDeserializer)
	{
		if (objectFactory.IsDictionary(expectedType))
		{
			if (!(objectFactory.Create(expectedType) is IDictionary dictionary))
			{
				value = null;
				return false;
			}
			Type keyType = objectFactory.GetKeyType(expectedType);
			Type valueType = objectFactory.GetValueType(expectedType);
			value = dictionary;
			base.Deserialize(keyType, valueType, reader, nestedObjectDeserializer, dictionary, rootDeserializer);
			return true;
		}
		value = null;
		return false;
	}
}
