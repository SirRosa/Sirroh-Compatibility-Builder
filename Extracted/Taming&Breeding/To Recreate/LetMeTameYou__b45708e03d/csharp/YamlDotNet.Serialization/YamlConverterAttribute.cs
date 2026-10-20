using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[AttributeUsage(AttributeTargets.Property | AttributeTargets.Field)]
internal sealed class YamlConverterAttribute : Attribute
{
	public Type ConverterType { get; }

	public YamlConverterAttribute(Type converterType)
	{
		ConverterType = converterType;
	}
}
