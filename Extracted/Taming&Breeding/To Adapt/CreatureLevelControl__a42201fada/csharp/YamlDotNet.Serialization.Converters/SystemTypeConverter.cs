using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.Converters;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal class SystemTypeConverter : IYamlTypeConverter
{
	public bool Accepts(Type type)
	{
		return typeof(Type).IsAssignableFrom(type);
	}

	public object ReadYaml(IParser parser, Type type)
	{
		return Type.GetType(parser.Consume<Scalar>().Value, throwOnError: true);
	}

	public void WriteYaml(IEmitter emitter, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object value, Type type)
	{
		Type type2 = (Type)value;
		emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, type2.AssemblyQualifiedName, ScalarStyle.Any, isPlainImplicit: true, isQuotedImplicit: false));
	}
}
