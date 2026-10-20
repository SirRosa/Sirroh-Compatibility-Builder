using System;
using System.Linq;
using BepInEx.Configuration;
using HarmonyLib;
using UnityEngine;

namespace QuickStackStore;

[HarmonyPatch]
public static class KeybindChecker
{
	[HarmonyPatch(typeof(Player))]
	public static class Player_Update_Patch
	{
		[HarmonyPatch("Update")]
		[HarmonyPostfix]
		public static void Postfix_Patch(Player __instance)
		{
			if (!((Object)(object)Player.m_localPlayer != (Object)(object)__instance) && !IgnoreKeyPresses())
			{
				if (ZInput.IsGamepadActive() && QSSConfig.ControllerConfig.UseHardcodedControllerSupport.Value)
				{
					HandleControllerKeys(__instance);
				}
				else
				{
					HandleGenericKeys(__instance);
				}
			}
		}

		private static void HandleGenericKeys(Player player)
		{
			//IL_001d: Unknown result type (might be due to invalid IL or missing references)
			//IL_003f: Unknown result type (might be due to invalid IL or missing references)
			//IL_0072: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e1: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a3: Unknown result type (might be due to invalid IL or missing references)
			//IL_0100: Unknown result type (might be due to invalid IL or missing references)
			//IL_00c1: Unknown result type (might be due to invalid IL or missing references)
			if (QSSConfig.GeneralConfig.OverrideKeybindBehavior.Value == QSSConfig.OverrideKeybindBehavior.DisableAllNewHotkeys)
			{
				return;
			}
			if (QSSConfig.QuickStackConfig.QuickStackKeybind.Value.IsKeyDown())
			{
				QuickStackModule.DoQuickStack(player);
			}
			else if (QSSConfig.RestockConfig.RestockKeybind.Value.IsKeyDown())
			{
				RestockModule.DoRestock(player);
			}
			else
			{
				if (!InventoryGui.IsVisible())
				{
					return;
				}
				if (QSSConfig.SortConfig.SortKeybind.Value.IsKeyDown())
				{
					SortModule.DoSort(player);
					return;
				}
				if (!CompatibilitySupport.DisallowAllTrashCanFeatures())
				{
					if (QSSConfig.TrashConfig.QuickTrashKeybind.Value.IsKeyDown())
					{
						TrashModule.AttemptQuickTrash();
						return;
					}
					if (QSSConfig.TrashConfig.TrashKeybind.Value.IsKeyDown())
					{
						TrashModule.TrashOrTrashFlagItem(usedFromHotkey: true);
						return;
					}
				}
				if (QSSConfig.StoreTakeAllConfig.TakeAllKeybind.Value.IsKeyDown())
				{
					StoreTakeAllModule.DoTakeAllWithKeybind(player);
				}
				else if (QSSConfig.StoreTakeAllConfig.StoreAllKeybind.Value.IsKeyDown())
				{
					StoreTakeAllModule.DoStoreAllWithKeybind(player);
				}
			}
		}

		private static void HandleControllerKeys(Player player)
		{
			//IL_0072: Unknown result type (might be due to invalid IL or missing references)
			if (!InventoryGui.IsVisible())
			{
				return;
			}
			if (ZInput.GetButtonDown("JoyBack"))
			{
				SortModule.DoSort(player);
			}
			else if (ZInput.GetButtonDown("JoyRStick"))
			{
				StoreTakeAllModule.DoStoreAllWithKeybind(player);
			}
			else if (QSSConfig.ControllerConfig.ControllerDPadUsageInInventoryGrid.Value != QSSConfig.DPadUsage.InventorySlotMovement && (QSSConfig.ControllerConfig.ControllerDPadUsageInInventoryGrid.Value != QSSConfig.DPadUsage.KeybindsWhileHoldingModifierKey || QSSConfig.ControllerConfig.ControllerDPadUsageModifierKeybind.Value.IsKeyHeld()))
			{
				if (ZInput.GetButtonDown("JoyDPadDown"))
				{
					QuickStackModule.DoQuickStack(player);
				}
				else if (ZInput.GetButtonDown("JoyDPadUp"))
				{
					RestockModule.DoRestock(player);
				}
				else if (ZInput.GetButtonDown("JoyDPadLeft"))
				{
					FavoritingMode.ToggleFavoriteToggling();
				}
				else if (!CompatibilitySupport.DisallowAllTrashCanFeatures() && ZInput.GetButtonDown("JoyDPadRight"))
				{
					TrashModule.TrashOrTrashFlagItem();
				}
			}
		}
	}

	internal const string joyTranslationPrefix = "KEY_";

	internal const string joyGetButtonDownPrefix = "Joy";

	internal const string joySort = "Back";

	internal const string joyStoreAll = "RStick";

	internal const string joyQuickStack = "DPadDown";

	internal const string joyRestock = "DPadUp";

	internal const string joyFavoriteToggling = "DPadLeft";

	internal const string joyTrash = "DPadRight";

	public static bool IgnoreKeyPresses()
	{
		return IgnoreKeyPressesDueToPlayer(Player.m_localPlayer) || !Object.op_Implicit((Object)(object)ZNetScene.instance) || Minimap.IsOpen() || Menu.IsVisible() || Console.IsVisible() || StoreGui.IsVisible() || TextInput.IsVisible() || (Object.op_Implicit((Object)(object)Chat.instance) && Chat.instance.HasFocus()) || (Object.op_Implicit((Object)(object)ZNet.instance) && ZNet.instance.InPasswordDialog()) || (Object.op_Implicit((Object)(object)TextViewer.instance) && TextViewer.instance.IsVisible());
	}

	private static bool IgnoreKeyPressesDueToPlayer(Player player)
	{
		return !Object.op_Implicit((Object)(object)player) || ((Character)player).InCutscene() || ((Character)player).IsTeleporting() || ((Character)player).IsDead() || ((Character)player).InPlaceMode();
	}

	public static bool IsKeyDown(this KeyboardShortcut shortcut)
	{
		//IL_0003: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		return (int)shortcut.MainKey != 0 && Input.GetKeyDown(shortcut.MainKey) && shortcut.Modifiers.All((Func<KeyCode, bool>)Input.GetKey);
	}

	public static bool IsKeyHeld(this KeyboardShortcut shortcut)
	{
		//IL_0003: Unknown result type (might be due to invalid IL or missing references)
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		return (int)shortcut.MainKey != 0 && Input.GetKey(shortcut.MainKey) && shortcut.Modifiers.All((Func<KeyCode, bool>)Input.GetKey);
	}
}
