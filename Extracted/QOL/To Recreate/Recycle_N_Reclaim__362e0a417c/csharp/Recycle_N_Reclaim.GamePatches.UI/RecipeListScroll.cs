using System.Linq;
using System.Runtime.CompilerServices;
using HarmonyLib;
using UnityEngine;
using UnityEngine.UI;

namespace Recycle_N_Reclaim.GamePatches.UI;

[HarmonyPatch]
[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
public static class RecipeListScroll
{
	private static ScrollRect _scrollRect;

	private static float _vanillaSensitivity = 40f;

	[HarmonyPatch(typeof(InventoryGui), "Awake")]
	[HarmonyPostfix]
	private static void GrabScrollRect(InventoryGui __instance)
	{
		_scrollRect = FindRecipeScrollRect(__instance);
		if ((Object)(object)_scrollRect == (Object)null)
		{
			Recycle_N_ReclaimPlugin.Recycle_N_ReclaimLogger.LogWarning((object)"Couldn't find the recipe list ScrollRect, scroll speed setting won't do anything");
			return;
		}
		_vanillaSensitivity = _scrollRect.scrollSensitivity;
		Apply();
	}

	private static ScrollRect FindRecipeScrollRect(InventoryGui igui)
	{
		RectTransform root = igui.m_recipeListRoot;
		if ((Object)(object)root == (Object)null)
		{
			return null;
		}
		ScrollRect componentInParent = ((Component)root).GetComponentInParent<ScrollRect>();
		if ((Object)(object)componentInParent != (Object)null)
		{
			return componentInParent;
		}
		return ((Component)igui).GetComponentsInChildren<ScrollRect>(true).FirstOrDefault([_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(0)] (ScrollRect sr) => (Object)(object)sr.content == (Object)(object)root);
	}

	public static void Apply()
	{
		if (!((Object)(object)_scrollRect == (Object)null))
		{
			_scrollRect.scrollSensitivity = _vanillaSensitivity * Mathf.Max(0.1f, Recycle_N_ReclaimPlugin.RecipeListScrollSpeedMultiplier.Value);
		}
	}
}
