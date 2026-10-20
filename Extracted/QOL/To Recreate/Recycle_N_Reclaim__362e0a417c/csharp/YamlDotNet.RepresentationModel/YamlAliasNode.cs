using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.RepresentationModel;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
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

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
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
