using System;
using System.Collections.Generic;
using System.Globalization;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.RepresentationModel;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal class _003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument
{
	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
	private class AnchorAssigningVisitor : _003C7e8e1593_002Dc5f6_002D4141_002D9709_002D34ad8e05916b_003EYamlVisitorBase
	{
		private readonly HashSet<_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName> existingAnchors = new HashSet<_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName>();

		private readonly Dictionary<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, bool> visitedNodes = new Dictionary<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, bool>();

		public void AssignAnchors(_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument document)
		{
			existingAnchors.Clear();
			visitedNodes.Clear();
			document.Accept(this);
			Random random = new Random();
			foreach (KeyValuePair<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, bool> visitedNode in visitedNodes)
			{
				if (!visitedNode.Value)
				{
					continue;
				}
				_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName obj;
				if (!visitedNode.Key.Anchor.IsEmpty && !existingAnchors.Contains(visitedNode.Key.Anchor))
				{
					obj = visitedNode.Key.Anchor;
				}
				else
				{
					do
					{
						obj = new _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName(random.Next().ToString(CultureInfo.InvariantCulture));
					}
					while (existingAnchors.Contains(obj));
				}
				existingAnchors.Add(obj);
				visitedNode.Key.Anchor = obj;
			}
		}

		private bool VisitNodeAndFindDuplicates(_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode node)
		{
			if (visitedNodes.TryGetValue(node, out var value))
			{
				if (!value)
				{
					visitedNodes[node] = true;
				}
				return !value;
			}
			visitedNodes.Add(node, value: false);
			return false;
		}

		public override void Visit(_003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode scalar)
		{
			VisitNodeAndFindDuplicates(scalar);
		}

		public override void Visit(_003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode mapping)
		{
			if (!VisitNodeAndFindDuplicates(mapping))
			{
				base.Visit(mapping);
			}
		}

		public override void Visit(_003C6e9158e4_002De227_002D476d_002D9b7c_002D17b4cf5f4470_003EYamlSequenceNode sequence)
		{
			if (!VisitNodeAndFindDuplicates(sequence))
			{
				base.Visit(sequence);
			}
		}
	}

	public _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode RootNode { get; private set; }

	public IEnumerable<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> AllNodes => RootNode.AllNodes;

	public _003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument(_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode rootNode)
	{
		RootNode = rootNode;
	}

	public _003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument(string rootNode)
	{
		RootNode = new _003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode(rootNode);
	}

	internal _003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser)
	{
		_003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState obj = new _003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState();
		parser.Consume<_003C11d343a3_002Dad11_002D4df1_002D9f55_002Da2bc7ef77934_003EDocumentStart>();
		_003C7d138b59_002Dd981_002D4379_002Daac9_002D8cdf906ac673_003EDocumentEnd @event;
		while (!parser.TryConsume<_003C7d138b59_002Dd981_002D4379_002Daac9_002D8cdf906ac673_003EDocumentEnd>(out @event))
		{
			RootNode = _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode.ParseNode(parser, obj);
			if (RootNode is _003Cf130bc9b_002D7e39_002D4940_002Dadd5_002D2ce6b0571a34_003EYamlAliasNode)
			{
				throw new _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException("A document cannot contain only an alias");
			}
		}
		obj.ResolveAliases();
		if (RootNode == null)
		{
			throw new ArgumentException("Atempted to parse an empty document");
		}
	}

	private void AssignAnchors()
	{
		AnchorAssigningVisitor anchorAssigningVisitor = new AnchorAssigningVisitor();
		anchorAssigningVisitor.AssignAnchors(this);
	}

	internal void Save(_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter, bool assignAnchors = true)
	{
		if (assignAnchors)
		{
			AssignAnchors();
		}
		emitter.Emit(new _003C11d343a3_002Dad11_002D4df1_002D9f55_002Da2bc7ef77934_003EDocumentStart());
		RootNode.Save(emitter, new _003C1c7e9eed_002D3476_002D4523_002D96b3_002D4f50ec92e55b_003EEmitterState());
		emitter.Emit(new _003C7d138b59_002Dd981_002D4379_002Daac9_002D8cdf906ac673_003EDocumentEnd(isImplicit: false));
	}

	public void Accept(_003C27b184bf_002D18f6_002D479b_002D8c90_002D05f0cd8bd61f_003EIYamlVisitor visitor)
	{
		visitor.Visit(this);
	}
}
