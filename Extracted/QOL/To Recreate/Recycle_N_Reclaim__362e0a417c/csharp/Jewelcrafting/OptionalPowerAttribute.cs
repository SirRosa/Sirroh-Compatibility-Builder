using System;

namespace Jewelcrafting;

[AttributeUsage(AttributeTargets.Field)]
internal class OptionalPowerAttribute : Attribute
{
	public readonly float DefaultValue;

	public OptionalPowerAttribute(float defaultValue)
	{
		DefaultValue = defaultValue;
	}
}
