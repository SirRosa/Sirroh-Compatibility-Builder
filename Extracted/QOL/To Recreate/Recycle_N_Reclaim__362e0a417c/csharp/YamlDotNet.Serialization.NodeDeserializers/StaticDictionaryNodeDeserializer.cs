using System;
using System.Collections;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Serialization.ObjectFactories;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal class StaticDictionaryNodeDeserializer : DictionaryDeserializer, INodeDeserializer
{
	private readonly StaticObjectFactory _objectFactory;

	public StaticDictionaryNodeDeserializer(StaticObjectFactory objectFactory, bool duplicateKeyChecking)
		: base(duplicateKeyChecking)
	{
		_objectFactory = objectFactory ?? throw new ArgumentNullException("objectFactory");
	}

	public bool Deserialize(IParser reader, Type expectedType, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<IParser, Type, object> nestedObjectDeserializer, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] out object value)
	{
		if (_objectFactory.IsDictionary(expectedType))
		{
			if (!(_objectFactory.Create(expectedType) is IDictionary dictionary))
			{
				value = null;
				return false;
			}
			Type keyType = _objectFactory.GetKeyType(expectedType);
			Type valueType = _objectFactory.GetValueType(expectedType);
			value = dictionary;
			base.Deserialize(keyType, valueType, reader, nestedObjectDeserializer, dictionary);
			return true;
		}
		value = null;
		return false;
	}
}
