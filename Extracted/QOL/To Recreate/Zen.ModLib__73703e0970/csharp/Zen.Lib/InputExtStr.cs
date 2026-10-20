using System.Collections.Generic;
using UnityEngine;

namespace Zen.Lib;

public static class InputExtStr
{
	private static readonly Dictionary<GamepadInput, string> ButtonActionStringCache = new Dictionary<GamepadInput, string>();

	public static string ToActionString(this GamepadInput gamepadButton)
	{
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_001c: Unknown result type (might be due to invalid IL or missing references)
		if (ButtonActionStringCache.TryGetValue(gamepadButton, out string value))
		{
			return value;
		}
		return ButtonActionStringCache[gamepadButton] = ZInput.instance.GetBoundActionString(gamepadButton, (BaseLayout)null);
	}

	public static string ToSpriteString(this GamepadInput gamepadButton)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		string key = gamepadButton.ToActionString();
		if (ZInput.s_gamepadSpriteMap.TryGetValue(key, out var value))
		{
			string text = value["xbox"];
			return "<sprite=\"xbox\" name=\"" + text + "\">";
		}
		return string.Empty;
	}

	public static string ToDisplayText(this KeyCode keycode)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0003: Invalid comparison between Unknown and I4
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		//IL_0038: Invalid comparison between Unknown and I4
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Invalid comparison between Unknown and I4
		//IL_0052: Unknown result type (might be due to invalid IL or missing references)
		//IL_0058: Unknown result type (might be due to invalid IL or missing references)
		//IL_0076: Expected I4, but got Unknown
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Invalid comparison between Unknown and I4
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Invalid comparison between Unknown and I4
		//IL_000a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0076: Unknown result type (might be due to invalid IL or missing references)
		//IL_007c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0096: Expected I4, but got Unknown
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		//IL_0048: Invalid comparison between Unknown and I4
		//IL_0025: Unknown result type (might be due to invalid IL or missing references)
		//IL_0028: Invalid comparison between Unknown and I4
		//IL_0010: Unknown result type (might be due to invalid IL or missing references)
		//IL_0013: Invalid comparison between Unknown and I4
		string text;
		if ((int)keycode <= 44)
		{
			if ((int)keycode <= 13)
			{
				if ((int)keycode != 0)
				{
					if ((int)keycode != 13)
					{
						goto IL_0129;
					}
					text = "$button_return";
				}
				else
				{
					text = "$menu_none";
				}
			}
			else if ((int)keycode != 32)
			{
				if ((int)keycode != 44)
				{
					goto IL_0129;
				}
				text = ",";
			}
			else
			{
				text = "$button_space";
			}
		}
		else if ((int)keycode <= 271)
		{
			if ((int)keycode != 46)
			{
				if ((int)keycode != 271)
				{
					goto IL_0129;
				}
				text = "$button_return";
			}
			else
			{
				text = ".";
			}
		}
		else
		{
			switch (keycode - 303)
			{
			case 1:
				goto IL_00f1;
			case 0:
				goto IL_00f9;
			case 5:
				goto IL_0101;
			case 4:
				goto IL_0109;
			case 3:
				goto IL_0111;
			case 2:
				goto IL_0119;
			}
			switch (keycode - 323)
			{
			case 0:
				break;
			case 1:
				goto IL_00a6;
			case 2:
				goto IL_00b1;
			case 3:
				goto IL_00b9;
			case 4:
				goto IL_00c1;
			default:
				goto IL_0129;
			}
			text = "$button_mouse0";
		}
		goto IL_0137;
		IL_00c1:
		text = "Mouse-4";
		goto IL_0137;
		IL_00b9:
		text = "Mouse-3";
		goto IL_0137;
		IL_00f9:
		text = "$button_rshift";
		goto IL_0137;
		IL_00f1:
		text = "$button_lshift";
		goto IL_0137;
		IL_0119:
		text = "$button_rctrl";
		goto IL_0137;
		IL_0111:
		text = "$button_lctrl";
		goto IL_0137;
		IL_0109:
		text = "$button_ralt";
		goto IL_0137;
		IL_0101:
		text = "$button_lalt";
		goto IL_0137;
		IL_0129:
		text = ((object)keycode/*cast due to constrained. prefix*/).ToString();
		goto IL_0137;
		IL_0137:
		string text2 = text;
		return Localization.instance.Localize(text2);
		IL_00a6:
		text = "$button_mouse1";
		goto IL_0137;
		IL_00b1:
		text = "$button_mouse2";
		goto IL_0137;
	}
}
