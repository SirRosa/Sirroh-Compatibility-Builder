using System;
using System.Collections;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal interface _003C86c651de_002D54a3_002D4b26_002D8421_002D77d942e1f3bb_003EIObjectFactory
{
	object Create(Type type);

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	object CreatePrimitive(Type type);

	bool GetDictionary(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor descriptor, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] out IDictionary dictionary, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 2, 1 })] out Type[] genericArguments);

	Type GetValueType(Type type);

	void ExecuteOnDeserializing(object value);

	void ExecuteOnDeserialized(object value);

	void ExecuteOnSerializing(object value);

	void ExecuteOnSerialized(object value);
}
