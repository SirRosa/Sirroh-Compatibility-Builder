using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Runtime.CompilerServices;
using YamlDotNet.Core.Tokens;

namespace YamlDotNet.Core;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(new byte[] { 0, 1, 1 })]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
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
