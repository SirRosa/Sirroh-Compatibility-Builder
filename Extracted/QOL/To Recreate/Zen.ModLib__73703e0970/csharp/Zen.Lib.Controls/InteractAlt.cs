using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using System.Text;
using BepInEx;
using HarmonyLib;
using TMPro;
using UnityEngine;

namespace Zen.Lib.Controls;

[HarmonyPatch]
internal static class InteractAlt
{
	[HarmonyPatch]
	private static class DetectInteractAltPress
	{
		private static bool _isInteractAltPressed;

		[HarmonyTranspiler]
		[HarmonyPatch(typeof(Player), "Update")]
		[HarmonyPriority(100)]
		private static IEnumerable<CodeInstruction> Player_Update(IEnumerable<CodeInstruction> codes)
		{
			//IL_002e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0038: Expected Obj, but got Unknown
			//IL_0058: Unknown result type (might be due to invalid IL or missing references)
			//IL_005e: Expected Obj, but got Unknown
			//IL_006e: Unknown result type (might be due to invalid IL or missing references)
			//IL_0074: Expected Obj, but got Unknown
			//IL_009d: Unknown result type (might be due to invalid IL or missing references)
			//IL_00a4: Expected Obj, but got Unknown
			//IL_00b4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00bb: Expected Obj, but got Unknown
			//IL_00e4: Unknown result type (might be due to invalid IL or missing references)
			//IL_00eb: Expected Obj, but got Unknown
			//IL_010a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0111: Expected Obj, but got Unknown
			//IL_013a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0141: Expected Obj, but got Unknown
			//IL_0143: Unknown result type (might be due to invalid IL or missing references)
			Func<string, string> func = InterceptAction;
			CodeInstruction instructionUse = new CodeInstruction(OpCodes.Call, (object)func.Method);
			CodeMatch val = new CodeMatch((Func<CodeInstruction, bool>)((CodeInstruction c) =>
			{
				bool flag = c.opcode == OpCodes.Ldstr;
				if (flag)
				{
					bool flag2;
					switch (c.operand as string)
					{
					case "Use":
					case "JoyUse":
						flag2 = true;
						break;
					default:
						flag2 = false;
						break;
					}
					flag = flag2;
				}
				return flag;
			}), (string)null);
			CodeMatch val2 = new CodeMatch((OpCode?)OpCodes.Ldstr, (object)"AltPlace", (string)null);
			Func<string, string> func2 = InterceptAltPlaceKeyboard;
			CodeInstruction val3 = new CodeInstruction(OpCodes.Call, (object)func2.Method);
			CodeMatch val4 = new CodeMatch((OpCode?)OpCodes.Ldstr, (object)"JoyAltPlace", (string)null);
			Func<string, string> func3 = InterceptJoyAltPlaceGamepad;
			CodeInstruction val5 = new CodeInstruction(OpCodes.Call, (object)func3.Method);
			CodeMatch val6 = new CodeMatch((OpCode?)OpCodes.Ldfld, (object)AccessTools.DeclaredField(typeof(Player), "m_doodadController"), (string)null);
			Func<IDoodadController, bool> func4 = InterceptDoodadController;
			CodeInstruction val7 = new CodeInstruction(OpCodes.Call, (object)func4.Method);
			return new CodeMatcher(codes, (ILGenerator)null).MatchStartForward(new CodeMatch[1] { val }).ThrowIfInvalid("Unable to match IL sequence: Use or JoyUse").Repeat((Action<CodeMatcher>)((CodeMatcher match) =>
			{
				match.Advance(1).InsertAndAdvance(new CodeInstruction[1] { instructionUse });
			}), (Action<string>)null)
				.Start()
				.MatchStartForward(new CodeMatch[1] { val2 })
				.ThrowIfInvalid("Unable to match IL sequence: AltPlace")
				.Advance(1)
				.Insert(new CodeInstruction[1] { val3 })
				.End()
				.MatchStartBackwards(new CodeMatch[1] { val4 })
				.ThrowIfInvalid("Unable to match IL sequence: JoyAltPlace")
				.Advance(1)
				.Insert(new CodeInstruction[1] { val5 })
				.End()
				.MatchStartBackwards(new CodeMatch[1] { val6 })
				.ThrowIfInvalid("Unable to match IL sequence: DoodadController")
				.Advance(1)
				.Insert(new CodeInstruction[1] { val7 })
				.InstructionEnumeration();
			static string InterceptAction(string vanilla)
			{
				if (!IsDefinedKey)
				{
					return vanilla;
				}
				string text = InputAction.ToString();
				_isInteractAltPressed = ZInput.GetButton(text);
				if (!_isInteractAltPressed)
				{
					return vanilla;
				}
				return text;
			}
			static string InterceptAltPlaceKeyboard(string vanilla)
			{
				if (ModLib.Configs.InteractAltUseShiftE.Value || !IsDefinedKey)
				{
					return vanilla;
				}
				return "AltPlace_DISABLED_Zen.ModLib";
			}
			static bool InterceptDoodadController(IDoodadController? doodadController)
			{
				if (!IsDefinedKey)
				{
					return doodadController != null;
				}
				if (!ZInput.IsGamepadActive())
				{
					return doodadController != null;
				}
				return false;
			}
			static string InterceptJoyAltPlaceGamepad(string vanilla)
			{
				//IL_0010: Unknown result type (might be due to invalid IL or missing references)
				if (!IsDefinedKey)
				{
					return vanilla;
				}
				if (!ZInput.IsGamepadActive() || (int)ZInput.InputLayout != 0)
				{
					return vanilla;
				}
				return "JoyAltPlace_DISABLED_Zen.ModLib";
			}
		}

