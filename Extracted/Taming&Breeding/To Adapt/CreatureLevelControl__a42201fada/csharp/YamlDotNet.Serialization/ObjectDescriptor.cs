using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;

namespace YamlDotNet.Serialization;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
internal sealed class ObjectDescriptor : IObjectDescriptor
{
	[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	[field: _003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)]
	public object Value
	{
		[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
		get;
		[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(2)]
		private set;
	}

	public Type Type { get; private set; }

	public Type StaticType { get; private set; }

	public ScalarStyle ScalarStyle { get; private set; }

	public ObjectDescriptor([_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object value, Type type, Type staticType)
		: this(value, type, staticType, ScalarStyle.Any)
	{
	}

	public ObjectDescriptor([_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object value, Type type, Type staticType, ScalarStyle scalarStyle)
	{
		Value = value;
		Type = type ?? throw new ArgumentNullException("type");
		StaticType = staticType ?? throw new ArgumentNullException("staticType");
		ScalarStyle = scalarStyle;
	}
}
