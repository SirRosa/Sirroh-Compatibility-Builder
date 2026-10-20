using System.Runtime.CompilerServices;
using UnityEngine;
using UnityEngine.UI;

namespace Recycle_N_Reclaim.GamePatches.MarkAsTrash;

internal class ButtonRenderer
{
	internal class MainButtonUpdate
	{
		[_003C98e96a37_002Df374_002D406e_002Dbbe0_002D48fa13b28265_003ENullableContext(1)]
		internal static void UpdateInventoryGuiButtons(InventoryGui __instance)
		{
			if (hasOpenedInventoryOnce && !((Object)(object)__instance != (Object)(object)InventoryGui.instance) && Object.op_Implicit((Object)(object)Player.m_localPlayer))
			{
				TrashingMode.HasCurrentlyToggledTrashing = false;
			}
		}
	}

	internal static bool hasOpenedInventoryOnce;

	[_003Cc6ee30b4_002D1fc8_002D48a6_002Db646_002D32a3d54a7999_003ENullable(1)]
	internal static Button TrashingTogglingButton;
}
