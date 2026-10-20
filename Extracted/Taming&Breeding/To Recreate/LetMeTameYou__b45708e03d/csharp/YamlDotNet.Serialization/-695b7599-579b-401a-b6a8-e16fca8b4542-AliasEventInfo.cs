using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

internal class _003C695b7599_002D579b_002D401a_002Db6a8_002De16fca8b4542_003EAliasEventInfo : _003C69c46928_002D3464_002D45e3_002Db68c_002Dad66c35dc08c_003EEventInfo
{
	public _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName Alias { get; }

	public bool NeedsExpansion { get; set; }

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
	public _003C695b7599_002D579b_002D401a_002Db6a8_002De16fca8b4542_003EAliasEventInfo(_003C7939ce99_002D9715_002D4aac_002D881a_002Dac56bffa0212_003EIObjectDescriptor source, _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName alias)
		: base(source)
	{
		if (alias.IsEmpty)
		{
			throw new ArgumentNullException("alias");
		}
		Alias = alias;
	}
}
