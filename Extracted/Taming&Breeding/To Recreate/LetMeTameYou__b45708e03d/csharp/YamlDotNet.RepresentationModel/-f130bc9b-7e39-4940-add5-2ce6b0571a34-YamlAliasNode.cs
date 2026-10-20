using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.RepresentationModel;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal class _003Cf130bc9b_002D7e39_002D4940_002Dadd5_002D2ce6b0571a34_003EYamlAliasNode : _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode
{
	public override _003Ca52a2d6b_002Db316_002D4a48_002D8e78_002Db0ca68ae1771_003EYamlNodeType NodeType => _003Ca52a2d6b_002Db316_002D4a48_002D8e78_002Db0ca68ae1771_003EYamlNodeType.Alias;

	internal _003Cf130bc9b_002D7e39_002D4940_002Dadd5_002D2ce6b0571a34_003EYamlAliasNode(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName anchor)
	{
		Anchor = anchor;
	}

	internal override void ResolveAliases(_003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState state)
	{
		throw new NotSupportedException("Resolving an alias on an alias node does not make sense");
	}

	internal override void Emit(_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter, _003C1c7e9eed_002D3476_002D4523_002D96b3_002D4f50ec92e55b_003EEmitterState state)
	{
		throw new NotSupportedException("A YamlAliasNode is an implementation detail and should never be saved.");
	}

	public override void Accept(_003C27b184bf_002D18f6_002D479b_002D8c90_002D05f0cd8bd61f_003EIYamlVisitor visitor)
	{
		throw new NotSupportedException("A YamlAliasNode is an implementation detail and should never be visited.");
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		if (obj is _003Cf130bc9b_002D7e39_002D4940_002Dadd5_002D2ce6b0571a34_003EYamlAliasNode obj2 && Equals(obj2))
		{
			return object.Equals(Anchor, obj2.Anchor);
		}
		return false;
	}

	public override int GetHashCode()
	{
		return base.GetHashCode();
	}

	internal override string ToString(_003C0330118d_002Da7bd_002D47a5_002D8c95_002D32910628e74b_003ERecursionLevel level)
	{
		return "*" + Anchor;
	}

	internal override IEnumerable<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> SafeAllNodes(_003C0330118d_002Da7bd_002D47a5_002D8c95_002D32910628e74b_003ERecursionLevel level)
	{
		yield return this;
	}
}
