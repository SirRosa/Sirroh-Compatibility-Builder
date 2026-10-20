using HarmonyLib;
using UnityEngine;

namespace ZenUI.Section;

[HarmonyPatch]
internal static class PieceHealthColor
{
	[HarmonyPostfix]
	[HarmonyPatch(typeof(Hud), "UpdateCrosshair")]
	[HarmonyPriority(100)]
	private static void Hud_UpdateCrosshair(Hud __instance)
	{
		//IL_0040: Unknown result type (might be due to invalid IL or missing references)
		if (Configs.ShowPieceHealthColor.Value && ((Component)__instance.m_pieceHealthRoot).gameObject.activeSelf)
		{
			__instance.m_pieceHealthBar.SetColor(AdjustColor(__instance.m_pieceHealthBar.m_value));
		}
	}

	public static void ResetColor()
	{
		if (Object.op_Implicit((Object)(object)Hud.instance))
		{
			Hud.instance.m_pieceHealthBar.ResetColor();
		}
	}

	private static Color AdjustColor(float value, float maxValue = 1f, float saturation = 1f, float brightness = 1f)
	{
		//IL_0028: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		if (maxValue <= 0f)
		{
			return Color.red;
		}
		return Color.HSVToRGB(Mathf.Clamp01(value / maxValue) * (1f / 3f), Mathf.Clamp01(saturation), Mathf.Clamp01(brightness));
	}
}
