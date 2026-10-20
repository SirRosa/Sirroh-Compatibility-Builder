using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

internal class AliasEventInfo : EventInfo
{
	public AnchorName Alias { get; }

	public bool NeedsExpansion { get; set; }

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
	public AliasEventInfo(IObjectDescriptor source, AnchorName alias)
		: base(source)
	{
		if (alias.IsEmpty)
		{
			throw new ArgumentNullException("alias");
		}
		Alias = alias;
	}
}
