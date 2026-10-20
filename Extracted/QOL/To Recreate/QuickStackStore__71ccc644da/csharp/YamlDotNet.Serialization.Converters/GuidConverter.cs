using System;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.Converters;

internal class GuidConverter : IYamlTypeConverter
{
	private readonly bool jsonCompatible;

	public GuidConverter(bool jsonCompatible)
	{
		this.jsonCompatible = jsonCompatible;
	}

	public bool Accepts(Type type)
	{
		if (!(type == typeof(Guid)))
		{
			return type == typeof(Guid?);
		}
		return true;
	}

	public object ReadYaml(IParser parser, Type type, ObjectDeserializer rootDeserializer)
	{
		string value = parser.Consume<Scalar>().Value;
		if (string.IsNullOrEmpty(value))
		{
			return null;
		}
		return new Guid(value);
	}

	public void WriteYaml(IEmitter emitter, object? value, Type type, ObjectSerializer serializer)
	{
		if (value == null)
		{
			emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, "", ScalarStyle.Plain, isPlainImplicit: true, isQuotedImplicit: false));
			return;
		}
		Guid guid = (Guid)value;
		emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, guid.ToString("D"), jsonCompatible ? ScalarStyle.DoubleQuoted : ScalarStyle.Any, isPlainImplicit: true, isQuotedImplicit: false));
	}
}
