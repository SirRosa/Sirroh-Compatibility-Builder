using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Text;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Core.ObjectPool;
using YamlDotNet.Helpers;
using YamlDotNet.Serialization;

namespace YamlDotNet.RepresentationModel;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal sealed class _003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode : _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, IEnumerable<KeyValuePair<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode>>, IEnumerable, _003Cfb7b8978_002D273f_002D4537_002Dab42_002Dfae47606174a_003EIYamlConvertible
{
	private readonly _003Cd0be3590_002D863d_002D4c1f_002Dacc2_002D4910625f8646_003EOrderedDictionary<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> children = new _003Cd0be3590_002D863d_002D4c1f_002Dacc2_002D4910625f8646_003EOrderedDictionary<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode>();

	public _003C79217a80_002D313c_002D4e4f_002Da85c_002D2552c691591c_003EIOrderedDictionary<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> Children => children;

	public _003C4531dc81_002Df938_002D4560_002D9983_002D291645827825_003EMappingStyle Style { get; set; }

	public override _003Ca52a2d6b_002Db316_002D4a48_002D8e78_002Db0ca68ae1771_003EYamlNodeType NodeType => _003Ca52a2d6b_002Db316_002D4a48_002D8e78_002Db0ca68ae1771_003EYamlNodeType.Mapping;

