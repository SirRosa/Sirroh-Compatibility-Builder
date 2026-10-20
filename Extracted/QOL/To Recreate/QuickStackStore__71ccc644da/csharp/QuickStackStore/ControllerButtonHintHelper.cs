using System.Collections;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace QuickStackStore;

internal class ControllerButtonHintHelper
{
	internal static void AddControllerTooltipToTrashCan(Button button, Transform parent)
	{
		if (!Object.op_Implicit((Object)(object)((Component)button).gameObject.GetComponent<UIGamePad>()))
		{
			UIGamePad component = ((Component)InventoryGui.instance.m_takeAllButton).GetComponent<UIGamePad>();
			GameObject hint = Object.Instantiate<GameObject>(component.m_hint, parent);
			UIGamePad val = ((Component)button).gameObject.AddComponent<UIGamePad>();
			val.m_hint = hint;
			((MonoBehaviour)InventoryGui.instance).StartCoroutine(WaitAFrameToSetupControllerHint(val));
		}
	}

	private static IEnumerator WaitAFrameToSetupControllerHint(UIGamePad uiGamePad)
	{
		yield return null;
		SetupControllerHint(uiGamePad, "DPadRight");
	}

	internal static IEnumerator WaitAFrameToSetupControllerHint(Button button, string joyHint)
	{
		yield return null;
		UIGamePad uiGamePad = default;
		if (Object.op_Implicit((Object)(object)button) && ((Component)button).TryGetComponent<UIGamePad>(ref uiGamePad))
		{
			SetupControllerHint(uiGamePad, joyHint);
		}
	}

	internal static void SetupControllerHint(UIGamePad uiGamePad, string joyHint)
	{
		if (!Object.op_Implicit((Object)(object)uiGamePad) || !Object.op_Implicit((Object)(object)uiGamePad.m_hint))
		{
			return;
		}
		uiGamePad.m_zinputKey = null;
		if (ZInput.IsGamepadActive() && QSSConfig.ControllerConfig.UseHardcodedControllerSupport.Value)
		{
			uiGamePad.m_hint.gameObject.SetActive(true);
			TextMeshProUGUI componentInChildren = uiGamePad.m_hint.GetComponentInChildren<TextMeshProUGUI>(true);
			if (Object.op_Implicit((Object)(object)componentInChildren))
			{
				((TMP_Text)componentInChildren).text = Localization.instance.Translate("KEY_" + joyHint);
			}
		}
		else
		{
			((Behaviour)uiGamePad).enabled = false;
			uiGamePad.m_hint.gameObject.SetActive(false);
		}
	}

	internal static void FixTakeAllButtonControllerHint(InventoryGui instance)
	{
		UIGamePad component = ((Component)instance.m_takeAllButton).GetComponent<UIGamePad>();
		if (!Object.op_Implicit((Object)(object)component))
		{
			return;
		}
		GameObject gameObject = component.m_hint.gameObject;
		if (QSSConfig.ControllerConfig.RemoveControllerButtonHintFromTakeAllButton.Value)
		{
			((Behaviour)component).enabled = false;
			gameObject.SetActive(false);
			return;
		}
		((Behaviour)component).enabled = true;
		gameObject.SetActive(true);
		if (!Object.op_Implicit((Object)(object)gameObject.GetComponent<TakeAllHintFixer>()))
		{
			gameObject.AddComponent<TakeAllHintFixer>();
		}
	}
}
