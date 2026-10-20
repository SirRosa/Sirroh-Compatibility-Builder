using UnityEngine;

namespace Zen.Lib;

public static class WardAccessExt
{
	public static bool CanAccessWard(this GameObject self, bool flash)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		return self.transform.position.CanAccessWard(flash);
	}

	public static bool CanAccessWard(this MonoBehaviour self, bool flash)
	{
		//IL_0006: Unknown result type (might be due to invalid IL or missing references)
		return ((Component)self).transform.position.CanAccessWard(flash);
	}

	public static bool CanAccessWard(this Container self, bool flash)
	{
		//IL_000e: Unknown result type (might be due to invalid IL or missing references)
		if (self.m_checkGuardStone)
		{
			return ((Component)self).transform.position.CanAccessWard(flash);
		}
		return true;
	}

	public static bool CanAccessWard(this Vector3 self, bool flash)
	{
		//IL_0000: Unknown result type (might be due to invalid IL or missing references)
		return PrivateArea.CheckAccess(self, 0f, flash, false);
	}
}
