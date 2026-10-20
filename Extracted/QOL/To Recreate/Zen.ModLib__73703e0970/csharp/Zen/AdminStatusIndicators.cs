using System;
using System.Collections;
using Jotunn.Managers;
using UnityEngine;
using UnityEngine.UI;
using Zen.Lib;

namespace Zen;

internal class AdminStatusIndicators : MonoBehaviour
{
	private GameObject _indicatorDevCommands;

	private GameObject _indicatorGodMode;

	private GameObject _indicatorGhostMode;

	private GameObject _indicatorNoCost;

	private GameObject _indicatorAccessWards;

	private Image _background;

	private const float IndicatorSize = 40f;

	private const float IndicatorSpacing = 4f;

	private const int IndicatorPadding = 4;

	private static GameObject? _indicatorsRoot;

	public static void Init()
	{
		//IL_0030: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Expected Obj, but got Unknown
		if (ZNet.instance.IsDedicated())
		{
			Logging<ModLib>.Info("Aborting creation of admin status indicators on dedicated server because there is no UI");
			return;
		}
		_indicatorsRoot = new GameObject("Zen.ModLib_AdminStatusIndicators", new Type[1] { typeof(RectTransform) });
		_indicatorsRoot.transform.SetParent(Hud.instance.m_rootObject.transform, false);
		_indicatorsRoot.AddComponent<AdminStatusIndicators>();
		SetActive();
		ModLib.Configs.AdminShowStatusIndicators.SettingChanged += (object _, EventArgs _) =>
		{
			SetActive();
		};
	}

	private static void SetActive()
	{
		if (Object.op_Implicit((Object)(object)_indicatorsRoot))
		{
			_indicatorsRoot.SetActive(ModLib.Configs.AdminShowStatusIndicators.Value);
		}
	}

	public static void Shutdown()
	{
		if (Object.op_Implicit((Object)(object)_indicatorsRoot))
		{
			Object.Destroy((Object)(object)_indicatorsRoot);
		}
	}

	private void Awake()
	{
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_0026: Unknown result type (might be due to invalid IL or missing references)
		//IL_003b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0045: Unknown result type (might be due to invalid IL or missing references)
		//IL_0077: Unknown result type (might be due to invalid IL or missing references)
		//IL_0081: Expected Obj, but got Unknown
		//IL_00d9: Unknown result type (might be due to invalid IL or missing references)
		RectTransform component = ((Component)this).GetComponent<RectTransform>();
		component.anchorMin = new Vector2(0f, 0f);
		component.anchorMax = new Vector2(0f, 0f);
		component.pivot = new Vector2(0f, 0f);
		component.anchoredPosition = Vector2.zero;
		ContentSizeFitter val = ((Component)this).gameObject.AddComponent<ContentSizeFitter>();
		val.horizontalFit = (FitMode)2;
		val.verticalFit = (FitMode)2;
		HorizontalLayoutGroup val2 = ((Component)this).gameObject.AddComponent<HorizontalLayoutGroup>();
		((LayoutGroup)val2).padding = new RectOffset(4, 4, 4, 4);
		((HorizontalOrVerticalLayoutGroup)val2).spacing = 4f;
		((LayoutGroup)val2).childAlignment = (TextAnchor)6;
		((HorizontalOrVerticalLayoutGroup)val2).childControlWidth = true;
		((HorizontalOrVerticalLayoutGroup)val2).childControlHeight = true;
		((HorizontalOrVerticalLayoutGroup)val2).childForceExpandWidth = false;
		((HorizontalOrVerticalLayoutGroup)val2).childForceExpandHeight = false;
		_background = ((Component)this).gameObject.AddComponent<Image>();
		((Graphic)_background).color = new Color(0f, 0f, 0f, 0.5f);
		((Behaviour)_background).enabled = false;
		Sprite sprite = GUIManager.Instance.GetSprite("eitr");
		Sprite sprite2 = GUIManager.Instance.GetSprite("HelmetPointyHat");
		Sprite sprite3 = GUIManager.Instance.GetSprite("TrophyGhost");
		Sprite sprite4 = GUIManager.Instance.GetSprite("hammer");
		Sprite sprite5 = GUIManager.Instance.GetSprite("key_icon");
		_indicatorDevCommands = CreateIndicatorNode("DevCommands", sprite);
		_indicatorGodMode = CreateIndicatorNode("God", sprite2);
		_indicatorGhostMode = CreateIndicatorNode("Ghost", sprite3);
		_indicatorNoCost = CreateIndicatorNode("NoCost", sprite4);
		_indicatorAccessWards = CreateIndicatorNode("AccessWards", sprite5);
	}

	private GameObject CreateIndicatorNode(string nodeName, Sprite sprite)
	{
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		//IL_004c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0067: Unknown result type (might be due to invalid IL or missing references)
		//IL_007b: Expected Obj, but got Unknown
		GameObject val = new GameObject(nodeName, new Type[3]
		{
			typeof(RectTransform),
			typeof(Image),
			typeof(LayoutElement)
		});
		val.SetActive(false);
		val.transform.SetParent(((Component)this).transform, false);
		LayoutElement component = val.GetComponent<LayoutElement>();
		component.preferredWidth = 40f;
		component.preferredHeight = 40f;
		Image component2 = val.GetComponent<Image>();
		component2.sprite = sprite;
		component2.preserveAspect = true;
		return val;
	}

	private void OnEnable()
	{
		((MonoBehaviour)this).StartCoroutine(UpdateIndicators());
	}

	private IEnumerator UpdateIndicators()
	{
		WaitForSeconds delay = new WaitForSeconds(1f);
		while (Object.op_Implicit((Object)(object)this))
		{
			if (Object.op_Implicit((Object)(object)Player.m_localPlayer))
			{
				_indicatorDevCommands.SetActive(ServerAdmin.IsAdminInCheatMode);
				_indicatorGodMode.SetActive(((Character)Player.m_localPlayer).InGodMode());
				_indicatorGhostMode.SetActive(((Character)Player.m_localPlayer).InGhostMode());
				_indicatorNoCost.SetActive(Player.m_localPlayer.NoCostCheat());
				_indicatorAccessWards.SetActive(ModLib.Configs.AdminEnterPrivateAreas.Value && ServerAdmin.IsAdminInCheatMode);
				((Behaviour)_background).enabled = HasActiveIndicators();
			}
			yield return delay;
		}
	}

	private bool HasActiveIndicators()
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		foreach (Transform item in ((Component)this).transform)
		{
			if (((Component)item).gameObject.activeSelf)
			{
				return true;
			}
		}
		return false;
	}
}
