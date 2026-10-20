using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Text;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Core.ObjectPool;
using YamlDotNet.Serialization;

namespace YamlDotNet.RepresentationModel;

[DebuggerDisplay("Count = {children.Count}")]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003C6e9158e4_002De227_002D476d_002D9b7c_002D17b4cf5f4470_003EYamlSequenceNode : _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, IEnumerable<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode>, IEnumerable, _003Cfb7b8978_002D273f_002D4537_002Dab42_002Dfae47606174a_003EIYamlConvertible
{
	private readonly List<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> children = new List<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode>();

	public IList<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> Children => children;

	public _003Ca02ab24e_002Db5a8_002D4bd7_002D916e_002D7ccfa73d61ca_003ESequenceStyle Style { get; set; }

	public override _003Ca52a2d6b_002Db316_002D4a48_002D8e78_002Db0ca68ae1771_003EYamlNodeType NodeType => _003Ca52a2d6b_002Db316_002D4a48_002D8e78_002Db0ca68ae1771_003EYamlNodeType.Sequence;

	internal _003C6e9158e4_002De227_002D476d_002D9b7c_002D17b4cf5f4470_003EYamlSequenceNode(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, _003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState state)
	{
		Load(parser, state);
	}

	private void Load(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, _003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState state)
	{
		_003C9f7de5d2_002Dfe16_002D493d_002D8158_002D378a5bfd51bb_003ESequenceStart obj = parser.Consume<_003C9f7de5d2_002Dfe16_002D493d_002D8158_002D378a5bfd51bb_003ESequenceStart>();
		Load(obj, state);
		Style = obj.Style;
		bool flag = false;
		_003Caa8581b2_002D1caa_002D46f6_002Db8ec_002D0b62fd9dce90_003ESequenceEnd @event;
		while (!parser.TryConsume<_003Caa8581b2_002D1caa_002D46f6_002Db8ec_002D0b62fd9dce90_003ESequenceEnd>(out @event))
		{
			_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode obj2 = _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode.ParseNode(parser, state);
			children.Add(obj2);
			flag |= obj2 is _003Cf130bc9b_002D7e39_002D4940_002Dadd5_002D2ce6b0571a34_003EYamlAliasNode;
		}
		if (flag)
		{
			state.AddNodeWithUnresolvedAliases(this);
		}
	}

	public _003C6e9158e4_002De227_002D476d_002D9b7c_002D17b4cf5f4470_003EYamlSequenceNode()
	{
	}

	public _003C6e9158e4_002De227_002D476d_002D9b7c_002D17b4cf5f4470_003EYamlSequenceNode(params _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode[] children)
		: this((IEnumerable<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode>)children)
	{
	}

	public _003C6e9158e4_002De227_002D476d_002D9b7c_002D17b4cf5f4470_003EYamlSequenceNode(IEnumerable<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> children)
	{
		foreach (_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode child in children)
		{
			this.children.Add(child);
		}
	}

	public void Add(_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode child)
	{
		children.Add(child);
	}

	public void Add(string child)
	{
		children.Add(new _003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode(child));
	}

	internal override void ResolveAliases(_003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState state)
	{
		for (int i = 0; i < children.Count; i++)
		{
			if (children[i] is _003Cf130bc9b_002D7e39_002D4940_002Dadd5_002D2ce6b0571a34_003EYamlAliasNode)
			{
				children[i] = state.GetNode(children[i].Anchor, children[i].Start, children[i].End);
			}
		}
	}

	internal override void Emit(_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter, _003C1c7e9eed_002D3476_002D4523_002D96b3_002D4f50ec92e55b_003EEmitterState state)
	{
		emitter.Emit(new _003C9f7de5d2_002Dfe16_002D493d_002D8158_002D378a5bfd51bb_003ESequenceStart(Anchor, Tag, Tag.IsEmpty, Style));
		foreach (_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode child in children)
		{
			child.Save(emitter, state);
		}
		emitter.Emit(new _003Caa8581b2_002D1caa_002D46f6_002Db8ec_002D0b62fd9dce90_003ESequenceEnd());
	}

	public override void Accept(_003C27b184bf_002D18f6_002D479b_002D8c90_002D05f0cd8bd61f_003EIYamlVisitor visitor)
	{
		visitor.Visit(this);
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		if (!(obj is _003C6e9158e4_002De227_002D476d_002D9b7c_002D17b4cf5f4470_003EYamlSequenceNode obj2) || !object.Equals(Tag, obj2.Tag) || children.Count != obj2.children.Count)
		{
			return false;
		}
		for (int i = 0; i < children.Count; i++)
		{
			if (!object.Equals(children[i], obj2.children[i]))
			{
				return false;
			}
		}
		return true;
	}

	public override int GetHashCode()
	{
		int h = 0;
		foreach (_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode child in children)
		{
			h = _003Ceda05417_002Dc99c_002D442b_002D93de_002De22ef768bacb_003EHashCode.CombineHashCodes(h, child);
		}
		return _003Ceda05417_002Dc99c_002D442b_002D93de_002De22ef768bacb_003EHashCode.CombineHashCodes(h, Tag);
	}

	internal override IEnumerable<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> SafeAllNodes(_003C0330118d_002Da7bd_002D47a5_002D8c95_002D32910628e74b_003ERecursionLevel level)
	{
		level.Increment();
		yield return this;
		foreach (_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode child in children)
		{
			foreach (_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode item in child.SafeAllNodes(level))
			{
				yield return item;
			}
		}
		level.Decrement();
	}

	internal override string ToString(_003C0330118d_002Da7bd_002D47a5_002D8c95_002D32910628e74b_003ERecursionLevel level)
	{
		if (!level.TryIncrement())
		{
			return "WARNING! INFINITE RECURSION!";
		}
		StringBuilderPool.BuilderWrapper builderWrapper = StringBuilderPool.Rent();
		try
		{
			StringBuilder builder = builderWrapper.Builder;
			builder.Append("[ ");
			foreach (_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode child in children)
			{
				if (builder.Length > 2)
				{
					builder.Append(", ");
				}
				builder.Append(child.ToString(level));
			}
			builder.Append(" ]");
			level.Decrement();
			return builder.ToString();
		}
		finally
		{
			((IDisposable)builderWrapper/*cast due to constrained. prefix*/).Dispose();
		}
	}

	public IEnumerator<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> GetEnumerator()
	{
		return Children.GetEnumerator();
	}

	IEnumerator IEnumerable.GetEnumerator()
	{
		return GetEnumerator();
	}

	void _003Cfb7b8978_002D273f_002D4537_002Dab42_002Dfae47606174a_003EIYamlConvertible.Read(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, Type expectedType, _003Ccf1bb9c3_002D9707_002D4afa_002Daa6b_002D02a0a9430a5f_003EObjectDeserializer nestedObjectDeserializer)
	{
		Load(parser, new _003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState());
	}

	void _003Cfb7b8978_002D273f_002D4537_002Dab42_002Dfae47606174a_003EIYamlConvertible.Write(_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer nestedObjectSerializer)
	{
		Emit(emitter, new _003C1c7e9eed_002D3476_002D4523_002D96b3_002D4f50ec92e55b_003EEmitterState());
	}
}
