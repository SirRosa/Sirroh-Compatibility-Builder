using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class ScalarEventInfo : ObjectEventInfo
{
	public string RenderedValue { get; set; }

	public ScalarStyle Style { get; set; }

	public bool IsPlainImplicit { get; set; }

	public bool IsQuotedImplicit { get; set; }

	public ScalarEventInfo(IObjectDescriptor source)
		: base(source)
	{
		Style = source.ScalarStyle;
		RenderedValue = string.Empty;
	}
}
