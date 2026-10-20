using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.NamingConventions;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003Cc7c1efe9_002D23fa_002D40e3_002D8597_002D02f79e5f0b62_003EUnderscoredNamingConvention : _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention
{
	public static readonly _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention Instance = new _003Cc7c1efe9_002D23fa_002D40e3_002D8597_002D02f79e5f0b62_003EUnderscoredNamingConvention();

	[Obsolete("Use the Instance static field instead of creating new instances")]
	public _003Cc7c1efe9_002D23fa_002D40e3_002D8597_002D02f79e5f0b62_003EUnderscoredNamingConvention()
	{
	}

	public string Apply(string value)
	{
		return _003C279aeba7_002D6dd3_002D45d5_002D9bd1_002Db0b92069b08d_003EStringExtensions.FromCamelCase(value, "_");
	}

	public string Reverse(string value)
	{
		return _003C279aeba7_002D6dd3_002D45d5_002D9bd1_002Db0b92069b08d_003EStringExtensions.ToPascalCase(value);
	}
}
