using System;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.Converters;

internal class UriConverter : IYamlTypeConverter
{
	private readonly bool jsonCompatible;

	public UriConverter(bool jsonCompatible = false)
	{
		this.jsonCompatible = jsonCompatible;
	}

	public bool Accepts(Type type)
	{
		return type == typeof(Uri);
	}

	public object ReadYaml(IParser parser, Type type, ObjectDeserializer rootDeserializer)
	{
		string value = parser.Consume<Scalar>().Value;
		if (string.IsNullOrEmpty(value))
		{
			return null;
		}
		return new Uri(value, UriKind.RelativeOrAbsolute);
	}

	public void WriteYaml(IEmitter emitter, object? value, Type type, ObjectSerializer serializer)
	{
		if (value == null)
		{
			emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, "", ScalarStyle.Plain, isPlainImplicit: true, isQuotedImplicit: false));
			return;
		}
		Uri uri = (Uri)value;
		emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, uri.OriginalString, jsonCompatible ? ScalarStyle.DoubleQuoted : ScalarStyle.Any, isPlainImplicit: true, isQuotedImplicit: false));
	}
}
