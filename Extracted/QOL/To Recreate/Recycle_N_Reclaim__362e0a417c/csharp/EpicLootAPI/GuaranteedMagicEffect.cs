using System;
using JetBrains.Annotations;

namespace EpicLootAPI;

[Serializable]
[PublicAPI]
internal class GuaranteedMagicEffect
{
	public string Type = "";

	public ValueDef Values = new ValueDef();

	public GuaranteedMagicEffect(string type, ValueDef values)
	{
		Type = type;
		Values = values;
	}

	public GuaranteedMagicEffect(string type, float min = 1f, float max = 1f, float increment = 1f)
		: this(type, new ValueDef(min, max, increment))
	{
	}

	public GuaranteedMagicEffect()
	{
	}
}
