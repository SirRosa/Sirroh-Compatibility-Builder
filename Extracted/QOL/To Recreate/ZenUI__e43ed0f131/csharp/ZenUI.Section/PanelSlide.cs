using HarmonyLib;
using UnityEngine;
using Zen.Lib;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class PanelSlide
{
	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "Show")]
	private static void InventoryGui_Show(InventoryGui __instance, Container container)
	{
		if (Configs.NoSlideAnimation.Value)
		{
			__instance.ToggleVisibleNoSlide(isVisible: true, container);
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "Hide")]
	private static void InventoryGui_Hide(InventoryGui __instance)
	{
		if (Configs.NoSlideAnimation.Value)
		{
			__instance.ToggleVisibleNoSlide(isVisible: false, null);
			__instance.m_containerName.text = string.Empty;
			__instance.ContainerGrid.DisableAllElements();
		}
	}

	private static void ToggleVisibleNoSlide(this InventoryGui gui, bool isVisible, Container? container)
	{
		if (isVisible)
		{
			if (!Object.op_Implicit((Object)(object)container))
			{
				((Component)gui.m_container).gameObject.SetActive(false);
			}
		}
		else if (Object.op_Implicit((Object)(object)gui.m_currentContainer))
		{
			((Component)gui.m_container).gameObject.SetActive(true);
		}
		string text = (isVisible ? "inventory_show" : "inventory_hide");
		gui.m_animator.Play(text, 0, 1f);
		gui.m_animator.Update(0f);
	}

	private static void DisableAllElements(this InventoryGrid? grid)
	{
		if ((Object)(object)grid == (Object)null)
		{
			return;
		}
		foreach (InventoryElement element in grid.m_elements)
		{
			grid.DisableElement(element);
		}
	}
}
