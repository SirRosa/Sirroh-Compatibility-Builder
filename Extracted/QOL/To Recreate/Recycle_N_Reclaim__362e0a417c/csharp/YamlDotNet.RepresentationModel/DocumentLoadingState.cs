using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.RepresentationModel;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
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
		throw new AnchorNotFoundException(in start, in end, $"The anchor '{anchor}' does not exists");
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
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
