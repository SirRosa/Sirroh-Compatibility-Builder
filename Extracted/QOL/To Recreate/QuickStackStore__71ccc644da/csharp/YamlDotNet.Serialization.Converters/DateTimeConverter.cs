using System;
using System.Globalization;
using System.Linq;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.Converters;

internal class DateTimeConverter : ScalarConverterBase<DateTime>
{
	private readonly DateTimeKind kind;

	private readonly IFormatProvider provider;

	private readonly bool doubleQuotes;

	private readonly string[] formats;

	public DateTimeConverter(DateTimeKind kind = DateTimeKind.Utc, IFormatProvider? provider = null, bool doubleQuotes = false, params string[] formats)
	{
		this.kind = ((kind == DateTimeKind.Unspecified) ? DateTimeKind.Utc : kind);
		this.provider = provider ?? CultureInfo.InvariantCulture;
		this.doubleQuotes = doubleQuotes;
		this.formats = formats.DefaultIfEmpty("G").ToArray();
	}

	public override object ReadYaml(IParser parser, Type type, ObjectDeserializer rootDeserializer)
	{
		string text = ScalarConverterBase<DateTime>.ConsumeScalarValue(parser);
		if (string.IsNullOrEmpty(text))
		{
			return null;
		}
		DateTimeStyles style = ((kind == DateTimeKind.Local) ? DateTimeStyles.AssumeLocal : DateTimeStyles.AssumeUniversal);
		DateTime dt = DateTime.ParseExact(text, formats, provider, style);
		dt = EnsureDateTimeKind(dt, kind);
		return dt;
	}

	public override void WriteYaml(IEmitter emitter, object? value, Type type, ObjectSerializer serializer)
	{
		if (value == null)
		{
			emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, "", ScalarStyle.Plain, isPlainImplicit: true, isQuotedImplicit: false));
			return;
		}
		DateTime dateTime = (DateTime)value;
		string formatted = ((kind == DateTimeKind.Local) ? dateTime.ToLocalTime() : dateTime.ToUniversalTime()).ToString(formats.First(), provider);
		ScalarConverterBase<DateTime>.EmitScalar(emitter, formatted, doubleQuotes ? ScalarStyle.DoubleQuoted : ScalarStyle.Any);
	}

	private static DateTime EnsureDateTimeKind(DateTime dt, DateTimeKind kind)
	{
		if (dt.Kind == DateTimeKind.Local && kind == DateTimeKind.Utc)
		{
			return dt.ToUniversalTime();
		}
		if (dt.Kind == DateTimeKind.Utc && kind == DateTimeKind.Local)
		{
			return dt.ToLocalTime();
		}
		return dt;
	}
}
