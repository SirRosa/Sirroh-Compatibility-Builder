using System;
using System.Globalization;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.Converters;

internal class DateTime8601Converter : ScalarConverterBase<DateTime>
{
	private readonly ScalarStyle scalarStyle;

	public DateTime8601Converter()
		: this(ScalarStyle.Any)
	{
	}

	public DateTime8601Converter(ScalarStyle scalarStyle)
	{
		this.scalarStyle = scalarStyle;
	}

	public override object ReadYaml(IParser parser, Type type, ObjectDeserializer rootDeserializer)
	{
		string text = ScalarConverterBase<DateTime>.ConsumeScalarValue(parser);
		if (string.IsNullOrEmpty(text))
		{
			return null;
		}
		DateTime dateTime = DateTime.ParseExact(text, "O", CultureInfo.InvariantCulture, DateTimeStyles.RoundtripKind);
		return dateTime;
	}

	public override void WriteYaml(IEmitter emitter, object? value, Type type, ObjectSerializer serializer)
	{
		if (value == null)
		{
			emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, "", ScalarStyle.Plain, isPlainImplicit: true, isQuotedImplicit: false));
			return;
		}
		string formatted = ((DateTime)value).ToString("O", CultureInfo.InvariantCulture);
		ScalarConverterBase<DateTime>.EmitScalar(emitter, formatted, scalarStyle);
	}
}
