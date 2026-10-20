namespace Zen.Lib;

public static class CharacterExt
{
	public static HudData? GetHudData(this Character c)
	{
		if (!EnemyHud.instance.m_huds.TryGetValue(c, out var value))
		{
			return null;
		}
		return value;
	}
}
