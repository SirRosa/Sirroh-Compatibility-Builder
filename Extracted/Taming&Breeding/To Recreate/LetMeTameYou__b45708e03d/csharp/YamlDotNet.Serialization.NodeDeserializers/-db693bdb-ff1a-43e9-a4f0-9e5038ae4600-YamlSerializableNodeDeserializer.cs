using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal sealed class _003Cdb693bdb_002Dff1a_002D43e9_002Da4f0_002D9e5038ae4600_003EYamlSerializableNodeDeserializer : _003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer
{
	private readonly _003C86c651de_002D54a3_002D4b26_002D8421_002D77d942e1f3bb_003EIObjectFactory objectFactory;

	public _003Cdb693bdb_002Dff1a_002D43e9_002Da4f0_002D9e5038ae4600_003EYamlSerializableNodeDeserializer(_003C86c651de_002D54a3_002D4b26_002D8421_002D77d942e1f3bb_003EIObjectFactory objectFactory)
	{
		this.objectFactory = objectFactory;
	}

	public bool Deserialize(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, Type expectedType, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser, Type, object> nestedObjectDeserializer, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] out object value, _003Ccf1bb9c3_002D9707_002D4afa_002Daa6b_002D02a0a9430a5f_003EObjectDeserializer rootDeserializer)
	{
		if (typeof(_003Ce38b0a79_002D37d3_002D4ef7_002D9ea1_002D69439e91296b_003EIYamlSerializable).IsAssignableFrom(expectedType))
		{
			_003Ce38b0a79_002D37d3_002D4ef7_002D9ea1_002D69439e91296b_003EIYamlSerializable obj = (_003Ce38b0a79_002D37d3_002D4ef7_002D9ea1_002D69439e91296b_003EIYamlSerializable)objectFactory.Create(expectedType);
			obj.ReadYaml(parser);
			value = obj;
			return true;
		}
		value = null;
		return false;
	}
}
