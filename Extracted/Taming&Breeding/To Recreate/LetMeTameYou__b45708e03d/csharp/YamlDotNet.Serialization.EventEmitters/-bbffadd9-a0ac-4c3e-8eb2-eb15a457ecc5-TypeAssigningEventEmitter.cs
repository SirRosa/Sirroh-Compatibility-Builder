using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Text.RegularExpressions;
using YamlDotNet.Core;
using YamlDotNet.Serialization.Schemas;

namespace YamlDotNet.Serialization.EventEmitters;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal sealed class _003Cbbffadd9_002Da0ac_002D4c3e_002D8eb2_002Deb15a457ecc5_003ETypeAssigningEventEmitter : _003C2c280942_002D8e06_002D4626_002Da61e_002D3b13681e453e_003EChainedEventEmitter
{
	private readonly IDictionary<Type, _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName> tagMappings;

	private readonly bool quoteNecessaryStrings;

	[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	private readonly Regex isSpecialStringValue_Regex;

	private static readonly string SpecialStrings_Pattern = "^(null|Null|NULL|\\~|true|True|TRUE|false|False|FALSE|[-+]?[0-9]+|0o[0-7]+|0x[0-9a-fA-F]+|[-+]?(\\.[0-9]+|[0-9]+(\\.[0-9]*)?)([eE][-+]?[0-9]+)?|[-+]?(\\.inf|\\.Inf|\\.INF)|\\.nan|\\.NaN|\\.NAN|\\s.*)$";

	private static readonly string CombinedYaml1_1SpecialStrings_Pattern = "^(null|Null|NULL|\\~|true|True|TRUE|false|False|FALSE|y|Y|yes|Yes|YES|n|N|no|No|NO|on|On|ON|off|Off|OFF|[-+]?0b[0-1_]+|[-+]?0o?[0-7_]+|[-+]?(0|[1-9][0-9_]*)|[-+]?0x[0-9a-fA-F_]+|[-+]?[1-9][0-9_]*(:[0-5]?[0-9])+|[-+]?([0-9][0-9_]*)?\\.[0-9_]*([eE][-+][0-9]+)?|[-+]?[0-9][0-9_]*(:[0-5]?[0-9])+\\.[0-9_]*|[-+]?\\.(inf|Inf|INF)|\\.(nan|NaN|NAN))$";

	private readonly _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle defaultScalarStyle;

	private readonly _003C7ac57b10_002Ded2c_002D4254_002D96e1_002D3b85a1ba3278_003EYamlFormatter formatter;

	private readonly _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention;

	private readonly _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector;

	public _003Cbbffadd9_002Da0ac_002D4c3e_002D8eb2_002Deb15a457ecc5_003ETypeAssigningEventEmitter(_003Ca359f02a_002D4850_002D48f6_002Da961_002Dc904bad904ab_003EIEventEmitter nextEmitter, IDictionary<Type, _003Cc95e2442_002D9554_002D4a91_002D80d4_002De2a252f4f81d_003ETagName> tagMappings, bool quoteNecessaryStrings, bool quoteYaml1_1Strings, _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle defaultScalarStyle, _003C7ac57b10_002Ded2c_002D4254_002D96e1_002D3b85a1ba3278_003EYamlFormatter formatter, _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector)
		: base(nextEmitter)
	{
		this.defaultScalarStyle = defaultScalarStyle;
		this.formatter = formatter;
		this.tagMappings = tagMappings;
		this.quoteNecessaryStrings = quoteNecessaryStrings;
		isSpecialStringValue_Regex = new Regex(quoteYaml1_1Strings ? CombinedYaml1_1SpecialStrings_Pattern : SpecialStrings_Pattern, RegexOptions.Compiled);
		this.enumNamingConvention = enumNamingConvention;
		this.typeInspector = typeInspector;
	}

	public override void Emit(_003C770f57fd_002Dbae1_002D4ccf_002D8ccf_002D88c849ae3ab1_003EScalarEventInfo eventInfo, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter)
	{
		_003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle style = _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Plain;
		object value = eventInfo.Source.Value;
		if (value == null)
		{
			eventInfo.Tag = _003C7e9c1dba_002D2035_002D4200_002D8a6c_002D11ff08451d09_003EJsonSchema.Tags.Null;
			eventInfo.RenderedValue = "";
		}
		else
		{
			TypeCode typeCode = _003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.GetTypeCode(eventInfo.Source.Type);
			switch (typeCode)
			{
			case TypeCode.Boolean:
				eventInfo.Tag = _003C7e9c1dba_002D2035_002D4200_002D8a6c_002D11ff08451d09_003EJsonSchema.Tags.Bool;
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
				if (eventInfo.Source.Type.IsEnum)
				{
					eventInfo.Tag = _003C17e3138a_002D6846_002D4cb2_002D9350_002D191c04acb229_003EFailsafeSchema.Tags.Str;
					eventInfo.RenderedValue = formatter.FormatEnum(value, typeInspector, enumNamingConvention);
					style = ((!quoteNecessaryStrings || !IsSpecialStringValue(eventInfo.RenderedValue) || !formatter.PotentiallyQuoteEnums(value)) ? defaultScalarStyle : _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.DoubleQuoted);
				}
				else
				{
					eventInfo.Tag = _003C7e9c1dba_002D2035_002D4200_002D8a6c_002D11ff08451d09_003EJsonSchema.Tags.Int;
					eventInfo.RenderedValue = formatter.FormatNumber(value);
				}
				break;
			case TypeCode.Single:
				eventInfo.Tag = _003C7e9c1dba_002D2035_002D4200_002D8a6c_002D11ff08451d09_003EJsonSchema.Tags.Float;
				eventInfo.RenderedValue = formatter.FormatNumber((float)value);
				break;
			case TypeCode.Double:
				eventInfo.Tag = _003C7e9c1dba_002D2035_002D4200_002D8a6c_002D11ff08451d09_003EJsonSchema.Tags.Float;
				eventInfo.RenderedValue = formatter.FormatNumber((double)value);
				break;
			case TypeCode.Decimal:
				eventInfo.Tag = _003C7e9c1dba_002D2035_002D4200_002D8a6c_002D11ff08451d09_003EJsonSchema.Tags.Float;
				eventInfo.RenderedValue = formatter.FormatNumber(value);
				break;
			case TypeCode.Char:
			case TypeCode.String:
				eventInfo.Tag = _003C17e3138a_002D6846_002D4cb2_002D9350_002D191c04acb229_003EFailsafeSchema.Tags.Str;
				eventInfo.RenderedValue = value.ToString();
				style = ((!quoteNecessaryStrings || !IsSpecialStringValue(eventInfo.RenderedValue)) ? defaultScalarStyle : _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.DoubleQuoted);
				break;
			case TypeCode.DateTime:
				eventInfo.Tag = _003C78294957_002D2874_002D420d_002Dbacf_002D7cea9f078e7b_003EDefaultSchema.Tags.Timestamp;
				eventInfo.RenderedValue = formatter.FormatDateTime(value);
				break;
			case TypeCode.Empty:
				eventInfo.Tag = _003C7e9c1dba_002D2035_002D4200_002D8a6c_002D11ff08451d09_003EJsonSchema.Tags.Null;
				eventInfo.RenderedValue = "";
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
		eventInfo.IsPlainImplicit = true;
		if (eventInfo.Style == _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Any)
		{
			eventInfo.Style = style;
		}
		base.Emit(eventInfo, emitter);
	}

	public override void Emit(_003Cf86b4489_002D7ae4_002D48a5_002Dbf69_002D820dcd79c453_003EMappingStartEventInfo eventInfo, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter)
	{
		AssignTypeIfNeeded(eventInfo);
		base.Emit(eventInfo, emitter);
	}

	public override void Emit(_003C36d39d35_002D67a3_002D41cc_002Da600_002De72a94055f2e_003ESequenceStartEventInfo eventInfo, _003Ce3ac13c3_002D7cb5_002D4d88_002D8b7b_002D9dd21bdaf81d_003EIEmitter emitter)
	{
		AssignTypeIfNeeded(eventInfo);
		base.Emit(eventInfo, emitter);
	}

	private void AssignTypeIfNeeded(_003C68dcbd18_002Db9a3_002D4f62_002D9af5_002Db28bc905cb81_003EObjectEventInfo eventInfo)
	{
		if (tagMappings.TryGetValue(eventInfo.Source.Type, out var value))
		{
			eventInfo.Tag = value;
		}
	}

	private bool IsSpecialStringValue(string value)
	{
		if (value.Trim() == string.Empty)
		{
			return true;
		}
		return isSpecialStringValue_Regex?.IsMatch(value) ?? false;
	}
}
