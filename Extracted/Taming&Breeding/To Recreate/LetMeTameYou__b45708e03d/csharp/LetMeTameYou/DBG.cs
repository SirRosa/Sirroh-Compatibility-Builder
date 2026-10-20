namespace LetMeTameYou;

internal class DBG
{
	public static void blogInfo(object o)
	{
		LetMeTameYou.logger.LogInfo(o);
	}

	public static void blogWarning(object o)
	{
		LetMeTameYou.logger.LogWarning(o);
	}

	public static void blogDebug(object o)
	{
		if (LetMeTameYou.debugout.Value)
		{
			LetMeTameYou.logger.LogWarning(o);
		}
	}

	public static void tryblogDebug(object o, object o_backup)
	{
		try
		{
			if (LetMeTameYou.debugout.Value)
			{
				LetMeTameYou.logger.LogWarning(o);
			}
		}
		catch
		{
			LetMeTameYou.logger.LogWarning(o_backup);
		}
	}
}
