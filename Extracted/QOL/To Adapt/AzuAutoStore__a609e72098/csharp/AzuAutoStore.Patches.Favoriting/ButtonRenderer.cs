using System.Collections;
using System.Runtime.CompilerServices;
using UnityEngine;
using UnityEngine.UI;

namespace AzuAutoStore.Patches.Favoriting;

internal class ButtonRenderer
{
	internal class MainButtonUpdate
	{
		[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
		internal static void UpdateInventoryGuiButtons(InventoryGui __instance)
		{
			if (hasOpenedInventoryOnce && !((Object)(object)__instance != (Object)(object)InventoryGui.instance) && Object.op_Implicit((Object)(object)Player.m_localPlayer))
			{
				FavoritingMode.HasCurrentlyToggledFavoriting = false;
			}
		}
	}

	internal static bool hasOpenedInventoryOnce;

	[_003C31f19a94_002Dc784_002D4aab_002Dbc2b_002D6331c6b22707_003ENullable(1)]
	internal static Button favoritingTogglingButton;

	[_003C5eccf676_002D4928_002D40d6_002Dbd07_002Dee44b60a7faa_003ENullableContext(1)]
	internal static IEnumerator WaitAFrameToUpdateUIElements(InventoryGui instance, bool includeTrashButton)
	{
		yield return null;
		if (!((Object)(object)instance == (Object)null))
		{
			MainButtonUpdate.UpdateInventoryGuiButtons(instance);
		}
	}
}
