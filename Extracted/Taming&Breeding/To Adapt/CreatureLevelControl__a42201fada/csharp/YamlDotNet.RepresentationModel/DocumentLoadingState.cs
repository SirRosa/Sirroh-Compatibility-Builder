using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.RepresentationModel;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal class DocumentLoadingState
{
	private readonly IDictionary<AnchorName, YamlNode> anchors = new Dictionary<AnchorName, YamlNode>();

	private readonly IList<YamlNode> nodesWithUnresolvedAliases = new List<YamlNode>();

	public void AddAnchor(YamlNode node)
	{
		if (node.Anchor.IsEmpty)
		{
			throw new ArgumentException("The specified node does not have an anchor");
		}
		if (anchors.ContainsKey(node.Anchor))
		{
			anchors[node.Anchor] = node;
		}
		else
		{
			anchors.Add(node.Anchor, node);
		}
	}

	public YamlNode GetNode(AnchorName anchor, Mark start, Mark end)
	{
		if (anchors.TryGetValue(anchor, out var value))
		{
			return value;
		}
		throw new AnchorNotFoundException(start, end, $"The anchor '{anchor}' does not exists");
	}

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
	public bool TryGetNode(AnchorName anchor, [NotNullWhen(true)] out YamlNode node)
	{
		return anchors.TryGetValue(anchor, out node);
	}

	public void AddNodeWithUnresolvedAliases(YamlNode node)
	{
		nodesWithUnresolvedAliases.Add(node);
	}

	public void ResolveAliases()
	{
		foreach (YamlNode nodesWithUnresolvedAlias in nodesWithUnresolvedAliases)
		{
			nodesWithUnresolvedAlias.ResolveAliases(this);
		}
	}
}
