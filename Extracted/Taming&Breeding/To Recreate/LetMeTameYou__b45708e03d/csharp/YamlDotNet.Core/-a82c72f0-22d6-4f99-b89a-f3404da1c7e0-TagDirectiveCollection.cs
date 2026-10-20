using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Tokens;

namespace YamlDotNet.Core;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 0, 1, 1 })]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal sealed class _003Ca82c72f0_002D22d6_002D4f99_002Db89a_002Df3404da1c7e0_003ETagDirectiveCollection : KeyedCollection<string, _003C7077c70a_002D7b6b_002D4819_002D8257_002D8431e277734c_003ETagDirective>
{
	public _003Ca82c72f0_002D22d6_002D4f99_002Db89a_002Df3404da1c7e0_003ETagDirectiveCollection()
	{
	}

	public _003Ca82c72f0_002D22d6_002D4f99_002Db89a_002Df3404da1c7e0_003ETagDirectiveCollection(IEnumerable<_003C7077c70a_002D7b6b_002D4819_002D8257_002D8431e277734c_003ETagDirective> tagDirectives)
	{
		foreach (_003C7077c70a_002D7b6b_002D4819_002D8257_002D8431e277734c_003ETagDirective tagDirective in tagDirectives)
		{
			Add(tagDirective);
		}
	}

	protected override string GetKeyForItem(_003C7077c70a_002D7b6b_002D4819_002D8257_002D8431e277734c_003ETagDirective item)
	{
		return item.Handle;
	}

	public new bool Contains(_003C7077c70a_002D7b6b_002D4819_002D8257_002D8431e277734c_003ETagDirective directive)
	{
		return Contains(GetKeyForItem(directive));
	}
}
