using System;
using System.Linq;
using BepInEx.Configuration;
using UnityEngine;

namespace Recycle_N_Reclaim;

public static class KeyboardExtensions
{
	public static bool IsKeyDown(this KeyboardShortcut shortcut)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		if ((int)shortcut.MainKey != 0 && Input.GetKeyDown(shortcut.MainKey))
		{
			return shortcut.Modifiers.All((Func<KeyCode, bool>)Input.GetKey);
		}
		return false;
	}

	public static bool IsKeyHeld(this KeyboardShortcut shortcut)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		if ((int)shortcut.MainKey != 0 && Input.GetKey(shortcut.MainKey))
		{
			return shortcut.Modifiers.All((Func<KeyCode, bool>)Input.GetKey);
		}
		return false;
	}
}
