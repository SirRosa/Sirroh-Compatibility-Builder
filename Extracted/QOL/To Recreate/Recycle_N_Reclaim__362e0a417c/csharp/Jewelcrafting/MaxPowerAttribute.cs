using UnityEngine;

namespace Jewelcrafting;

internal class MaxPowerAttribute : PowerAttribute
{
	public override float Add(float a, float b)
	{
		return Mathf.Max(a, b);
	}
}
