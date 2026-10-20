using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization.NamingConventions;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C4aa8658e_002D2183_002D4694_002Db0ce_002D777f343e803b_003ENullNamingConvention : _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention
{
	public static readonly _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention Instance = new _003C4aa8658e_002D2183_002D4694_002Db0ce_002D777f343e803b_003ENullNamingConvention();

	[Obsolete("Use the Instance static field instead of creating new instances")]
	public _003C4aa8658e_002D2183_002D4694_002Db0ce_002D777f343e803b_003ENullNamingConvention()
	{
	}

	public string Apply(string value)
	{
		return value;
	}

	public string Reverse(string value)
	{
		return value;
	}
}
