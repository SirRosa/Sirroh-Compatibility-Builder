using System;
using UnityEngine;

namespace Zen.Lib;

public static class InventoryGridExt
{
	public static void ShowAmountText(this InventoryGrid grid, bool isVisible, Vector2i pos)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		grid.ShowAmountText(isVisible, pos.x * (pos.y + 1));
	}

	public static void ShowAmountText(this InventoryGrid grid, bool isVisible, int index = -1)
	{
		if (grid.m_elements.Count == 0)
		{
			return;
		}
		if (grid.m_elements.Count < index)
		{
			throw new ArgumentOutOfRangeException("index");
		}
		Timing.NextFrame(() =>
		{
			if (Object.op_Implicit((Object)(object)grid) && grid.m_elements != null)
			{
				Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(37, 2, out var shouldAppend);
				if (shouldAppend)
				{
					msg.AppendLiteral("Show grid element amount: ");
					msg.AppendFormatted(isVisible);
					msg.AppendLiteral(" at index: ");
					msg.AppendFormatted(index);
				}
				Logging<ModLib>.Info(msg);
				if (index == -1)
				{
					foreach (InventoryElement element in grid.m_elements)
					{
						((Component)element.m_amount).gameObject.SetActive(isVisible);
					}
					return;
				}
				((Component)grid.m_elements[index].m_amount).gameObject.SetActive(isVisible);
			}
		});
	}

	public static void DisableElement(this InventoryGrid grid, InventoryElement element)
	{
		element.m_used = false;
		if (Object.op_Implicit((Object)(object)element.m_durability))
		{
			((Component)element.m_durability).gameObject.SetActive(false);
		}
		if (Object.op_Implicit((Object)(object)element.m_icon))
		{
			((Behaviour)element.m_icon).enabled = false;
		}
		if (Object.op_Implicit((Object)(object)element.m_amount))
		{
			((Behaviour)element.m_amount).enabled = false;
		}
		if (Object.op_Implicit((Object)(object)element.m_quality))
		{
			((Behaviour)element.m_quality).enabled = false;
		}
		if (Object.op_Implicit((Object)(object)element.m_equiped))
		{
			((Behaviour)element.m_equiped).enabled = false;
		}
		if (Object.op_Implicit((Object)(object)element.m_queued))
		{
			((Behaviour)element.m_queued).enabled = false;
		}
		if (Object.op_Implicit((Object)(object)element.m_noteleport))
		{
			((Behaviour)element.m_noteleport).enabled = false;
		}
		if (Object.op_Implicit((Object)(object)element.m_food))
		{
			((Behaviour)element.m_food).enabled = false;
		}
		if (Object.op_Implicit((Object)(object)element.m_tooltip))
		{
			element.m_tooltip.m_text = string.Empty;
			element.m_tooltip.m_topic = string.Empty;
		}
	}

	public static ItemData? GetHoveredItem(this InventoryGrid grid)
	{
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		if (grid.m_uiGroup.IsActive && ZInput.GamepadActive)
		{
			return grid.GetGamepadSelectedItem();
		}
		InventoryElement hoveredElement = grid.GetHoveredElement();
		if (!((Object)(object)hoveredElement == (Object)null))
		{
			return grid.m_inventory.GetItemAt(hoveredElement.Position.x, hoveredElement.Position.y);
		}
		return null;
	}

	public static bool IsFocusedElement(this InventoryGrid grid, InventoryElement element)
	{
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_0049: Expected Obj, but got Unknown
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		//IL_004f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0053: Unknown result type (might be due to invalid IL or missing references)
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		if (grid.m_uiGroup.IsActive && ZInput.IsGamepadActive())
		{
			return (Object)(object)element == (Object)(object)grid.GetElement(grid.m_selected.x, grid.m_selected.y, grid.m_width);
		}
		RectTransform val = (RectTransform)((Component)element).transform;
		Rect rect = val.rect;
		return rect.Contains(((Transform)val).InverseTransformPoint(ZInput.pointerPosition));
	}
}
