using System;
using UnityEngine;

namespace Zen.Lib;

public class UIColor : IEquatable<UIColor>
{
	private readonly string _hex;

	public readonly Color Color;

	public static readonly UIColor ValheimOrange = new Color(1f, 0.631f, 0.235f, 1f);

	public static readonly UIColor ValheimYellow = new Color(1f, 0.889f, 0f, 1f);

	public static readonly UIColor ValheimBeige = new Color(0.8529f, 0.725f, 0.5331f, 1f);

	public static readonly UIColor ValheimTooltipTitle = new Color(1f, 0.718f, 0.36f, 1f);

	public static readonly UIColor VanillaSelectGridActivatedColorBlue = new Color(0.376f, 0.66f, 0.897f, 0.761f);

	public static readonly UIColor VanillaSelectMenuActivatedColorOrange = new Color(0.7574f, 0.5042f, 0.1838f, 1f);

	public static readonly UIColor Clear = Color.clear;

	public static readonly UIColor White = Color.white;

	public static readonly UIColor Black = Color.black;

	public static readonly UIColor Gray = new Color32((byte)170, (byte)170, (byte)170, byte.MaxValue);

	public static readonly UIColor Orange = new Color(1f, 0.5f, 0f, 1f);

	public static readonly UIColor Yellow = new Color(1f, 1f, 0f);

	public static readonly UIColor Beige = new Color(0.9f, 0.9f, 0.8f);

	public static readonly UIColor BrightRed = new Color(1f, 0f, 0f);

	public static readonly UIColor Red = new Color32((byte)204, (byte)0, (byte)0, byte.MaxValue);

	public static readonly UIColor Blue = new Color32((byte)0, (byte)0, byte.MaxValue, byte.MaxValue);

	public static readonly UIColor Green = new Color32((byte)0, byte.MaxValue, (byte)0, byte.MaxValue);

	public static readonly UIColor Teal = new Color32((byte)170, byte.MaxValue, (byte)170, byte.MaxValue);

	public static readonly UIColor Cyan = new Color32((byte)0, byte.MaxValue, byte.MaxValue, byte.MaxValue);

	public static readonly UIColor Purple = new Color32((byte)147, (byte)49, (byte)189, byte.MaxValue);

	public static readonly UIColor Pink = new Color32(byte.MaxValue, (byte)0, byte.MaxValue, byte.MaxValue);

	public static readonly UIColor LightOrange = new Color32(byte.MaxValue, (byte)153, (byte)0, byte.MaxValue);

	public static readonly UIColor LightYellow = new Color32(byte.MaxValue, byte.MaxValue, (byte)170, byte.MaxValue);

	public static readonly UIColor LightRed = new Color32(byte.MaxValue, (byte)102, (byte)102, byte.MaxValue);

	public static readonly UIColor LightBlue = new Color(0f, 0.5f, 1f);

	public static readonly UIColor LightGreen = new Color32((byte)102, byte.MaxValue, (byte)102, byte.MaxValue);

	public static readonly UIColor LightPurple = new Color32((byte)221, (byte)136, byte.MaxValue, byte.MaxValue);

	public static readonly UIColor DarkGray = new Color32((byte)79, (byte)79, (byte)79, byte.MaxValue);

	public static readonly UIColor DarkCyan = new Color32((byte)0, (byte)153, (byte)153, byte.MaxValue);

	public static readonly UIColor DarkPurple = new Color32((byte)153, (byte)51, (byte)153, byte.MaxValue);

	public static readonly UIColor DarkRed = new Color32((byte)153, (byte)0, (byte)0, byte.MaxValue);

	public static readonly UIColor DarkBlue = new Color32((byte)0, (byte)0, (byte)153, byte.MaxValue);

	public static readonly UIColor DarkGreen = new Color32((byte)0, (byte)153, (byte)0, byte.MaxValue);

	public static readonly UIColor DarkYellow = new Color32((byte)153, (byte)153, (byte)0, byte.MaxValue);

	public static readonly UIColor DarkOrange = new Color32((byte)153, (byte)102, (byte)0, byte.MaxValue);

	public static readonly UIColor MinorInfo = Gray;

	public static readonly UIColor MajorInfo = ValheimOrange;

	public static readonly UIColor FrostBlue = new Color(0f, 0.8f, 1f);

	public static readonly UIColor FireRed = new Color(1f, 0.2f, 0.2f);

	public static readonly UIColor ForestGreen = new Color(0.2f, 0.8f, 0.2f);

	public static readonly UIColor Gold = new Color(1f, 0.8f, 0f);

	public static readonly UIColor Silver = new Color(0.7f, 0.7f, 0.7f);

	public static readonly UIColor SoftWhite = new Color32((byte)221, (byte)221, (byte)221, byte.MaxValue);

