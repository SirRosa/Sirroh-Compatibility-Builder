using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.NamingConventions;

internal sealed class HyphenatedNamingConvention : INamingConvention
{
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(1)]
	public static readonly INamingConvention Instance = new HyphenatedNamingConvention();

	[Obsolete("Use the Instance static field instead of creating new instances")]
	public HyphenatedNamingConvention()
	{
	}

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
	public string Apply(string value)
	{
		return value.FromCamelCase("-");
	}
}
