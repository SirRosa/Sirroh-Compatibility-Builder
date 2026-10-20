using UnityEngine;

namespace QuickStackStore;

internal static class TwoButtonExtension
{
	internal static bool ShouldSpawnMiniInventoryButton(this QSSConfig.ShowTwoButtons showTwoButtons)
	{
		if ((uint)showTwoButtons <= 1u || showTwoButtons == QSSConfig.ShowTwoButtons.BothButDependingOnContext)
		{
			return true;
		}
		return false;
	}

	internal static bool ShouldShowMiniInventoryButton(this QSSConfig.ShowTwoButtons showTwoButtons, InventoryGui gui)
	{
		switch (showTwoButtons)
		{
		case QSSConfig.ShowTwoButtons.Both:
		case QSSConfig.ShowTwoButtons.OnlyInventoryButton:
			return true;
		case QSSConfig.ShowTwoButtons.BothButDependingOnContext:
			return !Object.op_Implicit((Object)(object)gui.m_currentContainer);
		default:
			return false;
		}
	}

	internal static bool ShouldSpawnContainerButton(this QSSConfig.ShowTwoButtons showTwoButtons)
	{
		if (showTwoButtons == QSSConfig.ShowTwoButtons.Both || (uint)(showTwoButtons - 2) <= 1u)
		{
			return true;
		}
		return false;
	}

	internal static bool ShouldShowContainerButton(this QSSConfig.ShowTwoButtons showTwoButtons, InventoryGui gui)
	{
		switch (showTwoButtons)
		{
		case QSSConfig.ShowTwoButtons.Both:
		case QSSConfig.ShowTwoButtons.OnlyContainerButton:
			return true;
		case QSSConfig.ShowTwoButtons.BothButDependingOnContext:
			return Object.op_Implicit((Object)(object)gui.m_currentContainer);
		default:
			return false;
		}
	}
}