	public static readonly UIColor DeepGray = new Color32((byte)153, (byte)153, (byte)153, byte.MaxValue);

	public string Hex => _hex.Substring(1);

	public UIColor(Color color)
	{
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		//IL_0008: Unknown result type (might be due to invalid IL or missing references)
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		Color = color;
		_hex = "#" + ColorUtility.ToHtmlStringRGBA(Color);
	}

	public UIColor(string hexRGB, bool parseFailError = true)
	{
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		//IL_002d: Unknown result type (might be due to invalid IL or missing references)
		//IL_0032: Unknown result type (might be due to invalid IL or missing references)
		Color color = default;
		if (!ColorUtility.TryParseHtmlString(hexRGB, ref color) && parseFailError)
		{
			throw new ArgumentException("Unable to parse color string: " + hexRGB);
		}
		UIColor uIColor = new UIColor(color);
		Color = uIColor.Color;
		_hex = uIColor._hex;
	}

	public override string ToString()
	{
		return _hex;
	}

	public bool Equals(UIColor other)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		return Color == other.Color;
	}

	public override bool Equals(object? obj)
	{
		if (obj is UIColor other)
		{
			return Equals(other);
		}
		return false;
	}

	public override int GetHashCode()
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		return ((object)Color/*cast due to constrained. prefix*/).GetHashCode();
	}

	public static implicit operator Color(UIColor uic)
	{
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		return uic.Color;
	}

	public static implicit operator UIColor(Color color)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		return new UIColor(color);
	}

	public static implicit operator UIColor(Color32 color32)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		//IL_0001: Unknown result type (might be due to invalid IL or missing references)
		return new UIColor(Color32.op_Implicit(color32));
	}

	static UIColor()
	{
		//IL_0014: Unknown result type (might be due to invalid IL or missing references)
		//IL_0037: Unknown result type (might be due to invalid IL or missing references)
		//IL_005a: Unknown result type (might be due to invalid IL or missing references)
		//IL_007d: Unknown result type (might be due to invalid IL or missing references)
		//IL_00a0: Unknown result type (might be due to invalid IL or missing references)
		//IL_00c3: Unknown result type (might be due to invalid IL or missing references)
		//IL_00d2: Unknown result type (might be due to invalid IL or missing references)
		//IL_00e1: Unknown result type (might be due to invalid IL or missing references)
		//IL_00f0: Unknown result type (might be due to invalid IL or missing references)
		//IL_0113: Unknown result type (might be due to invalid IL or missing references)
		//IL_0136: Unknown result type (might be due to invalid IL or missing references)
		//IL_0154: Unknown result type (might be due to invalid IL or missing references)
		//IL_0172: Unknown result type (might be due to invalid IL or missing references)
		//IL_0190: Unknown result type (might be due to invalid IL or missing references)
		//IL_01ab: Unknown result type (might be due to invalid IL or missing references)
		//IL_01c6: Unknown result type (might be due to invalid IL or missing references)
		//IL_01e1: Unknown result type (might be due to invalid IL or missing references)
		//IL_0204: Unknown result type (might be due to invalid IL or missing references)
		//IL_0223: Unknown result type (might be due to invalid IL or missing references)
		//IL_0243: Unknown result type (might be due to invalid IL or missing references)
		//IL_0262: Unknown result type (might be due to invalid IL or missing references)
		//IL_0281: Unknown result type (might be due to invalid IL or missing references)
		//IL_02a4: Unknown result type (might be due to invalid IL or missing references)
		//IL_02c1: Unknown result type (might be due to invalid IL or missing references)
		//IL_02df: Unknown result type (might be due to invalid IL or missing references)
		//IL_02fc: Unknown result type (might be due to invalid IL or missing references)
		//IL_031f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0339: Unknown result type (might be due to invalid IL or missing references)
		//IL_0358: Unknown result type (might be due to invalid IL or missing references)
		//IL_0378: Unknown result type (might be due to invalid IL or missing references)
		//IL_0393: Unknown result type (might be due to invalid IL or missing references)
		//IL_03ae: Unknown result type (might be due to invalid IL or missing references)
		//IL_03c9: Unknown result type (might be due to invalid IL or missing references)
		//IL_03e8: Unknown result type (might be due to invalid IL or missing references)
		//IL_0404: Unknown result type (might be due to invalid IL or missing references)
		//IL_0436: Unknown result type (might be due to invalid IL or missing references)
		//IL_0454: Unknown result type (might be due to invalid IL or missing references)
		//IL_0472: Unknown result type (might be due to invalid IL or missing references)
		//IL_0490: Unknown result type (might be due to invalid IL or missing references)
		//IL_04ae: Unknown result type (might be due to invalid IL or missing references)
		//IL_04d1: Unknown result type (might be due to invalid IL or missing references)
		//IL_04f4: Unknown result type (might be due to invalid IL or missing references)
	}
}
