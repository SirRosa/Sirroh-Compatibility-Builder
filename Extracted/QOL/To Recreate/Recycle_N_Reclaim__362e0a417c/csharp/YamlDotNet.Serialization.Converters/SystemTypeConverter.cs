using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.Converters;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
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

	public void WriteYaml(IEmitter emitter, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object value, Type type)
	{
		Type type2 = (Type)value;
		emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, type2.AssemblyQualifiedName, ScalarStyle.Any, isPlainImplicit: true, isQuotedImplicit: false));
	}
}
