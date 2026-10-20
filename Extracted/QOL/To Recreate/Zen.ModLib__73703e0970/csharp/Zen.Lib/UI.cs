using System;
using System.Text.RegularExpressions;
using Jotunn;
using UnityEngine;
using UnityEngine.UI;
using Zen.Lib.Controls;

namespace Zen.Lib;

public static class UI
{
	public static class Materials
	{
		private static Material? _iconDropShadowCache;

		public static Material LitPanel => GlobalStatic.GetPrefab<Material>("litpanel", true);

		public static Material IconCleanTransparency => ((Graphic)Minimap.instance.m_pingImageObject).material;

		public static Material IconDropShadow
		{
			get
			{
				if (!Object.op_Implicit((Object)(object)_iconDropShadowCache))
				{
					return _iconDropShadowCache = ((Graphic)((Component)InventoryGui.instance.m_playerGrid.m_elementPrefab.transform.Find("icon")).GetComponent<Image>()).material;
				}
				return _iconDropShadowCache;
			}
		}
	}

	public static string PromptUseItem => Prompt("$KEY_HotbarUse");

	public static string PromptInteract => Prompt("$KEY_Use");

	public static string PromptInteractAlt
	{
		get
		{
			if (!InteractAlt.IsDefinedKey)
			{
				return PromptInteractAltVanilla();
			}
			return Prompt($"$KEY_{InteractAlt.InputAction}");
		}
	}

	public static bool IsBuildModeActive
	{
		get
		{
			if (!Hud.IsPieceSelectionVisible())
			{
				if (Object.op_Implicit((Object)(object)Hud.instance) && Object.op_Implicit((Object)(object)Hud.instance.m_buildHud))
				{
					return Hud.instance.m_buildHud.activeSelf;
				}
				return false;
			}
			return true;
		}
	}

	internal static CanvasScaler? CanvasScaler { get; set; }

	public static float ScaleFactor
	{
		get
		{
			if (!Object.op_Implicit((Object)(object)CanvasScaler))
			{
				return 1f;
			}
			return CanvasScaler.scaleFactor;
		}
	}

	public static bool IsOpen
	{
		get
		{
			if (!Object.op_Implicit((Object)(object)Game.instance) || !Object.op_Implicit((Object)(object)GameCamera.instance) || !Object.op_Implicit((Object)(object)Player.m_localPlayer))
			{
				return true;
			}
			if (((Character)Player.m_localPlayer).TakeInput())
			{
				return IsBuildModeActive;
			}
			return true;
		}
	}

	public static string Prompt(string text)
	{
		return "[<color=yellow><b>" + text + "</b></color>]";
	}