		[HarmonyPrefix]
		[HarmonyPatch(typeof(Player), "Interact")]
		[HarmonyPriority(0)]
		private static bool Player_Interact(Player __instance, ref bool alt)
		{
			if (!IsDefinedKey)
			{
				return true;
			}
			if (!_isInteractAltPressed | alt)
			{
				return true;
			}
			if (!IsValidInteractAlt(__instance))
			{
				return false;
			}
			Logging<ModLib>.Debug("InteractAlt pressed");
			alt = true;
			return true;
		}
	}

	private const string ExplicitName = "Zen_ModLib_InteractAlt";

	internal static readonly ActionString InputAction;

	private static string? _interactPrimaryPatternCache;

	private static string? _interactSecondaryPatternCache;

	private static readonly string[] InteractAltPrompts;

	private static readonly string?[] InteractAltPromptsCache;

	private static bool _isRegistered;

	internal static bool IsDefinedKey
	{
		get
		{
			//IL_0005: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Invalid comparison between Unknown and I4
			return (int)ModLib.Configs.InteractAltKey.Value > 0;
		}
	}

	private static string InteractPrimaryPattern => _interactPrimaryPatternCache ?? (_interactPrimaryPatternCache = UI.PromptInteract.Localize().GlyphFix());

	private static string InteractSecondaryPattern => _interactSecondaryPatternCache ?? (_interactSecondaryPatternCache = UI.PromptInteractAlt.Localize().GlyphFix());

	static InteractAlt()
	{
		InputAction = ControlInputs.Create("$input_interact_alt", "Zen_ModLib_InteractAlt");
		InteractAltPrompts = new string[2] { "[<color=yellow><b>$KEY_AltKeys + $KEY_Use</b></color>]", "[<color=yellow><b>$KEY_AltPlace + $KEY_Use</b></color>]" };
		InteractAltPromptsCache = new string[InteractAltPrompts.Length];
		ModLib.Configs.InteractAltKey.SettingChanged += (object _, EventArgs _) =>
		{
			ClearCache();
		};
	}

	internal static void ClearCache()
	{
		_interactPrimaryPatternCache = null;
		_interactSecondaryPatternCache = null;
		Array.Clear(InteractAltPromptsCache, 0, InteractAltPromptsCache.Length);
	}

	internal static void Register()
	{
		if (_isRegistered)
		{
			Logging<ModLib>.Info("Already registered InteractAlt button.");
			return;
		}
		ZenMod<ModLib>.Instance.RegisterInputs += AddInteractAltButton;
		_isRegistered = true;
	}

	private static void AddInteractAltButton()
	{
		//IL_0015: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Unknown result type (might be due to invalid IL or missing references)
		//IL_0052: Unknown result type (might be due to invalid IL or missing references)
		//IL_006a: Unknown result type (might be due to invalid IL or missing references)
		//IL_006f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0081: Unknown result type (might be due to invalid IL or missing references)
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		//IL_008a: Unknown result type (might be due to invalid IL or missing references)
		//IL_008d: Invalid comparison between Unknown and I4
		//IL_0115: Unknown result type (might be due to invalid IL or missing references)
		//IL_0103: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d5: Unknown result type (might be due to invalid IL or missing references)
		Logging<ModLib>.Info("Register Inputs: InteractAlt", 1);
		InputAction.RemoveButtons();
		GamepadInput val = (GamepadInput)(((int)ZInput.InputLayout == 0) ? 15 : 11);
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(25, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Add InteractAlt Gamepad: ");
			msg.AppendFormatted<GamepadInput>(val);
		}
		Logging<ModLib>.Info(msg);
		InputAction.AddButton(val, altKey: false, showHints: true);
		KeyCode value = ModLib.Configs.InteractAltKey.Value;
		ButtonDef buttonDef = ZInput.instance.GetButtonDef("AutoRun");
		if (buttonDef.IsMappedTo(value))
		{
			buttonDef.RemapTo((KeyCode)(((int)value == 113) ? 301 : 113));
			Logging<ModLib>.Warning($"> Remapped 'AutoRun' to avoid conflict with Interact Alt: {value}");
		}
		msg = new Logging<ModLib>.InterpolatedString(21, 1, out shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Add InteractAlt Key: ");
			msg.AppendFormatted<KeyCode>(value);
		}
		Logging<ModLib>.Info(msg);
		InputAction.AddButton(value);
		ClearCache();
	}

