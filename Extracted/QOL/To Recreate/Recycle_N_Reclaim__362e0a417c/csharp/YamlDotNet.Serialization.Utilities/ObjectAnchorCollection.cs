using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization.Utilities;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
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

	public bool TryGetAnchor(object @object, [MaybeNullWhen(false)][_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] out string anchor)
	{
		return anchorsByObject.TryGetValue(@object, out anchor);
	}
}
