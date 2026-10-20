using System;
using System.Globalization;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003C803c1201_002Db0ca_002D444d_002D853f_002D458ef77c9197_003ENullable(0)]
[_003Cb1cb263d_002Dbe44_002D4c1a_002D933e_002D4d061ea9093c_003ENullableContext(1)]
internal static class YamlFormatter
{
	public static readonly NumberFormatInfo NumberFormat = new NumberFormatInfo
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

	public static string FormatNumber(object number)
	{
		return Convert.ToString(number, NumberFormat);
	}

	public static string FormatNumber(double number)
	{
		return number.ToString("G", NumberFormat);
	}

	public static string FormatNumber(float number)
	{
		return number.ToString("G", NumberFormat);
	}

	public static string FormatBoolean(object boolean)
	{
		if (!boolean.Equals(true))
		{
			return "false";
		}
		return "true";
	}

	public static string FormatDateTime(object dateTime)
	{
		return ((DateTime)dateTime).ToString("o", CultureInfo.InvariantCulture);
	}

	public static string FormatTimeSpan(object timeSpan)
	{
		return ((TimeSpan)timeSpan/*cast due to constrained. prefix*/).ToString();
	}
}
