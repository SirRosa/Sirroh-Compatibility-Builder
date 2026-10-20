using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Serialization;

namespace YamlDotNet.Helpers;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal interface IFsharpHelper
{
	bool IsOptionType(Type t);

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	Type GetOptionUnderlyingType(Type t);

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	object GetValue(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor objectDescriptor);

	bool IsFsharpListType(Type t);

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	object CreateFsharpListFromArray(Type t, Type itemsType, Array arr);
}
