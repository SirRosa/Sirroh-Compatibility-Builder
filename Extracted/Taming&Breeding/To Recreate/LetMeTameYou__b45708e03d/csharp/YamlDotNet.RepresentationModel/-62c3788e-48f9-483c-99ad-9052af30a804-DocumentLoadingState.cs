using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.RepresentationModel;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal class _003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState
{
	private readonly Dictionary<_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> anchors = new Dictionary<_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode>();

	private readonly List<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> nodesWithUnresolvedAliases = new List<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode>();

	public void AddAnchor(_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode node)
	{
		if (node.Anchor.IsEmpty)
		{
			throw new ArgumentException("The specified node does not have an anchor");
		}
		anchors[node.Anchor] = node;
	}

	public _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode GetNode(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName anchor, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark start, _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark end)
	{
		if (anchors.TryGetValue(anchor, out var value))
		{
			return value;
		}
		throw new _003C9c6ae7e0_002D3304_002D4260_002D9e60_002D349a0e3ceca3_003EAnchorNotFoundException(in start, in end, $"The anchor '{anchor}' does not exists");
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	public bool TryGetNode(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName anchor, [_003Cb00cde0a_002Db4f0_002D4b9f_002Db13f_002D3c9332bf6e97_003ENotNullWhen(true)] out _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode node)
	{
		return anchors.TryGetValue(anchor, out node);
	}

	public void AddNodeWithUnresolvedAliases(_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode node)
	{
		nodesWithUnresolvedAliases.Add(node);
	}

	public void ResolveAliases()
	{
		foreach (_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode nodesWithUnresolvedAlias in nodesWithUnresolvedAliases)
		{
			nodesWithUnresolvedAlias.ResolveAliases(this);
		}
	}
}
