using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Serialization;
using YamlDotNet.Serialization.Schemas;

namespace YamlDotNet.RepresentationModel;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[DebuggerDisplay("{Value}")]
internal sealed class _003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode : _003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode, _003Cfb7b8978_002D273f_002D4537_002Dab42_002Dfae47606174a_003EIYamlConvertible
{
	private bool forceImplicitPlain;

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	private string value;

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public string Value
	{
		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
		get
		{
			return value;
		}
		[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
		set
		{
			if (value == null)
			{
				forceImplicitPlain = true;
			}
			else
			{
				forceImplicitPlain = false;
			}
			this.value = value;
		}
	}

	public _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle Style { get; set; }

	public override _003Ca52a2d6b_002Db316_002D4a48_002D8e78_002Db0ca68ae1771_003EYamlNodeType NodeType => _003Ca52a2d6b_002Db316_002D4a48_002D8e78_002Db0ca68ae1771_003EYamlNodeType.Scalar;

	internal _003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, _003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState state)
	{
		Load(parser, state);
	}

	[MethodImpl(MethodImplOptions.AggressiveInlining)]
	private void Load(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, _003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState state)
	{
		_003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar obj = parser.Consume<_003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar>();
		Load(obj, state);
		string text = obj.Value;
		if (obj.Style == _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Plain && Tag.IsEmpty)
		{
			forceImplicitPlain = text.Length switch
			{
				0 => true, 
				1 => text == "~", 
				4 => text == "null" || text == "Null" || text == "NULL", 
				_ => false, 
			};
		}
		value = text;
		Style = obj.Style;
	}

	public _003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode()
	{
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	public _003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode(string value)
	{
		Value = value;
	}

	internal override void ResolveAliases(_003C62c3788e_002D48f9_002D483c_002D99ad_002D9052af30a804_003EDocumentLoadingState state)
	{
		throw new NotSupportedException("Resolving an alias on a scalar node does not make sense");
	}

	internal override void Emit(_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter, _003C1c7e9eed_002D3476_002D4523_002D96b3_002D4f50ec92e55b_003EEmitterState state)
	{
		_003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName tag = Tag;
		bool isPlainImplicit = tag.IsEmpty;
		if (forceImplicitPlain && Style == _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Plain && (Value == null || Value == ""))
		{
			tag = _003C7e9c1dba_002D2035_002D4200_002D8a6c_002D11ff08451d09_003EJsonSchema.Tags.Null;
			isPlainImplicit = true;
		}
		else if (tag.IsEmpty && Value == null && (Style == _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Plain || Style == _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Any))
		{
			tag = _003C7e9c1dba_002D2035_002D4200_002D8a6c_002D11ff08451d09_003EJsonSchema.Tags.Null;
			isPlainImplicit = true;
		}
		emitter.Emit(new _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar(Anchor, tag, Value ?? string.Empty, Style, isPlainImplicit, isQuotedImplicit: false));
	}

	public override void Accept(_003C27b184bf_002D18f6_002D479b_002D8c90_002D05f0cd8bd61f_003EIYamlVisitor visitor)
	{
		visitor.Visit(this);
	}

	[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		if (obj is _003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode obj2 && object.Equals(Tag, obj2.Tag))
		{
			return object.Equals(Value, obj2.Value);
		}
		return false;
	}

	public override int GetHashCode()
	{
		return _003Ceda05417_002Dc99c_002D442b_002D93de_002De22ef768bacb_003EHashCode.CombineHashCodes(Tag.GetHashCode(), Value);
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	public static explicit operator string(_003Ced606403_002D50f4_002D45bb_002D937c_002Dd7291a9503af_003EYamlScalarNode value)
	{
		return value.Value;
	}

	internal override string ToString(_003C0330118d_002Da7bd_002D47a5_002D8c95_002D32910628e74b_003ERecursionLevel level)
	{
		return Value ?? string.Empty;
	}

	internal override IEnumerable<_003C9bd7dc0e_002Da92c_002D42b1_002Db9bf_002D8bdf32b007ce_003EYamlNode> SafeAllNodes(_003C0330118d_002Da7bd_002D47a5_002D8c95_002D32910628e74b_003ERecursionLevel level)
	{
		yield return this;
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
