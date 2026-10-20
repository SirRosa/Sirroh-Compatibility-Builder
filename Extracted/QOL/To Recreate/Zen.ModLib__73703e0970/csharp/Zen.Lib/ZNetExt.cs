using System;
using System.Linq;

namespace Zen.Lib;

public static class ZNetExt
{
	public static long GetPlayerUID(this ZNet instance, string playerName)
	{
		//IL_0002: Unknown result type (might be due to invalid IL or missing references)
		//IL_0007: Unknown result type (might be due to invalid IL or missing references)
		ZDOID playerZDOID = instance.GetPlayerZDOID(playerName);
		return playerZDOID.UserID;
	}

	public static ZDOID GetPlayerZDOID(this ZNet instance, string playerName)
	{
		//IL_001f: Unknown result type (might be due to invalid IL or missing references)
		//IL_0024: Unknown result type (might be due to invalid IL or missing references)
		return instance.GetPlayerList().FirstOrDefault((PlayerInfo p) =>
		{
			//IL_0000: Unknown result type (might be due to invalid IL or missing references)
			return string.Equals(p.m_name, playerName, StringComparison.OrdinalIgnoreCase);
		}).m_characterID;
	}
}
