using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using BepInEx.Configuration;
using HarmonyLib;
using JetBrains.Annotations;
using Splatform;
using UnityEngine;

namespace CreatureLevelControl;

[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
[_003C19a61b00_002Def00_002D4483_002D861c_002Da6ab09b7ab75_003ENullable(0)]
public static class WorldLevelMinimapCircles
{
	[HarmonyPatch(typeof(Minimap), "GenerateWorldMap")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private class PatchMinimapCircles
	{
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		[UsedImplicitly]
		[HarmonyPriority(100)]
		private static void Postfix(Minimap __instance)
		{
			originalMapColors = __instance.m_mapTexture.GetPixels();
			originalForestColors = __instance.m_forestMaskTexture.GetPixels();
			originalHeightColors = __instance.m_heightTexture.GetPixels();
			DrawDistanceLevelCircles(__instance);
		}
	}

	[HarmonyPatch(typeof(Minimap), "LoadMapData")]
	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)]
	private class PatchMinimapCirclesPins
	{
		[UsedImplicitly]
		[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(1)]
		private static void Postfix(Minimap __instance)
		{
			UpdateDistanceLevelPins(__instance);
		}
	}

	private static Color[] originalMapColors = null;

	private static Color[] originalForestColors = null;

	private static Color[] originalHeightColors = null;

	private static readonly Sprite emptySprite = Sprite.Create(new Texture2D(0, 0), Rect.zero, Vector2.zero);

	private static readonly List<PinData> distancePins = new List<PinData>();

	private static void DrawDistanceLevelCircles(Minimap minimap)
	{
		//IL_0124: Unknown result type (might be due to invalid IL or missing references)
		//IL_0129: Unknown result type (might be due to invalid IL or missing references)
		//IL_012e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0135: Unknown result type (might be due to invalid IL or missing references)
		//IL_013c: Unknown result type (might be due to invalid IL or missing references)
		//IL_014c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0151: Unknown result type (might be due to invalid IL or missing references)
		//IL_0156: Unknown result type (might be due to invalid IL or missing references)
		//IL_018b: Unknown result type (might be due to invalid IL or missing references)
		//IL_01af: Unknown result type (might be due to invalid IL or missing references)
		Color[] mapColors = new Color[originalMapColors.Length];
		Array.Copy(originalMapColors, mapColors, originalMapColors.Length);
		Color[] forestColors = minimap.m_forestMaskTexture.GetPixels();
		Array.Copy(originalForestColors, forestColors, originalForestColors.Length);
		Color[] heightColors = minimap.m_heightTexture.GetPixels();
		Array.Copy(originalHeightColors, heightColors, originalHeightColors.Length);
		if (CreatureLevelControl.difficultySecondFactor.Value == CreatureLevelControl.DifficultySecondFactor.Distance && CreatureLevelControl.displayDistanceFromSpawnCircles.GetToggle())
		{
			Vector3 val = default;
			foreach (int item in CreatureLevelControl.spawnDistance.Keys.Select([_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(0)] (ConfigEntry<int> v) => v.Value).Distinct())
			{
				ZoneSystem.instance.GetLocationIcon(Game.instance.m_StartLocation, ref val);
				Vector2 val2 = (float)minimap.m_textureSize / 2f * Vector2.one + new Vector2(val.x, val.z) / minimap.m_pixelSize;
				float num = (float)item / minimap.m_pixelSize;
				int num2 = Mathf.CeilToInt(num * 2f * (float)Math.PI);
				int i = 0;
				while (i < num2)
				{
					float num3 = val2.x + num * Mathf.Sin((float)Math.PI * 2f * (float)i / (float)num2);
					float num4 = val2.y + num * Mathf.Cos((float)Math.PI * 2f * (float)i / (float)num2);
					int num5 = ((!(num3 % 1f > 0.5f)) ? 1 : (-1));
					int num6 = ((!(num4 % 1f > 0.5f)) ? 1 : (-1));
					apply(num3, num4, 1f - Mathf.Abs(0.5f - num3 % 1f) * Mathf.Abs(0.5f - num4 % 1f) * 2f);
					apply(num3 + (float)num5, num4, 0.5f - (0.5f - Mathf.Abs(0.5f - num3 % 1f)) * Mathf.Abs(0.5f - num4 % 1f) * 2f);
					apply(num3, num4 + (float)num6, 0.5f - (0.5f - Mathf.Abs(0.5f - num4 % 1f)) * Mathf.Abs(0.5f - num3 % 1f) * 2f);
					apply(num3 + (float)num5, num4 + (float)num6, 0.5f - (0.5f - Mathf.Abs(0.5f - num3 % 1f)) * (0.5f - Mathf.Abs(0.5f - num4 % 1f)) * 2f);
					int num7 = i + 1;
					i = num7;
				}
				void apply(float x, float y, float intensity)
				{
					//IL_0076: Unknown result type (might be due to invalid IL or missing references)
					//IL_006f: Unknown result type (might be due to invalid IL or missing references)
					//IL_007b: Unknown result type (might be due to invalid IL or missing references)
					//IL_008a: Unknown result type (might be due to invalid IL or missing references)
					//IL_008f: Unknown result type (might be due to invalid IL or missing references)
					//IL_00b0: Unknown result type (might be due to invalid IL or missing references)
					//IL_00a2: Unknown result type (might be due to invalid IL or missing references)
					//IL_00a7: Unknown result type (might be due to invalid IL or missing references)
					//IL_00a9: Unknown result type (might be due to invalid IL or missing references)
					//IL_00b1: Unknown result type (might be due to invalid IL or missing references)
					//IL_00ca: Unknown result type (might be due to invalid IL or missing references)
					//IL_00cf: Unknown result type (might be due to invalid IL or missing references)
					//IL_0110: Unknown result type (might be due to invalid IL or missing references)
					//IL_0115: Unknown result type (might be due to invalid IL or missing references)
					if (!(x < 0f) && Mathf.RoundToInt(x) < minimap.m_textureSize && !(y < 0f) && Mathf.RoundToInt(y) < minimap.m_textureSize)
					{
						int num8 = Mathf.RoundToInt(y) * minimap.m_textureSize + Mathf.RoundToInt(x);
						Color val3 = ((i % 20 < 10) ? Color.red : Color.blue);
						mapColors[num8] = ((mapColors[num8] == Color.white) ? val3 : Color.Lerp(mapColors[num8], val3, intensity));
						if (intensity > 0.2f)
						{
							forestColors[num8] = Minimap.s_noForestColor;
							heightColors[num8] = new Color(Mathf.Clamp(heightColors[num8].r, ZoneSystem.instance.m_waterLevel + 4f, 89f), 0f, 0f);
						}
					}
				}
			}
		}
		minimap.m_mapTexture.SetPixels(mapColors);
		minimap.m_mapTexture.Apply();
		minimap.m_forestMaskTexture.SetPixels(forestColors);
		minimap.m_forestMaskTexture.Apply();
		minimap.m_heightTexture.SetPixels(heightColors);
		minimap.m_heightTexture.Apply();
	}

	private static void UpdateDistanceLevelPins(Minimap minimap)
	{
		//IL_00c4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d4: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d9: Unknown result type (might be due to invalid IL or missing references)
		//IL_00fd: Unknown result type (might be due to invalid IL or missing references)
		//IL_0103: Unknown result type (might be due to invalid IL or missing references)
		foreach (PinData distancePin in distancePins)
		{
			minimap.RemovePin(distancePin);
		}
		distancePins.Clear();
		if (CreatureLevelControl.difficultySecondFactor.Value != CreatureLevelControl.DifficultySecondFactor.Distance || !CreatureLevelControl.displayDistanceFromSpawnCircles.GetToggle())
		{
			return;
		}
		int num = int.MaxValue;
		Vector3 val = default;
		foreach (KeyValuePair<ConfigEntry<int>, int> item in CreatureLevelControl.spawnDistance.Reverse())
		{
			int value = item.Key.Value;
			if (value != num)
			{
				ZoneSystem.instance.GetLocationIcon(Game.instance.m_StartLocation, ref val);
				PinData val2 = minimap.AddPin(val + new Vector3(0f, 0f, (float)(-value)), (PinType)8, $"Level {item.Value + 1}", false, false, 0L, default(PlatformUserID));
				val2.m_icon = emptySprite;
				distancePins.Add(val2);
				num = value;
			}
		}
	}

	[_003C1db76c19_002D8463_002D48b3_002D863d_002Daed0b32ce4ba_003ENullableContext(2)]
	public static void RedrawDistanceCircles(Minimap minimap)
	{
		if ((Object)(object)minimap?.m_mapTexture != (Object)null)
		{
			try
			{
				DrawDistanceLevelCircles(minimap);
				UpdateDistanceLevelPins(minimap);
			}
			catch (NullReferenceException)
			{
			}
		}
	}

	static WorldLevelMinimapCircles()
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_0019: Unknown result type (might be due to invalid IL or missing references)
		//IL_001e: Unknown result type (might be due to invalid IL or missing references)
		//IL_0028: Expected Obj, but got Unknown
	}
}
