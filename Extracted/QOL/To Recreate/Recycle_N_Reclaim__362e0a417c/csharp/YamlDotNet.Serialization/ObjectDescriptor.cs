using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal sealed class ObjectDescriptor : IObjectDescriptor
{
	[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	[field: _003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)]
	public object Value
	{
		[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
		get;
		[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(2)]
		private set;
	}

	public Type Type { get; private set; }

	public Type StaticType { get; private set; }

	public ScalarStyle ScalarStyle { get; private set; }

	public ObjectDescriptor([_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object value, Type type, Type staticType)
		: this(value, type, staticType, ScalarStyle.Any)
	{
	}

	public ObjectDescriptor([_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object value, Type type, Type staticType, ScalarStyle scalarStyle)
	{
		Value = value;
		Type = type ?? throw new ArgumentNullException("type");
		StaticType = staticType ?? throw new ArgumentNullException("staticType");
		ScalarStyle = scalarStyle;
	}
}
