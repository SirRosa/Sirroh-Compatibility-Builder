using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.RepresentationModel;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[Obsolete("Use YamlVisitorBase")]
internal abstract class _003Ca784e855_002D6a2c_002D4add_002Da7dd_002De2e601808d5d_003EYamlVisitor : _003C27b184bf_002D18f6_002D479b_002D8c90_002D05f0cd8bd61f_003EIYamlVisitor
{
	protected virtual void Visit(_003C65b5ef89_002De8d4_002D4c53_002Da064_002D36961ca552d8_003EYamlStream stream)
	{
	}

	protected virtual void Visited(_003C65b5ef89_002De8d4_002D4c53_002Da064_002D36961ca552d8_003EYamlStream stream)
	{
	}

	protected virtual void Visit(_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument document)
	{
	}

	protected virtual void Visited(_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument document)
	{
	}

	protected virtual void Visit(_003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode scalar)
	{
	}

	protected virtual void Visited(_003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode scalar)
	{
	}

	protected virtual void Visit(_003C6e9158e4_002De227_002D476d_002D9b7c_002D17b4cf5f4470_003EYamlSequenceNode sequence)
	{
	}

	protected virtual void Visited(_003C6e9158e4_002De227_002D476d_002D9b7c_002D17b4cf5f4470_003EYamlSequenceNode sequence)
	{
	}

	protected virtual void Visit(_003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode mapping)
	{
	}

	protected virtual void Visited(_003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode mapping)
	{
	}

	protected virtual void VisitChildren(_003C65b5ef89_002De8d4_002D4c53_002Da064_002D36961ca552d8_003EYamlStream stream)
	{
		foreach (_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument document in stream.Documents)
		{
			document.Accept(this);
		}
	}

	protected virtual void VisitChildren(_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument document)
	{
		if (document.RootNode != null)
		{
			document.RootNode.Accept(this);
		}
	}

	protected virtual void VisitChildren(_003C6e9158e4_002De227_002D476d_002D9b7c_002D17b4cf5f4470_003EYamlSequenceNode sequence)
	{
		foreach (_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode child in sequence.Children)
		{
			child.Accept(this);
		}
	}

	protected virtual void VisitChildren(_003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode mapping)
	{
		foreach (KeyValuePair<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> child in mapping.Children)
		{
			child.Key.Accept(this);
			child.Value.Accept(this);
		}
	}

	void _003C27b184bf_002D18f6_002D479b_002D8c90_002D05f0cd8bd61f_003EIYamlVisitor.Visit(_003C65b5ef89_002De8d4_002D4c53_002Da064_002D36961ca552d8_003EYamlStream stream)
	{
		Visit(stream);
		VisitChildren(stream);
		Visited(stream);
	}

	void _003C27b184bf_002D18f6_002D479b_002D8c90_002D05f0cd8bd61f_003EIYamlVisitor.Visit(_003C4a108954_002Dfd76_002D4cb5_002D8c7c_002Dd49f730eff6c_003EYamlDocument document)
	{
		Visit(document);
		VisitChildren(document);
		Visited(document);
	}

	void _003C27b184bf_002D18f6_002D479b_002D8c90_002D05f0cd8bd61f_003EIYamlVisitor.Visit(_003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode scalar)
	{
		Visit(scalar);
		Visited(scalar);
	}

	void _003C27b184bf_002D18f6_002D479b_002D8c90_002D05f0cd8bd61f_003EIYamlVisitor.Visit(_003C6e9158e4_002De227_002D476d_002D9b7c_002D17b4cf5f4470_003EYamlSequenceNode sequence)
	{
		Visit(sequence);
		VisitChildren(sequence);
		Visited(sequence);
	}

	void _003C27b184bf_002D18f6_002D479b_002D8c90_002D05f0cd8bd61f_003EIYamlVisitor.Visit(_003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode mapping)
	{
		Visit(mapping);
		VisitChildren(mapping);
		Visited(mapping);
	}
}
