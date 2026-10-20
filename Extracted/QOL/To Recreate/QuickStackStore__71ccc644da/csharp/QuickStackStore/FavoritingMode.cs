using TMPro;
using UnityEngine;

namespace QuickStackStore;

internal class FavoritingMode
{
	private static bool hasCurrentlyToggledFavoriting;

	private const string blackStar = "★";

	private const string whiteStar = "☆";

	internal static bool HasCurrentlyToggledFavoriting
	{
		get
		{
			return hasCurrentlyToggledFavoriting;
		}
		set
		{
			//IL_0035: Unknown result type (might be due to invalid IL or missing references)
			hasCurrentlyToggledFavoriting = value;
			if (Object.op_Implicit((Object)(object)ButtonRenderer.favoritingTogglingButtonText))
			{
				if (QSSConfig.FavoriteConfig.FavoriteToggleButtonStyle.Value == QSSConfig.FavoriteToggleButtonStyle.TextStarInItemFavoriteColor)
				{
					string text = ColorUtility.ToHtmlStringRGB(QSSConfig.FavoriteConfig.BorderColorFavoritedItem.Value);
					((TMP_Text)ButtonRenderer.favoritingTogglingButtonText).text = "<color=#" + text + ">" + (value ? "★" : "☆") + "</color>";
				}
				else
				{
					((TMP_Text)ButtonRenderer.favoritingTogglingButtonText).text = (value ? "★" : "☆");
				}
			}
		}
	}

	internal static void RefreshDisplay()
	{
		HasCurrentlyToggledFavoriting = HasCurrentlyToggledFavoriting;
	}

	internal static void ToggleFavoriteToggling()
	{
		HasCurrentlyToggledFavoriting = !HasCurrentlyToggledFavoriting;
	}

	internal static bool IsInFavoritingMode()
	{
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		return HasCurrentlyToggledFavoriting || QSSConfig.FavoriteConfig.FavoritingModifierKeybind1.Value.IsKeyHeld() || QSSConfig.FavoriteConfig.FavoritingModifierKeybind2.Value.IsKeyHeld();
	}
}
