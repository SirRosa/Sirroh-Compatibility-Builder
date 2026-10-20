using HarmonyLib;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixInventoryTextInput
{
	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "Hide")]
	private static void InventoryGui_Hide(InventoryGui __instance, ref bool __runOriginal)
	{
		if (__runOriginal)
		{
			__runOriginal = !TextInput.IsVisible();
		}
	}

	[HarmonyPostfix]
	[HarmonyPatch(typeof(TextInput), "Update")]
	private static void TextInput_Update(TextInput __instance)
	{
		if (InventoryGui.IsVisible() && !__instance.m_bShouldHideNextFrame && ZInput.GetButtonDown("JoyButtonB"))
		{
			__instance.Hide();
		}
	}
}
