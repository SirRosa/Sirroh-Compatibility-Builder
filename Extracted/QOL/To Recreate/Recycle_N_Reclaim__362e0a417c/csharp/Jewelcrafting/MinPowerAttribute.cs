using UnityEngine;

namespace Jewelcrafting;

internal class MinPowerAttribute : PowerAttribute
{
	public override float Add(float a, float b)
	{
		return Mathf.Min(a, b);
	}
}