	private static string PromptInteractAltVanilla()
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		if (!ZInput.IsGamepadActive() || (int)ZInput.InputLayout == 0)
		{
			return Prompt("$KEY_AltPlace + $KEY_Use");
		}
		return Prompt("$KEY_AltKeys + $KEY_Use");
	}

	public static TimeSpan RealToGameTime(double seconds, float dayMin = 0f)
	{
		double num = seconds / (double)EnvMan.instance.m_dayLengthSec;
		return TimeSpan.FromDays((num <= 0.0) ? 0.0 : (num + (double)dayMin));
	}

	public static TimeSpan RealToGameTimeFuel(double seconds)
	{
		return RealToGameTime(seconds, 0.51f);
	}

	public static string RemainingTimeText(double seconds, float secPerFuel = -1f)
	{
		bool flag = secPerFuel > (float)EnvMan.instance.m_dayLengthSec;
		TimeSpan timeSpan = (flag ? RealToGameTimeFuel(seconds) : TimeSpan.FromSeconds(seconds));
		string result = "None";
		if (flag)
		{
			if (timeSpan.Days > 0)
			{
				result = $"{timeSpan.Days} " + ((timeSpan.Days > 1) ? "$time_dayN" : "$time_day1");
			}
			else if (timeSpan.TotalSeconds > 0.0)
			{
				result = "$time_day0";
			}
		}
		else
		{
			double totalMinutes = timeSpan.TotalMinutes;
			if (totalMinutes > 0.0 && totalMinutes <= 1.0)
			{
				result = "$time_minute0";
			}
			else
			{
				totalMinutes = timeSpan.TotalMinutes;
				result = ((!(totalMinutes > 1.0) || !(totalMinutes < 60.0)) ? ($"{timeSpan.TotalHours:N1} " + ((timeSpan.TotalHours > 1.0) ? "$time_hourN" : "$time_hour1")) : ($"{timeSpan.Minutes + 1} " + ((timeSpan.TotalMinutes > 1.0) ? "$time_minuteN" : "$time_minute1")));
			}
		}
		return result;
	}

	public static Material AddValheimIconShadow(this Image image)
	{
		return ((Graphic)image).material = ((Graphic)Hud.instance.m_buildIcon).material;
	}

	public static Outline AddOutline(this GameObject gameObject)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		return gameObject.AddOutline(1f, Color.black);
	}

	public static Outline AddOutline(this GameObject gameObject, float thickness, Color effectColor = default(Color))
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_000d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0018: Unknown result type (might be due to invalid IL or missing references)
		//IL_001b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0021: Unknown result type (might be due to invalid IL or missing references)
		//IL_002c: Unknown result type (might be due to invalid IL or missing references)
		//IL_0029: Unknown result type (might be due to invalid IL or missing references)
		Outline orAddComponent = ExposedGameObjectExtension.GetOrAddComponent<Outline>(gameObject);
		((Shadow)orAddComponent).effectDistance = Vector2.one * thickness;
		((Shadow)orAddComponent).effectColor = ((effectColor == default(Color)) ? Color.black : effectColor);
		return orAddComponent;
	}

	public static string InsertInteractAlt(string hoverText, string label)
	{
		string pattern = "^(" + PromptInteract.RegexPattern() + ".*)$";
		string text = PromptInteractAlt + " " + label;
		return Regex.Replace(hoverText, pattern, "$1\n" + text, RegexOptions.Multiline);
	}

	public static string CreateMeter(float value, float max, int length = 10)
	{
		//IL_0005: Unknown result type (might be due to invalid IL or missing references)
		//IL_000a: Unknown result type (might be due to invalid IL or missing references)
		//IL_000b: Unknown result type (might be due to invalid IL or missing references)
		//IL_0011: Unknown result type (might be due to invalid IL or missing references)
		//IL_0016: Unknown result type (might be due to invalid IL or missing references)
		//IL_0023: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_0034: Unknown result type (might be due to invalid IL or missing references)
		//IL_003a: Unknown result type (might be due to invalid IL or missing references)
		Color color = UIColor.MinorInfo.Color;
		Color val = color * 0.5f;
		val.a = 1f;
		Color val2 = val;
		return "<line-height=80%><size=80%>\n" + CreateMeter("▄", "▄", color, val2, value, max, length) + "\n</size></line-height>";
	}

	public static string CreateMeter(string active, string disabled, UIColor light, UIColor dark, float value, float max, int length)
	{
		if (length <= 0 || max <= 0f)
		{
			return string.Empty;
		}
		int num;
		if (Mathf.Approximately(max, (float)length))
		{
			num = Mathf.CeilToInt(value);
		}
		else
		{
			num = Mathf.RoundToInt(Mathf.Clamp01(value / max) * (float)length);
			if (value > 0f)
			{
				num = Mathf.Max(num, 1);
			}
		}
		num = Mathf.Clamp(num, 0, length);
		int num2 = length - num;
		string text = $"<color={light}>{active.Repeat(num)}</color>";
		if (num2 > 0)
		{
			text += $"<color={dark}>{disabled.Repeat(num2)}</color>";
		}
		return text;
	}
}
