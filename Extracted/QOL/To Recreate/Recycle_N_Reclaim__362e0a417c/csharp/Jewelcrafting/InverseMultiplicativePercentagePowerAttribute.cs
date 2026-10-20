namespace Jewelcrafting;

internal class InverseMultiplicativePercentagePowerAttribute : PowerAttribute
{
	public override float Add(float a, float b)
	{
		return (1f - (1f - a / 100f) * (1f - b / 100f)) * 100f;
	}
}
