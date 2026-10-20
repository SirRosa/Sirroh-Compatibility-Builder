using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using HarmonyLib;
using UnityEngine;

namespace QuickStackStore;

[HarmonyPatch(typeof(InventoryGrid))]
internal class InventoryGridButtonHandlingPatches
{
	[HarmonyPatch("OnRightDown")]
	[HarmonyPrefix]
	private static bool OnRightDown(InventoryGrid __instance, UIInputHandler element)
	{
		return HandleClick(__instance, element, isLeftClick: false);
	}

	[HarmonyPatch("OnLeftDown")]
	[HarmonyPrefix]
	private static bool OnLeftDown(InventoryGrid __instance, UIInputHandler clickHandler)
	{
		return HandleClick(__instance, clickHandler, isLeftClick: true);
	}

	private static bool HandleClick(InventoryGrid __instance, UIInputHandler clickHandler, bool isLeftClick)
	{
		//IL_0017: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		if (ShouldIgnoreFavoritingClick(__instance))
		{
			return true;
		}
		Vector2i buttonPos = __instance.GetButtonPos(((Component)clickHandler).gameObject);
		return HandleClickInternal(__instance, buttonPos, isLeftClick);
	}

	[HarmonyPatch("UpdateGamepad")]
	[HarmonyTranspiler]
	private static IEnumerable<CodeInstruction> UpdateGamepad_Transpiler(IEnumerable<CodeInstruction> instructions)
	{
		MethodInfo GetButtonDownMethod = AccessTools.DeclaredMethod(typeof(ZInput), "GetButtonDown", (Type[])null, (Type[])null);
		MethodInfo GetButtonDownWithConfigMethod = AccessTools.DeclaredMethod(typeof(InventoryGridButtonHandlingPatches), "ReactToGetButtonDown", (Type[])null, (Type[])null);
		List<CodeInstruction> instructionsList = instructions.ToList();
		foreach (CodeInstruction instruction in instructionsList)
		{
			if (instruction.opcode != OpCodes.Call || !CodeInstructionExtensions.OperandIs(instruction, (MemberInfo)GetButtonDownMethod))
			{
				yield return instruction;
				continue;
			}
			yield return new CodeInstruction(OpCodes.Dup, (object)null);
			yield return instruction;
			yield return new CodeInstruction(OpCodes.Ldarg_0, (object)null);
			yield return new CodeInstruction(OpCodes.Call, (object)GetButtonDownWithConfigMethod);
		}
	}

	public static bool ReactToGetButtonDown(string keybindName, bool originalReturnValue, InventoryGrid __instance)
	{
		//IL_00c2: Unknown result type (might be due to invalid IL or missing references)
		if ((Object)(object)__instance != (Object)(object)InventoryGui.instance.m_playerGrid)
		{
			return originalReturnValue;
		}
		if (!__instance.m_uiGroup.IsActive)
		{
			return originalReturnValue;
		}
		switch (keybindName)
		{
		case "JoyDPadLeft":
		case "JoyDPadRight":
		case "JoyDPadDown":
		case "JoyDPadUp":
			if (originalReturnValue && ShouldSuppressDPad())
			{
				return false;
			}
			return originalReturnValue;
		case "JoyButtonA":
		case "JoyButtonX":
			if (!originalReturnValue || ShouldIgnoreFavoritingClick(__instance))
			{
				return originalReturnValue;
			}
			return HandleClickInternal(__instance, __instance.m_selected, keybindName == "JoyButtonA");
		default:
			return originalReturnValue;
		}
	}

	private static bool ShouldSuppressDPad()
	{
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		return QSSConfig.ControllerConfig.ControllerDPadUsageInInventoryGrid.Value switch
		{
			QSSConfig.DPadUsage.InventorySlotMovement => false, 
			QSSConfig.DPadUsage.KeybindsWhileHoldingModifierKey => QSSConfig.ControllerConfig.ControllerDPadUsageModifierKeybind.Value.IsKeyHeld(), 
			_ => true, 
		};
	}

	private static bool ShouldIgnoreFavoritingClick(InventoryGrid __instance)
	{
		if ((Object)(object)__instance != (Object)(object)InventoryGui.instance.m_playerGrid)
		{
			return true;
		}
		if (((Character)Player.m_localPlayer).IsTeleporting())
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
		return false;
	}

	private static bool HandleClickInternal(InventoryGrid __instance, Vector2i buttonPos, bool isLeftClick)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0004: Unknown result type (might be due to invalid IL or missing references)
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		if (buttonPos == new Vector2i(-1, -1))
		{
			return true;
		}
		Player localPlayer = Player.m_localPlayer;
		if (!isLeftClick)
		{
			UserConfig.GetPlayerConfig(localPlayer.GetPlayerID()).ToggleSlotFavoriting(buttonPos);
		}
		else
		{
			ItemData itemAt = __instance.m_inventory.GetItemAt(buttonPos.x, buttonPos.y);
			if (itemAt == null)
			{
				return true;
			}
			if (!UserConfig.GetPlayerConfig(localPlayer.GetPlayerID()).ToggleItemNameFavoriting(itemAt.m_shared))
			{
				((Character)localPlayer).Message((MessageType)2, LocalizationConfig.GetRelevantTranslation(LocalizationConfig.CantFavoriteTrashFlaggedItemWarning, "CantFavoriteTrashFlaggedItemWarning"), 0, (Sprite)null, false);
			}
		}
		return false;
	}
}
