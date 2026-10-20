using Zen.Lib;

namespace ZenUI.Section;

internal class TooltipDataItem(ItemData item, bool isCraftPanel, int amount = -1) : ITooltipData
{
	public ItemData Item => item;

	private int StackOverride
	{
		get
		{
			if (amount < 0)
			{
				if (!isCraftPanel)
				{
					return -1;
				}
				return item.GetCraftAmount();
			}
			return amount;
		}
	}

	public string Detail()
	{
		if (!isCraftPanel)
		{
			return item.GetTooltip(StackOverride);
		}
		return item.GetTooltipCrafting(StackOverride);
	}

	public string Summary()
	{
		return item.GetTooltipSummary(StackOverride);
	}
}
