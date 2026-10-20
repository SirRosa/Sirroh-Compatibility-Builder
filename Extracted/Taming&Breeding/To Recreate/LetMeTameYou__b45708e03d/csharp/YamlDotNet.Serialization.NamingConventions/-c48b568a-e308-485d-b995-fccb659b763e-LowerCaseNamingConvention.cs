using System.Globalization;
using System.Runtime.CompilerServices;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.NamingConventions;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003Cc48b568a_002De308_002D485d_002Db995_002Dfccb659b763e_003ELowerCaseNamingConvention : _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention
{
	public static readonly _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention Instance = new _003Cc48b568a_002De308_002D485d_002Db995_002Dfccb659b763e_003ELowerCaseNamingConvention();

	private _003Cc48b568a_002De308_002D485d_002Db995_002Dfccb659b763e_003ELowerCaseNamingConvention()
	{
	}

	public string Apply(string value)
	{
		return _003C279aeba7_002D6dd3_002D45d5_002D9bd1_002Db0b92069b08d_003EStringExtensions.ToCamelCase(value).ToLower(CultureInfo.InvariantCulture);
	}

	public string Reverse(string value)
	{
		if (string.IsNullOrEmpty(value))
		{
			return value;
		}
		return char.ToUpperInvariant(value[0]) + value.Substring(1);
	}
}
