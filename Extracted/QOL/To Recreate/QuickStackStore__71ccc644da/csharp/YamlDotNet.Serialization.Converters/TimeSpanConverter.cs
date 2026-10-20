using System;
using System.Globalization;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.Converters;

internal class TimeSpanConverter : IYamlTypeConverter
{
	private readonly bool jsonCompatible;

	public TimeSpanConverter(bool jsonCompatible = false)
	{
		this.jsonCompatible = jsonCompatible;
	}

	public bool Accepts(Type type)
	{
		if (!(type == typeof(TimeSpan)))
		{
			return type == typeof(TimeSpan?);
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
		return TimeSpan.Parse(value, CultureInfo.InvariantCulture);
	}

	public void WriteYaml(IEmitter emitter, object? value, Type type, ObjectSerializer serializer)
	{
		if (value == null)
		{
			emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, "", ScalarStyle.Plain, isPlainImplicit: true, isQuotedImplicit: false));
			return;
		}
		string value2 = ((TimeSpan)value).ToString("c", CultureInfo.InvariantCulture);
		emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, value2, jsonCompatible ? ScalarStyle.DoubleQuoted : ScalarStyle.Any, isPlainImplicit: true, isQuotedImplicit: false));
	}
}
