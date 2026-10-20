using System;
using System.Collections;
using UnityEngine;

namespace Zen.Lib;

public static class InventoryGuiExt
{
	private static bool _isRestoringStackAllButton;

	public static void ShowStackAllButton(this InventoryGui self, bool show)
	{
		Logging<ModLib>.InterpolatedString msg = new Logging<ModLib>.InterpolatedString(22, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Show StackAll button: ");
			msg.AppendFormatted(show);
		}
		Logging<ModLib>.Info(msg);
		GameObject gameObject = ((Component)self.m_stackAllButton).gameObject;
		gameObject.SetActive(show);
		if (!show && !_isRestoringStackAllButton)
		{
			((MonoBehaviour)self).StartCoroutine(Restore(gameObject));
		}
		static IEnumerator Restore(GameObject btn)
		{
			_isRestoringStackAllButton = true;
			while (!btn.activeSelf)
			{
				Logging<ModLib>.Info("Coroutine set to restore StackAll button visibility when inventory is closed.");
				yield return (object)new WaitWhile((Func<bool>)InventoryGui.IsVisible);
				yield return (object)new WaitForSeconds(0.5f);
				if (!InventoryGui.IsVisible())
				{
					btn.SetActive(true);
				}
			}
			_isRestoringStackAllButton = false;
			Logging<ModLib>.Info("StackAll button visibility restored.");
		}
	}

	public static bool IsMulticraftPressed(this InventoryGui _)
	{
		if (!InventoryGui.IsVisible() || !ZInput.IsGamepadActive())
		{
			return ZInput.GetButton("AltPlace");
		}
		return ZInput.GetButton("JoyLStick");
	}
}
