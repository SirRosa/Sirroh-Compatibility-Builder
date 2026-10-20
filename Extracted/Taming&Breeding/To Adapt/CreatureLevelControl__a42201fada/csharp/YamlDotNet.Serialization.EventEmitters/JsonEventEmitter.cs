using System;
using System.Runtime.CompilerServices;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;

namespace YamlDotNet.Serialization.EventEmitters;

[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
internal sealed class JsonEventEmitter : ChainedEventEmitter
{
	public JsonEventEmitter(IEventEmitter nextEmitter)
		: base(nextEmitter)
	{
	}

	public override void Emit(AliasEventInfo eventInfo, IEmitter emitter)
	{
		eventInfo.NeedsExpansion = true;
	}

	public override void Emit(ScalarEventInfo eventInfo, IEmitter emitter)
	{
		eventInfo.IsPlainImplicit = true;
		eventInfo.Style = ScalarStyle.Plain;
		object value = eventInfo.Source.Value;
		if (value == null)
		{
			eventInfo.RenderedValue = "null";
		}
		else
		{
			TypeCode typeCode = eventInfo.Source.Type.GetTypeCode();
			switch (typeCode)
			{
			case TypeCode.Boolean:
				eventInfo.RenderedValue = YamlFormatter.FormatBoolean(value);
				break;
			case TypeCode.SByte:
			case TypeCode.Byte:
			case TypeCode.Int16:
			case TypeCode.UInt16:
			case TypeCode.Int32:
			case TypeCode.UInt32:
			case TypeCode.Int64:
			case TypeCode.UInt64:
				if (eventInfo.Source.Type.IsEnum())
				{
					eventInfo.RenderedValue = value.ToString();
					eventInfo.Style = ScalarStyle.DoubleQuoted;
				}
				else
				{
					eventInfo.RenderedValue = YamlFormatter.FormatNumber(value);
				}
				break;
			case TypeCode.Single:
			case TypeCode.Double:
			case TypeCode.Decimal:
				eventInfo.RenderedValue = YamlFormatter.FormatNumber(value);
				break;
			case TypeCode.Char:
			case TypeCode.String:
				eventInfo.RenderedValue = value.ToString();
				eventInfo.Style = ScalarStyle.DoubleQuoted;
				break;
			case TypeCode.DateTime:
				eventInfo.RenderedValue = YamlFormatter.FormatDateTime(value);
				break;
			case TypeCode.Empty:
				eventInfo.RenderedValue = "null";
				break;
			default:
				if (eventInfo.Source.Type == typeof(TimeSpan))
				{
					eventInfo.RenderedValue = YamlFormatter.FormatTimeSpan(value);
					break;
				}
				throw new NotSupportedException($"TypeCode.{typeCode} is not supported.");
			}
		}
		base.Emit(eventInfo, emitter);
	}

	public override void Emit(MappingStartEventInfo eventInfo, IEmitter emitter)
	{
		eventInfo.Style = MappingStyle.Flow;
		base.Emit(eventInfo, emitter);
	}

	public override void Emit(SequenceStartEventInfo eventInfo, IEmitter emitter)
	{
		eventInfo.Style = SequenceStyle.Flow;
		base.Emit(eventInfo, emitter);
	}
}
