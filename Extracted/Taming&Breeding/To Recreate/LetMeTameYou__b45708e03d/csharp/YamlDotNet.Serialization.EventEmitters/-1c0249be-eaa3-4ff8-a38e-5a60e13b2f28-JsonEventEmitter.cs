using System;
using System.Globalization;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.EventEmitters;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal sealed class _003C1c0249be_002Deaa3_002D4ff8_002Da38e_002D5a60e13b2f28_003EJsonEventEmitter : _003C2c280942_002D8e06_002D4626_002Da61e_002D3b13681e453e_003EChainedEventEmitter
{
	private readonly _003C7ac57b10_002Ded2c_002D4254_002D96e1_002D3b85a1ba3278_003EYamlFormatter formatter;

	private readonly _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention;

	private readonly _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector;

	public _003C1c0249be_002Deaa3_002D4ff8_002Da38e_002D5a60e13b2f28_003EJsonEventEmitter(_003Ca359f02a_002D4850_002D48f6_002Da961_002Dc904bad904ab_003EIEventEmitter nextEmitter, _003C7ac57b10_002Ded2c_002D4254_002D96e1_002D3b85a1ba3278_003EYamlFormatter formatter, _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector)
		: base(nextEmitter)
	{
		this.formatter = formatter;
		this.enumNamingConvention = enumNamingConvention;
		this.typeInspector = typeInspector;
	}

	public override void Emit(_003C695b7599_002D579b_002D401a_002Db6a8_002De16fca8b4542_003EAliasEventInfo eventInfo, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter)
	{
		eventInfo.NeedsExpansion = true;
	}

	public override void Emit(_003C770f57fd_002Dbae1_002D4ccf_002D8ccf_002D88c849ae3ab1_003EScalarEventInfo eventInfo, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter)
	{
		eventInfo.IsPlainImplicit = true;
		eventInfo.Style = _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Plain;
		object value = eventInfo.Source.Value;
		if (value == null)
		{
			eventInfo.RenderedValue = "null";
		}
		else
		{
			TypeCode typeCode = _003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.GetTypeCode(eventInfo.Source.Type);
			switch (typeCode)
			{
			case TypeCode.Boolean:
				eventInfo.RenderedValue = formatter.FormatBoolean(value);
				break;
			case TypeCode.SByte:
			case TypeCode.Byte:
			case TypeCode.Int16:
			case TypeCode.UInt16:
			case TypeCode.Int32:
			case TypeCode.UInt32:
			case TypeCode.Int64:
			case TypeCode.UInt64:
				if (_003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.IsEnum(eventInfo.Source.Type))
				{
					eventInfo.RenderedValue = formatter.FormatEnum(value, typeInspector, enumNamingConvention);
					eventInfo.Style = ((!formatter.PotentiallyQuoteEnums(value)) ? _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Plain : _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.DoubleQuoted);
				}
				else
				{
					eventInfo.RenderedValue = formatter.FormatNumber(value);
				}
				break;
			case TypeCode.Single:
			{
				float f = (float)value;
				eventInfo.RenderedValue = f.ToString("G", CultureInfo.InvariantCulture);
				if (float.IsNaN(f) || float.IsInfinity(f))
				{
					eventInfo.Style = _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.DoubleQuoted;
				}
				break;
			}
			case TypeCode.Double:
			{
				double d = (double)value;
				eventInfo.RenderedValue = d.ToString("G", CultureInfo.InvariantCulture);
				if (double.IsNaN(d) || double.IsInfinity(d))
				{
					eventInfo.Style = _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.DoubleQuoted;
				}
				break;
			}
			case TypeCode.Decimal:
				eventInfo.RenderedValue = ((decimal)value).ToString(CultureInfo.InvariantCulture);
				break;
			case TypeCode.Char:
			case TypeCode.String:
				eventInfo.RenderedValue = value.ToString();
				eventInfo.Style = _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.DoubleQuoted;
				break;
			case TypeCode.DateTime:
				eventInfo.RenderedValue = formatter.FormatDateTime(value);
				break;
			case TypeCode.Empty:
				eventInfo.RenderedValue = "null";
				break;
			default:
				if (eventInfo.Source.Type == typeof(TimeSpan))
				{
					eventInfo.RenderedValue = formatter.FormatTimeSpan(value);
					break;
				}
				throw new NotSupportedException($"TypeCode.{typeCode} is not supported.");
			}
		}
		base.Emit(eventInfo, emitter);
	}

	public override void Emit(_003Cf86b4489_002D7ae4_002D48a5_002Dbf69_002D820dcd79c453_003EMappingStartEventInfo eventInfo, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter)
	{
		eventInfo.Style = _003C4531dc81_002Df938_002D4560_002D9983_002D291645827825_003EMappingStyle.Flow;
		base.Emit(eventInfo, emitter);
	}

	public override void Emit(_003C36d39d35_002D67a3_002D41cc_002Da600_002De72a94055f2e_003ESequenceStartEventInfo eventInfo, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter)
	{
		eventInfo.Style = _003Ca02ab24e_002Db5a8_002D4bd7_002D916e_002D7ccfa73d61ca_003ESequenceStyle.Flow;
		base.Emit(eventInfo, emitter);
	}
}
