using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C770f57fd_002Dbae1_002D4ccf_002D8ccf_002D88c849ae3ab1_003EScalarEventInfo : _003C68dcbd18_002Db9a3_002D4f62_002D9af5_002Db28bc905cb81_003EObjectEventInfo
{
	public string RenderedValue { get; set; }

	public _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle Style { get; set; }

	public bool IsPlainImplicit { get; set; }

	public bool IsQuotedImplicit { get; set; }

	public _003C770f57fd_002Dbae1_002D4ccf_002D8ccf_002D88c849ae3ab1_003EScalarEventInfo(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor source)
		: base(source)
	{
		Style = source.ScalarStyle;
		RenderedValue = string.Empty;
	}
}
