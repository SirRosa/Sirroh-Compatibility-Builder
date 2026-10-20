namespace Jewelcrafting;

internal class MultiplicativePercentagePowerAttribute : PowerAttribute
{
	public override float Add(float a, float b)
	{
		return ((1f + a / 100f) * (1f + b / 100f) - 1f) * 100f;
	}
}
