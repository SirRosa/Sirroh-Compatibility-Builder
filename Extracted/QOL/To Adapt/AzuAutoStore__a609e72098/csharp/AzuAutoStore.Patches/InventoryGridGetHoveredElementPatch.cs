using System.Runtime.CompilerServices;
using AzuAutoStore.Util;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.Patches;

[HarmonyPatch(typeof(InventoryGrid), "UpdateGui")]
internal static class InventoryGridGetHoveredElementPatch
{
	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	private static void Prefix(InventoryGrid __instance)
	{
		//IL_0056: Unknown result type (might be due to invalid IL or missing references)
		//IL_0069: Unknown result type (might be due to invalid IL or missing references)
		//IL_0074: Unknown result type (might be due to invalid IL or missing references)
		InventoryElement val = ((__instance.m_uiGroup.IsActive && ZInput.IsGamepadActive()) ? __instance.GetElement(__instance.m_selected.x, __instance.m_selected.y, __instance.m_inventory.GetWidth()) : __instance.GetHoveredElement());
		if (!((Object)(object)val == (Object)null) && AzuAutoStorePlugin.SingleItemShortcut.Value.IsKeyDown())
		{
			ItemData itemAt = __instance.m_inventory.GetItemAt(val.Position.x, val.Position.y);
			if (itemAt != null && __instance.m_inventory != null)
			{
				Functions.TryStoreThisItem(itemAt, __instance.m_inventory);
			}
		}
	}
}
