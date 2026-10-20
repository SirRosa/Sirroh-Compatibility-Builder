using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using HarmonyLib;
using UnityEngine;

namespace Zen.Lib.Controls;

[HarmonyPatch]
internal static class GamepadRemap
{
	internal enum RemapRule
	{
		Automatic,
		Always,
		Never
	}

	[HarmonyPatch]
	private static class JoyAltHide
	{
		[HarmonyTranspiler]
		[HarmonyPatch(typeof(Player), "Update")]
		[HarmonyPriority(0)]
		private static IEnumerable<CodeInstruction> Player_Update(IEnumerable<CodeInstruction> codes)
		{
			MethodInfo methodInfo = AccessTools.Method(typeof(Character), "InPlaceMode", (Type[])null, (Type[])null);
			Func<Character, bool> func = InPlaceModeIntercept;
			return Transpilers.MethodReplacer(codes, (MethodBase)methodInfo, (MethodBase)func.Method);
			static bool InPlaceModeIntercept(Character character)
			{
				if (!ZenMod.RequireGamepadRemap)
				{
					return character.InPlaceMode();
				}
				if (((IEnumerable<string>)new string[4] { "JoyLBumper", "JoyLTrigger", "JoyRBumper", "JoyRTrigger" }).Any((Func<string, bool>)ZInput.GetButton))
				{
					return character.InPlaceMode();
				}
				if (!Hud.IsPieceSelectionVisible() && !InventoryGui.IsVisible())
				{
					return Minimap.IsOpen();
				}
				return true;
			}
		}
	}

	[HarmonyPatch]
	private static class GuardianPowerY
	{
		[HarmonyTranspiler]
		[HarmonyPatch(typeof(InventoryGui), "Update")]
		[HarmonyPriority(100)]
		private static IEnumerable<CodeInstruction> InventoryGui_Update(IEnumerable<CodeInstruction> codes)
		{
			MethodInfo methodInfo = AccessTools.DeclaredMethod(typeof(InventoryGui), "Show", (Type[])null, (Type[])null);
			Action<InventoryGui, Container, int> action = InterceptInventoryGuiShow;
			return Transpilers.MethodReplacer(codes, (MethodBase)methodInfo, (MethodBase)action.Method);
			static void InterceptInventoryGuiShow(InventoryGui gui, Container container, int activeGroup)
			{
				//IL_000e: Unknown result type (might be due to invalid IL or missing references)
				if (ZenMod.RequireGamepadRemap && ZInput.IsGamepadActive() && (int)ZInput.InputLayout == 0)
				{
					bool button = ZInput.GetButton(ControlInputs.JoyAlt);
					bool buttonPressQuick = ControlInputs.GetButtonPressQuick("JoyGP");
					if (button & buttonPressQuick)
					{
						if (Object.op_Implicit((Object)(object)Player.m_localPlayer))
						{
							Player.m_localPlayer.StartGuardianPower();
						}
						return;
					}
				}
				gui.Show(container, activeGroup);
			}
		}

		[HarmonyTranspiler]
		[HarmonyPatch(typeof(Player), "Update")]
		[HarmonyPriority(100)]
		private static IEnumerable<CodeInstruction> Player_Update(IEnumerable<CodeInstruction> codes)
		{
			Func<string> bypass = ToggleBypass;
			return Transpilers.Manipulator(codes, (Func<CodeInstruction, bool>)((CodeInstruction c) => CodeInstructionExtensions.Is(c, OpCodes.Ldstr, (object)"JoyGP")), (Action<CodeInstruction>)((CodeInstruction c) =>
			{
				c.opcode = OpCodes.Call;
				c.operand = bypass.Method;
			}));
			static string ToggleBypass()
			{
				if (!ZenMod.RequireGamepadRemap)
				{
					return "JoyGP";
				}
				return "JoyGP_ZEN_DISABLED";
			}
		}
	}

