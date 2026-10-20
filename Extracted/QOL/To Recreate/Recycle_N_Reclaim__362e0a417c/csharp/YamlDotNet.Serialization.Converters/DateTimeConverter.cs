using System;
using System.Globalization;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.Converters;

[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
internal class DateTimeConverter : IYamlTypeConverter
{
	private readonly DateTimeKind kind;

	private readonly IFormatProvider provider;

	private readonly bool doubleQuotes;

	private readonly string[] formats;

	public DateTimeConverter(DateTimeKind kind = DateTimeKind.Utc, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] IFormatProvider provider = null, bool doubleQuotes = false, params string[] formats)
	{
		this.kind = ((kind == DateTimeKind.Unspecified) ? DateTimeKind.Utc : kind);
		this.provider = provider ?? CultureInfo.InvariantCulture;
		this.doubleQuotes = doubleQuotes;
		this.formats = formats.DefaultIfEmpty("G").ToArray();
	}

	public bool Accepts(Type type)
	{
		return type == typeof(DateTime);
	}

	public object ReadYaml(IParser parser, Type type)
	{
		return EnsureDateTimeKind(DateTime.ParseExact(parser.Consume<Scalar>().Value, style: (kind == DateTimeKind.Local) ? DateTimeStyles.AssumeLocal : DateTimeStyles.AssumeUniversal, formats: formats, provider: provider), kind);
	}

	public void WriteYaml(IEmitter emitter, [_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(2)] object value, Type type)
	{
		DateTime dateTime = (DateTime)value;
		string value2 = ((kind == DateTimeKind.Local) ? dateTime.ToLocalTime() : dateTime.ToUniversalTime()).ToString(formats.First(), provider);
		emitter.Emit(new Scalar(AnchorName.Empty, TagName.Empty, value2, doubleQuotes ? ScalarStyle.DoubleQuoted : ScalarStyle.Any, isPlainImplicit: true, isQuotedImplicit: false));
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
