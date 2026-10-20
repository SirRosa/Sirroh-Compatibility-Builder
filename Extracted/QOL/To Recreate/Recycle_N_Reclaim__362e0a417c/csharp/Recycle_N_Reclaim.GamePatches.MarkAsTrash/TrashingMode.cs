namespace Recycle_N_Reclaim.GamePatches.MarkAsTrash;

internal class TrashingMode
{
	private static bool hasCurrentlyToggledTrashing;

	internal static bool HasCurrentlyToggledTrashing
	{
		get
		{
			return hasCurrentlyToggledTrashing;
		}
		set
		{
			hasCurrentlyToggledTrashing = value;
		}
	}

	internal static void RefreshDisplay()
	{
		HasCurrentlyToggledTrashing = HasCurrentlyToggledTrashing;
	}

	internal static bool IsInTrashingMode()
	{
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		if (!HasCurrentlyToggledTrashing)
		{
			return Recycle_N_ReclaimPlugin.TrashingModifierKeybind1.Value.IsKeyHeld();
		}
		return true;
	}
}
