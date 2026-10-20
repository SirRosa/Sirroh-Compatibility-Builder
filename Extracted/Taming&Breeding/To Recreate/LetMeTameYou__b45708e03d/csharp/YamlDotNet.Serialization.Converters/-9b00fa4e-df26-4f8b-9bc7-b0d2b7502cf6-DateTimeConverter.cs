using System;
using System.Globalization;
using System.Linq;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.Converters;

[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
internal class _003C9b00fa4e_002Ddf26_002D4f8b_002D9bc7_002Db0d2b7502cf6_003EDateTimeConverter : _003C5384a3d0_002D8336_002D4a99_002Db8c4_002D408e36f4fefa_003EIYamlTypeConverter
{
	private readonly DateTimeKind kind;

	private readonly IFormatProvider provider;

	private readonly bool doubleQuotes;

	private readonly string[] formats;

	public _003C9b00fa4e_002Ddf26_002D4f8b_002D9bc7_002Db0d2b7502cf6_003EDateTimeConverter(DateTimeKind kind = DateTimeKind.Utc, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] IFormatProvider provider = null, bool doubleQuotes = false, params string[] formats)
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

	public object ReadYaml(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, Type type, _003Ccf1bb9c3_002D9707_002D4afa_002Daa6b_002D02a0a9430a5f_003EObjectDeserializer rootDeserializer)
	{
		string value = parser.Consume<_003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar>().Value;
		DateTimeStyles style = ((kind == DateTimeKind.Local) ? DateTimeStyles.AssumeLocal : DateTimeStyles.AssumeUniversal);
		DateTime dt = DateTime.ParseExact(value, formats, provider, style);
		dt = EnsureDateTimeKind(dt, kind);
		return dt;
	}

	public void WriteYaml(_003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] object value, Type type, _003Cff01c211_002D8732_002D4686_002Db12e_002D1c8f5a0f67f9_003EObjectSerializer serializer)
	{
		DateTime dateTime = (DateTime)value;
		string value2 = ((kind == DateTimeKind.Local) ? dateTime.ToLocalTime() : dateTime.ToUniversalTime()).ToString(formats.First(), provider);
		emitter.Emit(new _003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar(_003Ccca93639_002Dbccb_002D4800_002Dad4c_002D8f4e0d58ede2_003EAnchorName.Empty, _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName.Empty, value2, doubleQuotes ? _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.DoubleQuoted : _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Any, isPlainImplicit: true, isQuotedImplicit: false));
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
