using System;
using System.Globalization;
using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

[_003C6904cc35_002Df760_002D4462_002Dadce_002D303240664b60_003ENullable(0)]
[_003C07e15e1d_002D2b25_002D4848_002D91c4_002D625313a8aa79_003ENullableContext(1)]
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
		return number.ToString("G17", NumberFormat);
	}

	public static string FormatNumber(float number)
	{
		return number.ToString("G17", NumberFormat);
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