	private static bool IsValidInteractAlt(Player player)
	{
		//IL_0035: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		if (UI.IsOpen)
		{
			return false;
		}
		if (Hud.InRadial())
		{
			return false;
		}
		if (((Character)player).IsTeleporting() || ((Character)player).IsDead() || ((Character)player).InDodge() || ((Character)player).IsRunning())
		{
			return false;
		}
		if (((Character)player).GetMoveDir() != Vector3.zero)
		{
			return false;
		}
		return player.IsHoveringInteractAlt();
	}

	private static bool HasHoverText(this Player player, out TMP_Text hover)
	{
		hover = (TMP_Text)(object)Hud.instance.m_hoverName;
		if (Object.op_Implicit((Object)(object)player.m_hovering) && Object.op_Implicit((Object)(object)hover))
		{
			return !Utility.IsNullOrWhiteSpace(hover.text);
		}
		return false;
	}

	private static bool IsHoveringInteractAlt(this Player player)
	{
		if (player.HasHoverText(out TMP_Text hover))
		{
			return hover.text.Contains(InteractSecondaryPattern);
		}
		return false;
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Hud), "UpdateCrosshair")]
	private static void Hud_UpdateCrosshair(Hud __instance, Player player)
	{
		if (player.HasHoverText(out TMP_Text hover))
		{
			hover.ReplaceInteractAltPrompt();
		}
	}

	private static void ReplaceInteractAltPrompt(this TMP_Text hover)
	{
		string text = hover.text;
		bool flag = false;
		for (int i = 0; i < InteractAltPromptsCache.Length; i++)
		{
			ref string reference = ref InteractAltPromptsCache[i];
			string text2 = reference ?? (reference = InteractAltPrompts[i].Localize().GlyphFix());
			if (text.Contains(text2))
			{
				text = text.Replace(text2, InteractSecondaryPattern);
				flag = true;
			}
		}
		if (flag)
		{
			hover.text = RepositionInteractAltPrompt(text);
		}
	}

	private static string RepositionInteractAltPrompt(string hoverText)
	{
		if (Utility.IsNullOrWhiteSpace(hoverText))
		{
			return hoverText;
		}
		int num = -1;
		int num2 = -1;
		int num3 = -1;
		int num4 = -1;
		int num5 = -1;
		int num6 = -1;
		int num7 = 0;
		int num8 = 0;
		while (num7 < hoverText.Length)
		{
			int num9 = hoverText.IndexOf('\n', num7);
			if (num9 == -1)
			{
				num9 = hoverText.Length;
			}
			int num10 = ((num9 < hoverText.Length) ? (num9 + 1) : num9);
			if (num == -1 && StartsWithAt(hoverText, num7, num9, InteractPrimaryPattern))
			{
				num = num8;
				num3 = num10;
			}
			else if (num2 == -1 && StartsWithAt(hoverText, num7, num9, InteractSecondaryPattern))
			{
				num2 = num8;
				num5 = num7;
				num6 = num9;
				num4 = num10;
			}
			if (num != -1 && num2 != -1)
			{
				break;
			}
			num7 = num10;
			num8++;
		}
		if (num == -1 || num2 == -1)
		{
			return hoverText;
		}
		if (num2 == num + 1)
		{
			return hoverText;
		}
		StringBuilder stringBuilder = new StringBuilder(hoverText.Length);
		if (num < num2)
		{
			int num11 = ((num6 >= hoverText.Length && num5 > num3 && hoverText[num5 - 1] == '\n') ? (num5 - 1) : num5);
			stringBuilder.Append(hoverText, 0, num3);
			stringBuilder.Append(hoverText, num5, num6 - num5);
			if (num3 < num11 || num4 < hoverText.Length)
			{
				stringBuilder.Append('\n');
			}
			stringBuilder.Append(hoverText, num3, num11 - num3);
			stringBuilder.Append(hoverText, num4, hoverText.Length - num4);
		}
		else
		{
			stringBuilder.Append(hoverText, 0, num5);
			stringBuilder.Append(hoverText, num4, num3 - num4);
			if (num3 == hoverText.Length)
			{
				stringBuilder.Append('\n');
			}
			stringBuilder.Append(hoverText, num5, num6 - num5);
			if (num3 < hoverText.Length)
			{
				stringBuilder.Append('\n');
			}
			stringBuilder.Append(hoverText, num3, hoverText.Length - num3);
		}
		return stringBuilder.ToString();
		static bool StartsWithAt(string text, int start, int end, string value)
		{
			if (end - start >= value.Length)
			{
				return string.Compare(text, start, value, 0, value.Length, StringComparison.Ordinal) == 0;
			}
			return false;
		}
	}
}
