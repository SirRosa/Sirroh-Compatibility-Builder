using UnityEngine;

namespace Zen.Lib;

public static class ZNetViewExt
{
	public static bool TryGetZDO(this ZNetView? nview, out ZDO zdo)
	{
		if (Object.op_Implicit((Object)(object)nview) && nview.IsValid())
		{
			zdo = nview.GetZDO();
			return true;
		}
		zdo = null;
		return false;
	}
}
