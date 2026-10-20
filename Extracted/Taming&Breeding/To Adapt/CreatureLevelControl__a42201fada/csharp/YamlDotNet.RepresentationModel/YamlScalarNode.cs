using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Serialization;

namespace YamlDotNet.RepresentationModel;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[DebuggerDisplay("{Value}")]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class YamlScalarNode : YamlNode, IYamlConvertible
{
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	[field: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	public string Value
	{
		[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
		get;
		[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
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

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
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

	[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
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
		return YamlDotNet.Core.HashCode.CombineHashCodes(Tag, Value);
	}

	[return: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
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
