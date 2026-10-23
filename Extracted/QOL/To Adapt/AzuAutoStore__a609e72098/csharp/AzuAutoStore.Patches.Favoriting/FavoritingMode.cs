namespace AzuAutoStore.Patches.Favoriting;

internal class FavoritingMode
{
	private static bool hasCurrentlyToggledFavoriting;

	internal static bool HasCurrentlyToggledFavoriting
	{
		get
		{
			return hasCurrentlyToggledFavoriting;
		}
		set
		{
			hasCurrentlyToggledFavoriting = value;
		}
	}

	internal static void RefreshDisplay()
	{
		HasCurrentlyToggledFavoriting = HasCurrentlyToggledFavoriting;
	}

	internal static bool IsInFavoritingMode()
	{
		//IL_000c: Unknown result type (might be due to invalid IL or missing references)
		//IL_001d: Unknown result type (might be due to invalid IL or missing references)
		//IL_002e: Unknown result type (might be due to invalid IL or missing references)
		if (!HasCurrentlyToggledFavoriting && !AzuAutoStorePlugin.FavoritingModifierKeybind1.Value.IsKeyHeld() && !AzuAutoStorePlugin.FavoritingModifierKeybind2.Value.IsKeyHeld())
		{
			return AzuAutoStorePlugin.SearchModifierKeybind.Value.IsKeyHeld();
		}
		return true;
	}
}
