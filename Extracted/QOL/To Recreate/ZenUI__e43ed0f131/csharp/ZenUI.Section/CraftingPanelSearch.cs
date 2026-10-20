using System.Linq;
using BepInEx;
using GUIFramework;
using HarmonyLib;
using TMPro;
using UnityEngine;
using UnityEngine.Events;
using Zen;
using Zen.Lib;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class CraftingPanelSearch
{
	private const float FieldWidth = 150f;

	private const float FieldHeight = 28f;

	private static readonly Vector2 SearchPositionDefault = new Vector2(200f, -82f);

	private static GuiInputField _search = null;

	private static string _searchText = string.Empty;

	private static bool IsConfigValid
	{
		get
		{
			if (Configs.CraftPanelEnabled.Value)
			{
				return Configs.CraftPanelSearch.Value;
			}
			return false;
		}
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(Game), "Start")]
	internal static void Game_Start()
	{
		if (IsConfigValid)
		{
			Init();
		}
	}

	private static void Init()
	{
		//IL_00a1: Unknown result type (might be due to invalid IL or missing references)
		//IL_00b6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00cb: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d6: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00ea: Unknown result type (might be due to invalid IL or missing references)
		if ((Object)(object)_search != (Object)null)
		{
			Logging<Plugin>.Warning("Already initialized");
			return;
		}
		RectTransform crafting = InventoryGui.instance.m_crafting;
		GameObject val = Object.Instantiate<GameObject>(((Component)TextInput.instance.m_inputField).gameObject, (Transform)(object)crafting);
		((Object)val).name = "ZenUI_Search";
		_search = val.GetComponent<GuiInputField>();
		_search.VirtualKeyboardTitle = "$menu_filter";
		((Component)((Component)_search).transform.Find("Text Area/Placeholder")).GetComponent<TMP_Text>().text = "$menu_filter".Localize();
		((TMP_InputField)_search).restoreOriginalTextOnEscape = false;
		RectTransform component = val.GetComponent<RectTransform>();
		component.anchorMin = new Vector2(0.5f, 1f);
		component.anchorMax = new Vector2(0.5f, 1f);
		component.sizeDelta = new Vector2(150f, 28f);
		component.anchoredPosition = SearchPositionDefault;
		component.pivot = Vector2.one * 0.5f;
		((UnityEvent<string>)(object)((TMP_InputField)_search).onValueChanged).AddListener((UnityAction<string>)delegate
		{
			UpdateSearchFilter();
			UpdateCraftingPanel();
		});
		ResetSearchFilter();
		Logging<Plugin>.Info("Initialized");
	}

	internal static void Shutdown()
	{
		if (Object.op_Implicit((Object)(object)_search))
		{
			Object.Destroy((Object)(object)((Component)_search).gameObject);
		}
	}

	private static void Show(bool show)
	{
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0033: Unknown result type (might be due to invalid IL or missing references)
		//IL_003d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0042: Unknown result type (might be due to invalid IL or missing references)
		((Component)_search).gameObject.SetActive(show && IsConfigValid && !ZInput.IsGamepadActive());
		((RectTransform)((Component)_search).transform).anchoredPosition = SearchPositionDefault + Configs.CraftPanelSearchPosition.Value;
	}

	private static void UpdateSearchFilter()
	{
		Logging<Plugin>.InterpolatedString msg = new Logging<Plugin>.InterpolatedString(24, 1, out var shouldAppend);
		if (shouldAppend)
		{
			msg.AppendLiteral("Update search filter: '");
			msg.AppendFormatted(((TMP_InputField)_search).text);
			msg.AppendLiteral("'");
		}
		Logging<Plugin>.Info(msg);
		_searchText = ((TMP_InputField)_search).text.ToLower().Trim();
	}

	private static void ResetSearchFilter()
	{
		Logging<Plugin>.Info("Resetting search filter");
		((TMP_InputField)_search).text = string.Empty;
		UpdateSearchFilter();
	}

	internal static bool ApplySearchFilter(RecipeDataPair recipeDataPair)
	{
		if (Utility.IsNullOrWhiteSpace(_searchText))
		{
			return true;
		}
		Recipe recipe = recipeDataPair.Recipe;
		if (!IsItemFiltered() && !IsArmorSetFiltered())
		{
			return IsResourceFiltered();
		}
		return true;
		bool IsArmorSetFiltered()
		{
			if (Configs.CraftPanelSearchArmorSets.Value)
			{
				return IsFiltered(recipe.m_item.m_itemData.m_shared.m_setStatusEffect?.m_name ?? string.Empty);
			}
			return false;
		}
		static bool IsFiltered(string text)
		{
			return text.Localize().ToLower().Split(new char[1] { ' ' })
				.Any((string word) => word.Trim().StartsWith(_searchText));
		}
		bool IsItemFiltered()
		{
			return IsFiltered(recipe.m_item.GetName());
		}
		bool IsResourceFiltered()
		{
			if (Configs.CraftPanelSearchResources.Value)
			{
				return recipe.m_resources.Any((Requirement req) => req.m_amount > 0 && IsFiltered(req.m_resItem.GetName()));
			}
			return false;
		}
	}

	private static void UpdateCraftingPanel()
	{
		CraftingPanel.ResetScrollCache();
		CraftingPanel.UpdateRecipeList();
		CraftingPanel.SelectItem(null);
	}

	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "Update")]
	private static void InventoryGui_Update(InventoryGui __instance)
	{
		if (IsConfigValid && InventoryGui.IsVisible())
		{
			Show(__instance.InCraftTab());
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(Chat), "HasFocus")]
	private static void Chat_HasFocus(ref bool __result)
	{
		if (IsConfigValid && Object.op_Implicit((Object)(object)_search) && ((TMP_InputField)_search).isFocused)
		{
			__result = true;
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(InventoryGui), "UpdateRecipe")]
	private static void InventoryGui_UpdateRecipe()
	{
		if (!IsConfigValid)
		{
			return;
		}
		if (((TMP_InputField)_search).isFocused)
		{
			if (ZInput.GetButtonDown("Chat") || ZInput.GetButtonDown("Block") || ZInput.GetButtonDown("Console") || ZInput.GetButtonDown("Escape") || ZInput.GetButtonDown("Inventory"))
			{
				((TMP_InputField)_search).DeactivateInputField(false);
			}
		}
		else if (Object.op_Implicit((Object)(object)Player.m_localPlayer) && !Console.IsVisible() && !TextInput.IsVisible() && !Minimap.InTextInput() && !Menu.IsVisible() && ZInput.GetButtonDown("Chat"))
		{
			_search.ActivateInputField();
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(InventoryGui), "Show")]
	private static void InventoryGui_Show()
	{
		if (IsConfigValid && CraftingPanel.IsStationChanged)
		{
			ResetSearchFilter();
		}
	}

	static CraftingPanelSearch()
	{
		//IL_000a: Unknown result type (might be due to invalid IL or missing references)
		//IL_000f: Unknown result type (might be due to invalid IL or missing references)
	}
}
