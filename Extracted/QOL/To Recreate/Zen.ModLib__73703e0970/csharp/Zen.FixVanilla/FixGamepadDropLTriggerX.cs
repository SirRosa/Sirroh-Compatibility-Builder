using HarmonyLib;

namespace Zen.FixVanilla;

[HarmonyPatch]
internal static class FixGamepadDropLTriggerX
{
	[HarmonyPrefix]
	[HarmonyPatch(typeof(InventoryGui), "OnSelectedItem")]
	[HarmonyPriority(800)]
	private static bool InventoryGui_OnSelectedItem(InventoryGui __instance, Modifier mod)
	{
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Invalid comparison between Unknown and I4
		if (!ModLib.Configs.FixGamepadDropLTriggerX.Value)
		{
			return true;
		}
		if (!ZInput.IsGamepadActive() || __instance.IsContainerOpen())
		{
			return true;
		}
		if ((int)mod == 2 && ZInput.GetButton("JoyLTrigger"))
		{
			return !ZInput.GetButton("JoyButtonX");
		}
		return true;
	}
}
