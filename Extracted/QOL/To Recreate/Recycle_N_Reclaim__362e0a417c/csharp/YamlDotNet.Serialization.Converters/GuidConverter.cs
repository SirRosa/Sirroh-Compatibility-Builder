using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.Converters;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal class GuidConverter : IYamlTypeConverter
{
	private readonly bool jsonCompatible;

	public GuidConverter(bool jsonCompatible)
	{
		this.jsonCompatible = jsonCompatible;
	}

	public bool Accepts(Type type)
	{
		return type == typeof(Guid);
	}

	public object ReadYaml(IParser parser, Type type)
	{
		return new Guid(parser.Consume<Scalar>().Value);
	}

	public void WriteYaml(IEmitter emitter, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object value, Type type)
	{
		Guid guid = (Guid)value;
		emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, guid.ToString("D"), jsonCompatible ? ScalarStyle.DoubleQuoted : ScalarStyle.Any, isPlainImplicit: true, isQuotedImplicit: false));
	}
}
