namespace ZenUI.Section;

internal class TooltipData(string detail, string summary) : ITooltipData
{
	public string Detail()
	{
		return detail;
	}

	public string Summary()
	{
		return summary;
	}
}
