using System;
using System.Globalization;
using System.Runtime.CompilerServices;

namespace YamlDotNet;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C85e2c2b0_002D3cc5_002D4133_002Db3c9_002D1ecb8e6d278d_003ECultureInfoAdapter : CultureInfo
{
	private readonly IFormatProvider provider;

	public _003C85e2c2b0_002D3cc5_002D4133_002Db3c9_002D1ecb8e6d278d_003ECultureInfoAdapter(CultureInfo baseCulture, IFormatProvider provider)
		: base(baseCulture.Name)
	{
		this.provider = provider;
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public override object GetFormat(Type formatType)
	{
		return provider.GetFormat(formatType);
	}
}
