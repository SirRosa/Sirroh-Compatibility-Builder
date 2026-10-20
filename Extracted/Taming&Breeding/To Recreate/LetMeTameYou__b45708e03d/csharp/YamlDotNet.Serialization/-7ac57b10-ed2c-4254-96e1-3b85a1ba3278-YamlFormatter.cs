using System;
using System.Globalization;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(0)]
[_003C82913185_002D597c_002D40dc_002D9ac4_002Dfc8a83fa3787_003ENullableContext(1)]
internal class _003C7ac57b10_002Ded2c_002D4254_002D96e1_002D3b85a1ba3278_003EYamlFormatter
{
	public static _003C7ac57b10_002Ded2c_002D4254_002D96e1_002D3b85a1ba3278_003EYamlFormatter Default { get; } = new _003C7ac57b10_002Ded2c_002D4254_002D96e1_002D3b85a1ba3278_003EYamlFormatter();

	public NumberFormatInfo NumberFormat { get; set; } = new NumberFormatInfo
	{
		CurrencyDecimalSeparator = ".",
		CurrencyGroupSeparator = "_",
		CurrencyGroupSizes = new int[1] { 3 },
		CurrencySymbol = string.Empty,
		CurrencyDecimalDigits = 99,
		NumberDecimalSeparator = ".",
		NumberGroupSeparator = "_",
		NumberGroupSizes = new int[1] { 3 },
		NumberDecimalDigits = 99,
		NaNSymbol = ".nan",
		PositiveInfinitySymbol = ".inf",
		NegativeInfinitySymbol = "-.inf"
	};

	public virtual Func<object, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector, _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention, string> FormatEnum { get; set; } = (object value, _003C0f2e048a_002Dc25c_002D452c_002Db9b3_002Ddcbaebd877c5_003EITypeInspector typeInspector, _003C6b570e97_002D8c61_002D429b_002D9b61_002D13cef86f0e8a_003EINamingConvention enumNamingConvention) =>
	{
		string empty = string.Empty;
		empty = ((value != null) ? typeInspector.GetEnumValue(value) : string.Empty);
		return enumNamingConvention.Apply(empty);
	};

	public virtual Func<object, bool> PotentiallyQuoteEnums { get; set; } = (object _) => true;

	public string FormatNumber(object number)
	{
		return Convert.ToString(number, NumberFormat);
	}

	public string FormatNumber(double number)
	{
		return number.ToString("G", NumberFormat);
	}

	public string FormatNumber(float number)
	{
		return number.ToString("G", NumberFormat);
	}

	public string FormatBoolean(object boolean)
	{
		if (!boolean.Equals(true))
		{
			return "false";
		}
		return "true";
	}

	public string FormatDateTime(object dateTime)
	{
		return ((DateTime)dateTime).ToString("o", CultureInfo.InvariantCulture);
	}

	public string FormatTimeSpan(object timeSpan)
	{
		return ((TimeSpan)timeSpan/*cast due to constrained. prefix*/).ToString();
	}
}
