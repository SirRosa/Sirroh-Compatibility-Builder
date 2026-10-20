using System;
using System.Collections;
using HarmonyLib;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class SystemClock
{
	public enum DisplayMode
	{
		Never,
		Always,
		SystemMenu
	}

	private static TMP_Text? _clockUI;

	private static Coroutine? _updater;

	private static TMP_Text ClockUI
	{
		get
		{
			if (!Object.op_Implicit((Object)(object)_clockUI))
			{
				return _clockUI = CreateClockUI();
			}
			return _clockUI;
		}
	}

	static SystemClock()
	{
		Configs.ShowSystemClock.SettingChanged += (object _, EventArgs _) =>
		{
			UpdateDisplayMode();
		};
	}

	public static void Init()
	{
		if (!ZNet.instance.IsDedicated())
		{
			_updater = ((MonoBehaviour)Hud.instance).StartCoroutine(UpdateClock());
			UpdateDisplayMode();
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Hud), "OnDestroy")]
	private static void Hud_OnDestroy()
	{
		_updater = null;
	}

	private static void ShowClock(bool isVisible)
	{
		if (_updater != null && ((Component)ClockUI).gameObject.activeSelf != isVisible)
		{
			((Component)ClockUI).gameObject.SetActive(isVisible);
		}
	}

	private static void UpdateDisplayMode()
	{
		switch (Configs.ShowSystemClock.Value)
		{
		case DisplayMode.Never:
			ShowClock(isVisible: false);
			break;
		case DisplayMode.SystemMenu:
			ShowClock(((Component)Menu.instance.m_root).gameObject.activeSelf);
			break;
		case DisplayMode.Always:
			ShowClock(isVisible: true);
			break;
		default:
			throw new ArgumentOutOfRangeException();
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Menu), "Show")]
	private static void Menu_Show()
	{
		UpdateDisplayMode();
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Menu), "Hide")]
	private static void Menu_Hide()
	{
		UpdateDisplayMode();
	}

	private static IEnumerator UpdateClock()
	{
		while (Object.op_Implicit((Object)(object)Hud.instance))
		{
			ClockUI.text = DateTime.Now.ToString("t");
			int num = 60 - DateTime.Now.Second;
			yield return (object)new WaitForSecondsRealtime((float)num);
		}
	}

	public static void Shutdown()
	{
		RemoveUI();
	}

	private static void RemoveUI()
	{
		if (_updater != null && Object.op_Implicit((Object)(object)Hud.instance))
		{
			((MonoBehaviour)Hud.instance).StopCoroutine(_updater);
			_updater = null;
		}
		if (Object.op_Implicit((Object)(object)_clockUI))
		{
			Object.Destroy((Object)(object)((Component)_clockUI).gameObject);
		}
	}

	private static TMP_Text CreateClockUI()
	{
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Expected Obj, but got Unknown
		//IL_0046: Unknown result type (might be due to invalid IL or missing references)
		//IL_004b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0056: Unknown result type (might be due to invalid IL or missing references)
		//IL_0060: Unknown result type (might be due to invalid IL or missing references)
		//IL_006b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0075: Unknown result type (might be due to invalid IL or missing references)
		//IL_0080: Unknown result type (might be due to invalid IL or missing references)
		//IL_008a: Unknown result type (might be due to invalid IL or missing references)
		//IL_0095: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d9: Unknown result type (might be due to invalid IL or missing references)
		//IL_011e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0148: Unknown result type (might be due to invalid IL or missing references)
		GameObject val = new GameObject("ZenUI_SystemClock", new Type[1] { typeof(RectTransform) });
		val.SetActive(false);
		val.transform.SetParent(Hud.instance.m_rootObject.transform, false);
		RectTransform val2 = (RectTransform)val.transform;
		val2.anchorMin = new Vector2(1f, 0f);
		val2.anchorMax = new Vector2(1f, 0f);
		val2.pivot = new Vector2(1f, 0f);
		val2.sizeDelta = new Vector2(200f, 50f);
		val2.anchoredPosition = new Vector2(-20f, -10f);
		TextMeshProUGUI val3 = val.AddComponent<TextMeshProUGUI>();
		((TMP_Text)val3).font = ((TMP_Text)Hud.instance.m_hoverName).font;
		((Graphic)val3).color = ((Graphic)Hud.instance.m_hoverName).color;
		((TMP_Text)val3).fontSize = ((TMP_Text)Hud.instance.m_hoverName).fontSize + 3f;
		((TMP_Text)val3).fontSharedMaterial = ((TMP_Text)Hud.instance.m_hoverName).fontSharedMaterial;
		((TMP_Text)val3).fontStyle = ((TMP_Text)Hud.instance.m_hoverName).fontStyle;
		((TMP_Text)val3).alignment = (TextAlignmentOptions)4100;
		((TMP_Text)val3).margin = new Vector4(0f, -5f, 0f, 5f);
		val.SetActive(true);
		return (TMP_Text)(object)val3;
	}
}
