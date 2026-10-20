using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Tokens;

namespace YamlDotNet.Core;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(new byte[] { 0, 1, 1 })]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal sealed class TagDirectiveCollection : KeyedCollection<string, TagDirective>
{
	public TagDirectiveCollection()
	{
	}

	public TagDirectiveCollection(IEnumerable<TagDirective> tagDirectives)
	{
		foreach (TagDirective tagDirective in tagDirectives)
		{
			Add(tagDirective);
		}
	}

	protected override string GetKeyForItem(TagDirective item)
	{
		return item.Handle;
	}

	public new bool Contains(TagDirective directive)
	{
		return Contains(GetKeyForItem(directive));
	}
}
