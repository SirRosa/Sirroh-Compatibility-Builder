using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.RepresentationModel;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal class YamlAliasNode : YamlNode
{
	public override YamlNodeType NodeType => YamlNodeType.Alias;

	internal YamlAliasNode(AnchorName anchor)
	{
		Anchor = anchor;
	}

	internal override void ResolveAliases(DocumentLoadingState state)
	{
		throw new NotSupportedException("Resolving an alias on an alias node does not make sense");
	}

	internal override void Emit(IEmitter emitter, EmitterState state)
	{
		throw new NotSupportedException("A YamlAliasNode is an implementation detail and should never be saved.");
	}

	public override void Accept(IYamlVisitor visitor)
	{
		throw new NotSupportedException("A YamlAliasNode is an implementation detail and should never be visited.");
	}

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		if (obj is YamlAliasNode yamlAliasNode && Equals(yamlAliasNode))
		{
			return object.Equals(Anchor, yamlAliasNode.Anchor);
		}
		return false;
	}

	public override int GetHashCode()
	{
		return base.GetHashCode();
	}

	internal override string ToString(RecursionLevel level)
	{
		return "*" + Anchor.ToString();
	}

	internal override IEnumerable<YamlNode> SafeAllNodes(RecursionLevel level)
	{
		yield return this;
	}
}
