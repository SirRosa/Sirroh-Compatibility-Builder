using System;

namespace RunicBuildCamera.Core;

internal static class CameraExitInput
{
	private static readonly string[] HotbarButtons = new string[8] { "Hotbar1", "Hotbar2", "Hotbar3", "Hotbar4", "Hotbar5", "Hotbar6", "Hotbar7", "Hotbar8" };

	internal static bool ReleaseIfRequested(bool nativeInput, Func<bool> requested, Action stop)
	{
		if (!nativeInput || !requested())
		{
			return false;
		}
		stop();
		return true;
	}

	internal static bool HotbarRequested(Func<string, bool> down)
	{
		string[] hotbarButtons = HotbarButtons;
		foreach (string arg in hotbarButtons)
		{
			if (down(arg))
			{
				return true;
			}
		}
		return false;
	}

	internal static bool HideRequested(bool keyboardHide, bool alternateGamepadLayout, bool shortControllerRelease, bool inPlaceMode, bool altKeys)
	{
		if (alternateGamepadLayout)
		{
			return !inPlaceMode & shortControllerRelease & altKeys;
		}
		if (!keyboardHide)
		{
			if (shortControllerRelease && !altKeys)
			{
				return !inPlaceMode;
			}
			return false;
		}
		return true;
	}
}
