using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

internal class AliasEventInfo : EventInfo
{
	public AnchorName Alias { get; }

	public bool NeedsExpansion { get; set; }

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
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