	[HarmonyPatch]
	private static class TapToOpenInv
	{
		[HarmonyTranspiler]
		[HarmonyPatch(typeof(InventoryGui), "Update")]
		[HarmonyPriority(600)]
		private static IEnumerable<CodeInstruction> InventoryGui_Update(IEnumerable<CodeInstruction> codes)
		{
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Expected Obj, but got Unknown
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_0047: Expected Obj, but got Unknown
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Expected Obj, but got Unknown
			//IL_006d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0073: Expected Obj, but got Unknown
			//IL_0096: Unknown result type (might be due to invalid IL or missing references)
			//IL_009c: Expected Obj, but got Unknown
			//IL_00bb: Unknown result type (might be due to invalid IL or missing references)
			//IL_00e9: Unknown result type (might be due to invalid IL or missing references)
			//IL_00ef: Expected Obj, but got Unknown
			CodeMatch[] array = new CodeMatch[5]
			{
				new CodeMatch((OpCode?)OpCodes.Ldstr, (object)"Inventory", (string)null),
				new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(ZInput), "GetButtonDown", (Type[])null, (Type[])null), (string)null),
				new CodeMatch((OpCode?)OpCodes.Brtrue, (object)null, (string)null),
				new CodeMatch((OpCode?)OpCodes.Ldstr, (object)"JoyButtonY", (string)null),
				new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(ZInput), "GetButtonDown", (Type[])null, (Type[])null), (string)null)
			};
			Func<bool, bool> func = DetectTap;
			return new CodeMatcher(codes, (ILGenerator)null).MatchEndForward(array).ThrowIfInvalid("Unable to match IL sequence: InventoryGui_Update").Advance(1)
				.Insert(new CodeInstruction[1]
				{
					new CodeInstruction(OpCodes.Call, (object)func.Method)
				})
				.InstructionEnumeration();
			static bool DetectTap(bool isJoyButtonYDown)
			{
				if (!ZenMod.RequireGamepadRemap || !ModLib.Configs.GamepadRadialMenu.Value || UI.IsOpen)
				{
					return isJoyButtonYDown;
				}
				return ControlInputs.GetButtonPressQuick("JoyButtonY");
			}
		}
	}

	[HarmonyPatch]
	private static class JoySitAltInteract
	{
		[HarmonyTranspiler]
		[HarmonyPatch(typeof(Player), "HandleRadialInput")]
		private static IEnumerable<CodeInstruction> Player_HandleRadialInput(IEnumerable<CodeInstruction> codes)
		{
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Expected Obj, but got Unknown
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_0047: Expected Obj, but got Unknown
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Expected Obj, but got Unknown
			//IL_006d: Unknown result type (might be due to invalid IL or missing references)
			//IL_0073: Expected Obj, but got Unknown
			//IL_0096: Unknown result type (might be due to invalid IL or missing references)
			//IL_009c: Expected Obj, but got Unknown
			//IL_00d7: Unknown result type (might be due to invalid IL or missing references)
			//IL_0105: Unknown result type (might be due to invalid IL or missing references)
			//IL_010b: Expected Obj, but got Unknown
			//IL_0129: Unknown result type (might be due to invalid IL or missing references)
			//IL_012f: Expected Obj, but got Unknown
			CodeMatch[] array = new CodeMatch[5]
			{
				new CodeMatch((OpCode?)OpCodes.Ldstr, (object)"JoyAltKeys", (string)null),
				new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.Method(typeof(ZInput), "GetButton", (Type[])null, (Type[])null), (string)null),
				new CodeMatch((OpCode?)OpCodes.Brtrue, (object)null, (string)null),
				new CodeMatch((OpCode?)OpCodes.Ldstr, (object)"JoySit", (string)null),
				new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.Method(typeof(ZInput), "GetButtonUp", (Type[])null, (Type[])null), (string)null)
			};
			Func<bool, bool> func = InterceptJoyAltKeys;
			Func<bool, bool> func2 = InterceptJoySit;
			return new CodeMatcher(codes, (ILGenerator)null).MatchStartForward(array).ThrowIfInvalid("Could not match IL").Advance(2)
				.InsertAndAdvance(new CodeInstruction[1]
				{
					new CodeInstruction(OpCodes.Call, (object)func.Method)
				})
				.Advance(3)
				.InsertAndAdvance(new CodeInstruction[1]
				{
					new CodeInstruction(OpCodes.Call, (object)func2.Method)
				})
				.InstructionEnumeration();
			static bool InterceptJoyAltKeys(bool isBtnPressed)
			{
				if (!ZenMod.RequireGamepadRemap)
				{
					return isBtnPressed;
				}
				return false;
			}
			static bool InterceptJoySit(bool isBtnUp)
			{
				if (ZenMod.RequireGamepadRemap)
				{
					int num;
					if (isBtnUp)
					{
						num = (ZInput.GetButton(ControlInputs.JoyAlt) ? 1 : 0);
						if (num != 0)
						{
							PlayerController.SetTakeInputDelay(0.8f);
						}
					}
					else
					{
						num = 0;
					}
					return (byte)num != 0;
				}
				return isBtnUp;
			}
		}
	}

	[HarmonyPatch]
	private static class SetRadialPressDuration
	{
		[HarmonyTranspiler]
		[HarmonyPatch(typeof(Player), "HandleRadialInput")]
		private static IEnumerable<CodeInstruction> Player_HandleRadialInput(IEnumerable<CodeInstruction> codes)
		{
			//IL_0018: Unknown result type (might be due to invalid IL or missing references)
			//IL_001e: Expected Obj, but got Unknown
			//IL_0041: Unknown result type (might be due to invalid IL or missing references)
			//IL_0047: Expected Obj, but got Unknown
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_005b: Expected Obj, but got Unknown
			//IL_007a: Unknown result type (might be due to invalid IL or missing references)
			CodeMatch[] array = new CodeMatch[3]
			{
				new CodeMatch((OpCode?)OpCodes.Ldstr, (object)"JoyRadial", (string)null),
				new CodeMatch((OpCode?)OpCodes.Call, (object)AccessTools.DeclaredMethod(typeof(ZInput), "GetButtonPressedTimer", (Type[])null, (Type[])null), (string)null),
				new CodeMatch((OpCode?)OpCodes.Ldc_R4, (object)null, (string)null)
			};
			Func<float> func = GetDuration;
			return new CodeMatcher(codes, (ILGenerator)null).MatchEndForward(array).ThrowIfInvalid("Unable to match IL").Set(OpCodes.Call, (object)func.Method)
				.InstructionEnumeration();
			static float GetDuration()
			{
				return ModLib.Configs.GamepadRadialMenuDuration.Value;
			}
		}
	}

	internal static void SetupControls()
	{
		if (ZenMod.RequireGamepadRemap)
		{
			RemapControls();
		}
		SetupRadialMenu();
	}

	private static void RemapControls()
	{
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0060: Unknown result type (might be due to invalid IL or missing references)
		//IL_0066: Invalid comparison between Unknown and I4
		//IL_006c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0071: Unknown result type (might be due to invalid IL or missing references)
		//IL_0081: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b8: Unknown result type (might be due to invalid IL or missing references)
		Logging<ModLib>.Message("Using gamepad extended remap");
		if ((int)ZInput.InputLayout == 0)
		{
			if (ZInput.instance.GetButtonDef("JoyGP").RemapTo((GamepadInput)8, true))
			{
				Logging<ModLib>.Message("> Remap 'Guardian Power' to Y+Alt button");
			}
		}
		else
		{
			GamepadInput val = (GamepadInput)(((int)ZInput.InputLayout != 1) ? 15 : ((int)ControlInputs.TriggerSwappedL));
			if (ZInput.instance.GetButtonDef("JoyCrouch").RemapTo(val, false))
			{
				Logging<ModLib>.Message($"> Remap 'Crouch' to {val}");
			}
		}
		ButtonDef buttonDef = ZInput.instance.GetButtonDef("JoyAltPlace");
		bool? showHints = false;
		buttonDef.UpdatePresentation(null, null, showHints);
		if (ZInput.instance.GetButtonDef("JoyRadial").RemapTo((GamepadInput)8))
		{
			Logging<ModLib>.Message("> Remap 'Radial Menu' to Y button (long press)");
		}
		if (ZInput.instance.GetButtonDef("JoyHide").RemapTo((GamepadInput)3))
		{
			Logging<ModLib>.Message("> Remap 'Show/Hide' to D-Pad Down");
		}
		if (ZInput.instance.GetButtonDef("JoySit").RemapTo((GamepadInput)19, true))
		{
			Logging<ModLib>.Message("> Remap 'Sit' to Select button with alt press");
		}
		if (ZInput.instance.RemoveButton("JoyChat"))
		{
			Logging<ModLib>.Message("> Removed 'Chat' button, use a keyboard or mic to chat.");
		}
		Logging<ModLib>.Info("Gamepad remap success");
	}

	public static void SetupRadialMenu()
	{
		if (!ModLib.Configs.GamepadRadialMenu.Value)
		{
			ZInput.instance.RemoveButton("JoyRadial");
			ZInput.instance.RemoveButton("JoyRadialInteract");
			ZInput.instance.RemoveButton("JoyRadialBack");
			ZInput.instance.RemoveButton("JoyRadialClose");
			ZInput.instance.RemoveButton("JoyRadialSecondaryInteract");
			Logging<ModLib>.Message("Radial menu inputs removed per config settings, game restart required to re-enable it.");
			return;
		}
		ButtonDef buttonDef = ZInput.instance.GetButtonDef("JoyRadialInteract");
		bool? showHints = false;
		buttonDef.UpdatePresentation(null, null, showHints);
		ButtonDef buttonDef2 = ZInput.instance.GetButtonDef("JoyRadialBack");
		showHints = false;
		buttonDef2.UpdatePresentation(null, null, showHints);
		ButtonDef buttonDef3 = ZInput.instance.GetButtonDef("JoyRadialClose");
		showHints = false;
		buttonDef3.UpdatePresentation(null, null, showHints);
		ButtonDef buttonDef4 = ZInput.instance.GetButtonDef("JoyRadialSecondaryInteract");
		showHints = false;
		buttonDef4.UpdatePresentation(null, null, showHints);
	}
}
