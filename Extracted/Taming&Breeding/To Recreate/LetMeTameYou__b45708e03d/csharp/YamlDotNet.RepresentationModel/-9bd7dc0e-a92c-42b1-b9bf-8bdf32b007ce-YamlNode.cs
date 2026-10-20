using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.RepresentationModel;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal abstract class _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode
{
	private const int MaximumRecursionLevel = 1000;

	internal const string MaximumRecursionLevelReachedToStringValue = "WARNING! INFINITE RECURSION!";

	public _003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName Anchor { get; set; }

	public _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName Tag { get; set; }

	public _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark Start { get; private set; } = _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty;

	public _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark End { get; private set; } = _003Ce5bc99aa_002D79b4_002D461f_002D9c4d_002D5af7da5eb1b8_003EMark.Empty;

	public IEnumerable<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> AllNodes
	{
		get
		{
			_003C0330118d_002Da7bd_002D47a5_002D8c95_002D32910628e74b_003ERecursionLevel level = new _003C0330118d_002Da7bd_002D47a5_002D8c95_002D32910628e74b_003ERecursionLevel(1000);
			return SafeAllNodes(level);
		}
	}

	public abstract _003Ca52a2d6b_002Db316_002D4a48_002D8e78_002Db0ca68ae1771_003EYamlNodeType NodeType { get; }

	public _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode this[int index]
	{
		get
		{
			if (!(this is _003C6e9158e4_002De227_002D476d_002D9b7c_002D17b4cf5f4470_003EYamlSequenceNode obj))
			{
				throw new ArgumentException($"Accessed '{NodeType}' with an invalid index: {index}. Only Sequences can be indexed by number.");
			}
			return obj.Children[index];
		}
	}

	public _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode this[_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode key]
	{
		get
		{
			if (!(this is _003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode obj))
			{
				throw new ArgumentException($"Accessed '{NodeType}' with an invalid index: {key}. Only Mappings can be indexed by key.");
			}
			return obj.Children[key];
		}
	}

	internal void Load(_003C1af307a4_002D0546_002D4fb8_002D9199_002D3379b8888e00_003ENodeEvent yamlEvent, _003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState state)
	{
		Tag = yamlEvent.Tag;
		if (!yamlEvent.Anchor.IsEmpty)
		{
			Anchor = yamlEvent.Anchor;
			state.AddAnchor(this);
		}
		Start = yamlEvent.Start;
		End = yamlEvent.End;
	}

	internal static _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode ParseNode(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, _003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState state)
	{
		if (parser.Accept<_003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar>(out var _))
		{
			return new _003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode(parser, state);
		}
		if (parser.Accept<_003C9f7de5d2_002Dfe16_002D493d_002D8158_002D378a5bfd51bb_003ESequenceStart>(out var _))
		{
			return new _003C6e9158e4_002De227_002D476d_002D9b7c_002D17b4cf5f4470_003EYamlSequenceNode(parser, state);
		}
		if (parser.Accept<_003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart>(out var _))
		{
			return new _003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode(parser, state);
		}
		if (parser.TryConsume<_003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias>(out var event4))
		{
			if (!state.TryGetNode(event4.Value, out var node))
			{
				return new _003Cf130bc9b_002D7e39_002D4940_002Dadd5_002D2ce6b0571a34_003EYamlAliasNode(event4.Value);
			}
			return node;
		}
		throw new ArgumentException("The current event is of an unsupported type.", "parser");
	}

	internal abstract void ResolveAliases(_003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState state);

	internal void Save(_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter, _003C1c7e9eed_002D3476_002D4523_002D96b3_002D4f50ec92e55b_003EEmitterState state)
	{
		if (!Anchor.IsEmpty && !state.EmittedAnchors.Add(Anchor))
		{
			emitter.Emit(new _003C3010bf72_002Dd2cd_002D45d1_002D9245_002Db3b55fbfa5a0_003EAnchorAlias(Anchor));
		}
		else
		{
			Emit(emitter, state);
		}
	}

	internal abstract void Emit(_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter, _003C1c7e9eed_002D3476_002D4523_002D96b3_002D4f50ec92e55b_003EEmitterState state);

	public abstract void Accept(_003C27b184bf_002D18f6_002D479b_002D8c90_002D05f0cd8bd61f_003EIYamlVisitor visitor);

	public override string ToString()
	{
		_003C0330118d_002Da7bd_002D47a5_002D8c95_002D32910628e74b_003ERecursionLevel obj = new _003C0330118d_002Da7bd_002D47a5_002D8c95_002D32910628e74b_003ERecursionLevel(1000);
		return ToString(obj);
	}

	internal abstract string ToString(_003C0330118d_002Da7bd_002D47a5_002D8c95_002D32910628e74b_003ERecursionLevel level);

	internal abstract IEnumerable<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> SafeAllNodes(_003C0330118d_002Da7bd_002D47a5_002D8c95_002D32910628e74b_003ERecursionLevel level);

	public static implicit operator _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode(string value)
	{
		return new _003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode(value);
	}

	public static implicit operator _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode(string[] sequence)
	{
		return new _003C6e9158e4_002De227_002D476d_002D9b7c_002D17b4cf5f4470_003EYamlSequenceNode(((IEnumerable<string>)sequence).Select((Func<string, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode>)([_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(0)] (string i) => i)));
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public static explicit operator string(_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode node)
	{
		if (!(node is _003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode obj))
		{
			throw new ArgumentException($"Attempted to convert a '{node.NodeType}' to string. This conversion is valid only for Scalars.");
		}
		return obj.Value;
	}
}
