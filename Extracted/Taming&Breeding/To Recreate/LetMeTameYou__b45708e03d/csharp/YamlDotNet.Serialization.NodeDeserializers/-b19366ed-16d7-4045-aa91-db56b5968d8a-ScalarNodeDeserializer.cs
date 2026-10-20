using System;
using System.Globalization;
using System.Runtime.CompilerServices;
using System.Text;
using System.Text.RegularExpressions;
using YamlDotNet.Core;
using YamlDotNet.Core.Events;
using YamlDotNet.Core.ObjectPool;
using YamlDotNet.Helpers;
using YamlDotNet.Serialization.Utilities;

namespace YamlDotNet.Serialization.NodeDeserializers;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal sealed class _003Cb19366ed_002D16d7_002D4045_002Daa91_002Ddb56b5968d8a_003EScalarNodeDeserializer : _003Cb785578c_002Db96c_002D492b_002D85eb_002Da7a6a41c8875_003EINodeDeserializer
{
	private const string BooleanTruePattern = "^(true|y|yes|on)$";

	private const string BooleanFalsePattern = "^(false|n|no|off)$";

	private readonly bool attemptUnknownTypeDeserialization;

	private readonly ITypeConverter typeConverter;

	private readonly _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector;

	private readonly _003C7ac57b10_002Ded2c_002D4254_002D96e1_002D3b85a1ba3278_003EYamlFormatter formatter;

	private readonly _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention;

	public _003Cb19366ed_002D16d7_002D4045_002Daa91_002Ddb56b5968d8a_003EScalarNodeDeserializer(bool attemptUnknownTypeDeserialization, ITypeConverter typeConverter, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector, _003C7ac57b10_002Ded2c_002D4254_002D96e1_002D3b85a1ba3278_003EYamlFormatter formatter, _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention)
	{
		this.attemptUnknownTypeDeserialization = attemptUnknownTypeDeserialization;
		this.typeConverter = typeConverter ?? throw new ArgumentNullException("typeConverter");
		this.typeInspector = typeInspector;
		this.formatter = formatter;
		this.enumNamingConvention = enumNamingConvention;
	}

