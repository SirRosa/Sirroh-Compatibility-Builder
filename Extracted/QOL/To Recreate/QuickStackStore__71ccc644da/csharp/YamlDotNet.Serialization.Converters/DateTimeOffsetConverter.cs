using System;
using System.Globalization;
using System.Linq;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.Converters;

internal class DateTimeOffsetConverter : ScalarConverterBase<DateTimeOffset>
{
	private readonly IFormatProvider provider;

	private readonly ScalarStyle style;

	private readonly DateTimeStyles dateStyle;

	private readonly string[] formats;

	public DateTimeOffsetConverter(IFormatProvider? provider = null, ScalarStyle style = ScalarStyle.Any, DateTimeStyles dateStyle = DateTimeStyles.None, params string[] formats)
	{
		this.provider = provider ?? CultureInfo.InvariantCulture;
		this.style = style;
		this.dateStyle = dateStyle;
		this.formats = formats.DefaultIfEmpty("O").ToArray();
	}

	public override object ReadYaml(IParser parser, Type type, ObjectDeserializer rootDeserializer)
	{
		string text = ScalarConverterBase<DateTimeOffset>.ConsumeScalarValue(parser);
		if (string.IsNullOrEmpty(text))
		{
			return null;
		}
		DateTimeOffset dateTimeOffset = DateTimeOffset.ParseExact(text, formats, provider, dateStyle);
		return dateTimeOffset;
	}

	public override void WriteYaml(IEmitter emitter, object? value, Type type, ObjectSerializer serializer)
	{
		if (value == null)
		{
			emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, "", ScalarStyle.Plain, isPlainImplicit: true, isQuotedImplicit: false));
			return;
		}
		string formatted = ((DateTimeOffset)value).ToString(formats.First(), provider);
		ScalarConverterBase<DateTimeOffset>.EmitScalar(emitter, formatted, style);
	}
}
