using System.Runtime.CompilerServices;
using HarmonyLib;
using UnityEngine;

namespace Recycle_N_Reclaim.GamePatches.MarkAsTrash;

[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
[HarmonyPatch(typeof(InventoryGrid))]
[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
internal class InventoryGridButtonHandlingPatches
{
	[HarmonyPatch("OnLeftClick")]
	[HarmonyPrefix]
	internal static bool OnLeftClick(InventoryGrid __instance, UIInputHandler clickHandler)
	{
		return HandleClick(__instance, clickHandler, isLeftClick: true);
	}

	internal static bool HandleClick(InventoryGrid __instance, UIInputHandler clickHandler, bool isLeftClick)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_000e: Unknown result type (might be due to invalid IL or missing references)
		Vector2i buttonPos = __instance.GetButtonPos(((Component)clickHandler).gameObject);
		return HandleClick(__instance, buttonPos, isLeftClick);
	}

	[HarmonyPatch("UpdateGamepad")]
	private static void Postfix(InventoryGrid __instance)
	{
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_004a: Unknown result type (might be due to invalid IL or missing references)
		if (!((Object)(object)__instance != (Object)(object)InventoryGui.instance.m_playerGrid) && __instance.m_uiGroup.IsActive)
		{
			if (ZInput.GetButtonDown("JoyButtonA"))
			{
				HandleClick(__instance, __instance.m_selected, isLeftClick: true);
			}
			else if (ZInput.GetButtonDown("JoyButtonX"))
			{
				HandleClick(__instance, __instance.m_selected, isLeftClick: false);
			}
		}
	}

	internal static bool HandleClick(InventoryGrid __instance, Vector2i buttonPos, bool isLeftClick)
	{
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b1: Unknown result type (might be due to invalid IL or missing references)
		if ((Object)(object)InventoryGui.instance.m_playerGrid != (Object)(object)__instance)
		{
			return true;
		}
		Player localPlayer = Player.m_localPlayer;
		if (((Character)localPlayer).IsTeleporting())
		{
			return true;
		}
		if (Object.op_Implicit((Object)(object)InventoryGui.instance.m_dragGo))
		{
			return true;
		}
		if (!TrashingMode.IsInTrashingMode())
		{
			return true;
		}
		if (buttonPos == new Vector2i(-1, -1))
		{
			return true;
		}
		if (isLeftClick)
		{
			InventoryElement val = ((__instance.m_uiGroup.IsActive && ZInput.IsGamepadActive()) ? __instance.GetElement(__instance.m_selected.x, __instance.m_selected.y, __instance.m_inventory.GetWidth()) : __instance.GetHoveredElement());
			if (val != null && val.m_used)
			{
				UserConfig.GetPlayerConfig(localPlayer.GetPlayerID()).ToggleSlotTrashing(buttonPos);
			}
		}
		return false;
	}
}
