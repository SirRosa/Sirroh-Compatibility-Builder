using System;
using JetBrains.Annotations;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class ValueDef
{
	public float MinValue;

	public float MaxValue;

	public float Increment;

	public ValueDef()
	{
	}

	public ValueDef(float min, float max, float increment)
	{
		MinValue = min;
		MaxValue = max;
		Increment = increment;
	}

	public void Set(float min, float max, float increment = 1f)
	{
		MinValue = min;
		MaxValue = max;
		Increment = increment;
	}
}
