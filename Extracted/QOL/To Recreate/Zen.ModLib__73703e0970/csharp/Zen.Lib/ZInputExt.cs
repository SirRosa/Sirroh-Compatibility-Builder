using System.Linq;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.LowLevel;
using Valheim.SettingsGui;
using Zen.Lib.Controls;

namespace Zen.Lib;

public static class ZInputExt
{
	public static string Path(this GamepadInput g)
	{
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		return ZInput.s_gamepadInputPathMap[g];
	}

	public static string Path(this MouseButton m)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		return ZInput.MouseButtonToPath(m, true);
	}

	public static string Path(this KeyCode k)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		return ZInput.KeyCodeToPath(k, false);
	}

	public static string Path(this Key k)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		return ZInput.KeyToPath(k);
	}

	private static LayoutButton[] GetLayouts(this ButtonDef def)
	{
		LayoutButton[] array = ZInput.instance.m_presentationButtons.Keys.Where((LayoutButton layout) => layout.Name == def.Name).ToArray();
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(18, 2, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Button ");
			msg.AppendFormatted(def.Name);
			msg.AppendLiteral(", layouts: ");
			msg.AppendFormatted(array.Length);
		}
		Logging<ModLib>.Info(msg);
		return array;
	}

	private static ButtonPresentation GetPresentation(this LayoutButton layout)
	{
		return ZInput.instance.m_presentationButtons[layout];
	}

	private static ButtonPresentation[] GetPresentations(this ButtonDef def)
	{
		ButtonPresentation[] array = ZInput.instance.m_presentationButtons.Values.Where((ButtonPresentation p) => p.Name == def.Name).ToArray();
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(18, 2, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Button ");
			msg.AppendFormatted(def.Name);
			msg.AppendLiteral(", layouts: ");
			msg.AppendFormatted(array.Length);
		}
		Logging<ModLib>.Info(msg);
		return array;
	}

	internal static void UpdatePresentation(this ButtonDef def, string? path = null, bool? altKey = null, bool? showHints = null)
	{
		//IL_0096: Unknown result type (might be due to invalid IL or missing references)
		//IL_009d: Expected Obj, but got Unknown
		if (path != null || altKey.HasValue || showHints.HasValue)
		{
			def.AltKey = altKey ?? def.AltKey;
			LayoutButton[] layouts = def.GetLayouts();
			foreach (LayoutButton val in layouts)
			{
				ButtonPresentation presentation = val.GetPresentation();
				ButtonPresentation value = new ButtonPresentation(presentation.Name, path ?? presentation.Path, altKey ?? presentation.AltKey, showHints ?? presentation.ShowHints);
				ZInput.instance.m_presentationButtons[val] = value;
			}
		}
	}

	public static ButtonDef GetButtonDef(this ZInput self, ActionString actionString)
	{
		return self.GetButtonDef(actionString.Name);
	}

	public static bool RemoveButton(this ZInput self, string name)
	{
		if (!self.m_buttons.TryGetValue(name, out var value))
		{
			return false;
		}
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(15, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Remove Button: ");
			msg.AppendFormatted(name);
		}
		Logging<ModLib>.Info(msg, 1);
		self.UnsubscribeButton(value);
		self.m_buttons.Remove(value.Name);
		LayoutButton[] layouts = value.GetLayouts();
		foreach (LayoutButton key in layouts)
		{
			self.m_presentationButtons.Remove(key);
		}
		return true;
	}

	private static bool RemapToPath(this ButtonDef self, string newPath, bool? altKey = null, bool? showHints = null, bool? rebindable = null, float? repeatDelay = null, float? repeatInterval = null)
	{
		if (self.GetActionPath(true) == newPath && (!altKey.HasValue || altKey == self.AltKey) && (!showHints.HasValue || self.GetPresentations().All((ButtonPresentation p) => p.ShowHints == showHints)) && (!rebindable.HasValue || rebindable == self.Rebindable) && (!repeatDelay.HasValue || Mathf.Approximately(repeatDelay.Value, self.m_repeatDelay)) && (!repeatInterval.HasValue || Mathf.Approximately(repeatInterval.Value, self.m_repeatInterval)))
		{
			return false;
		}
		self.Rebind(newPath);
		self.UpdatePresentation(newPath, altKey, showHints);
		if (rebindable.HasValue)
		{
			self.Rebindable = rebindable.Value;
		}
		if (repeatDelay.HasValue)
		{
			self.m_repeatDelay = repeatDelay.Value;
		}
		if (repeatInterval.HasValue)
		{
			self.m_repeatInterval = repeatInterval.Value;
		}
		return true;
	}

	public static bool IsMappedTo(this ButtonDef def, KeyCode input)
	{
		return def.GetActionPath(true).ToUpper().EndsWith(((object)input/*cast due to constrained. prefix*/).ToString());
	}

	public static bool RemapTo(this ButtonDef def, KeyCode newInput, bool? altKey = null, bool? showHints = null, bool? rebindable = null, float? repeatDelay = null, float? repeatInterval = null)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		return def.RemapToPath(newInput.Path(), altKey, showHints, rebindable, repeatDelay, repeatInterval);
	}

	public static bool RemapTo(this ButtonDef def, GamepadInput newInput, bool? altKey = null, bool? showHints = null, bool? rebindable = null, float? repeatDelay = null, float? repeatInterval = null)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		return def.RemapToPath(newInput.Path(), altKey, showHints, rebindable, repeatDelay, repeatInterval);
	}

	public static string GetGamepadPlatform(this ZInput zi)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Expected I4, but got Unknown
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_0022: Invalid comparison between Unknown and I4
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_0026: Unknown result type (might be due to invalid IL or missing references)
		//IL_0028: Invalid comparison between Unknown and I4
		GamepadGlyphs currentGlyph = ZInput.CurrentGlyph;
		switch ((int)currentGlyph)
		{
		case 0:
		{
			GamepadType connectedGamepadType = ZInput.ConnectedGamepadType;
			string result;
			if ((int)connectedGamepadType == 3)
			{
				result = "xbox";
			}
			else
			{
				result = ((connectedGamepadType - 4 > 1) ? "xbox" : "ps5");
			}
			return result;
		}
		case 1:
			return "xbox";
		case 2:
			return "ps5";
		default:
			return "xbox";
		}
	}

	public static string GetGamepadSpriteName(this ZInput zi, GamepadInput gamepadInput, string platform)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		string key = zi.MapKeyFromPath(ZInput.s_gamepadInputPathMap[gamepadInput]);
		return ZInput.s_gamepadSpriteMap[key][platform];
	}

	public static string GetSpriteTag(this ZInput zi, GamepadInput gamepadInput)
	{
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		string gamepadPlatform = zi.GetGamepadPlatform();
		string gamepadSpriteName = zi.GetGamepadSpriteName(gamepadInput, gamepadPlatform);
		return "<sprite=\"" + gamepadPlatform + "\" name=\"" + gamepadSpriteName + "\">";
	}
}
