using System.Runtime.CompilerServices;
using HarmonyLib;
using UnityEngine;

namespace AzuAutoStore.Patches.Favoriting;

[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(0)]
[HarmonyPatch(typeof(InventoryGrid))]
internal class InventoryGridButtonHandlingPatches
{
	[HarmonyPrefix]
	[HarmonyPatch("OnRightDown")]
	internal static bool OnRightClick(InventoryGrid __instance, UIInputHandler element)
	{
		return HandleClick(__instance, element, isLeftClick: false);
	}

	[HarmonyPatch("OnLeftDown")]
	[HarmonyPrefix]
	internal static bool OnLeftDown(InventoryGrid __instance, UIInputHandler clickHandler)
	{
		return HandleClick(__instance, clickHandler, isLeftClick: true);
	}

	internal static bool HandleClick(InventoryGrid __instance, UIInputHandler clickHandler, bool isLeftClick)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_000e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0015: Unknown result type (might be due to invalid IL or missing references)
		Vector2i buttonPos = __instance.GetButtonPos(((Component)clickHandler).gameObject);
		return HandleClick(__instance, buttonPos, isLeftClick, AzuAutoStorePlugin.SearchModifierKeybind.Value.IsKeyHeld());
	}

	[HarmonyPatch("UpdateGamepad")]
	private static void Postfix(InventoryGrid __instance)
	{
		//IL_002f: Unknown result type (might be due to invalid IL or missing references)
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
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

	internal static bool HandleClick(InventoryGrid __instance, Vector2i buttonPos, bool isLeftClick, bool searchBypass = false)
	{
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		//IL_0043: Unknown result type (might be due to invalid IL or missing references)
		//IL_005f: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b5: Unknown result type (might be due to invalid IL or missing references)
		//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
		//IL_0070: Unknown result type (might be due to invalid IL or missing references)
		//IL_0076: Unknown result type (might be due to invalid IL or missing references)
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
		if (!FavoritingMode.IsInFavoritingMode())
		{
			return true;
		}
		if (buttonPos == new Vector2i(-1, -1))
		{
			return true;
		}
		if (!isLeftClick)
		{
			UserConfig.GetPlayerConfig(localPlayer.GetPlayerID()).ToggleSlotFavoriting(buttonPos);
		}
		else if (searchBypass)
		{
			ItemData itemAt = __instance.m_inventory.GetItemAt(buttonPos.x, buttonPos.y);
			if (itemAt == null)
			{
				return true;
			}
			((Terminal)Chat.instance).TryRunCommand("azuautostoresearch " + ((Object)itemAt.m_dropPrefab).name.ToLower(), false, true);
		}
		else
		{
			ItemData itemAt2 = __instance.m_inventory.GetItemAt(buttonPos.x, buttonPos.y);
			if (itemAt2 == null)
			{
				return true;
			}
			UserConfig.GetPlayerConfig(localPlayer.GetPlayerID()).ToggleItemNameFavoriting(itemAt2.m_shared);
		}
		return false;
	}
}
