using HarmonyLib;
using JetBrains.Annotations;
using UnityEngine;
using UnityEngine.UI;
using Zen;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class ApplyThinScrollBars
{
	[HarmonyPatch(typeof(BuildUi), "SetTagListActive")]
	private static class BuildUISetTagListActive
	{
		internal static bool IsGridInitialized;

		[UsedImplicitly]
		private static void Prefix(BuildUi __instance, ref bool __state)
		{
			__state = ((Component)__instance.m_tagListContainer).gameObject.activeSelf;
		}

		[UsedImplicitly]
		private static void Postfix(BuildUi __instance, bool active, bool showTabs, bool __state)
		{
			//IL_0048: Unknown result type (might be due to invalid IL or missing references)
			//IL_0037: Unknown result type (might be due to invalid IL or missing references)
			if (IsFeatureEnabled && (!IsGridInitialized || active != __state))
			{
				Logging<Plugin>.Info("Adjust grid cell size");
				((Component)__instance.m_pieceView).GetComponentInChildren<GridLayoutGroup>().cellSize = (active ? new Vector2(71.5f, 71.5f) : new Vector2(76.3f, 76.3f));
				Logging<Plugin>.Info("Toggle help key hints visibility to match tabs");
				((Component)((Transform)__instance.m_tabContainer).parent.Find("InputHelp")).gameObject.SetActive(showTabs);
				IsGridInitialized = true;
			}
		}
	}

	private static bool IsFeatureEnabled => Configs.ThinScrollBars.Value;

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Game), "Start")]
	public static void Game_Start()
	{
		if (IsFeatureEnabled)
		{
			SetupBuildGridScrollbars();
			SetupContainerScrollbars();
		}
	}

	private static void SetupBuildGridScrollbars()
	{
		BuildUi buildUi = Hud.instance.m_buildUi;
		ThinScrollbar(buildUi.m_tagListScrollRect.verticalScrollbar);
		ThinScrollbar(buildUi.m_pieceScrollRect.verticalScrollbar);
		BuildUISetTagListActive.IsGridInitialized = false;
		static void ThinScrollbar(Scrollbar scrollbar)
		{
			//IL_0006: Unknown result type (might be due to invalid IL or missing references)
			//IL_000b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0016: Unknown result type (might be due to invalid IL or missing references)
			//IL_0020: Unknown result type (might be due to invalid IL or missing references)
			//IL_002b: Unknown result type (might be due to invalid IL or missing references)
			//IL_0035: Unknown result type (might be due to invalid IL or missing references)
			//IL_0040: Unknown result type (might be due to invalid IL or missing references)
			//IL_004a: Unknown result type (might be due to invalid IL or missing references)
			//IL_0055: Unknown result type (might be due to invalid IL or missing references)
			//IL_0069: Unknown result type (might be due to invalid IL or missing references)
			RectTransform val = (RectTransform)((Component)scrollbar).transform;
			val.anchoredPosition = new Vector2(0f, 0f);
			val.anchorMax = new Vector2(1f, 1f);
			val.anchorMin = new Vector2(1f, 0f);
			val.offsetMax = new Vector2(2f, 0f);
			val.offsetMin = new Vector2(-2f, 0f);
		}
	}

	private static void SetupContainerScrollbars()
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		//IL_001a: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0020: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		RectTransform val = (RectTransform)((Component)InventoryGui.instance.ContainerGrid.m_scrollbar).transform;
		Vector2 anchoredPosition = val.anchoredPosition;
		anchoredPosition.y = -20f;
		val.anchoredPosition = anchoredPosition;
		val.sizeDelta = new Vector2(4f, 290f);
	}
}
