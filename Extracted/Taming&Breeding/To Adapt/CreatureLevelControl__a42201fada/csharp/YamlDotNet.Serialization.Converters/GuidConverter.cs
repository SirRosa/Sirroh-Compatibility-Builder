using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.Converters;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
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

	public void WriteYaml(IEmitter emitter, [_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(2)] object value, Type type)
	{
		Guid guid = (Guid)value;
		emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, guid.ToString("D"), jsonCompatible ? ScalarStyle.DoubleQuoted : ScalarStyle.Any, isPlainImplicit: true, isQuotedImplicit: false));
	}
}
