using System;
using System.Collections;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal interface IObjectFactory
{
	object Create(Type type);

	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	object CreatePrimitive(Type type);

	bool GetDictionary(IObjectDescriptor descriptor, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] out IDictionary dictionary, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 2, 1 })] out Type[] genericArguments);

	Type GetValueType(Type type);
}
