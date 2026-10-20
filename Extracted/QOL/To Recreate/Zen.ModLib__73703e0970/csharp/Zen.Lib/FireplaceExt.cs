using Zen.Compatibility;

namespace Zen.Lib;

public static class FireplaceExt
{
	public static double FuelTimeRemaining(this Fireplace fireplace, out float fuel)
	{
		if (!fireplace.m_nview.IsValid())
		{
			fuel = 0f;
			return 0.0;
		}
		fuel = fireplace.m_nview.GetZDO().GetFloat(ZDOVars.s_fuel, 0f);
		double timeRemaining = Seasons.GetTimeRemaining(fireplace);
		if (!(timeRemaining >= 0.0))
		{
			return fuel * fireplace.m_secPerFuel;
		}
		return timeRemaining;
	}

	public static double FuelTimeRemaining(this Fireplace fireplace)
	{
		float fuel;
		return fireplace.FuelTimeRemaining(out fuel);
	}

	public static int FuelDays(this Fireplace fireplace, float? fuel = null)
	{
		float valueOrDefault = fuel.GetValueOrDefault();
		if (!fuel.HasValue)
		{
			valueOrDefault = fireplace.m_nview.GetZDO().GetFloat(ZDOVars.s_fuel, 0f);
			fuel = valueOrDefault;
		}
		return UI.RealToGameTimeFuel(fuel.Value * fireplace.m_secPerFuel).Days;
	}

	public static int FuelDaysMax(this Fireplace fireplace)
	{
		return UI.RealToGameTimeFuel(fireplace.m_maxFuel * fireplace.m_secPerFuel).Days;
	}

	public static bool IsFuelDaysFull(this Fireplace fireplace, float? fuel = null)
	{
		if (fireplace.m_infiniteFuel)
		{
			return true;
		}
		int num = fireplace.FuelDays(fuel);
		if (num > 0)
		{
			return num >= fireplace.FuelDaysMax();
		}
		return false;
	}

	public static bool IsFuelDaysEmpty(this Fireplace fireplace, float? fuel = null)
	{
		if (!fireplace.m_infiniteFuel)
		{
			return fireplace.FuelDays(fuel) <= 0;
		}
		return false;
	}

	public static bool IsFuelEmpty(this Fireplace fireplace)
	{
		if (!fireplace.m_infiniteFuel)
		{
			return fireplace.m_nview.GetZDO().GetFloat(ZDOVars.s_fuel, 0f) <= 0f;
		}
		return false;
	}
}
