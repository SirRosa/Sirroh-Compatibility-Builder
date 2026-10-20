using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.NamingConventions;

internal sealed class PascalCaseNamingConvention : INamingConvention
{
	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(1)]
	public static readonly INamingConvention Instance = new PascalCaseNamingConvention();

	[Obsolete("Use the Instance static field instead of creating new instances")]
	public PascalCaseNamingConvention()
	{
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public string Apply(string value)
	{
		return value.ToPascalCase();
	}
}
