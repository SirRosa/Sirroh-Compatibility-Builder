namespace Jewelcrafting;

internal class AdditivePowerAttribute : PowerAttribute
{
	public override float Add(float a, float b)
	{
		return a + b;
	}
}
