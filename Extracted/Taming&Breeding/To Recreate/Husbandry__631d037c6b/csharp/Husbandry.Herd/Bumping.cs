namespace Husbandry.Herd;

internal static class Bumping
{
	internal const string Key = "husbandry_solid";

	internal static bool Phased(bool tamed, bool solid)
	{
		if (tamed)
		{
			return !solid;
		}
		return false;
	}

	internal static bool Toggled(bool tamed, bool solid)
	{
		if (!tamed)
		{
			return solid;
		}
		return !solid;
	}

	internal static bool Mine(bool tamed)
	{
		return tamed;
	}

	internal static string Says(bool solid)
	{
		if (!solid)
		{
			return "$msg_husbandry_phased";
		}
		return "$msg_husbandry_solid";
	}

	internal static string Plain(bool solid)
	{
		if (!solid)
		{
			return "will stay out of your way";
		}
		return "will get in your way again";
	}
}
