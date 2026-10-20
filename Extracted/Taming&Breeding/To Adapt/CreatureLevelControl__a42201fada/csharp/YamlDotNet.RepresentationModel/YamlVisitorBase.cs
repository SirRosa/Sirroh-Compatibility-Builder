using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace YamlDotNet.RepresentationModel;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal abstract class YamlVisitorBase : IYamlVisitor
{
	public virtual void Visit(YamlStream stream)
	{
		VisitChildren(stream);
	}

	public virtual void Visit(YamlDocument document)
	{
		VisitChildren(document);
	}

	public virtual void Visit(YamlScalarNode scalar)
	{
	}

	public virtual void Visit(YamlSequenceNode sequence)
	{
		VisitChildren(sequence);
	}

	public virtual void Visit(YamlMappingNode mapping)
	{
		VisitChildren(mapping);
	}

	protected virtual void VisitPair(YamlNode key, YamlNode value)
	{
		key.Accept(this);
		value.Accept(this);
	}

	protected virtual void VisitChildren(YamlStream stream)
	{
		foreach (YamlDocument document in stream.Documents)
		{
			document.Accept(this);
		}
	}

	protected virtual void VisitChildren(YamlDocument document)
	{
		if (document.RootNode != null)
		{
			document.RootNode.Accept(this);
		}
	}

	protected virtual void VisitChildren(YamlSequenceNode sequence)
	{
		foreach (YamlNode child in sequence.Children)
		{
			child.Accept(this);
		}
	}

	protected virtual void VisitChildren(YamlMappingNode mapping)
	{
		foreach (KeyValuePair<YamlNode, YamlNode> child in mapping.Children)
		{
			VisitPair(child.Key, child.Value);
		}
	}
}
