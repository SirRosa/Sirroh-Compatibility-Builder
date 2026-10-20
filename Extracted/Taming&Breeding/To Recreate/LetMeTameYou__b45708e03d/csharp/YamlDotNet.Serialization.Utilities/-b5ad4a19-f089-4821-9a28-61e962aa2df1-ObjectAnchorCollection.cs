using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.Utilities;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003Cb5ad4a19_002Df089_002D4821_002D9a28_002D61e962aa2df1_003EObjectAnchorCollection
{
	private readonly Dictionary<string, object> objectsByAnchor = new Dictionary<string, object>();

	private readonly Dictionary<object, string> anchorsByObject = new Dictionary<object, string>();

	public object this[string anchor]
	{
		get
		{
			if (objectsByAnchor.TryGetValue(anchor, out var value))
			{
				return value;
			}
			throw new _003C9c6ae7e0_002D3304_002D4260_002D9e60_002D349a0e3ceca3_003EAnchorNotFoundException("The anchor '" + anchor + "' does not exists");
		}
	}

	public void Add(string anchor, object @object)
	{
		objectsByAnchor.Add(anchor, @object);
		if (@object != null)
		{
			anchorsByObject.Add(@object, anchor);
		}
	}

	public bool TryGetAnchor(object @object, [_003C3e7b65c3_002D9a34_002D466b_002D9a0e_002Dc991173a4ba0_003EMaybeNullWhen(false)][_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] out string anchor)
	{
		return anchorsByObject.TryGetValue(@object, out anchor);
	}
}
