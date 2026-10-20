using UnityEngine;

namespace Zen.Lib;

public static class ColorExt
{
	public static string ToStringRGB(this Color color)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		return new UIColor(color).ToString();
	}
}