	public bool Deserialize(_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser parser, Type expectedType, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(new byte[] { 1, 1, 1, 2 })] Func<_003C7c152f22_002D242a_002D414b_002D85f1_002D679cb123b4c6_003EIParser, Type, object> nestedObjectDeserializer, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] out object value, _003Ccf1bb9c3_002D9707_002D4afa_002Daa6b_002D02a0a9430a5f_003EObjectDeserializer rootDeserializer)
	{
		if (!parser.TryConsume<_003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar>(out var @event))
		{
			value = null;
			return false;
		}
		Type type = Nullable.GetUnderlyingType(expectedType) ?? FsharpHelper.GetOptionUnderlyingType(expectedType) ?? expectedType;
		if (_003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.IsEnum(type))
		{
			string name = enumNamingConvention.Reverse(@event.Value);
			name = typeInspector.GetEnumName(type, name);
			value = Enum.Parse(type, name, ignoreCase: true);
			return true;
		}
		TypeCode typeCode = _003Ce06d2af1_002D43d5_002D4dae_002Db4f7_002D148c660b753e_003EReflectionExtensions.GetTypeCode(type);
		switch (typeCode)
		{
		case TypeCode.Boolean:
			value = DeserializeBooleanHelper(@event.Value);
			break;
		case TypeCode.SByte:
		case TypeCode.Byte:
		case TypeCode.Int16:
		case TypeCode.UInt16:
		case TypeCode.Int32:
		case TypeCode.UInt32:
		case TypeCode.Int64:
		case TypeCode.UInt64:
			value = DeserializeIntegerHelper(typeCode, @event.Value);
			break;
		case TypeCode.Single:
			value = float.Parse(@event.Value, formatter.NumberFormat);
			break;
		case TypeCode.Double:
			value = double.Parse(@event.Value, formatter.NumberFormat);
			break;
		case TypeCode.Decimal:
			value = decimal.Parse(@event.Value, formatter.NumberFormat);
			break;
		case TypeCode.String:
			value = @event.Value;
			break;
		case TypeCode.Char:
			value = @event.Value[0];
			break;
		case TypeCode.DateTime:
			value = DateTime.Parse(@event.Value, CultureInfo.InvariantCulture, DateTimeStyles.RoundtripKind);
			break;
		default:
			if (expectedType == typeof(object))
			{
				if (!@event.IsKey && attemptUnknownTypeDeserialization)
				{
					value = AttemptUnknownTypeDeserialization(@event);
				}
				else
				{
					value = @event.Value;
				}
			}
			else
			{
				value = typeConverter.ChangeType(@event.Value, expectedType, enumNamingConvention, typeInspector);
			}
			break;
		}
		return true;
	}

	private static bool DeserializeBooleanHelper(string value)
	{
		if (Regex.IsMatch(value, "^(true|y|yes|on)$", RegexOptions.IgnoreCase))
		{
			return true;
		}
		if (Regex.IsMatch(value, "^(false|n|no|off)$", RegexOptions.IgnoreCase))
		{
			return false;
		}
		throw new FormatException("The value \"" + value + "\" is not a valid YAML Boolean");
	}

	private object DeserializeIntegerHelper(TypeCode typeCode, string value)
	{
		StringBuilderPool.BuilderWrapper builderWrapper = StringBuilderPool.Rent();
		try
		{
			StringBuilder builder = builderWrapper.Builder;
			int i = 0;
			bool flag = false;
			ulong num = 0uL;
			if (value[0] == '-')
			{
				i++;
				flag = true;
			}
			else if (value[0] == '+')
			{
				i++;
			}
			if (value[i] == '0')
			{
				int num2;
				if (i == value.Length - 1)
				{
					num2 = 10;
					num = 0uL;
				}
				else
				{
					i++;
					if (value[i] == 'b')
					{
						num2 = 2;
						i++;
					}
					else if (value[i] == 'x')
					{
						num2 = 16;
						i++;
					}
					else
					{
						num2 = 8;
					}
				}
				for (; i < value.Length; i++)
				{
					if (value[i] != '_')
					{
						builder.Append(value[i]);
					}
				}
				switch (num2)
				{
				case 2:
				case 8:
					num = Convert.ToUInt64(builder.ToString(), num2);
					break;
				case 16:
					num = ulong.Parse(builder.ToString(), NumberStyles.HexNumber, formatter.NumberFormat);
					break;
				}
			}
			else
			{
				string[] array = value.Substring(i).Split(new char[1] { ':' });
				num = 0uL;
				for (int j = 0; j < array.Length; j++)
				{
					num *= 60;
					num += ulong.Parse(array[j].Replace("_", ""), CultureInfo.InvariantCulture);
				}
			}
			if (!flag)
			{
				return CastInteger(num, typeCode);
			}
			long number = ((num != 9223372036854775808uL) ? checked(-(long)num) : long.MinValue);
			return CastInteger(number, typeCode);
		}
		finally
		{
			((IDisposable)builderWrapper/*cast due to constrained. prefix*/).Dispose();
		}
	}

	private static object CastInteger(long number, TypeCode typeCode)
	{
		return checked(typeCode switch
		{
			TypeCode.Byte => (object)(byte)number, 
			TypeCode.Int16 => (short)number, 
			TypeCode.Int32 => (int)number, 
			TypeCode.Int64 => number, 
			TypeCode.SByte => (sbyte)number, 
			TypeCode.UInt16 => (ushort)number, 
			TypeCode.UInt32 => (uint)number, 
			TypeCode.UInt64 => (ulong)number, 
			_ => number, 
		});
	}

	private static object CastInteger(ulong number, TypeCode typeCode)
	{
		return checked(typeCode switch
		{
			TypeCode.Byte => (object)(byte)number, 
			TypeCode.Int16 => (short)number, 
			TypeCode.Int32 => (int)number, 
			TypeCode.Int64 => (long)number, 
			TypeCode.SByte => (sbyte)number, 
			TypeCode.UInt16 => (ushort)number, 
			TypeCode.UInt32 => (uint)number, 
			TypeCode.UInt64 => number, 
			_ => number, 
		});
	}

	[return: _003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)]
	private object AttemptUnknownTypeDeserialization(_003C8284bc76_002D89b7_002D4bf8_002Daa46_002D39da1e634380_003EScalar value)
	{
		if (value.Style == _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.SingleQuoted || value.Style == _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.DoubleQuoted || value.Style == _003Cd305849e_002D94a1_002D4819_002Dbce0_002D16e0b811ff5d_003EScalarStyle.Folded)
		{
			return value.Value;
		}
		string v = value.Value;
		switch (v)
		{
		case "null":
		case "Null":
		case "NULL":
		case "~":
		case "":
			return null;
		case "true":
		case "True":
		case "TRUE":
			return true;
		case "False":
		case "FALSE":
		case "false":
			return false;
		default:
			if (Regex.IsMatch(v, "^0x[0-9a-fA-F]+$"))
			{
				v = v.Substring(2);
				if (byte.TryParse(v, NumberStyles.AllowHexSpecifier, formatter.NumberFormat, out var result))
				{
					return result;
				}
				if (short.TryParse(v, NumberStyles.AllowHexSpecifier, formatter.NumberFormat, out var result2))
				{
					return result2;
				}
				if (int.TryParse(v, NumberStyles.AllowHexSpecifier, formatter.NumberFormat, out var result3))
				{
					return result3;
				}
				if (long.TryParse(v, NumberStyles.AllowHexSpecifier, formatter.NumberFormat, out var result4))
				{
					return result4;
				}
				if (ulong.TryParse(v, NumberStyles.AllowHexSpecifier, formatter.NumberFormat, out var result5))
				{
					return result5;
				}
				return v;
			}
			if (Regex.IsMatch(v, "^0o[0-9a-fA-F]+$"))
			{
				if (!TryAndSwallow(() => Convert.ToByte(v, 8), out var value2) && !TryAndSwallow(() => Convert.ToInt16(v, 8), out value2) && !TryAndSwallow(() => Convert.ToInt32(v, 8), out value2) && !TryAndSwallow(() => Convert.ToInt64(v, 8), out value2) && !TryAndSwallow(() => Convert.ToUInt64(v, 8), out value2))
				{
					return v;
				}
				return value2;
			}
			if (Regex.IsMatch(v, "^[-+]?(\\.[0-9]+|[0-9]+(\\.[0-9]*)?)([eE][-+]?[0-9]+)?$"))
			{
				if (byte.TryParse(v, NumberStyles.Integer, formatter.NumberFormat, out var result6))
				{
					return result6;
				}
				if (short.TryParse(v, NumberStyles.Integer, formatter.NumberFormat, out var result7))
				{
					return result7;
				}
				if (int.TryParse(v, NumberStyles.Integer, formatter.NumberFormat, out var result8))
				{
					return result8;
				}
				if (long.TryParse(v, NumberStyles.Integer, formatter.NumberFormat, out var result9))
				{
					return result9;
				}
				if (ulong.TryParse(v, NumberStyles.Integer, formatter.NumberFormat, out var result10))
				{
					return result10;
				}
				if (float.TryParse(v, NumberStyles.Float, formatter.NumberFormat, out var result11))
				{
					return result11;
				}
				if (double.TryParse(v, NumberStyles.Float, formatter.NumberFormat, out var result12))
				{
					return result12;
				}
				return v;
			}
			if (Regex.IsMatch(v, "^[-+]?(\\.inf|\\.Inf|\\.INF)$"))
			{
				if (Polyfills.StartsWith(v, '-'))
				{
					return float.NegativeInfinity;
				}
				return float.PositiveInfinity;
			}
			if (Regex.IsMatch(v, "^(\\.nan|\\.NaN|\\.NAN)$"))
			{
				return float.NaN;
			}
			return v;
		}
	}

	private static bool TryAndSwallow(Func<object> attempt, [_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] out object value)
	{
		try
		{
			value = attempt();
			return true;
		}
		catch
		{
			value = null;
			return false;
		}
	}
}
