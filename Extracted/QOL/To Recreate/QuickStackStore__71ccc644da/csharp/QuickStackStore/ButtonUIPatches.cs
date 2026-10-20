using HarmonyLib;
using UnityEngine;
using UnityEngine.UI;

namespace QuickStackStore;

internal class ButtonUIPatches
{
	[HarmonyPatch(typeof(InventoryGui))]
	internal static class PatchInventoryGui
	{
		[HarmonyPriority(300)]
		[HarmonyPatch("Show")]
		[HarmonyPostfix]
		private static void Show_Postfix(InventoryGui __instance)
		{
			ButtonRenderer.hasOpenedInventoryOnce = true;
			ButtonRenderer.MainButtonUpdate.UpdateInventoryGuiButtons(__instance);
			ButtonRenderer.hasCompletedOpeningInventoryOnce = true;
		}

		[HarmonyPriority(300)]
		[HarmonyPatch("Hide")]
		[HarmonyPostfix]
		private static void CloseInventory_Postfix()
		{
			FavoritingMode.HasCurrentlyToggledFavoriting = false;
		}

		[HarmonyPriority(300)]
		[HarmonyPatch("CloseContainer")]
		[HarmonyPostfix]
		public static void CloseContainer_Postfix(InventoryGui __instance)
		{
			if ((Object)(object)__instance.m_currentContainer != (Object)null)
			{
				return;
			}
			Button[] array = new Button[4]
			{
				ButtonRenderer.storeAllButton,
				ButtonRenderer.quickStackToContainerButton,
				ButtonRenderer.sortContainerButton,
				ButtonRenderer.restockFromContainerButton
			};
			Button[] array2 = array;
			foreach (Button val in array2)
			{
				if (!((Object)(object)val == (Object)null))
				{
					((Component)val).gameObject.SetActive(false);
				}
			}
		}
	}

	[HarmonyPatch(typeof(Game))]
	internal static class PatchGame
	{
		[HarmonyPatch("Logout")]
		[HarmonyPrefix]
		internal static void ResetOnLogout()
		{
			//IL_0022: Unknown result type (might be due to invalid IL or missing references)
			ButtonRenderer.hasOpenedInventoryOnce = false;
			TrashModule.TrashItemsPatches.hasOpenedInventoryOnce = false;
			ButtonRenderer.hasCompletedOpeningInventoryOnce = false;
			ButtonRenderer.origButtonLength = -1f;
			ButtonRenderer.origButtonPosition = default;
		}
	}
}
