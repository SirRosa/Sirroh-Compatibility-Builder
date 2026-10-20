using System;
using System.Globalization;
using System.Runtime.CompilerServices;

namespace YamlDotNet;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class CultureInfoAdapter : CultureInfo
{
	private readonly IFormatProvider provider;

	public CultureInfoAdapter(CultureInfo baseCulture, IFormatProvider provider)
		: base(baseCulture.LCID)
	{
		this.provider = provider;
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
	public override object GetFormat(Type formatType)
	{
		return provider.GetFormat(formatType);
	}
}
