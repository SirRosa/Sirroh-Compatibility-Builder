using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.Utilities;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class ObjectAnchorCollection
{
	private readonly IDictionary<string, object> objectsByAnchor = new Dictionary<string, object>();

	private readonly IDictionary<object, string> anchorsByObject = new Dictionary<object, string>();

	public object this[string anchor]
	{
		get
		{
			if (objectsByAnchor.TryGetValue(anchor, out var value))
			{
				return value;
			}
			throw new AnchorNotFoundException("The anchor '" + anchor + "' does not exists");
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

	public bool TryGetAnchor(object @object, [MaybeNullWhen(false)][_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] out string anchor)
	{
		return anchorsByObject.TryGetValue(@object, out anchor);
	}
}
