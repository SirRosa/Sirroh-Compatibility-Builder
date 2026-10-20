using System;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal abstract class _003C69c46928_002D3464_002D45e3_002Db68c_002Dad66c35dc08c_003EEventInfo
{
	public _003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor Source { get; }

	protected _003C69c46928_002D3464_002D45e3_002Db68c_002Dad66c35dc08c_003EEventInfo(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor source)
	{
		Source = source ?? throw new ArgumentNullException("source");
	}
}
