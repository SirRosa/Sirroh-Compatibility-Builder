using BepInEx.Configuration;
using UnityEngine;

namespace neobotics.ModSdk;

internal static class InputEvaluator
{
	public static bool IsPressed(KeyboardShortcut shortcut)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0030: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Unknown result type (might be due to invalid IL or missing references)
		object obj = KeyboardShortcut.Empty;
		if (((object)shortcut/*cast due to constrained. prefix*/).Equals(obj))
		{
			return false;
		}
		foreach (KeyCode modifier in shortcut.Modifiers)
		{
			if ((int)modifier != 0 && !Input.GetKey(modifier))
			{
				return false;
			}
		}
		return Input.GetKeyDown(shortcut.MainKey);
	}

	public static bool IsDown(KeyboardShortcut shortcut)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0030: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Unknown result type (might be due to invalid IL or missing references)
		object obj = KeyboardShortcut.Empty;
		if (((object)shortcut/*cast due to constrained. prefix*/).Equals(obj))
		{
			return false;
		}
		foreach (KeyCode modifier in shortcut.Modifiers)
		{
			if ((int)modifier != 0 && !Input.GetKey(modifier))
			{
				return false;
			}
		}
		return Input.GetKey(shortcut.MainKey);
	}

	public static bool IsReleased(KeyboardShortcut shortcut)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_002b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0030: Unknown result type (might be due to invalid IL or missing references)
		//IL_0031: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Unknown result type (might be due to invalid IL or missing references)
		object obj = KeyboardShortcut.Empty;
		if (((object)shortcut/*cast due to constrained. prefix*/).Equals(obj))
		{
			return false;
		}
		foreach (KeyCode modifier in shortcut.Modifiers)
		{
			if ((int)modifier != 0 && !Input.GetKeyUp(modifier))
			{
				return false;
			}
		}
		return Input.GetKeyUp(shortcut.MainKey);
	}
}