	internal _003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, _003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState state)
	{
		Load(parser, state);
	}

	private void Load(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, _003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState state)
	{
		_003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart obj = parser.Consume<_003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart>();
		Load(obj, state);
		Style = obj.Style;
		bool flag = false;
		_003C446b682a_002D36b6_002D46ea_002Db1c3_002D0616b60e5c52_003EMappingEnd @event;
		while (!parser.TryConsume<_003C446b682a_002D36b6_002D46ea_002Db1c3_002D0616b60e5c52_003EMappingEnd>(out @event))
		{
			_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode obj2 = _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode.ParseNode(parser, state);
			_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode obj3 = _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode.ParseNode(parser, state);
			if (!children.TryAdd(obj2, obj3))
			{
				throw new _003C98bbf7cf_002D29a6_002D4379_002Dbeba_002Df0efbbce1348_003EYamlException(obj2.Start, obj2.End, $"Duplicate key {obj2}");
			}
			flag |= obj2 is _003Cf130bc9b_002D7e39_002D4940_002Dadd5_002D2ce6b0571a34_003EYamlAliasNode || obj3 is _003Cf130bc9b_002D7e39_002D4940_002Dadd5_002D2ce6b0571a34_003EYamlAliasNode;
		}
		if (flag)
		{
			state.AddNodeWithUnresolvedAliases(this);
		}
	}

	public _003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode()
	{
	}

	public _003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 0, 1, 1 })] params KeyValuePair<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode>[] children)
		: this((IEnumerable<KeyValuePair<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode>>)children)
	{
	}

	public _003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode([_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 0, 1, 1 })] IEnumerable<KeyValuePair<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode>> children)
	{
		foreach (KeyValuePair<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> child in children)
		{
			this.children.Add(child);
		}
	}

	public _003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode(params _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode[] children)
		: this((IEnumerable<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode>)children)
	{
	}

	public _003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode(IEnumerable<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> children)
	{
		using IEnumerator<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> enumerator = children.GetEnumerator();
		while (enumerator.MoveNext())
		{
			_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode current = enumerator.Current;
			if (!enumerator.MoveNext())
			{
				throw new ArgumentException("When constructing a mapping node with a sequence, the number of elements of the sequence must be even.");
			}
			Add(current, enumerator.Current);
		}
	}

	public void Add(_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode key, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode value)
	{
		children.Add(key, value);
	}

	public void Add(string key, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode value)
	{
		children.Add(new _003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode(key), value);
	}

	public void Add(_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode key, string value)
	{
		children.Add(key, new _003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode(value));
	}

	public void Add(string key, string value)
	{
		children.Add(new _003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode(key), new _003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode(value));
	}

	internal override void ResolveAliases(_003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState state)
	{
		Dictionary<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> dictionary = null;
		Dictionary<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> dictionary2 = null;
		foreach (KeyValuePair<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> child in children)
		{
			if (child.Key is _003Cf130bc9b_002D7e39_002D4940_002Dadd5_002D2ce6b0571a34_003EYamlAliasNode)
			{
				if (dictionary == null)
				{
					dictionary = new Dictionary<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode>();
				}
				dictionary.Add(child.Key, state.GetNode(child.Key.Anchor, child.Key.Start, child.Key.End));
			}
			if (child.Value is _003Cf130bc9b_002D7e39_002D4940_002Dadd5_002D2ce6b0571a34_003EYamlAliasNode)
			{
				if (dictionary2 == null)
				{
					dictionary2 = new Dictionary<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode>();
				}
				dictionary2.Add(child.Key, state.GetNode(child.Value.Anchor, child.Value.Start, child.Value.End));
			}
		}
		if (dictionary2 != null)
		{
			foreach (KeyValuePair<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> item in dictionary2)
			{
				children[item.Key] = item.Value;
			}
		}
		if (dictionary == null)
		{
			return;
		}
		foreach (KeyValuePair<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> item2 in dictionary)
		{
			_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode value = children[item2.Key];
			children.Remove(item2.Key);
			children.Add(item2.Value, value);
		}
	}

	internal override void Emit(_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter, _003C1c7e9eed_002D3476_002D4523_002D96b3_002D4f50ec92e55b_003EEmitterState state)
	{
		emitter.Emit(new _003Ca19ef90a_002D64a0_002D4d7e_002Db490_002D56e422b0103d_003EMappingStart(Anchor, Tag, isImplicit: true, Style));
		foreach (KeyValuePair<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> child in children)
		{
			child.Key.Save(emitter, state);
			child.Value.Save(emitter, state);
		}
		emitter.Emit(new _003C446b682a_002D36b6_002D46ea_002Db1c3_002D0616b60e5c52_003EMappingEnd());
	}

	public override void Accept(_003C27b184bf_002D18f6_002D479b_002D8c90_002D05f0cd8bd61f_003EIYamlVisitor visitor)
	{
		visitor.Visit(this);
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		if (!(obj is _003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode obj2) || !object.Equals(Tag, obj2.Tag) || children.Count != obj2.children.Count)
		{
			return false;
		}
		foreach (KeyValuePair<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> child in children)
		{
			if (!obj2.children.TryGetValue(child.Key, out var value) || !object.Equals(child.Value, value))
			{
				return false;
			}
		}
		return true;
	}

	public override int GetHashCode()
	{
		int num = base.GetHashCode();
		foreach (KeyValuePair<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> child in children)
		{
			num = _003Ceda05417_002Dc99c_002D442b_002D93de_002De22ef768bacb_003EHashCode.CombineHashCodes(num, child.Key);
			num = (child.Value.Anchor.IsEmpty ? _003Ceda05417_002Dc99c_002D442b_002D93de_002De22ef768bacb_003EHashCode.CombineHashCodes(num, child.Value) : _003Ceda05417_002Dc99c_002D442b_002D93de_002De22ef768bacb_003EHashCode.CombineHashCodes(num, child.Value.Anchor));
		}
		return num;
	}

	internal override IEnumerable<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> SafeAllNodes(_003C0330118d_002Da7bd_002D47a5_002D8c95_002D32910628e74b_003ERecursionLevel level)
	{
		level.Increment();
		yield return this;
		foreach (KeyValuePair<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> child in children)
		{
			foreach (_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode item in child.Key.SafeAllNodes(level))
			{
				yield return item;
			}
			foreach (_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode item2 in child.Value.SafeAllNodes(level))
			{
				yield return item2;
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
			builder.Append("{ ");
			foreach (KeyValuePair<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> child in children)
			{
				if (builder.Length > 2)
				{
					builder.Append(", ");
				}
				builder.Append("{ ").Append(child.Key.ToString(level)).Append(", ")
					.Append(child.Value.ToString(level))
					.Append(" }");
			}
			builder.Append(" }");
			level.Decrement();
			return builder.ToString();
		}
		finally
		{
			((IDisposable)builderWrapper/*cast due to constrained. prefix*/).Dispose();
		}
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 0, 1, 1 })]
	public IEnumerator<KeyValuePair<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode>> GetEnumerator()
	{
		return children.GetEnumerator();
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

	public static _003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode FromObject(object mapping)
	{
		if (mapping == null)
		{
			throw new ArgumentNullException("mapping");
		}
		_003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode obj = new _003Cf55ef6f4_002D81e5_002D43f5_002Da831_002D4556301fc931_003EYamlMappingNode();
		foreach (PropertyInfo publicProperty in _003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.GetPublicProperties(mapping.GetType()))
		{
			if (publicProperty.CanRead && publicProperty.GetGetMethod(nonPublic: false).GetParameters().Length == 0)
			{
				object value = publicProperty.GetValue(mapping, null);
				_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode obj2 = value as _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode;
				if (obj2 == null)
				{
					string text = Convert.ToString(value, CultureInfo.InvariantCulture);
					obj2 = text ?? string.Empty;
				}
				obj.Add(publicProperty.Name, obj2);
			}
		}
		return obj;
	}
}
