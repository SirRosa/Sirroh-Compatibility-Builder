using System.Collections.Generic;
using System.Runtime.CompilerServices;
using UnityEngine;

namespace Recycle_N_Reclaim.GamePatches.UI;

[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(0)]
public static class InventoryGuiExtensions
{
	public static float get_m_recipeListBaseSize(this InventoryGui instance)
	{
		return instance.m_recipeListBaseSize;
	}

	public static List<RecipeDataPair> get_m_recipeList(this InventoryGui instance)
	{
		return instance.m_availableRecipes;
	}

	public static List<RecipeDataPair> get_m_availableRecipes(this InventoryGui instance)
	{
		return instance.m_availableRecipes;
	}

	public static RecipeDataPair get_m_selectedRecipe(this InventoryGui instance)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		return instance.m_selectedRecipe;
	}

	public static void set_m_selectedRecipe(this InventoryGui instance, RecipeDataPair value)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		instance.m_selectedRecipe = value;
	}

	public static int get_m_selectedVariant(this InventoryGui instance)
	{
		return instance.m_selectedVariant;
	}

	public static void set_m_selectedVariant(this InventoryGui instance, int value)
	{
		instance.m_selectedVariant = value;
	}

	public static float get_m_craftTimer(this InventoryGui instance)
	{
		return instance.m_craftTimer;
	}

	public static void set_m_craftTimer(this InventoryGui instance, float value)
	{
		instance.m_craftTimer = value;
	}

	public static Color get_m_minStationLevelBasecolor(this InventoryGui instance)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		return instance.m_minStationLevelBasecolor;
	}
}
