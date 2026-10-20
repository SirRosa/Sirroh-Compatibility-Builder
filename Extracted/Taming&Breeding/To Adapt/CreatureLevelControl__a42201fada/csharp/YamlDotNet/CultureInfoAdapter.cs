using System;
using System.Globalization;
using System.Runtime.CompilerServices;

namespace YamlDotNet;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class CultureInfoAdapter : CultureInfo
{
	private readonly IFormatProvider provider;

	public CultureInfoAdapter(CultureInfo baseCulture, IFormatProvider provider)
		: base(baseCulture.LCID)
	{
		this.provider = provider;
	}

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
	public override object GetFormat(Type formatType)
	{
		return provider.GetFormat(formatType);
	}
}
