using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Serialization;

namespace YamlDotNet.RepresentationModel;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[DebuggerDisplay("{Value}")]
internal sealed class YamlScalarNode : YamlNode, IYamlConvertible
{
	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	[field: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public string Value
	{
		[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
		get;
		[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
		set;
	}

	public ScalarStyle Style { get; set; }

	public override YamlNodeType NodeType => YamlNodeType.Scalar;

	internal YamlScalarNode(IParser parser, DocumentLoadingState state)
	{
		Load(parser, state);
	}

	private void Load(IParser parser, DocumentLoadingState state)
	{
		Scalar scalar = parser.Consume<Scalar>();
		Load(scalar, state);
		Value = scalar.Value;
		Style = scalar.Style;
	}

	public YamlScalarNode()
	{
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
	public YamlScalarNode(string value)
	{
		Value = value;
	}

	internal override void ResolveAliases(DocumentLoadingState state)
	{
		throw new NotSupportedException("Resolving an alias on a scalar node does not make sense");
	}

	internal override void Emit(IEmitter emitter, EmitterState state)
	{
		emitter.Emit(new Scalar(Anchor, Tag, Value ?? string.Empty, Style, Tag.IsEmpty, isQuotedImplicit: false));
	}

	public override void Accept(IYamlVisitor visitor)
	{
		visitor.Visit(this);
	}

	[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
	public override bool Equals(object obj)
	{
		if (obj is YamlScalarNode yamlScalarNode && object.Equals(Tag, yamlScalarNode.Tag))
		{
			return object.Equals(Value, yamlScalarNode.Value);
		}
		return false;
	}

	public override int GetHashCode()
	{
		return YamlDotNet.Core.HashCode.CombineHashCodes(Tag.GetHashCode(), Value);
	}

	[return: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public static explicit operator string(YamlScalarNode value)
	{
		return value.Value;
	}

	internal override string ToString(RecursionLevel level)
	{
		return Value ?? string.Empty;
	}

	internal override IEnumerable<YamlNode> SafeAllNodes(RecursionLevel level)
	{
		yield return this;
	}

	void IYamlConvertible.Read(IParser parser, Type expectedType, ObjectDeserializer nestedObjectDeserializer)
	{
		Load(parser, new DocumentLoadingState());
	}

	void IYamlConvertible.Write(IEmitter emitter, ObjectSerializer nestedObjectSerializer)
	{
		Emit(emitter, new EmitterState());
	}
}
