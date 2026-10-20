using HarmonyLib;
using Zen.Lib;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixHideKeyHintExitMenu
{
	[HarmonyPostfix]
	[HarmonyPatch(typeof(KeyHints), "Awake")]
	internal static void KeyHints_Awake()
	{
		Logging<ModLib>.Info("Hiding KeyHint: Inventory.ExitMenu");
		KeyHint.SetVisible(HintType.Inventory, "ExitMenu", isVisible: false);
	}
}
