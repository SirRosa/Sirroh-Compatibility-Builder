using System;

namespace Jewelcrafting;

[AttributeUsage(AttributeTargets.Field)]
internal abstract class PowerAttribute : Attribute
{
	public abstract float Add(float a, float b);
}
